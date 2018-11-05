class UserProfilesController < ApplicationController
  before_action :set_user_profile, only: [:show, :edit, :update, :destroy]

  # GET /user_profiles
  # GET /user_profiles.json
  def index
    @user_profiles = UserProfile.all
  end

  # GET /user_profiles/1
  # GET /user_profiles/1.json
  def show
    if @user_profile.image.attachment 
      @profile_image = @user_profile.image
    else
      @profile_image = "https://api.adorable.io/avatars/200/#{current_user.username}" 
    end
  end

  # GET /user_profiles/new
  def new
    @user_profile = UserProfile.new
  end

  # GET /user_profiles/1/edit
  def edit
    authorize @user_profile
  end

  # GET /user_profiles/1/my_job
  def my_jobs
    @jobs = current_user.jobs 

    @my_jobs = []
    @accepted_jobs = []

    @is_job_creator_completed = []
    @is_job_acceptor_completed = []

    @is_job_creator_paid = []
    @is_job_acceptor_paid = []

    # Statuses: 1 -> created, 2 -> accepted, 3 -> completed, 4 -> paid
    @jobs.each do |job|
      @is_job_creator = job.users.first == current_user 
      @is_job_acceptor = job.users.first != current_user 
      @job_status = job.job_status.id

      if @is_job_creator && @job_status == 1
        @my_jobs << job
      elsif @is_job_acceptor && @job_status == 2
        @accepted_jobs << job
      elsif @is_job_acceptor && @job_status == 3
        @is_job_acceptor_completed << job
      elsif job.users.first == current_user && job.job_status.id == 3
        @is_job_creator_completed << job
      elsif @is_job_creator && @job_status == 4
        @is_job_creator_paid << job
      elsif @is_job_acceptor && @job_status == 4
        @is_job_acceptor_paid
      end
    end
  end

  # POST /user_profiles
  # POST /user_profiles.json
  def create
    @user_profile = UserProfile.new(user_profile_params) 

    respond_to do |format| 
      if @user_profile.save
        format.html { redirect_to @user_profile, notice: 'User profile was successfully created.' }
        format.json { render :show, status: :created, location: @user_profile }
      else
        format.html { render :new }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_profiles/1
  # PATCH/PUT /user_profiles/1.json
  def update
    respond_to do |format|
      if @user_profile.update(user_profile_params) && params[:user_profile][:job_id]
        previous_job_id = params[:user_profile][:job_id]
        format.html { redirect_to jobs_accept_path(previous_job_id) }
        format.json { render :show, status: :ok, location: @user_profile }
      elsif @user_profile.update(user_profile_params)
        format.html { redirect_to @user_profile, notice: 'User profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_profile }
      else
        format.html { render :edit }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_profiles/1
  # DELETE /user_profiles/1.json
  def destroy
    authorize @user_profile
    @user_profile.destroy
    respond_to do |format|
      format.html { redirect_to user_profiles_url, notice: 'User profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_user_profile
      @user_profile = UserProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_profile_params
      params.fetch(:user_profile).permit(:bio, :contact, :name, :insurance, :abn, :street_number, :street_name, :city, :postcode, :state, :business_name, :image)
    end
end
