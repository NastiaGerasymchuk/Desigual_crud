class SessionsController < ApplicationController
  def create
    session[:user_id]=params[:id]
    session[:username]=params[:username]
    redirect_to '/desigual#index', notice: "successful login via telegram"
    # user = User.find_by(email: login_params[:email])
    # if user&.authenticate(login_params[:password])
    #   session[:user_id] = user.id
    #   redirect_to '/dashboard'
    # else
    #   flash[:login_errors] = ['invalid credentianls']
    #   redirect_to '/'
    # end
  end

  def destroy
    session[:user_id]=nil
    session[:username]=nil
    redirect_to '/', notice: "successful logged from telegram"
  end

  private

  def login_params
    params.require(:login).permit(:email, :password)
  end
end
