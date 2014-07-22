class StocksController < ApplicationController
  def index
    @stocks = StockQuote::Stock.quote(Stock.all.pluck :ticker)
  end

  def graph
  end

  def gspc
    result = historical_prices("^gspc")

    render :json => {
      :quote => result.reverse!
    }
  end

  def dia
    result = historical_prices("dia")

    render :json => {
      :quote => result.reverse!
    }
  end

  def ixic
    result = historical_prices("^ixic")

    render :json => {
      :quote => result.reverse!
    }
  end

  private
  def historical_prices(ticker)
    quote = StockQuote::Stock.json_quote(ticker, 1.year.ago, Date.today, ['Date', 'Close'])
    result = []
    quote["quote"].each do |info|
      result << [info["Date"].to_date.strftime('%Q').to_i, info["Close"].to_i]
    end
    result
  end
end
