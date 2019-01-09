class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks
  
  def self.new_from_lookup(ticker_symbol)
    begin
      lookup_stock = StockQuote::Stock.quote(ticker_symbol)
      new(ticker: lookup_stock.symbol,name: lookup_stock.company_name, last_price: lookup_stock.latest_price, highest: lookup_stock.high, lowest: lookup_stock.low)
    rescue Exception => e
      return nil
    end
  end
end
