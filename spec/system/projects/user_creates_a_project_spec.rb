require "rails_helper"

RSpec.describe "User creates a new project", type: :system do
  context "when values are valid" do
    it "creates a new project" do
      visit new_project_path

      fill_in "project[name]", with: "Proyecto de prueba"
      fill_in "project[description]", with: "Descripcion de prueba"
      click_button "Guardar"

      expect(page).to have_content("Proyecto: Proyecto de prueba")
      expect(page).to have_content("Proyecto creado con exito")
    end
  end

  context "when the name is missing" do
    it "shows an error in name field" do
      visit new_project_path
      fill_in "project[description]", with: "Descripcion de prueba"
      click_button "Guardar"

      expect(page).to have_css("p.help.is-danger", text: "Nombre no puede estar en blanco")
    end
  end

  context "when the description is missing" do
    it "shows an error in description field" do
      visit new_project_path
      fill_in "project[name]", with: "Nombre de prueba"
      click_button "Guardar"
      
      expect(page).to have_css("p.help.is-danger", text: "Descripción no puede estar en blanco")
    end
  end
end
