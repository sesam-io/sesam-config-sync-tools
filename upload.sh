#!/bin/bash
#
# Uploads and replaces node config with files from local disk
#
source .syncconfig
JWT=${JWT/[Aa]uthorization:/}
zip -qr config.zip . -i '*.conf.json'
curl -s -XPUT -H "Content-Type: application/zip" -H "Authorization: $JWT" --data-binary @config.zip "https://$NODE/api/config" > result.json
error=$?
rm config.zip
if [ $error -ne 0 ]
then
   echo "Failed to upload config to the node. Maybe the JWT has expired?"
   exit 1
fi
error=`jq '.validation_errors|length' result.json`
if [ $error -ne 0 ]
then
   jq '.' result.json
   echo "Failed to upload config to the node: $error validation error(s)!"
   echo "(Hints provided in messages above)"
   rm result.json
   exit 1
fi
rm result.json
echo "Node config replaced with local config."
