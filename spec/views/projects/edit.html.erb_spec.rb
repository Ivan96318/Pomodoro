# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/projects/edit', type: :view do
  let(:user) { create(:user) }
  let(:project) { create(:project) }

  # TODO: averiguar como hacer stub el current user
  it 'displays the update form', :skip do
    assign(:project, project)

    render

    expect(rendered).to have_css('h2.is-size-2', text: "Editar proyecto #{project.name}")
    expect(rendered).to have_content('Nombre del proyecto')
    expect(rendered).to have_content('Descripción')
  end
end
