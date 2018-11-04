require 'rails_helper'

RSpec.describe Game, type: :model do
  context 'relationships' do
    it { should have_many(:user_games) }
    it { should have_many(:users), through: :user_parties }
  end
  context 'validations' do
     it { should validate_presence_of(:hands_played) }
     it { should validate_presence_of(:win_loss) }
     it { should validate_presence_of(:deck_id) }
  end
end
