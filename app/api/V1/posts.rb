module V1
    class Posts < Grape::API
        version 'v1', using: :path
        format :json

        resource :posts do
            desc 'Get all posts'
            get do
                posts = Post.order(id: :desc)
                present posts, with: V1::Entities::PostEntity
            end

            desc 'Get a specific post'
            params do
                requires :id, type: Integer, desc: 'Post ID'
            end

            get ':id' do
                post = Post.find(params[:id])
                present post, with: V1::Entities::PostEntity
            end

            desc 'Create a new post'
            params do
                requires :title, type: String, desc: 'Post title'
                requires :body, type: String, desc: 'Post content'
                optional :user_id, type: String 
                optional :category_id, type: String 
                optional :sub_category_id, type: String 
                optional :image, type: File, desc: 'Post image'
            end
            post do
                new_post = Post.create!(title: params[:title],
                                   body: params[:body],
                                   user_id: params[:user_id],
                                   category_id: params[:category_id],
                                   sub_category_id: params[:sub_category_id]
                                )
                new_post.image.attach(io: params[:image][:tempfile], filename: params[:image][:filename]) if params[:image]

                # new_post.image.attach(params[:image]) if params[:image].is_a?(ActionDispatch::Http::UploadedFile)
                present new_post, with: V1::Entities::PostEntity
                # params
            end

            desc 'Update a post'
            params do
                requires :id, type: Integer, desc: 'Post ID'
                requires :title, type: String, desc: 'Post title'
                requires :body, type: String, desc: 'Post content'
                optional :user_id, type: String 
                optional :category_id, type: String 
                optional :sub_category_id, type: String
                optional :image, type: File, desc: 'Post image'
            end
            put ':id' do
                post = Post.find(params[:id])
                post.update(title: params[:title],
                    body: params[:body],
                    user_id: params[:user_id],
                    category_id: params[:category_id],
                    sub_category_id: params[:sub_category_id])
                present post, with: V1::Entities::PostEntity
            end

            desc 'Delete a post'
            params do
                requires :id, type: Integer, desc: 'Post ID'
            end
            delete ':id' do
                post = Post.find(params[:id])
                post.destroy
            end
        end
    end
end
