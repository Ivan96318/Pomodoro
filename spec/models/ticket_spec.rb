require "rails_helper"

RSpec.describe Ticket, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:short_description) }
    it { is_expected.to validate_presence_of(:status) }
  end

  describe "associations" do
    it { should belong_to(:project) }
    it { should belong_to(:assigned_to).class_name("User") }
  end

  it { should define_enum_for(:status) }
end
