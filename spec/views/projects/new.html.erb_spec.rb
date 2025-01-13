# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'projects/new', type: :view do
  let(:new_project) { Project.new }

  it 'displays new project form' do
    assign(:new_project, new_project)

    render

    expect(rendered).to have_css('h2.is-size-2', text: 'Nuevo proyecto')
    expect(rendered).to have_content('Nombre del proyecto')
    expect(rendered).to have_content('Descripción')
  end
end
