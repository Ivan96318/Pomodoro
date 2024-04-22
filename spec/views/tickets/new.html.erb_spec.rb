require "rails_helper"

RSpec.describe "tickets/new", type: :view do
  let(:project) { create(:project) }
  let(:new_ticket) { build(:ticket, project: project) }

  it "displays new ticket form" do
    assign(:project, project)
    assign(:new_ticket, new_ticket)

    render

    expect(rendered).to have_content("Nuevo Ticket")
    expect(rendered).to have_css(".modal-card-head")
    expect(rendered).to have_css(".modal-card-body")
  end
end
