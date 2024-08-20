#!/bin/bash

#sed -r -i 's#^!\[(.+)\]\((.+)\)$#{{< resize-image src="\2" alt="\1" >}}#g' $1

sed -r -i '' 's#^{{< resize-image src="(.+)" alt="(.+)" >}}$#!\[\2\]\(\1\)#g' $1
