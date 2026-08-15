class Public::SessionsController < Public::ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }

  def new
  end

  def create
    if (user = User.find_by(name: params[:name]))&.authenticate(params[:password])
      start_new_session_for user
      redirect_to posts_path, status: :see_other, notice: "ログインしました！"
    else
      flash.now[:alert] = "名前、またはパスワードが正しくありません。"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    terminate_session
    redirect_to root_path, notice: "ログアウトしました。"
  end
end
