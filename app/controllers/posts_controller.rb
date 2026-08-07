class PostsController < ApplicationController
  

  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Current.user.posts.build(post_params)
    if @post.save
      redirect_to post_path(@post), notice: "投稿を作成しました！"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "投稿を更新しました！"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to mypage_path, notice: "投稿を削除しました。"
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def ensure_correct_user
    unless @post.user == Current.user
      redirect_to posts_path, alert: "権限がありません。"
    end
  end

  def post_params
    params.require(:post).permit(:title, :body, :address, :location_name)
  end
end
