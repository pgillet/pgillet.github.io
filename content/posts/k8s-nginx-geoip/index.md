---
title: "Restricting Access by Geographical Location using NGINX with Helm"
date: 2024-08-20T04:00:00+01:00

tags: ["Kubernetes", "GeoIP", "NGINX", "Helm"]
author: "Pascal Gillet"
lang: en
---

{{< resize-image src="header.jpg" alt="banner" >}}

This article explains how you can restrict content distribution to a particular country from services in your Kubernetes 
cluster, using the GeoIP2 dynamic module. 

## Prerequisites

- Install NGINX Ingress Controller in your Kubernetes cluster using Helm.

## Getting the GeoLite2 databases from MaxMind

The **MaxMind** company provides the [**GeoLite2**](https://dev.maxmind.com/geoip/geolite2-free-geolocation-data) free 
IP geolocation databases. You need to create an account on the MaxMind website and generate a **license key**.

## Configuring the NGINX Ingress Controller

Override the NGINX Helm chart with the following values:

```yaml
controller:
  # Maxmind license key to download GeoLite2 Databases
  maxmindLicenseKey: ""
  extraArgs:
    # GeoLite2 Databases to download (default "GeoLite2-City,GeoLite2-ASN")
    maxmind-edition-ids: GeoLite2-Country
  service:
    # Preserve source IP...
    externalTrafficPolicy: Local
    # ...Which is only supported if we enable the v2 proxy protocol for the OVH load balancer (specific to OVH Cloud provider)
    annotations:
      service.beta.kubernetes.io/ovh-loadbalancer-proxy-protocol: "v2"
  config:
    use-proxy-protocol: "true"
    # Enable Ingress to parse and add -snippet annotations/directives
    allow-snippet-annotations: "true"
    # Enable geoip2 module
    use-geoip: "false"
    use-geoip2: "true"
    # Configure access by geographical location.
    # Here, we map ISO 3166 country codes to the custom variable allowed_country.
    # Map directives are only allowed at Ingress Controller level.
    http-snippet: |
      map $geoip2_country_code $allowed_country {
        default no;
        FR yes;
        US yes;
      }
```

## Example Ingress

A minimal Ingress resource example:

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: minimal-ingress
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
    # Restrict access by geographical location
    nginx.ingress.kubernetes.io/server-snippet: |
      if ($allowed_country = no) {
        return 451;
      }
spec:
  ingressClassName: nginx-example
  rules:
  - http:
      paths:
      - path: /testpath
        pathType: Prefix
        backend:
          service:
            name: test
            port:
              number: 80
```

**Note**: The [HTTP status code 451](https://en.wikipedia.org/wiki/HTTP_451) was chosen as a reference to the novel 
["Fahrenheit 451"](https://en.wikipedia.org/wiki/Fahrenheit_451).

# References

- [NGINX Installation with Helm](https://docs.nginx.com/nginx-ingress-controller/installation/installing-nic/installation-with-helm/)
- [Restricting Access by Geographical Location](https://docs.nginx.com/nginx/admin-guide/security-controls/controlling-access-by-geoip/)
- [NGINX ConfigMap Resource](https://docs.nginx.com/nginx-ingress-controller/configuration/global-configuration/configmap-resource/)
