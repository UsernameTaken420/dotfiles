Data query language used as an alternative to REST APIs, works by querying for only the needed data entirely at one endpoint, rather than requiring multiple endpoints and having to filter the data received.

Basic request:
```graphql
query{
	user{
		id
		email
		firstName
		lastName
	}
}
```
Response:
```json
{
	"data":{
		"user":{
			"id":"1",
			"email":"email@example.com",
			"firstName":"Name",
			"lastName":"LastName"
		}
	}
}
```

Introspection is a feature that allows asking *what kind of queries* are possible by enumerating existing fields and types.

`/graphql.php?debug=1` might enable debugging mode with additional error reporting

---

#stub