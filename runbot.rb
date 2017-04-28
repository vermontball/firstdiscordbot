###
require 'discordrb'
bot = Discordrb::Commands::CommandBot.new token:'<BOT.TOKEN>', client_id: 140239236312989696, prefix: '!'

#Here we can see the `help_available` property used, which can determine whether a command shows up in the default
#generated `help` command. It is true by default but it can be set to false to hide internal commands that only
#specific people can use.

bot.command(:exitbot, help_available: false) do |event|
#This is a check that only allows a user with a specific ID to execute this command. Otherwise, everyone would be
#able to shut your bot down whenever they wanted.
  break unless event.user.id == 140239236312989696
    bot.send_message(event.channel.id, 'Bot is shutting down')
    exit
end
#################################################################################################################################################################

bot.command(:ping) do |event|
  # The `respond` method returns a `Message` object, which is stored in a variable `m`. The `edit` method is then called
  # to edit the message with the time difference between when the event was received and after the message was sent.
  m = event.respond('Pong!')
  m.edit "Pong! Time taken: #{Time.now - event.timestamp} seconds."
end
##################################################################################################################################################################

#Defineing Variables
math_l = 'A'
math_g = '98.7'
sci_l = 'B'
sci_g = '87.2'

bot.command(:grades) do |event|
  bot.send_message(event.channel.id,'Math: #{math_l} #{math_g}\n Science: #{sci_l} #{sci_g}')
end
bot.run
