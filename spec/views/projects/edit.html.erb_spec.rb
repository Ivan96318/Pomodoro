require "rails_helper"

RSpec.describe "projects/edit", type: :view do
  let(:project) { create(:project) }

  it "displays the update form" do
    assign(:project, project)

    render

    expect(rendered).to have_css("h2.is-size-2", text: "Editar proyecto #{project.name}")
    expect(rendered).to have_content("Nombre del proyecto")
    expect(rendered).to have_content("Descripción")
  end
end
