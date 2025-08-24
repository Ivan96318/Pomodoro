require "rails_helper"

RSpec.describe "User visits my projects", type: :system do
  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }

  describe "user cretes new project" do
    context "when the fields are valid" do
      it "creates a new project" do
        login_as(user)
        visit projects_path
        click_link "Nuevo Proyecto"
        fill_in "project[name]", with: "Lorem Ipsum"
        fill_in "project[description]", with: "Some description"
        click_button "Guardar"
        
        expect(page).to have_content("Proyecto creado con exito")
      end
    end
  end

  describe "user edits project" do
    context "when the fields are valid" do
      it "edits a project" do
        project

        login_as(user)
        visit projects_path
        click_link "..."
        fill_in "project[name]", with: "Lorem Ipsum"
        fill_in "project[description]", with: "Some description"
        click_button "Guardar"
        
        expect(page).to have_content("Proyecto actualizado correctamente")
      end
    end
  end

  describe "user deletes project" do
    context "when the fields are valid" do
      it "deletes a project" do
        project

        login_as(user)
        visit projects_path
        click_link "..."
        page.accept_confirm '¿Estas seguro?' do
          click_button "Eliminar"
        end
        
        expect(page).to have_content("Proyecto eliminado correctamente")
      end
    end
  end

  def login_as(user)
    visit login_path
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password
    click_button "Iniciar sesión"
    expect(page).to have_content("Bienvenido")
  end
end
