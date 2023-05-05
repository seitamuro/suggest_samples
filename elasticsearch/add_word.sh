curl -X POST localhost:9200/_bulk \
  -H "Content-Type: application/json" \
  -d "
{\"index\": {\"_index\": \"my_suggest\"}}
{\"my_field\": \"$1\", \"created\": \"2020-04-07T12:00:00\"}
"