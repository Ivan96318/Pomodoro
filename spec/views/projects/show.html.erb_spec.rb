# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'projects/show', type: :view do
  let(:user) { create(:user) }
  let(:project) { create(:project, user:) }

  it 'displays the project details' do
    assign(:project, project)
    

    render

    expect(rendered).to have_content("Proyecto: #{project.name}")
    expect(rendered).to have_link('Editar', href: edit_project_path(project))
    expect(rendered).to have_css('button.button.is-danger', text: 'Eliminar proyecto')
  end
end
