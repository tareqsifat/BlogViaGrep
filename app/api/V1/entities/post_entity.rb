module V1
  module Entities
    class PostEntity < Grape::Entity
      expose :id
      expose :user_id
      expose :category_id
      expose :sub_category_id
      expose :title
      expose :slug
      expose :body
      expose :image
    end
  end
end
  