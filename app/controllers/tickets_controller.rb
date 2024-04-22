class TicketsController < ApplicationController
  before_action :set_project
  before_action :set_ticket, only: %i[show edit update destroy]

  def show; end

  def new
    @new_ticket = Ticket.new(project: @project)
  end

  def edit; end

  def create
    @new_ticket = Ticket.new(ticket_params)

    if @new_ticket.save
      # TODO: add new ticket as a card in todo status
      flash[:notice] = "Ticket creado con exito"
    else
      render turbo_stream: turbo_stream.replace(
        @new_ticket,
        partial: "form",
        locals: { ticket: @new_ticket, url: project_tickets_path(@project) }
      ), status: :unprocessable_entity
    end
  end

  def update
    if @ticket.update(ticket_params)
      # TODO: close modal and show an alert to tell that the update was success
      flash[:notice] = "Ticket actualizado con exito"
    else
      render turbo_stream: turbo_stream.replace(
        "edit_ticket_#{@ticket.id}",
        partial: "form",
        locals: { ticket: @ticket, url: project_ticket_path(@project, @ticket) }
      ), status: :unprocessable_entity
    end
  end

  def destroy
    # TODO: poner un mensaje de fallo en caso de que falle
    if @ticket.destroy
      redirect_to project_path(@project), notice: "Ticket eliminado correctamente"
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_ticket
    @ticket = Ticket.find_by(id: params[:id])
  end
  
  def ticket_params
    params
      .require(:ticket)
      .permit(:short_description, :long_description)
      .merge(project: @project)
  end
end
