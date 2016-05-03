class UsersController < ApplicationController

  load_and_authorize_resource

  respond_to :html, :js
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :modal_responder, only: [:show, :edit]

  def index
    @users = User.all.includes(:role)
  end

  def new
    respond_modal_with @user = User.new
  end

  def create
    @user = User.create(user_params)
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'O usuário foi criado.' }
    end
  end

  def show
    debugger
  end

  def edit
    debugger
    respond_to do |format|
      unless @user == current_user or current_user.admin?
        debugger
        format.html { redirect_to root_path, alert: 'Você não possui autorização.' }
      else
        format.html 
      end
    end
  end

  def update

    if params[:password].blank? and params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    @user.update_attributes(user_params)
    respond_to do |format|
      format.html { redirect_to :back, notice: 'O usuário foi atualizado.' }
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'O usuário foi excluído.' }
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :role_id, :email, :password, :password_confirmation)
    end

    def modal_responder
      respond_modal_with set_user
    end

end
