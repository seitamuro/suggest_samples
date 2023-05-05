#!/bin/sh
curl -X PUT localhost:9200/sample_index \
  -H "Content-Type: application/json" \
  -d '{
    "mappings": {
      "properties": {
        "item_name": {
          "type": "text",
          "analyzer": "standard"
        }
      }
    }
  }'

curl -X POST localhost:9200/sample_index/_bulk \
  -H "Content-Type: application/json" \
  -d '{"index": {"_id": 1}}' \
  -d '{"index_name": "シャツ"}' \
  -d '{"index": {"_id": 2}}' \
  -d '{"index_name": "パンツ"}' \
  -d '{"index": {"_id": 3}}' \
  -d '{"index_name": "帽子"}'

curl -X GET localhost:9200/sample_index/_search \
  -H "Content-Type: application/json" \
  -d '{
    "size": 10
  }';