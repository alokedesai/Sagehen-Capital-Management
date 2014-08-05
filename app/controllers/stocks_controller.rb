class StocksController < ApplicationController
  def index
    @stocks = StockQuote::Stock.quote(Stock.all.pluck :ticker)
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
    # get the prices for each ticker
    portfolio_prices = []
    Stock.pluck(:ticker).each do |ticker|
      begin
        portfolio_prices << StockQuote::Stock.json_quote(ticker, 3.months.ago, Date.today, ['Date', 'Close', 'Symbol'])

      # silently fail if the ticker can't be found
      rescue StockQuote::NoDataForStockError
        next
      end
    end

    # aggregate the data by summing the price weighted by the # of shares
    result = []
    portfolio_prices.each do |stock_info|
      num_shares = Stock.find_by_ticker(stock_info["quote"].first["Symbol"].upcase).share_count
      stock_info["quote"].each_with_index do |data, i|
        if result[i]
          result[i][1] += num_shares * data["Close"].to_i
        else
          result[i] = [data["Date"].to_date.strftime("%Q").to_i, num_shares * data["Close"].to_i]
        end
      end
    end
    render :json => {
      :quote => result.reverse!
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
