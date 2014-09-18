class UsersController < ApplicationController

  def index
  end

  def new
  end

  def create
    @user = User.new
    @user.name = params[:name]
    @user.alias = params[:alias]
    @user.email = params[:email]
    @user.birthdate = params[:birthdate]
    @user.password = params[:password]
    @user.save
    render '/mains/index'
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end
end
