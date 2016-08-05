class SubsController < ApplicationController
  before_action :require_login!, only: [:new, :create, :edit, :update]

  before_action :editor_is_moderator!, only: [:edit,:update]



  def index
    @subs = Sub.all
  end

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(
    title: sub_params[:title],
    description: sub_params[:description],
    moderator_id: current_user.id
    )
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = "failed to create your sub"
      render :new
    end

  end

  def show
    @sub = Sub.find(params[:id])
    @posts = @sub.posts
    # render json: params
  end

  def edit
    #render json: params
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = Sub.find(params[:id])
    @sub.update(
    title: sub_params[:title],
    description: sub_params[:description],
    moderator_id: current_user.id
    )
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = "failed to create your sub"
      render :new
    end

  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end


end
