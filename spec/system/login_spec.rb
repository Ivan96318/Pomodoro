require "rails_helper"

RSpec.describe "Login", type: :system do
  let(:user) { create(:user) }
  
  context "when the form is valid", js: true do
    it "logs in the user" do
      user

      visit login_path
      fill_in "session[email]", with: user.email
      fill_in "session[password]", with: user.password
      click_button "Iniciar sesión"

      expect(page).to have_content("Bienvenido")
      expect(page).to have_content("Inicio")
    end
  end

  context "when the form is not valid", js: true do
    it "displays the error" do
      user

      visit login_path
      fill_in "session[email]", with: "test@test.com"
      fill_in "session[password]", with: "123"
      click_button "Iniciar sesión"

      expect(page).to have_content("Usuario o contraseña invalido")
    end
  end
end
