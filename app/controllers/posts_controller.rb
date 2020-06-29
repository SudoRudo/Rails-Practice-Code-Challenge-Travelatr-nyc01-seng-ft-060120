class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :like]

    def index
        @posts = Post.all
    end

    def show
    end

    def new
        @bloggers = Blogger.all 
        @destinations = Destination.all
        @post = Post.new
    end

    def create
        @post = Post.create(post_params)
        if @post.valid?
            redirect_to posts_path(@post)
        else
            flash[:my_errors] = @post.errors.full_messages
            redirect_to edit_post_path
        end
    end

    def like
        @post.likes = @post.likes + 1
        redirect_to post_path(@post)
    end

    private

    def find_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end
end
