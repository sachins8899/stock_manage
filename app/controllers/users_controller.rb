class UsersController < ApplicationController
  def my_portfolio
    
  end
  
  def my_friends
    
  end
  
  def add_friend
    @friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: @friend.id)
    
    if current_user.save
      flash[:success] ="Successfully Added !!"
    else
      flash[:danger] = "Somthing wrong Try Again !!"
    end
    redirect_to settings_path
  end
  
  def search
    if params[:friend].blank?
      flash.now[:danger] ="You have entered an empty string"
    else
      @users = User.search(params[:friend])
      flash.now[:danger] ="No such user found !!" if @users.blank?
    end
    respond_to do |format|
         format.js{ render partial: 'friends/result' }          
    end
  end
  
end