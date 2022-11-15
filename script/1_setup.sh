docker run --network poor-man-api_default --rm curlimages/curl:7.86.0 -v -i http://apisix:9080/apisix/admin/upstreams/1 -H 'X-API-KEY: edd1c9f034335f136f87ad84b625c8f1' -X PUT -d '
{
  "type": "roundrobin",
  "nodes": {
    "postgrest:3000": 1
  }
}'

docker run --network poor-man-api_default --rm curlimages/curl:7.86.0 -v -i http://apisix:9080/apisix/admin/routes/1 -H 'X-API-KEY: edd1c9f034335f136f87ad84b625c8f1' -X PUT -d '
{
  "uri": "/*",
  "upstream_id": 1
}'
