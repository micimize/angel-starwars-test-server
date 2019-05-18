
```gql
mutation {
  modifyHuman(id: "1001", data:{ name: "Anikin" } ){
     id, name, friends { name }
  }
}
```


```gql
{
  humans {
    id, name, friends { name }
  }
}
```
