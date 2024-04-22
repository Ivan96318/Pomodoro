require "rails_helper"

RSpec.describe "tickets/edit", type: :view do
  let(:project) { create(:project) }
  let(:ticket) { create(:ticket, project: project) }

  it "displays ticket edit form" do
    assign(:project, project)
    assign(:ticket, ticket)

    render

    expect(rendered).to have_css(".title.is-2", text: "Editar ticket")
    expect(rendered).to have_css("form[action='#{project_ticket_path(project, ticket)}']", text: "Eliminar")
    expect(rendered).to have_css(".modal-card-head")
    expect(rendered).to have_css(".modal-card-body")
  end
end
