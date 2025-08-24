require "rails_helper"

RSpec.describe "tickets/show", type: :view do
  let(:project) { create(:project) }
  let(:ticket) { create(:ticket, project: project, status: 0) }
  let(:ticket_2) { create(:ticket, project: project, status: 0, due_date: nil, assigned_to: nil) }

  it "displays ticket attributes" do
    skip # remove this skip when the part of tickes is finished
    assign(:project, project)
    assign(:ticket, ticket)

    render

    expect(rendered).to have_css(".is-size-1", text: ticket.short_description)
    expect(rendered).to have_content(ticket.long_description)
    expect(rendered).to have_css("a[href='#{edit_project_ticket_path(project, ticket)}']")
    expect(rendered).to have_content("Estado: Por hacer")
    expect(rendered).to have_content("Fecha compromiso: #{ticket.due_date}")
    expect(rendered).to have_content("Asignado a: #{ticket.assigned_to.name}")
  end

  context "when some attributes does not have values" do
    it "displays the ticket attributes" do
      skip # remove this skip when the part of tickes is finished
      assign(:project, project)
      assign(:ticket, ticket_2)

      render

      expect(rendered).to have_content("Fecha compromiso: Sin fecha")
      expect(rendered).to have_content("Asignado a: Sin asignar")
    end
  end
end
