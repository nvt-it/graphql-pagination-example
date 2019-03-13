require_relative 'filter/article_filter'
require_relative 'order/article_order'

require 'search_object/plugin/graphql'
require 'graphql/query_resolver'

module Resolvers
  class Article < Resolvers::Base
    scope { ::Article.all }
    type types[Types::ArticleType]

    option :filter, type: ArticleFilter, with: :apply_filter
    option :page, type: types.Int, default: 1, with: :apply_page
    option :perPage, type: types.Int, default: 20, with: :apply_per_page
    option :orderBy, type: ArticleOrder, default: 'createdAt_DESC'

    def normalize_filters(value, branches = [])
      scope = Article.all
      scope = scope.like(:content, value['content_contains']) if value['content_contains']
      scope = scope.like(:title, value['title_contains']) if value['title_contains']

      branches << scope

      value['OR'].reduce(branches) { |s, v| normalize_filters(v, s) } if value['OR'].present?

      branches
    end

    def fetch_results
      # NOTE: Don't run QueryResolver during tests
      return super if context.blank?

      GraphQL::QueryResolver.run(::Article, context, Types::ArticleType) do
        super
      end
    end
  end
end
