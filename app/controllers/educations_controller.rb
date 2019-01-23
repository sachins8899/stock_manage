class EducationsController < ApplicationController
  
  def new
    @education = Education.new
  end
  
  def edit
    @educations = Education.where(profile_id: params[:id])
    render :json => @educations.to_json
  end
  
  def create
    @education = Education.new(education_param)
    @education.profile_id = current_user.profile.id
    if @education.save
      flash.now[:success]="Successfully added !!"
    else
      flash.now[:danger] = "Try Again !!"
    end
  end
  
  private
  def education_param
    params.require(:education).permit(:standard, :start, :end, :school_college, :from_where, :university, :subjects, )
  end
end