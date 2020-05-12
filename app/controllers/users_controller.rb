class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:secret]

  def index
    redirect_to :root
    @users = User.all
  end

  def show
    @user = current_user
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
