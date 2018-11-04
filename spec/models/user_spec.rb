require "rails_helper"

describe User do
  context 'relationships' do
    it { should have_many(:user_games) }
    it { should have_many(:games), through: :user_parties }
  end
  context 'validations' do
     it { should validate_presence_of(:username) }
     it { should validate_presence_of(:password) }
     it { should validate_presence_of(:chip_count) }
  end
end
