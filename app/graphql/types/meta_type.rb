module Types
  class MetaType < BaseNode
    field :total_count, Integer, null: false
    field :total_pages, Integer, null: false
    field :current_page, Integer, null: false
    field :next_page, Integer, null: true
    field :prev_page, Integer, null: true
  end
end
