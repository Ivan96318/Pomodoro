require "rails_helper"

RSpec.describe "users/projects/show", type: :view do
  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }

  # TODO: averiguar como hacer stub del current user
  it "displays the project details", :skip do
    assign(:project, project)

    render current_user: user

    expect(rendered).to have_content("Proyecto: #{project.name}")
    expect(rendered).to have_link("Editar", href: edit_project_path(project))
    expect(rendered).to have_css("button.button.is-danger", text: "Eliminar proyecto")
  end
end
