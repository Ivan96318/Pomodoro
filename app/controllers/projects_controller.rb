class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]
  
  def new
    @new_project = Project.new
  end

  def show; end

  def edit; end

  def create
    new_project = Project.new(project_params)

    if new_project.save
      flash[:notice] = "Proyecto creado con exito"
      redirect_to project_path(new_project)
    else
      render(turbo_stream: turbo_stream.replace(
        new_project,
        partial: "form",
        locals: {new_project: new_project}
      ), status: :unprocessable_entity)
    end
  end

  def update
    if @project.update(project_params)
      flash[:notice] = "Proyecto actualizado correctamente"
      redirect_to project_path(@project)
    else
      render(turbo_stream: turbo_stream.replace(
        "new_project",
        partial: "form",
        locals: {new_project: @project}
      ), status: :unprocessable_entity)
    end
  end

  def destroy
    @project.delete
    redirect_to root_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :project_type)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
