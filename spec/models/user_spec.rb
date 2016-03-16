require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(email: "user@blocipedia.com", password: "helloworld") }

  it { is_expected.to have_many(:wikis) }
  it { is_expected.to have_many(:wikis_as_collaborator).through(:collaborations) }

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


  describe "the collaboration relationship" do
    it "should return all wikis that the user is related to via collaborations" do
        wiki = Wiki.create
        user = User.create(email: "Test@example.com", password: "password")
        Collaboration.create(user: user, wiki: wiki)
        expect(User.first.wikis_as_collaborator).to eq([wiki])
    end
  end
end
