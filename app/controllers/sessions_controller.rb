class SessionsController < ApplicationController

  def index
  end

  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user.nil?
      flash.now[:login_error] = "Invalid email/password combination."
      render 'mains/index'
    else
      session[:user_id] = user.id
      current_user = user
      redirect_to '/sessions/show'
    end
  end

  def edit
  end

  def update
  end

  def show
    @user = User.find(session[:user_id])
    @usersPokeMe = User.find(session[:user_id]).pokers # All who poked user 
    @users = User.all
  end

  def destroy
    session[:user_id] = nil
    current_user = nil
    redirect_to '/'
  end

  def addPoke
    puts params[:id]
    # If Poke.find_by_user_id(session[:user_id]) && find_by_poke_id(params[:id] THEN update poke_count += 1)
    # Else Poke.create(user_id=session[:user_id] poke_id=params[:id] pokecount=1"])
    redirect_to '/sessions/show'
  end
end
