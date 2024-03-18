class HomeController < ApplicationController
  skip_before_action :authorize, only: :index
  
  def index
    @projects = current_user.projects.limit(5).order(created_at: :desc) if current_user
    render_landing if !current_user
  end
  
  private
  
  def render_landing
    render "landing", layout: "landing"
  end
end
