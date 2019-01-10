class UserStocksController < ApplicationController
  def create
    stock = Stock.find_by_ticker(params[:stock_ticker])
    if stock.blank?
      stock = Stock.new_from_lookup(params[:stock_ticker])
    end
    if stock.save
      @user_stock = UserStock.create(user: current_user, stock: stock)
      flash[:success] ="Successfully added stock for you"
    else
      flash[:danger] = stock.errors.full_messages.to_s
    end
    redirect_to my_portfolio_path
  end
  
  def index
    @stocks = current_user.stocks
  end
  
  def destroy
    stock = Stock.find(params[:id])
    @user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first
    @user_stock.destroy
    flash[:notice] ="Successfully Deleted Stock"
    redirect_to user_stocks_path
  end
  
end
