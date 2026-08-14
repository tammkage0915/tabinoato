class Public::CommentsController < Public::ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = Current.user

    if @comment.save
      redirect_to post_path(@post), notice: "コメントを投稿しました。"
    else
      redirect_to post_path(@post), alert: "コメントの投稿に失敗しました。"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Current.user.comments.find(params[:id])
    @comment.destroy

    redirect_to post_path(@post), notice: "コメントを削除しました。"
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
