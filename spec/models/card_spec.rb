require 'spec_helper'

describe Card do

  let(:card) { FactoryGirl.create :card }

  it 'has a valid factory' do
    card.should be_valid
  end

  describe "Card's interface" do
    it 'has a string name' do
      card.name.should be_a(String)
    end
    it 'has a string recto' do
      card.recto.should be_a(String)
    end
    it 'has a string verso' do
      card.verso.should be_a(String)
    end
    it 'has a string description' do
      card.description.should be_a(String)
    end
  end

  describe 'validations' do
    it 'is invalid without a recto' do
      FactoryGirl.build(:card, recto: nil).should_not be_valid
    end
    it 'is invalid without a verso' do
      FactoryGirl.build(:card, verso: nil).should_not be_valid
    end
  end

end
