class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_discussions = @user.discussions
  end
end