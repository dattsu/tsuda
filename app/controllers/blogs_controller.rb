class BlogsController < ApplicationController
  before_action :move_to_index, except: :index


  def index
    @blog = Bblog.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
  end

  def create
    Bblog.create(name: blog_params[:name], text: blog_params[:text], user_id: current_user.id)
    redirect_to "/blogs"
  end

  def destroy
    blog = Bblog.find(params[:id])
    blog.destroy if blog.user_id == current_user.id
  end

    def edit
      @blog = Bblog.find(params[:id])
    end

    def update
      blog = Bblog.find(params[:id])
      if blog.user_id == current_user.id
        blog.update(blog_params)
        redirect_to blogs_path(@blogs)
      end

    end

# 詳細ページに表示したい情報をshowアクションに定義
    def show
      @blog = Bblog.find(params[:id])
    end


  private
  def blog_params
    params.permit(:name, :text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
