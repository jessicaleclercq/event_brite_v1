class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show] #les visiteurs non connectés ne peuvent pas voir les profils

  def index
    redirect_to :root
    @users = User.all
  end

  def show
      @user = User.find(params[:id])
 #profil utilisateur pas visible par d'autres utilisateurs connectés
  end

  def new
    @user = User.new 
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
