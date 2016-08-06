class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    # render json: post_params
    @post = Post.new(
    title: post_params[:title],
    url: post_params[:url],
    content: post_params[:content],
    author_id: current_user.id,
    sub_ids: post_params[:sub_ids]
    )
    # @post.save
    # @post.sub_ids = post_params[:sub_ids]
    #@post.sub_ids = post_params[:sub_ids]
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @subs = @post.subs
    @comments = Comment.where(post_id: params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(
    title: post_params[:title],
    url: post_params[:url],
    content: post_params[:content],
    author_id: current_user.id,
    sub_ids: post_params[:sub_ids]
    )
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content, :author_id, sub_ids: [])
  end
end
