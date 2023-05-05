#!/bin/bash
curl -X GET localhost:9200/my_suggest/_search \
  -H "Content-Type: application/json" \
  -d '
  {
    "size": 0,
    "query": {
      "bool": {
        "should": [
          {
            "match": {
              "my_field.suggest": {
                "query": "日本"
              }
            }
          },
          {
            "match": {
              "my_field.readingform": {
                "query": "日本",
                "fuzziness": "AUTO",
                "operator": "and"
              }
            }
          }
        ]
      }
    },
    "aggs": {
      "keywords": {
        "terms": {
          "field": "my_field",
          "order": {
            "_count": "desc"
          },
          "size": "10"
        }
      }
    }
  }';