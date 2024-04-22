require "rails_helper"

RSpec.describe Ticket, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:short_description) }
  end

  describe "associations" do
    it { should belong_to(:project) }
  end

  it { should define_enum_for(:status) }
end
