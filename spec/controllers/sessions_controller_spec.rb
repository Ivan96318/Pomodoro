require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let (:user) { create(:user) }

  describe "GET #new" do
    it "renders the new template" do
      get :new

      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "logs in the user" do
        session_paramas = {
          email: user.email,
          password: user.password
        }

        post :create, params: { session: session_paramas }

        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq("Bienvenido")
      end
    end

    context "with invalid parameters" do
      it "does not render to root path" do
        session_params = {
          email: "test",
          password: nil
        }

        post :create, params: { session: session_params }

        expect(response).not_to redirect_to(root_path)
      end
    end
  end

  describe "DELETE #destroy" do
    it "redirects to login path" do
      delete :destroy

      expect(response).to redirect_to(login_path)
    end
  end
end
