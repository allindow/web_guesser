require 'sinatra'
require 'sinatra/reloader'

set :secret_number, rand(100)


get '/' do
  guess = params["guess"]
  message = check_guess(settings.secret_number, guess)
  bg_color = color_changer(settings.secret_number, guess)
  erb :index, :locals => { :number => settings.secret_number, :message => message,
                          :bg_color => bg_color}

end

def check_guess(number, guess)
  if guess.to_i == number
    "You got it right!\nThe SECRET NUMBER is #{number}"
  elsif guess.to_i - number > 5
    "Way too high!"
  elsif guess.to_i - number < -5
    "Way too low!"
  elsif guess.to_i >= number
    "Too high!"
  elsif guess.to_i <= number
    "Too low!"
  end
end

def color(hex)
  "#%06x" % hex
end

def color_changer(number,guess)
  if guess.to_i == number
    color(0x00cc66)
  elsif guess.to_i - number > 5
    color(0xff3333)
  elsif guess.to_i - number < -5
    color(0xff3333)
  elsif guess.to_i >= number
    color(0xffcccc)
  elsif guess.to_i <= number
    color(0xffcccc)
  end
end
