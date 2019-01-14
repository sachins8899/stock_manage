class WelcomeController < ApplicationController
  def index
    
  end
  
  def setting
    @friendship = current_user.friends
  end
end