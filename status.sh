#!/bin/bash
#
# Compares local config with config on the node
#
source .syncconfig
JWT=${JWT/[Aa]uthorization:/}
curl -so node.zip -H "Accept: application/zip" -H "Authorization: $JWT" "https://$NODE/api/config"
zip -q local.zip -r . -i '*.conf.json'
unzip -q node.zip -d node
unzip -q local.zip -d local
diff -r node local
error=$?
rm -r node.zip local.zip node local
if [ $error -eq 0 ]
then
   echo "Node config is up-to-date with local config."
else
   echo "Node config is NOT in sync with local config."
   exit 1
fi
