class HomeController < ApplicationController
  skip_before_action :authorize, only: :index

  def index
    render "landing" if current_user.nil?
  end
end
