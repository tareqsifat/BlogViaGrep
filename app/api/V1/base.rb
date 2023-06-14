module V1
    class Base < Grape::API
        before do
            ActiveStorage::Current.url_options = Rails.application.routes.default_url_options
        end
        version 'v1', using: :path
        format :json


        mount V1::Posts
        mount V1::Entities::PostEntity

    end
end
  