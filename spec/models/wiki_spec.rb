require 'rails_helper'
include RandomData

RSpec.describe Wiki, type: :model do
  let(:user) { User.create(email: "user@blocipedia.com", encrypted_password: "helloworld") }
  let(:wiki) { Wiki.create(title: RandomData.random_sentence, body: RandomData.random_paragraph) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:users_as_collaborator).through(:collaborations) }

  describe "attributes" do
    it "responds to title" do
      expect(wiki).to respond_to(:title)
    end

    it "responds to body" do
      expect(wiki).to respond_to(:body)
    end
  end

  describe "the collaboration relationship" do
    it "should return all users that the wiki is related to via collaborations" do
        wiki = Wiki.create
        user = User.create(email: "Test@example.com", password: "password")
        Collaboration.create(user: user, wiki: wiki)
        expect(Wiki.first.users_as_collaborator).to eq([user])
    end
  end
end
