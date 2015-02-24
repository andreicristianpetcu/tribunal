class BlogPostsController < ApplicationController
  before_action :set_blog_post, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @blog_posts = BlogPost.all
    respond_with(@blog_posts)
  end

  def show
    respond_with(@blog_post)
  end

  private
    def set_blog_post
      @blog_post = BlogPost.find(params[:id])
    end

    def blog_post_params
      params.require(:blog_post).permit(:title, :body)
    end
end
