#!/bin/sh
docker run --network poor-man-api_default --rm curlimages/curl:7.86.0 -v -i http://apisix:9080/apisix/admin/consumers -H 'X-API-KEY: edd1c9f034335f136f87ad84b625c8f1' -X PUT -d '
{
  "username": "admin",
  "plugins": {
    "key-auth": {
      "key": "admin"
    }
  }
}'

docker run --network poor-man-api_default --rm curlimages/curl:7.86.0 -v -i http://apisix:9080/apisix/admin/consumers -H 'X-API-KEY: edd1c9f034335f136f87ad84b625c8f1' -X PUT -d '
{
  "username": "user",
  "plugins": {
    "key-auth": {
      "key": "user"
    }
  }
}'

docker run --network poor-man-api_default --rm curlimages/curl:7.86.0 -v -i http://apisix:9080/apisix/admin/routes/1 -H 'X-API-KEY: edd1c9f034335f136f87ad84b625c8f1' -X DELETE

docker run --network poor-man-api_default --rm curlimages/curl:7.86.0 -v -i http://apisix:9080/apisix/admin/routes -H 'X-API-KEY: edd1c9f034335f136f87ad84b625c8f1' -X POST -d '
{
  "uri": "/",
  "upstream_id": 1,
  "plugins": {
    "key-auth": {},
    "consumer-restriction": {
      "whitelist": [ "admin" ]
    }
  }
}'

docker run --network poor-man-api_default --rm curlimages/curl:7.86.0 -v -i http://apisix:9080/apisix/admin/routes -H 'X-API-KEY: edd1c9f034335f136f87ad84b625c8f1' -X POST -d '
{
  "uri": "/product",
  "upstream_id": 1,
  "plugins": {
    "key-auth": {},
    "consumer-restriction": {
      "whitelist": [ "admin", "user" ]
    }
  }
}'
