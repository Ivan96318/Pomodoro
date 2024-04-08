# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sign up', type: :system do
  context 'when the fields are correct' do
    it 'creates a new user', js: true do
      visit sign_up_path

      fill_in 'user[name]', with: 'Corey'
      fill_in 'user[email]', with: 'corey@mail.com'
      fill_in 'user[password]', with: '123456-Ab'
      fill_in 'user[password_confirmation]', with: '123456-Ab'

      click_button 'Guardar'

      expect(page).to have_content('Usuario creado con exito')
      expect(User.count).to eq(1)
    end
  end

  context 'when the fields are incorrect' do
    it 'does not create a new user' do
      visit sign_up_path

      fill_in 'user[name]', with: ''
      fill_in 'user[email]', with: 'corey'
      fill_in 'user[password]', with: '123456'
      fill_in 'user[password_confirmation]', with: '12'

      click_button 'Guardar'

      expect(page).to have_content('no puede estar en blanco')
      expect(page).to have_content('es inválido')
      expect(page).to have_content('no coincide')
    end
  end
end
