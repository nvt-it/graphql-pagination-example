class ArticleFilter < ::Types::BaseInputObject
  argument :OR, [self], required: false
  argument :content_contains, String, required: false
  argument :title_contains, String, required: false
end
