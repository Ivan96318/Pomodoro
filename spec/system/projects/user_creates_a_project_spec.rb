# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User creates a new project', type: :system do
  let(:user) { create(:user) }

  before do
    driven_by(:selenium_chrome_headless)
  end

  context 'when values are valid', js: true do
    it 'creates a new project' do
      skip 'pasar este test para que se haga desde my projects'
      user

      visit login_path
      fill_in 'session[email]', with: user.email
      fill_in 'session[password]', with: user.password
      click_button 'Iniciar sesión'
      click_on 'Nuevo Proyecto'
      fill_in 'project[name]', with: 'Proyecto de prueba'
      fill_in 'project[description]', with: 'Descripcion de prueba'
      click_button 'Guardar'

      expect(page).to have_content('Proyecto de prueba')
      expect(page).to have_content('Proyecto creado con exito')
    end
  end

  context 'when the name is missing', js: true do
    it 'shows an error in name field' do
      skip 'pasar este test para que se haga desde my projects'
      user

      visit login_path
      fill_in 'session[email]', with: user.email
      fill_in 'session[password]', with: user.password
      click_button 'Iniciar sesión'
      click_on 'Nuevo Proyecto'
      fill_in 'project[description]', with: 'Descripcion de prueba'
      click_button 'Guardar'

      expect(page).to have_css('p.help.is-danger', text: 'Nombre no puede estar en blanco')
    end
  end

  context 'when the description is missing' do
    it 'shows an error in description field' do
      skip 'pasar este test para que se haga desde my projects'
      user

      visit login_path
      fill_in 'session[email]', with: user.email
      fill_in 'session[password]', with: user.password
      click_button 'Iniciar sesión'
      click_on 'Nuevo Proyecto'
      fill_in 'project[name]', with: 'Nombre de prueba'
      click_button 'Guardar'

      expect(page).to have_css('p.help.is-danger', text: 'Descripción no puede estar en blanco')
    end
  end
end
