class PostsController < ApplicationController
  before_action :authenticate_user, {only: [:new, :create, :edit, :update, :destroy, :delivery_void_flag_change]}
  
  def index
    @posts = Post.all.order(created_at: :desc)
    @posts = Post.page(params[:page]).per(10)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(title: params[:title],content: params[:content],url: params[:url],delivery_void_flag: 0)
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("/posts/new")
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title]
    @post.content = params[:content]
    @post.url = params[:url]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      render("/posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts/index")
  end

  def delivery_void_flag_change
    @post = Post.find_by(id: params[:id])
    if @post.delivery_void_flag == "effective"
      @post.delivery_void_flag = 1
      if @post.save
        flash[:notice] = "配信を停止しました"
        redirect_to("/posts/index")
      else
        render("/posts/#{@post.id}")
      end
    else
      @post.delivery_void_flag = 0
      if @post.save
        flash[:notice] = "配信リストに追加しました"
        redirect_to("/posts/index")
      else
        render("/posts/#{@post.id}")
      end
    end
  end
end
