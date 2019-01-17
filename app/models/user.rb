class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :user_stocks
  has_many :stocks, through: :user_stocks
  
  has_many :friendships
  has_many :friends, through: :friendships
  
  has_one :profile, dependent: :destroy
  
  has_many :images
  
  def fullName
    return "#{f_name}" +" "+ "#{l_name}".strip if (f_name || l_name)
    "Anonymous" 
  end
  
  def stock_already_added?(ticker_symbol)
    stock = Stock.find_by_ticker(ticker_symbol)
    puts "stock"
    return false unless stock
    user_stocks.where(stock_id: stock.id).exists?
  end
  
  def stock_limit?
    (user_stocks.count < 10)
  end
  
  def can_add_stock?(ticker_symbol)
    puts stock_already_added?(ticker_symbol)
    !stock_already_added?(ticker_symbol) && stock_limit?
  end
  
  def self.search(param)
    param.strip!
    param.downcase!
    to_stock_back = (first_name_matches(param) + last_name_matches(param) + email_matches(param)).uniq
    return nil unless to_stock_back
    to_stock_back
  end
  
  def self.first_name_matches(param)
    matches('f_name',param)
  end
  
  def self.last_name_matches(param)
    matches('l_name',param)
  end
  
  def self.email_matches(param)
    matches('email',param)
  end
  
  def self.matches(field_name, param)
    User.where("#{field_name} like?", "%#{param}%")
  end
  
  def not_friend_with?(friend_id)
    self.friendships.where(friend_id: friend_id) < 1
  end
  
end
