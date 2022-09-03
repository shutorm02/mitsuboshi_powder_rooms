class Admin::UserSessionsController < Admin::BaseController
  skip_before_action :require_login
  skip_before_action :check_admin
  layout 'layouts/admin_login'

  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to admin_root_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def logout
    logout
    redirect_to admin_login_path, success: t('.success')
  end
end
