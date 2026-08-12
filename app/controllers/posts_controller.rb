class PostsController < ApplicationController
  allow_unauthenticated_access only: %i[ index ]

  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  
  def index
  if authenticated? && params[:keyword].present?
    @posts = Post.search_by_keyword(params[:keyword], params[:search_type]).order(created_at: :desc)
  else
    @posts = Post.order(created_at: :desc)
  end
end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user).order(created_at: :asc)
    @comment = Comment.new
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
    params.require(:post).permit(:title, :body, :address, :location_name, images: [])
  end
end
