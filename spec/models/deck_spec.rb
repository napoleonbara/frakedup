require 'spec_helper'

describe Deck do

  let(:deck) { FactoryGirl.create :deck }
  let(:default_deck) { FactoryGirl.create :default_deck }

  it 'has a valid factory' do
    deck.should be_valid
  end

  describe "Deck's interface" do
    it { should respond_to :shuffle }
    it { should respond_to :insert }
    it { should respond_to :cards }
    it { should respond_to :draw }
    it { should respond_to :size }
    it { should respond_to :owner }
  end

  describe 'insertion and draw' do
    it 'responds to insert at top'
    it 'responds to insert at bottom'
    it 'responds to insert at random'
    it 'responds to draw at top'
    it 'responds to draw at bottom'
    it 'responds to draw at random'
    it 'reponds ONLY to draw or insert at random, top and bottom' do
      expect { deck.draw 'EPIC_FAIL'}.to raise_error(ArgumentError)
      expect { deck.insert nil, 'EPIC_FAIL'}.to raise_error(ArgumentError)
    end
  end

  it 'has many cards' do
    deck.cards.should == [] 
  end

  it 'has a nil owner by default' do
    default_deck.owner.should == nil
  end
  
end
