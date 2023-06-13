module V1
    class Base < Grape::API
        version 'v1', using: :path
        format :json

        mount V1::Posts
        mount V1::Entities::PostEntity

    end
end
  