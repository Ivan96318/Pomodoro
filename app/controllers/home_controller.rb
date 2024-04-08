# frozen_string_literal: true

class HomeController < ApplicationController
  skip_before_action :authorize, only: :index

  def index
    @projects = current_user.projects.limit(5).order(created_at: :desc) if current_user
    render_landing unless current_user
  end

  private

  def render_landing
    render 'landing', layout: 'landing'
  end
end
