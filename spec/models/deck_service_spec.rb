require "spec_helper"

describe "Deck Service" do
  describe 'Methods' do
    it '#get_new_deck' do
      deck = DeckService.new.get_new_deck

      expect(deck[:deck_id]).to be_a(String)
      expect(deck[:remaining]).to be_a(Integer)
      expect(deck[:success]).to eq(true)
      expect(deck[:shuffled]).to eq(false)
    end
  end
end
