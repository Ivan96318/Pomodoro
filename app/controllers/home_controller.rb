class HomeController < ApplicationController
  skip_before_action :authorize, only: :index
  
  def index
    render_landing if !current_user
  end
  
  private
  
  def render_landing
    render "landing", layout: "landing"
  end
end
