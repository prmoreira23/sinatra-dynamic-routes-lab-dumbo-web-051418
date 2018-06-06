require_relative 'config/environment'
require 'pry'
class App < Sinatra::Base
  # Write your code here!
  get '/reversename/:name' do
    @name = params["name"].reverse
    erb :reversename
  end

  get '/square/:number' do
    @num = square(params["number"].to_i)
    erb :square
  end

  get '/say/:number/:phrase' do
    @phrase = params['phrase']
    @number = params['number'].to_i
    erb :say
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    # binding.pry
    @phrase = params.values.join(" ")+"."
    erb :say_phrases
  end

  get '/:operation/:number1/:number2' do
    operation = params['operation']
    number1 = params['number1'].to_i
    number2 = params['number2'].to_i
    case operation
      when 'add' then @result = number1 + number2
      when 'subtract' then @result = number1 - number2
      when 'divide' then @result = number1 / number2
      when 'multiply' then @result = number1 * number2
    end
    erb :operation
  end

  private
  def square(num)
    num ** 2
  end
end
