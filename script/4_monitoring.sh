#!/bin/sh
docker run --network poor-man-api_default --rm curlimages/curl:7.86.0 -v -i http://apisix:9080/apisix/admin/global_rules/2 -H 'X-API-KEY: edd1c9f034335f136f87ad84b625c8f1' -X PUT -d '
{
  "plugins": {
    "prometheus": {}
  }
}'
