class SubsController < ApplicationController
  before_action :editor_is_moderator!, only: [:edit,:update]


  def index

    @subs = Sub.all
  end

  def editor_is_moderator
  end

  def new
    @sub = Sub.new
  end

  def create
  end

  def show
    @sub = Sub.find(params[:id])
    @posts = @sub.posts
    # render json: params
  end

  def edit
    @sub = Sub.find(params[:id])
  end
  def update
  end




end
