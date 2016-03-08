require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(email: "user@blocipedia.com", encrypted_password: "helloworld") }

  it { is_expected.to have_many(:wikis) }
end
