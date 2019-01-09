class UserStocksController < ApplicationController
  def create
    stock = Stock.find_by_ticker(params[:stock_ticker])
    if stock.blank?
      stock = Stock.new_from_lookup(params[:stock_ticker])
    end
    stock.save
    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:success] ="Successfully added stock for you"
    redirect_to my_portfolio_path
  end
end
