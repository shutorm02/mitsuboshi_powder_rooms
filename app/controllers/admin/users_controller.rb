class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: %i[edit update show destroy]

  def index
    @users = User.all.order(id: :asc).page(params[:page])
  end

  def show; end

  def destroy
    @user.destroy!
    redirect_to admin_users_path, success: t('defaults.message.delete')
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
