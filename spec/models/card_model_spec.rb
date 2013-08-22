require 'spec_helper'

describe CardModel do

  let(:card_model) { FactoryGirl.create :card_model }

  it 'has a valid factory' do
    card_model.should be_a CardModel
    card_model.should be_valid
  end

  describe "Card model's interface" do
    it 'has a string name' do
      card_model.name.should be_a(String)
    end
    it 'has a string recto' do
      card_model.recto.should be_a(String)
    end
    it 'has a string verso' do
      card_model.verso.should be_a(String)
    end
  end

  describe 'validations' do
    it 'is invalid without a recto' do
      FactoryGirl.build(:card_model, recto: nil).should_not be_valid
    end
    it 'is invalid without a verso' do
      FactoryGirl.build(:card_model, verso: nil).should_not be_valid
    end
  end

end
