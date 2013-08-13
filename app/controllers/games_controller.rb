class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy, :start]

  # POST /games/:id/start
  def start
    if @game.started?
      #TODO error
    end
    @game.started = true
    
    # New Coinche
    deck = Deck.new(:name => "Pioche")
    File.open("#{Rails.root}/db/fixtures/playing_cards.yml", 'r') do |file|
      record = YAML::load_file(file)
      deck.cards << Card.create(record["card"])
    end
    deck.shuffle
    @game.decks << deck
    @game.users.each do |user|
      hand = Deck.new(:name => "Hand of " + user.login)
      user.decks << hand
      draw = Action.new(:name => "Draw a card", 
          :quantity => 1, 
          :draw_mode => Action::TOP,
          :insert_mode => Action::TOP)
      draw.deck_from = deck
      draw.deck_to = hand 
      user.actions << draw
    end
    
    @game.save
    # TODO test return value
    redirect_to @game
  end
  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /users/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game,
           notice: 'Game was successfully created.' }
        format.json { render action: 'show', status: :created,
           location: @game }
      else
        format.html { render action: 'new' }
        format.json { render json: @game.errors,
           status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:name)
    end
end
