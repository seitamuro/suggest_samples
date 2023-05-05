# 動かし方

## Get Started
1. `docker-compose up -d`を実行する。
2. しばらく時間を開けてから`bash index_and_mapping.sh`を実行する。(時間を置かないとエラーがでます)
3. `bash post_data.sh`を実行する。
4. `bash search.sh "日本"`を実行する。

```
{"took":15,"timed_out":false,"_shards":{"total":1,"successful":1,"skipped":0,"failed":0},"hits":{"total":{"value":33,"relation":"eq"},"max_score":null,"hits":[]},"aggregations":{"keywords":{"doc_count_error_upper_bound":0,"sum_other_doc_count":0,"buckets":[{"key":"日本","doc_count":13},{"key":"日本 地図","doc_count":8},{"key":"日本 郵便","doc_count":6},{"key":"日本の人口","doc_count":4},{"key":"日本 代表","doc_count":2}]}}}%
```

5. `bash search.sh "にほn"`を実行する。

```
{"took":15,"timed_out":false,"_shards":{"total":1,"successful":1,"skipped":0,"failed":0},"hits":{"total":{"value":33,"relation":"eq"},"max_score":null,"hits":[]},"aggregations":{"keywords":{"doc_count_error_upper_bound":0,"sum_other_doc_count":0,"buckets":[{"key":"日本","doc_count":13},{"key":"日本 地図","doc_count":8},{"key":"日本 郵便","doc_count":6},{"key":"日本の人口","doc_count":4},{"key":"日本 代表","doc_count":2}]}}}%
```

4.と5.で同じ出力が得られていることがわかります。

## サジェスト用の単語を追加する

`post_data.sh`で単語を追加しています。ここでは`日本 郵便`、`日本地図`などの単語を追加しています。
コードを見てみると、同じ単語を複数回実行していることが確認できます。
追加された回数が多いほど検索上位に表示されます。
ここでは`饅頭`という単語を追加します。

1. `bash add_word.sh "饅頭"`
2. `bash search.sh "まんじ"`
3. `bash search.sh "饅"`

2.と3.の手順で`饅頭`という結果が得られていることがわかる。
