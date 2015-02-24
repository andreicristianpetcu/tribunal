class BlogPagesController < ApplicationController
  before_action :set_blog_page, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @blog_pages = BlogPage.all
    respond_with(@blog_pages)
  end

  def show
    respond_with(@blog_page)
  end

  def new
    @blog_page = BlogPage.new
    respond_with(@blog_page)
  end

  def edit
  end

  def create
    @blog_page = BlogPage.new(blog_page_params)
    @blog_page.save
    respond_with(@blog_page)
  end

  def update
    @blog_page.update(blog_page_params)
    respond_with(@blog_page)
  end

  def destroy
    @blog_page.destroy
    respond_with(@blog_page)
  end

  private
    def set_blog_page
      @blog_page = BlogPage.find(params[:id])
    end

    def blog_page_params
      params.require(:blog_page).permit(:title, :body)
    end
end
