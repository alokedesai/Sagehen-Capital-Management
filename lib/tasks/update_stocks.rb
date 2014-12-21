require "mongo"
require "json"


portfolio_prices = []
Stock.pluck(:ticker).each do |ticker|
  begin
    portfolio_prices << StockQuote::Stock.json_quote(ticker, 6.months.ago, Date.today, ['Date', 'Close', 'Symbol'])

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

# update mongolab
data = {:quote => result.reverse!}

uri = "mongodb://aloke:sagehen@ds027771.mongolab.com:27771/stocks"

client = Mongo::MongoClient.from_uri(uri)

db_name = uri[%r{/([^/\?]+)(\?|$)}, 1]

db = client.db(db_name)

stocks = db.collection("portfolio")

stocks.remove
stocks.insert data

