class UsersController < ApplicationController
  def show
    @name = current_user.name
    @blog = current_user.bblogs.page(params[:page]).per(5).order("created_at DESC")
  end


end
