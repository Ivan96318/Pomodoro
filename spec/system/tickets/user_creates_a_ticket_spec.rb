require "rails_helper"

RSpec.describe "User creates a new ticket", type: :system do
  let(:user) { create(:user) }
  let(:project) { create(:project) }

  # TODO: agregar mas pruebas para cuando haya una accion despues de crear el ticket
  context "when the values are valid", js: true do
    xit "creates a new ticket" do
      # Sign in
      visit login_path
      fill_in "session[email]", with: user.email
      fill_in "session[password]", with: user.password
      click_button "Iniciar sesión"

      # Create new ticket
      visit project_path(project)
      click_link "Nuevo ticket"
      fill_in "ticket[short_description]", with: "Lorem ipsum"
      fill_in "ticket[long_description]", with: "Lorem ipsum dolor"
      click_button "Guardar Ticket"

      # expect(Ticket.count).to eq(1)
    end
  end

  # TODO: arreglar el field error para que aparezca el nombre del campo y arreglar la prueba
  context "when the short description is missing", js: true do
    it "shows an error in the short description field" do
      # Sign in
      visit login_path
      fill_in "session[email]", with: user.email
      fill_in "session[password]", with: user.password
      click_button "Iniciar sesión"

      # Create new ticket
      visit project_path(project)
      click_link "Nuevo ticket"
      fill_in "ticket[long_description]", with: "Lorem ipsum dolor"
      click_button "Guardar Ticket"

      expect(page).to have_css("p.help.is-danger", text: "no puede estar en blanco")
    end
  end
end
