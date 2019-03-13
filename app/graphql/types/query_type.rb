require'connections/article_connection'

module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :articles_connection, ArticleConnection, function: Resolvers::Article, null: false, connection: true
  end
end
