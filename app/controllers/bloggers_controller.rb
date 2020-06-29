class BloggersController < ApplicationController
    before_action :set_blogger, only: [:show, :edit, :update, :delete] 
    def index
        @bloggers = Blogger.all 
    end

    def show
    end

    def new
        @blogger = Blogger.new
    end

    def create
        @blogger = Blogger.create(blogger_params)
        if @blogger.valid?
            redirect_to blogger_path(@blogger.id)
        else
            flash[:my_errors] = @blogger.errors.full_messages
            redirect_to new_blogger_path
        end
    end

    private

    def set_blogger
        @blogger = Blogger.find(params[:id])
    end

    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end
end
