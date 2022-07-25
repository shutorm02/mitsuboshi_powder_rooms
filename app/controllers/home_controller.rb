class HomeController < ApplicationController
  skip_before_action :require_login, only: %i[index]

  def index; end
end
