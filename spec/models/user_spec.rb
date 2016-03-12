require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(email: "user@blocipedia.com", password: "helloworld") }

  it { is_expected.to have_many(:wikis) }

  describe "attributes" do
    it "should respond to email" do
      expect(user).to respond_to(:email)
    end

    it "should respond to role" do
      expect(user).to respond_to(:role)
    end

    it "defaults to standard role" do
      my_user = User.create!(email: "standard@blocipedia.com", password: "helloworld")
      expect(my_user.role).to eq("standard")
    end
  end
end
