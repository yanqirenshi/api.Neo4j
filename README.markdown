# Api.Neo4j

|          | url                                       | version |
|----------|-------------------------------------------|---------|
| rest-api | https://neo4j.com/docs/rest-docs/current/ | V3.5    |
| http-api | https://neo4j.com/docs/http-api/current/  | V4      |

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

## API

### http

**http** _&key_ **db** **user** **password** **commit-uri** **commit** **statements** **adjuster** **nature** _=>_ **result**

## Variables

### *db*

### *user*

### *password*

### *scheme*

### *host*

### *port*

## Installation
