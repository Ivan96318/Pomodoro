# frozen_string_literal: true

require "rails_helper"

RSpec.describe ProjectComponent, type: :component do
  let(:project) { create(:project, name: "Almanaque") }
  
  it "renders the project component" do
    render_inline(described_class.new(project: project))
    expect(page).to have_css("p.card-header-title", text: project.name)
    expect(page).to have_link("Editar")
    expect(page).to have_link("Eliminar")
  end
end
