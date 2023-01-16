class HomeController < ApplicationController
  skip_before_action :require_login, only: %i[index terms_of_use privacy_policy]

  def index; end
  def terms_of_use; end
  def privacy_policy; end
end
