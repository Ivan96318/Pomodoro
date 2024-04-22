require "rails_helper"

RSpec.describe TicketsController, type: :controller do
  let(:project) { create(:project) }
  let(:ticket) { create(:ticket, project: project) }

  describe "GET #show" do
    it "renders the show template" do
      get :show, params: { project_id: project.id, id: ticket.id }

      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "renders the new template" do
      get :new, params: { project_id: project.id }

      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new ticket" do
        ticket_params = {
          short_description: "Lorem Ipsum",
          long_description: "Lorem Ipsum dolor sit amet"
        }

        post :create, params: { project_id: project.id, ticket: ticket_params }

        expect(Ticket.count).to eq(1)
        expect(flash[:notice]).to eq("Ticket creado con exito")
      end
    end

    context "with invalid parameters" do
      it "does not create a ticket" do
        ticket_params = {
          short_description: nil,
          long_description: nil
        }

        post :create, params: { project_id: project.id, ticket: ticket_params }

        expect(Ticket.count).to eq(0)
      end
    end
  end

  describe "GET #edit" do
    it "renders the edit template" do
      get :edit, params: { project_id: project.id, id: ticket.id }

      expect(response).to render_template(:edit)
    end
  end

  describe "PATCH #update" do
    context "with valid parameters" do
      it "updates the tickt" do
        ticket_params = {
          short_description: "short description changed",
          long_description: "long description changed"
        }

        patch :update, params: { project_id: project.id, id: ticket.id, ticket: ticket_params }

        expect(ticket.reload.short_description).to eq("short description changed")
        expect(ticket.long_description).to eq("long description changed")
        expect(flash[:notice]).to eq("Ticket actualizado con exito")
      end
    end

    context "with invalid parameters" do
      it "does not update the ticket" do
        ticket_params = {
          short_description: nil,
          long_description: "long description changed"
        }

        patch :update, params: { project_id: project.id, id: ticket.id, ticket: ticket_params }

        expect(ticket.reload.short_description).not_to be_nil
        expect(ticket.long_description).not_to eq("long description changed")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the ticket" do
      delete :destroy, params: { project_id: project.id, id: ticket.id }

      expect(Ticket.count).to eq(0)
    end
  end
end
