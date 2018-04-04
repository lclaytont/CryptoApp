class HomeController < ApplicationController
  def index
    @url = 'https://api.coinmarketcap.com/v1/ticker/'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @coins = JSON.parse(@response)
    @my_coins = ['BTC', 'XRP', 'ADA', 'XLM', 'STEEM']
  end

  def about
  end

  def lookup
    @url = 'https://api.coinmarketcap.com/v1/ticker/'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @lookup_coin = JSON.parse(@response)

    @symbol = params[:sym]
    if @symbol
      @symbol.upcase!
    end

    if @symbol == ""
      @symbol = "Hey, you forgot to enter a Currency"
    end

  end
end
