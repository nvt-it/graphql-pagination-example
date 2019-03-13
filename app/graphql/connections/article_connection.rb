# frozen_string_literal: true

class ArticlesEdgeType < GraphQL::Types::Relay::BaseEdge
  node_type(Types::ArticleType)
end

class ArticleConnection < GraphQL::Types::Relay::BaseConnection
  field :meta, Types::MetaType, null: false

  def meta
    object.nodes
  end

  edge_type(ArticlesEdgeType)
end
