class TelegramSessionsController < ApplicationController
  def create
    telegram_session[:user_id]=params[:id]
    telegram_session[:username]=params[:username]
    redirect_to '/', notice: "successful login via telegram"
  end
end
