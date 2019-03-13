module Types
  class ArticleType < BaseNode
    field :id, ID, null: false
    field :title, String, null: true
    field :content, String, null: true
    field :created_at, DateTimeType, null: false
    field :updated_at, DateTimeType, null: false
  end
end
