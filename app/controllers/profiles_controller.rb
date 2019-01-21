class ProfilesController < ApplicationController
  
  def edit
    @user = current_user
    if profile_exist? 
      @profile = @user.profile
    else
      @profile = Profile.new
      # @eduction = Eduction.new
    end
  end
  
  def new
    @profile = Profile.new
  end
  
  def create
    @profile = Profile.new(profile_param)
    @profile.user = current_user
    @profile.employee_employer = true
    if @profile.save
      flash[:success] ="Profile has been created !!"
      redirect_to settings_path
    else
      flash[:danger] ="Somthis wrong please try again !!"
      render 'new'
    end
   # redirect_to settings_path
  end
  
  def edit
    @profile = Profile.find(params[:id])
  end
  
  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_param)
      flash[:success] ="Profile has been updated !!"
      redirect_to settings_path
    else
      flash[:danger] ="Somthis wrong please try again !!"
      render 'edit'
    end
  end
  
  private
  def profile_param
    params.require(:profile).permit(:company, :profession, :temp_address, :fixed_address)
  end
  
end