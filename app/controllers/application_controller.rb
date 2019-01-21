class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper_method :logged_in?,:imgae_exist?,:profile_exist?
  
  def logged_in?
    !!current_user
  end
  
  def imgae_exist?
    !!current_user.images.last
  end
  
  def profile_exist?
    !!current_user.profile
  end
  
  def education_exist?
    !!current_user.profile.educations
  end
  
end
