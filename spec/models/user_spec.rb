require "rails_helper"

RSpec.describe User, type: :model do
  context 'relationships' do
    it { should have_many(:user_games) }
    it { should have_many(:games), through: :user_parties }
  end
  context 'validations' do
     it { should validate_presence_of(:username) }
     it { should validate_presence_of(:password_digest) }
     it { should validate_presence_of(:chip_count) }
  end
end
