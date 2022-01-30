# Generate website

```shell
hugo
```

# Export website

```shell
gsutil -m rm -r gs://www.pascalgillet.net/*
gsutil -m cp -r public/* gs://www.pascalgillet.net
```
