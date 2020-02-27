A simple starwars schema server adapted from the [angel starwars example](https://github.com/angel-dart/graphql/tree/master/example_star_wars) for use in testing graphql clients, such as [graphql_flutter](https://github.com/zino-app/graphql-flutter).

The schema it aims to implement is in `schema.graphql`, and the seed data is mostly in `data.json`.
The server is heavily limited:
* recursive relationships aren't supported
* it doesn't serve a schema
* a lot of mutations seem broken


To run, add as a dependency and
```bash
pub run graphql_starwars_test_server
  # --host 127.0.0.1
  # --port 3000
```

Here are some working test operations:
```gql
mutation {
  modifyHuman(id: "1001", data:{ name: "Anikin" } ){
     id, name, friends { name }
  }
}

{
  humans {
    id, name, friends { name }
  }
}

subscription reviewAdded {
  reviewAdded {
    stars, commentary, episode
  }
}
```

The server will generate a fake review for testing streams every 10 seconds, unless the env variable `GENERATE_REVIEWS=false`

`schema.graphql` generated with `get-graphql-schema http://127.0.0.1:3000/graphql > schema.graphql`
