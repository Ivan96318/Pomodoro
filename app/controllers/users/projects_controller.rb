# frozen_string_literal: true

module Users
  class ProjectsController < ApplicationController
    before_action :set_project, only: %i[show edit update destroy]

    def new
      @new_project = current_user.projects.build
    end

    def show
    end

    def edit; end

    def create
      new_project = Project.new(project_params)

      if new_project.save
        flash[:notice] = 'Proyecto creado con exito'
        redirect_to user_project_path(current_user, new_project)
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
        redirect_to user_project_path(@project)
      else
        render(turbo_stream: turbo_stream.replace(
          'new_project',
          partial: 'form',
          locals: { new_project: @project }
        ), status: :unprocessable_entity)
      end
    end

    def destroy
      @project.delete
      flash.now[:notice] = 'Proyecto eliminado correctamente'
      render(turbo_stream: turbo_stream.remove(@project))
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
  end
end
