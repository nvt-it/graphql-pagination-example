module Resolvers
  class Base
    include SearchObject.module(:graphql)

    def apply_per_page(scope, value)
      scope.per(value)
    end

    def apply_page(scope, value)
      scope.page(value)
    end

    def apply_filter(scope, value)
      branches = normalize_filters(value).reduce { |a, b| a.or(b) }
      scope.merge branches
    end

    def apply_orderBy_with_created_at_asc(scope) # rubocop:disable Style/MethodName
      scope.order('created_at ASC')
    end

    def apply_orderBy_with_created_at_desc(scope) # rubocop:disable Style/MethodName
      scope.order('created_at DESC')
    end
  end
end
