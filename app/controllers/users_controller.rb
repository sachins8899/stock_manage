class UsersController < ApplicationController
  
  def my_portfolio
    
  end
  
  def my_friends
    
  end
  
  def add_friend
    @friend = User.find(params[:friend])
    # current_user.friendships.build(friend_id: @friend.id)
    
    sql = "INSERT INTO `friendships` (`user_id`, `friend_id`, `created_at`, `updated_at`,`status`) VALUES ("+@friend.id.to_s+", "+current_user.id.to_s+",current_time(),current_time(),'P')"
    ActiveRecord::Base.connection.execute(sql)
    
    flash[:success] ="Your request has been sent to "+@friend.fullName
    
    redirect_to settings_path
  end
  
  def accept_request
    @friend = User.find(params[:friend])
    # current_user.friendships.build(friend_id: @friend.id)
    
    sql = "INSERT INTO `friendships` (`user_id`, `friend_id`, `created_at`, `updated_at`,`status`) VALUES ("+@friend.id.to_s+", "+current_user.id.to_s+",current_time(),current_time(),'A')"
    ActiveRecord::Base.connection.execute(sql)
    
    sql = "UPDATE friendships set status= 'A' where friend_id = "+@friend.id.to_s+" and user_id = "+current_user.id.to_s
    ActiveRecord::Base.connection.execute(sql)
    
    flash[:success] = @friend.fullName+" And you are friends now"
    
    redirect_to root_path
  end
  
  def reject_request
    
    @friendship = current_user.friendships.where(friend_id:params[:friend])
    @friendship.destroy(@friendship.ids)
    flash[:success] ="You rejectes "+User.find(params[:friend]).fullName+" friend request!!" 
    redirect_to root_path
  end
  
  def search
    if params[:friend].blank?
      flash.now[:danger] ="You have entered an empty string"
    else
      @users = User.search(params[:friend])
      flash.now[:danger] ="No such user found !!" if @users.blank?
    end
    respond_to do |format|
         format.js{ render partial: 'friends/frndresult' }          
    end
  end
  
end