class Stock < ApplicationRecord
  def self.new_from_lookup(ticker_symbol)
    begin
      lookup_stock = StockQuote::Stock.quote(ticker_symbol)
      price = lookup_stock.latest_price
      new(ticker: lookup_stock.symbol,name: lookup_stock.company_name, last_price: price)
    rescue Exception => e
      return nil
    end
  end
end
