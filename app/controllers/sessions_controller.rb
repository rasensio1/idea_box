class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username]) rescue nil

    if user && user.authenticate(params[:session][:password])
      session[:id] = user.id
      redirect_to user_path(user)
    else
      flash[:errors] = "Incorrect Username/Password combination. Have you signed up?"
      redirect_to new_session_path
    end
  end

  def destroy
    session[:id] = nil
    redirect_to root_path
  end

end
