class HomeController < ApplicationController
  def index
  end

  def user_signout
    sign_out current_user
    redirect_to root_url
  end
end
