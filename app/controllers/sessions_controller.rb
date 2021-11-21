class SessionsController < ApplicationController
  def create
    session[:user_id] = params[:id]
    session[:username] = params[:username]
    redirect_to '/desigual', notice: 'successful login via telegram'
  end

  def login
    user = User.find_by(email: login_params[:email])
    if user&.authenticate(login_params[:password])
      session[:user_id] = user.id
      redirect_to '/desigual', notice: 'successful login via private account'
    else
      flash[:login_errors] = ['invalid credentianls']
      redirect_to '/'
    end
  end

  def destroy
    logout_place = 'telegram'
    logout_place = 'private account' if session[:username].nil?
    session[:user_id] = nil
    session[:username] = nil
    redirect_to '/', notice: "successful logged from #{logout_place}"
  end

  private

  def login_params
    params.require(:login).permit(:email, :password)
  end
end
