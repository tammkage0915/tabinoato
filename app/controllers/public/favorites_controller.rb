class Public::FavoritesController < Public::ApplicationController
  def create
    @post = Post.find(params[:post_id])
    current_user.favorites.create(post_id: @post.id)
    redirect_back fallback_location: posts_path, status: :see_other
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: @post.id)
    favorite&.destroy
    redirect_back fallback_location: posts_path, status: :see_other
  end

  def index
    @bookmark_posts = current_user.bookmark_posts.order(created_at: :desc)
  end
end
