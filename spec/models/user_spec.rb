# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to have_secure_password }
    it { is_expected.to allow_value('test@example.com').for(:email) }
    it { is_expected.to allow_value('This1password*').for(:password) }
  end
end
