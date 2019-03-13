module Mutations
  class CreateArticle < BaseMutation
    argument :title, String, required: true
    argument :content, String, required: true

    type Types::ArticleType

    def resolve(title: nil, content: nil)
      Article.create!( title: title, content: content)
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
