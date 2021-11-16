class TelegramMailer < ApplicationMailer
  include HTTParty
  def send_group_message(text)
    api_key=TELEGRAM
    chat_id=-778328908
    HTTParty.post("https://api.telegram.org/bot#{api_key}/sendMessage",
                  headers:{
                    'Content-Type'=>'application/json'
                  },
                  body:{
                    chat_id:chat_id,
                    text:text
                  }.to_json)
  end
end
