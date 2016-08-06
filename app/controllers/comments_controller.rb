class CommentsController < ApplicationController
  def new
    @post_id = params[:post_id]
    @comment = Comment.new
  end

  def edit

  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_url(Post.find(comment_params[:post_id]))
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
    @post_id = @comment.post_id
  end

  def update

  end

  private
  def comment_params
    params.require(:comment).permit(:user_id,:post_id,:content,:parent_id)
  end

end
