class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to mypage_path, notice: "ユーザー情報を変更しました！"
    else
      @user = current_user
      render :edit
    end
  end

  # 退会機能
  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def confirm
  end



  private

    def user_params
      params.require(:user).permit(:user_id, :user_name, :email, :encrypted_password, :age, :is_deleted)
    end

end
