require 'rails_helper'
include RandomData

RSpec.describe Wiki, type: :model do
  let(:user) { User.create(email: "user@blocipedia.com", encrypted_password: "helloworld") }
  let(:wiki) { Wiki.create(title: RandomData.random_sentence, body: RandomData.random_paragraph) }

  it { is_expected.to belong_to(:user)}

  describe "attributes" do
    it "responds to title" do
      expect(wiki).to respond_to(:title)
    end

    it "responds to body" do
      expect(wiki).to respond_to(:body)
    end
  end

end
