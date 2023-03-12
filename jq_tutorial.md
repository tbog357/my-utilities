- jq '.' sample/fruit.json
```json
[
  {
    "fruit": {
      "name": "apple",
      "color": "green",
      "price": 1.2,
      "tags": [
        "cheap",
        "juice"
      ]
    }
  },
  {
    "fruit": {
      "name": "orange",
      "color": "orange",
      "price": 2,
      "tags": [
        "juice",
        "vitamin"
      ]
    }
  }
]
```

-  jq '.[]' sample/fruit.json
```json
{
  "fruit": {
    "name": "apple",
    "color": "green",
    "price": 1.2,
    "tags": [
      "cheap",
      "juice"
    ]
  }
}
{
  "fruit": {
    "name": "orange",
    "color": "orange",
    "price": 2,
    "tags": [
      "juice",
      "vitamin"
    ]
  }
}
```
-  jq '.[0:1]' sample/fruit.json 
```json
[
  {
    "fruit": {
      "name": "apple",
      "color": "green",
      "price": 1.2,
      "tags": [
        "cheap",
        "juice"
      ]
    }
  }
]
```
-  jq '.[0:1][] | .fruit.name,.fruit.color,.fruit.price' sample/fruit.json
```json
"apple"
"green"
1.2
```
-  jq '.[].fruit.name' sample/fruit.json
```json
"apple"
"orange"
```
-  jq '.[] | keys' sample/fruit.json
```json
[
  "fruit"
]
[
  "fruit"
]
```
-  jq '.[].fruit | keys' sample/fruit.json
```json
[
  "color",
  "name",
  "price",
  "tags"
]
[
  "color",
  "name",
  "price",
  "tags"
]
```
-  jq '.[] | length' sample/fruit.json 
```json
2
```
-  Apply to an array
```json
-  jq 'map(has("fruit"))' sample/fruit.json
```json
[
  true,
  true
]
```
-  jq 'map(.fruit.price+2)' sample/fruit.json
```json
[
  3.2,
  4
]
```
-  jq '[.[].fruit.price] | min' sample/fruit.json
```json
1.2
```
-  jq '[.[].fruit.price] | max' sample/fruit.json
```json
2
```
-  jq '.[] | select(.fruit.price==2)' sample/fruit.json
```json
{
  "fruit": {
    "name": "orange",
    "color": "orange",
    "price": 2,
    "tags": [
      "juice",
      "vitamin"
    ]
  }
}
```	
-  jq '.[] | select(.fruit.price==2) | .fruit.name' sample/fruit.json
```json
"orange"
```
-  jq 'map(.fruit.name) | unique' sample/fruit.json
```json
[
  "apple",
  "orange"
]
```
-  jq '.[] | del(.fruit.name)' sample/fruit.json
```json
{
  "fruit": {
    "color": "green",
    "price": 1.2,
    "tags": [
      "cheap",
      "juice"
    ]
  }
}
{
  "fruit": {
    "color": "orange",
    "price": 2,
    "tags": [
      "juice",
      "vitamin"
    ]
  }
}
```

-  jq '.' sample/wikipedia.json
```json
{
  "query": {
    "pages": [
      {
        "21721040": {
          "pageid": 21721040,
          "ns": 0,
          "title": "Stack Overflow",
          "extract": "Some interesting text about Stack Overflow"
        }
      },
      {
        "21721041": {
          "pageid": 21721041,
          "ns": 0,
          "title": "Baeldung",
          "extract": "A great place to learn about Java"
        }
      }
    ]
  }
}
```
-  jq '.query.pages' sample/wikipedia.json
```json
[
  {
    "21721040": {
      "pageid": 21721040,
      "ns": 0,
      "title": "Stack Overflow",
      "extract": "Some interesting text about Stack Overflow"
    }
  },
  {
    "21721041": {
      "pageid": 21721041,
      "ns": 0,
      "title": "Baeldung",
      "extract": "A great place to learn about Java"
    }
  }
]
```
-  jq '.query.pages | .[] | keys' sample/wikipedia.json
```json
[
  "21721040"
]
[
  "21721041"
]
```
-  jq '.query.pages | .[] | map(.)' sample/wikipedia.json
```json
[
  {
    "pageid": 21721040,
    "ns": 0,
    "title": "Stack Overflow",
    "extract": "Some interesting text about Stack Overflow"
  }
]
[
  {
    "pageid": 21721041,
    "ns": 0,
    "title": "Baeldung",
    "extract": "A great place to learn about Java"
  }
]
```
-  jq '.query.pages | .[] | map(.) | .[] | keys' sample/wikipedia.json
```json
[
  "extract",
  "ns",
  "pageid",
  "title"
]
[
  "extract",
  "ns",
  "pageid",
  "title"
]
```
-  jq '.query.pages | .[] | map(.) | .[] | .pageid, .title, .ns, .extract' sample/wikipedia.json
```json
21721040
"Stack Overflow"
0
"Some interesting text about Stack Overflow"
21721041
"Baeldung"
0
"A great place to learn about Java"
```
-  jq '.query.pages | .[] | map(.) | .[] | {page_title: .title, page_description: .extract}' sample/wikipedia.json
```json
{
  "page_title": "Stack Overflow",
  "page_description": "Some interesting text about Stack Overflow"
}
{
  "page_title": "Baeldung",
  "page_description": "A great place to learn about Java"
}
```

-  jq '.query.pages | [.[] | map(.) | .[] | {page_title: .title, page_description: .extract}]' sample/wikipedia.json
```json
[
  {
    "page_title": "Stack Overflow",
    "page_description": "Some interesting text about Stack Overflow"
  },
  {
    "page_title": "Baeldung",
    "page_description": "A great place to learn about Java"
  }
]
```