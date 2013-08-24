require 'spec_helper'

describe CardsDeck do
  
  let(:cards_deck) { FactoryGirl.create :cards_deck}

  it 'has a valid factory' do
    cards_deck.should be_a CardsDeck
    cards_deck.should be_valid
  end

  describe "CardsDeck's interface" do
    it 'has a card' do
      cards_deck.card.should be_a(Card)
    end
    it 'has a deck' do
      cards_deck.deck.should be_a(Deck)
    end
    it 'has a rank' do
      cards_deck.rank.should be_a(Integer)
    end
  end

  describe 'validations' do
    it 'is invalid without a card' do
      FactoryGirl.build(:cards_deck, card: nil).should_not be_valid
    end
    it 'is invalid without a deck' do
      FactoryGirl.build(:cards_deck, deck: nil).should_not be_valid
    end
    it 'is invalid without a rank' do
      FactoryGirl.build(:cards_deck, rank: nil).should_not be_valid
    end
  end

end
