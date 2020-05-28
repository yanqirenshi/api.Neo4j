# Api.Neo4j

|          | url                                       | version |
|----------|-------------------------------------------|---------|
| rest-api | https://neo4j.com/docs/rest-docs/current/ | V3.5    |
| http-api | https://neo4j.com/docs/http-api/current/  | V4      |

## Usage

### HTTP API

```
(api :http
     :statements '(("CREATE (n $props) RETURN n" . (:|props| (:|name| "My Node" )))
                   ("CREATE (n $props) RETURN n" . (:|props| (:|name| "Another Node")))))
```

### REST API

```
(api :rest)
```

## Installation
