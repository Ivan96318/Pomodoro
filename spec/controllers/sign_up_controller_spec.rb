require 'rails_helper'

RSpec.describe SignUpController, type: :controller do
  describe "GET #new" do
    it "renders the new template" do
      get :new

      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new user" do
        user_params = {
          name: "Taylor",
          email: "taylor@email.com",
          password: "123456-Ab.",
          password_confirmation: "123456-Ab."
        }

        expect do
          post :create, params: { user: user_params }
        end.to change(User, :count).by(1)
      end
    end

    context "with invalid parameters" do
      it "does not create a new user" do
        user_params = {
          name: nil,
          email: nil,
          password: nil,
          password_confirmation: nil
        }

        expect do
          post :create, params: { user: user_params }
        end.not_to change(User, :count)
        expect(response).to render_template("sign_up/_form")
      end
    end
  end
end
