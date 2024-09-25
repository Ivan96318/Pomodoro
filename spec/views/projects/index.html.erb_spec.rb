require 'rails_helper'

RSpec.describe "projects/index.html.erb" do
  before do
    mock_pagy
  end

  it "renders the index view" do
    create(:project)
    projects = Project.all
    assign(:projects, projects)

    render

    expect(rendered).to have_content("Mis Proyectos")
    expect(rendered).to have_css("a.button[href='/projects/new']", text: "Nuevo Proyecto")
    expect(rendered).to have_css("a.button[href='/projects/1/edit']")
  end
end
