class Deck < ActiveRecord::Base

  has_many :cards_decks, dependent: :destroy
  has_many :cards, through: :cards_decks, dependent: :destroy

  def no_cards?
    card_associations.count == 0
  end

  def cards
    card_associations.order(:rank).map(&:card)
  end

  def draw opts={}
    return nil if no_cards?
    from = opts.fetch(:from, :top)
    index = where_to 'draw', from
    association = card_associations.find_by_rank(index)
    card = association.card
    association.destroy
    card_associations.where('rank > ?', index)
      .update_all('rank = rank - 1')
      #.each{|cd| cd.update(rank: cd.rank - 1)}
    card
  end

  def insert card, opts={}
    where = opts.fetch(:at, :random)
    index = where_to 'insert', where
    card_associations.where('rank >= ?', index)
      .update_all('rank = rank + 1')
      #.each{|cd| cd.update(rank: cd.rank + 1)}
    CardsDeck.create card: card, deck: self, rank: index
  end

  def top_card
    return nil if no_cards?
    card_associations.where(rank: 0).first.card  
  end

  def bottom_card
    return nil if no_cards?
    card_associations.find_by_rank(size - 1).card  
  end

  def size
    return 0 if no_cards?
    card_associations.maximum(:rank) + 1
  end

  def include? card
    card_associations.where(card: card).any?
  end

  def shuffle
    new_order = (0...size).to_a.shuffle.each
    card_associations.each do |assoc|
      assoc.update(rank: new_order.next)
    end
  end

  private

    def where_to operation, place
      interval = case operation
        when 'draw' then 0...size
        when 'insert' then 0..size
      end

      case place
        when :top    then 0
        when :bottom then interval.max
        when :random then rand(interval).to_i
        else 
          raise ArgumentError, "can't #{operation} at #{place}." 
      end
    end
    def card_associations
      CardsDeck.where(deck: self)
    end

    def coherent?
      card_associations.order(:rank).select(:rank) == (0...size).to_a
    end
end
