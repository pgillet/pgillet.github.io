#!/bin/bash

sed -r -i 's#^!\[(.+)\]\((.+)\)$#{{< resize-image src="\2" alt="\1" >}}#g' $1
