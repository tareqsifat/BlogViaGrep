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
      expose :image_url, if: ->(post, _) { post.image.attached? }

      def image_url
        if object.image.attached?
          Rails.application.routes.url_helpers.rails_blob_path(object.image, only_path: true)
        end
      end
    end
  end
end
  