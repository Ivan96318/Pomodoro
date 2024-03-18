require "rails_helper"

RSpec.describe "projects/new", type: :view do
  let(:new_project) { Project.new }

  # TODO: averiguar como hacer stub el current user
  it "displays new project form", :skip do
    assign(:new_project, new_project)

    render

    expect(rendered).to have_css("h2.is-size-2", text: "Nuevo proyecto")
    expect(rendered).to have_content("Nombre del proyecto")
    expect(rendered).to have_content("Descripción")
  end
end
