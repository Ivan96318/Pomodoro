# frozen_string_literal: true

class ProjectsController < ApplicationController
  include Pagy::Backend

  before_action :set_project, only: %i[show edit update destroy]

  def index
    @pagy, @projects = pagy(current_user.projects.order(id: :desc), items: 10)
  end
  def new
    @new_project = Project.new
  end

  def show
    set_tickets
  end

  def edit; end

  def create
    new_project = Project.new(project_params)

    if new_project.save
      flash[:notice] = 'Proyecto creado con exito'
      redirect_to project_path(new_project)
    else
      render(turbo_stream: turbo_stream.replace(
        new_project,
        partial: 'form',
        locals: { new_project: }
      ), status: :unprocessable_entity)
    end
  end

  def update
    if @project.update(project_params)
      flash[:notice] = 'Proyecto actualizado correctamente'
      redirect_to project_path(@project)
    else
      render(turbo_stream: turbo_stream.replace(
        'new_project',
        partial: 'form',
        locals: { new_project: @project }
      ), status: :unprocessable_entity)
    end
  end

  def destroy
    if @project.delete
      render turbo_stream: [
        turbo_stream.remove(@project),
        turbo_stream.replace("turbo-flash-message", 
          partial: "shared/turbo_flash", 
          locals: { message: "Proyecto eliminado correctamente" })]
    else
      render turbo_stream: turbo_stream.replace("turbo-flash-message", 
        partial: "shared/turbo_flash", 
        locals: { message: "No se pudo eliminar el proyecto" })
    end
  end

  def infinite_scroll
    @pagy, @projects = pagy(current_user.projects.order(id: :desc), items: 10, page: params[:page])
  end

  private

  def project_params
    params
      .require(:project)
      .permit(:name, :description, :project_type)
      .merge(user: current_user)
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def set_tickets
    @new_tickets = @project.tickets.where(status: 0)
    @in_progress_tickets = @project.tickets.where(status: 1)
    @done_tickets = @project.tickets.where(status: 2)
    @cancel_tickets = @project.tickets.where(status: 3)
    @pause_tickets = @project.tickets.where(status: 4)
    @pending_tickets = @project.tickets.where(status: 5)
  end
end
