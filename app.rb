require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!

  get '/reversename/:name' do
    @user_name = params[:name].reverse
  end

  get '/square/:number' do
    @sq = params[:number].to_i ** 2
    "#{@sq}"
  end

  get '/say/:number/:phrase' do
    @n = params[:number].to_i
    @result = ""
    @n.times{@result += params[:phrase]}
    @result
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    arr = params.map{|k,v| v}
    arr.join(" ") + "."
  end

  get '/:operation/:number1/:number2' do
    case params[:operation]
    when "add"
      @result = params[:number1].to_i + params[:number2].to_i
    when "subtract"
      @result = params[:number1].to_i - params[:number2].to_i
    when "multiply"
      @result = params[:number1].to_i * params[:number2].to_i
    when "divide"
      @result = params[:number1].to_i / params[:number2].to_i
    end
    @result.to_s
  end
end
