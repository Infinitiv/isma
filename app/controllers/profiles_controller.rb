class ProfilesController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @profiles = Profile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  
  def create
    @profile = Profile.new(params[:profile])
    @profile.user_id = session[:user_id]
    respond_to do |format|
      if @profile.save
          session[:user_first_name] = Profile.last.first_name
          session[:user_last_name] = Profile.last.last_name
          format.html { redirect_to @profile.user, notice: 'Profile was successfully created.' }
          format.json { render json: @profile.user, status: :created, location: @profile }
        else
          format.html { render action: "new" }
          format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end
end