class StocksController < ApplicationController
  def index
    @stocks = StockQuote::Stock.quote Stock.all.pluck(:ticker)
  end

  def graph
  end

  # S&P 500
  def gspc
    result = historical_prices("^gspc")
    # we have to reverse since Highcharts requires the data in ascending order
    render :json => {
      :quote => result.reverse!
    }
  end

  # Dow Jones Industrial Average
  def dia
    result = historical_prices("dia")
    render :json => {
      :quote => result.reverse!
    }
  end

  # Nasdaq
  def ixic
    result = historical_prices("^ixic")
    render :json => {
      :quote => result.reverse!
    }
  end

  def portfolio_data
    uri = "mongodb://aloke:sagehen@ds027771.mongolab.com:27771/stocks"
    client = Mongo::MongoClient.from_uri(uri)
    db_name = uri[%r{/([^/\?]+)(\?|$)}, 1]
    db = client.db(db_name)
    stocks = db.collection("portfolio")

    render :json => {
      :quote => stocks.find_one["quote"]
    }
  end

  private
  def historical_prices(ticker)
    quote = StockQuote::Stock.json_quote(ticker, 6.months.ago, Date.today, ['Date', 'Close'])
    result = []
    quote["quote"].each do |info|
      result << [info["Date"].to_date.strftime('%Q').to_i, info["Close"].to_i]
    end
    result
  end
end