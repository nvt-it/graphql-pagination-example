module Types
  class MutationType < BaseObject
    field :create_article, mutation: Mutations::CreateArticle
  end
end
