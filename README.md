# graphql-ruby

## Installation

Install dependencies:

```
bundle install

rails db:create
rails ridge:apply
rails db:seed
```

Starting the server:

```
rails server
```

Opening the application:

```
open http://localhost:3000/
```

## Sample GraphQL Queries

List first 10 links, containing "example":

```graphql
{
  articlesConnection(page: 36, perPage: 20, orderBy: createdAt_ASC) {
    edges {
      node {
        id
        content
        title
        createdAt
        updatedAt
      }
    }
    meta {
      totalCount
      totalPages
      prevPage
      currentPage
      nextPage
    }
  }
}


```

Creates new article:

```graphql
mutation {
  createArticle(title: "Article 01", content:"This is an Article") {
    id
    title
    content
    createdAt
    updatedAt
  }
}
```