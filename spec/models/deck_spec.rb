require 'spec_helper'

describe Deck do

  let(:empty_deck) { FactoryGirl.create :deck}

  let(:card_list_size) {25}    
  let(:card_list) {FactoryGirl.create_list(:card, card_list_size)}    

  let(:ordered_deck) {
     deck = FactoryGirl.create :deck
     card_list.each do |card|
       deck.insert card, at: :top
     end
     deck
  }
  let(:random_deck) {
     deck = FactoryGirl.create :deck
     card_list.each do |card|
       deck.insert card, at: :random
     end
     deck
  }

  it 'has a valid factory' do
    empty_deck.should be_a Deck
    empty_deck.should be_valid
  end

  describe "new deck" do
    it 'has a string name' do
      empty_deck.name.should be_a(String)
    end
    it 'has many cards' do
      empty_deck.cards.should == []
    end
    it 'has no cards' do
      expect{empty_deck.no_cards?}.to be_true
    end
  end

  describe 'destruction' do
    it 'also destroys its cards association'
  end

  it 'can be shuffled' do
    random_deck.shuffle
    #je suis un peu emmerde pour tester le shuffle...
    random_deck.should include(*card_list)
    expect{random_deck.instance_exec{coherent?}}.to be_true
  end

  describe 'card inspection' do

    it 'keeps track of the number of cards' do
      ordered_deck.size.should == card_list_size
    end
    it 'can be done at top' do
      ordered_deck.top_card.should == card_list.last
      expect{ordered_deck.instance_exec{coherent?}}.to be_true
    end
    it 'can be done at bottom' do
      ordered_deck.bottom_card.should == card_list.first
      expect{ordered_deck.instance_exec{coherent?}}.to be_true
    end
    it "keeps the deck's size" do
      ordered_deck.top_card
      ordered_deck.bottom_card
      ordered_deck.size.should == card_list_size
    end
    it "returns nil on empty decks" do
      empty_deck.top_card.should == nil
      empty_deck.bottom_card.should == nil
    end
  end

  describe 'card rank coherence' do
    it 'is guaranteed at creation' do
      expect{deck.instance_exec{coherent?}}.to be_true
    end
  end

  describe 'card insertion' do
  
    let(:card) {FactoryGirl.create :card}    

    it 'can be done at top' do
      random_deck.insert card, at: :top
      random_deck.top_card.should == card
      expect{random_deck.instance_exec{coherent?}}.to be_true
    end
    it 'can be done at bottom' do
      random_deck.insert card, at: :bottom
      random_deck.bottom_card.should == card
      expect{random_deck.instance_exec{coherent?}}.to be_true
    end
    it 'can be done at random' do
      random_deck.insert card, at: :random
      random_deck.should include(card)
      expect{random_deck.instance_exec{coherent?}}.to be_true
    end
    it 'is at random by default' do
      random_deck.insert card
      random_deck.should include(card)
      expect{random_deck.instance_exec{coherent?}}.to be_true
    end
    it 'maintain coherence' do
      expect{random_deck.instance_exec{coherent?}}.to be_true
    end
    it 'can be done only at top, bottom or random' do
      expect { random_deck.insert card, at: :caca_boudin}
        .to raise_error(ArgumentError, "can't insert at caca_boudin.")
    end
    it "increments the deck's size" do
      {top: card_list_size + 1,
       bottom: card_list_size + 2,
       random: card_list_size + 3
      }.each do |sym, expect_size|
        random_deck.insert card, at: sym
        random_deck.size.should == expect_size
      end
    end
  end

  describe 'card drawing' do

    it 'can be done at top' do
      ordered_deck.draw(from: :top).should == card_list.last
      expect{ordered_deck.instance_exec{coherent?}}.to be_true
    end
    it 'can be done at bottom' do
      ordered_deck.draw(from: :bottom).should == card_list.first
      expect{ordered_deck.instance_exec{coherent?}}.to be_true
    end
    it 'can be done at random' do
      card_list.should include(ordered_deck.draw(at: :random))
      expect{ordered_deck.instance_exec{coherent?}}.to be_true
    end
    it 'is at top by default' do
      ordered_deck.draw.should == card_list.last
      expect{ordered_deck.instance_exec{coherent?}}.to be_true
    end
    it 'can be done only at top, bottom or random' do
      expect { random_deck.draw from: :caca_boudin}
        .to raise_error(ArgumentError, "can't draw at caca_boudin.")
    end
    it "decrements the deck's size" do
      {top: card_list_size - 1,
       bottom: card_list_size - 2,
       random: card_list_size - 3
      }.each do |sym, expect_size|
        random_deck.draw at: sym
        random_deck.size.should == expect_size
      end
    end
    it "returns nil on empty decks" do
      empty_deck.draw.should == nil
    end
  end
end
