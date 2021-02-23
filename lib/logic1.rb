# logic1
require 'telegram/bot'

class BotLogic
  attr_reader :token

  def initialize(token = nil)
    @token = token
    Telegram::Bot::Client.run('1565232960:AAEH6D-6Te-C7MS3j8e-OEjXyvnzKkM4KN4') do |bot|
      bot.listen do |message|
        case message.text
        when 'hello'
          bot.api.send_message(chat_id: message.chat.id,
                               text: "Hello, #{message.from.first_name}. Welcome to this simple chatbot.
                               You can try different options. If unsure, please write /options")
        when 'who'
          bot.api.send_message(chat_id: message.chat.id,
                               text: "I am simple bot created to help you boost your daily mood.
                               It aint easy to stay focus or motivated. I will try my best to help
                               you #{message.from.first_name}")
        when 'options'
          bot.api.send_message(chat_id: message.chat.id,
                               text: "Thanks for trying this chatbot #{message.from.first_name}. You can select some
                               options such as Jokes (/joke), Dayly powerfull messages (/motivation), who am I (/who)")
        when 'joke'
          bot.api.send_message(chat_id: message.chat.id,
                               text: "Thanks for trying some daily jokes #{message.from.first_name}. Hopefully the joke
                               amuze you")

        when 'motivation'
          bot.api.send_message(chat_id: message.chat.id,
                               text: "Thanks for trying this chatbot #{message.from.first_name}. You can select some
                                options such as Jokes (/joke), Dayly powerfull
                                messages (/motivation), who am I (/who)")
        else
          bot.api.send_message(chat_id: message.chat.id,
                               text: "Sorry, I don't understand '#{message.text}'. I only understand `hello` `who` `joke` 'options' and `motivation`")
        end
      end
    end
  end
end
