class CommentsController < ApplicationController
  before_action :find_discussion
  before_action :find_comment, only: [:destroy, :edit, :update, :comment_owner]
  before_action :comment_owner, only: [:destroy, :edit, :update]
  before_action :set_current_user

  def create
    @comment = @discussion.comments.create(params[:comment].permit(:content))
    @comment.user_id = current_user.id
    @comment.save

    if @comment.save
      redirect_to discussion_path(@discussion)
    else
      flash[:notice] = "Blah blah blah"
      redirect_to discussion_path(@discussion)
    end
  end

  def destroy
    @comment.destroy
    redirect_to discussion_path(@discussion)
  end

  def edit
  end

  def update
    if @comment.update(params[:comment].permit(:content))
      redirect_to discussion_path(@discussion)
    else
      render 'edit'
    end
  end

  private

  def find_discussion
    @discussion = Discussion.find(params[:discussion_id])
  end

  def find_comment
    @comment = @discussion.comments.find(params[:id])
  end

  def comment_owner
    unless current_user.id == @comment.user_id
      flash[:notice] = "You do not have permission to perform that action"
      redirect_to @discussion
    end
  end

  def set_current_user
    @user = current_user
  end

end