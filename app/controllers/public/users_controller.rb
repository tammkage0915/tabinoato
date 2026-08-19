class Public::UsersController < Public::ApplicationController
  allow_unauthenticated_access only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      start_new_session_for @user
      redirect_to posts_path, status: :see_other, notice: "会員登録が完了しました！"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = Current.user
    end

    @posts = @user.posts.order(created_at: :desc).page(params[:page]).per(6)

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def edit
    if params[:id] && params[:id].to_i != Current.user.id
      redirect_to mypage_path, alert: "アクセス権限がありません"
      return
    end

    @user = Current.user
  end

  def update
    @user = Current.user
    if @user.update(user_params)
      redirect_to mypage_path, notice: "プロフィールを更新しました！"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def unsubscribe
  end

  def withdraw
    user = Current.user
    terminate_session
    user.destroy
    
    redirect_to new_user_path, notice: "退会処理が完了しました。"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email_address, :password, :password_confirmation, :profile_image)
  end
end
