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

    if @sign_in_token.save
      redirect_to administration_path, notice: 'Sign in token was successfully created.'
    else
      render action: 'new'
    end
  end

  # DELETE /sign_in_tokens/1
  # DELETE /sign_in_tokens/1.json
  def destroy
    @sign_in_token.destroy
    redirect_to sign_in_tokens_url
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
