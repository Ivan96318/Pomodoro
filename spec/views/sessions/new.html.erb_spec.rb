# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sessions/new', type: :view do
  let(:session) { Session.new }

  it 'displays the login form' do
    assign(:session, session)

    render

    expect(rendered).to have_css('h1.has-text-centered', text: 'Inicia Sesión')
    expect(rendered).to have_content('Correo electrónico')
    expect(rendered).to have_content('Contraseña')
  end
end
