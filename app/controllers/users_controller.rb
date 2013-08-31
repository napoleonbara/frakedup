class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :join]

  def index
    @users = User.all
  end

  def show
    session[:last_page] = request.env['HTTP_REFERER'] || contents_url
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      redirect_to welcome_path, flash: {account_just_created: true}
    else
      render action: 'new'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to if admin? administration_path else root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      normal_permissions = [:login, :password, :password_confirmation, :sign_in_token]
      admin_permissions = if admin? then [:privilege] else [] end
      params.require(:user).permit(*(normal_permissions + admin_permissions))
    end
end

