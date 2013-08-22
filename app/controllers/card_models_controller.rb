class CardModelsController < ApplicationController
  before_action :set_card_model, only: [:show, :edit, :update, :destroy]

  # GET /card_models
  # GET /card_models.json
  def index
    @card_models = CardModel.all
  end

  # GET /card_models/1
  # GET /card_models/1.json
  def show
  end

  # GET /card_models/new
  def new
    @card_model = CardModel.new
  end

  # GET /card_models/1/edit
  def edit
  end

  # POST /card_models
  # POST /card_models.json
  def create
    @card_model = CardModel.new(card_model_params)

    respond_to do |format|
      if @card_model.save
        format.html { redirect_to @card_model, notice: 'Card model was successfully created.' }
        format.json { render action: 'show', status: :created, location: @card_model }
      else
        format.html { render action: 'new' }
        format.json { render json: @card_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_models/1
  # PATCH/PUT /card_models/1.json
  def update
    respond_to do |format|
      if @card_model.update(card_model_params)
        format.html { redirect_to @card_model, notice: 'Card model was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @card_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_models/1
  # DELETE /card_models/1.json
  def destroy
    @card_model.destroy
    respond_to do |format|
      format.html { redirect_to card_models_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_model
      @card_model = CardModel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_model_params
      params[:card_model]
    end
end
