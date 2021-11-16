# frozen_string_literal: true
class HomeController < ApplicationController
  include HTTParty
  def index
  end
  def group_message
   #  api_key=TELEGRAM
   #  chat_id=-778328908
   #  text='GROUP DATA'
   #  HTTParty.post("https://api.telegram.org/bot#{api_key}/sendMessage",
   #   headers:{
   #     'Content-Type'=>'application/json'
   # },
   #  body:{
   #  chat_id:chat_id,
   #  text:text
   #  }.to_json)
    redirect_to '/dashboard', notice: "group success"
  end
  def private_message
    api_key=TELEGRAM
    chat_id=612782284
    text="Personal"
    HTTParty.post("https://api.telegram.org/bot#{api_key}/sendMessage?chat_id=#{chat_id}&text=#{text}")
    redirect_to '/dashboard', notice: "private success"
  end
end
