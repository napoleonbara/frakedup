require 'spec_helper'

describe Card do

  let(:card) { FactoryGirl.create :card }

  it 'has a valid factory' do
    card.should be_a Card
    card.should be_valid
  end

  describe "Card's interface" do
    it 'has a card model' do
      card.card_model.should be_a CardModel
    end
    it 'has a string name' do
      card.name.should be_a(String)
    end
    it 'has a string recto' do
      card.recto.should be_a(String)
    end
    it 'has a string verso' do
      card.verso.should be_a(String)
    end
  end

  describe 'validations' do
    it 'is invalid without a card model' do
      FactoryGirl.build(:card, card_model: nil).should_not be_valid
    end
  end

end
