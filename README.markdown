# Api.Neo4j

## Usage

```
(let ((stmt (concatenate 'string
                         "MATCH (from:GENIUS)-[edge:HAVE_TO]->(to:FORCE) "
                         "WHERE ID(from) = 1 "
                         "RETURN from, edge, to")))
  (neo4j:http :statements `((,stmt . nil))))
```

```
(let ((stmt "CREATE (n $props) RETURN n"))
  (neo4j:http :statements `((,stmt . (:|props| (:|name| "My Node" )))
                            (,stmt . (:|props| (:|name| "Another Node"))))))
```

## Cypher

- [The Neo4j Cypher Manual v4.2](https://neo4j.com/docs/cypher-manual/current/)
- [lang.Cypher](https://github.com/yanqirenshi/lang.Cypher)

## API

### http

#### Syntax

> **http** _&key_ **statements** **commit-uri** **commit** **adjuster** **nature** **db** **user** **password** _=>_ **result**

#### `statements`

#### `commit-uri`

#### `commit`

実行する `statements` でコミットする場合は `t` を指定します。

デフォルト値は `t` です。

この値が `nil` の場合、実行した `statements` はトランザクション実行となり commit されていない状態になります。

別途 `commit-uri` でコミットする必要があります。

#### `adjuster`

API から取得した値を変換するための関数を指定します。

この関数では必ず値を返す必要があります。

この関数は行単位で実行されます。

関数の定義は以下の通りです。

> #'(lambda (row columns) ....)

#### `nature`

返す値 `results` の形式を指定します。

`t` の場合は [Neo4j の API が返す値](https://neo4j.com/docs/http-api/current/actions/begin-a-transaction/) をそのまま返します。

#### `results`

#### `db`

#### `user`

#### `password`

## Variables

### `*db*`

### `*user*`

### `*password*`

### `*scheme*`

### `*host*`

### `*port*`

## Installation
