# frozen_string_literal: true
class HomeController < ApplicationController
  include HTTParty
  def index
  end
  def group_message
    HTTParty.post('https://api.telegram.org/bot2105912353:AAF1UVZbaWDHIrJm3fcMg0TKYDA_n4674pU/sendMessage?chat_id=-778328908&text=GROUP')
    redirect_to '/dashboard', notice: "group success"
  end
  def private_message
    HTTParty.post('https://api.telegram.org/bot/sendMessage?chat_id=612782284&text=DIRECT')
    redirect_to '/dashboard', notice: "private success"
  end
end
