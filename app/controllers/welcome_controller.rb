class WelcomeController < ApplicationController
  def index
    
  end
  
  def setting
    # sql = "SELECT  `users`.* FROM `users` INNER JOIN `friendships` ON `users`.`id` = `friendships`.`friend_id` WHERE `friendships`.`user_id` = "+current_user.id.to_s+" and `friendships`.`status` ='A'"
    # @friendship = ActiveRecord::Base.connection.execute(sql)
#     
    # puts @friendship
    @friendship = current_user.friendships.where(status: 'A')
  end
end