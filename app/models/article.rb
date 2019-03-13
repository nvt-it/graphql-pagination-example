# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  content    :string           not null
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Article < ApplicationRecord
  max_paginates_per 20

  scope :pagination_scope, ->(page, per_page) {
    page(page).per(per_page)
  }
end
