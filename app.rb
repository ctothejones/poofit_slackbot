require 'sinatra'
require 'json'

post '/gateway' do

  return if params[:token] != 'LK1QyaEb4i9TGfd0Nb2adL8D'

  trigger_word = params[:trigger_word].strip
  poof_receiver = params[:text].gsub(trigger_word, '').strip
  user_name = params[:user_name].strip

  if poof_receiver.include? "@"
  else poof_receiver = "@" + poof_receiver
  end


  #switch on the message
  # case user_name
  #   when ''
  #   else # default - ignore
  # end

  response_message = "#{poof_receiver} got a poof! :poof:"

  content_type :json
  {:username => 'poofit', :response_type => "in-channel", :text => response_message }.to_json
end
