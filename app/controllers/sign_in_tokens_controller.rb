class SignInTokensController < ApplicationController
  before_action :set_sign_in_token, only: [:destroy]

  # GET /sign_in_tokens
  # GET /sign_in_tokens.json
  def index
    @sign_in_tokens = SignInToken.all
  end

  # GET /sign_in_tokens/new
  def new
    @sign_in_token = SignInToken.new
  end

  # POST /sign_in_tokens
  # POST /sign_in_tokens.json
  def create
    @sign_in_token = SignInToken.new()

    respond_to do |format|
      if @sign_in_token.save
        format.html { redirect_to sign_in_tokens_path, notice: 'Sign in token was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sign_in_token }
      else
        format.html { render action: 'new' }
        format.json { render json: @sign_in_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sign_in_tokens/1
  # DELETE /sign_in_tokens/1.json
  def destroy
    @sign_in_token.destroy
    respond_to do |format|
      format.html { redirect_to sign_in_tokens_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sign_in_token
      @sign_in_token = SignInToken.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sign_in_token_params
    end
end
