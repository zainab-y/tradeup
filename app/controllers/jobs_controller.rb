class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  after_action :create_user_job, only: [:create]
  before_action :is_trader?, only: [:accept]

  # GET /jobs
  # GET /jobs.json
  def index
    # jobs that haven't been accepted, so jobs with only one user will be displayed, jobs with two users won't display
    @jobs = []
    Job.all.each do |job|
      if job.users.count < 2
        @jobs << job
      end
    end
    if params[:query].present?
      job_category_search = JobCategory.where(category: params[:query])
      job_category_search = job_category_search.first
      @jobs = job_category_search.jobs
    else 
      @jobs
    end 
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @is_job_creator = current_user == @job.users.first
    @is_job_acceptor = current_user == @job.users.find(2) 
    @job_status = @job.job_status_id
    # Statuses: 1 -> created, 2 -> accepted, 3 -> completed, 4 -> paid
    # if the status is completed and not the creator of the job
    if @job_status == 1 && @is_job_creator
        @message = "Congratulations your job is created! We will send you an email when someone takes the job!"
    elsif @job_status == 1
      @message = "This job is available. Click ACCEPT JOB if you would like to take the job"
    elsif @job_status == 2 && @is_job_creator
      @message = "Your job has been taken, waiting completion"
    elsif @job_status == 2 && @is_job_acceptor
      @message = "You have accepted this job, click complete when done"
    elsif @job_status == 3 && @is_job_acceptor
      @message = "You have completed the job and now pending payment"
    elsif @job_status == 3 && @is_job_creator
      @message = "The Job you have posted has been completed. Please make payment using the button below:"
    elsif @job_status == 4
      @message = "The payment was successful! This order is now closed. Thank you!!!"
    end

  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
    authorize @job
  end

  # GET /jobs/1/accept
  def accept
    # assigns user(tradesman) to job in the join table
    @user_job = UserJob.new 
    @user_job.user_id = current_user.id
    @user_job.job_id = params[:id].to_i
    @user_job.save

    @job = Job.find(params[:id])
    # sets the job status to 'accepted'
    @job.job_status_id = 2
    @job.save
    redirect_to @job
  end

  # GET /jobs/1/completed
  def complete
    @job = Job.find(params[:id])
    # sets the job status to 'completed'
    @job.job_status_id = 3
    @job.save
    redirect_to @job
  end

  # GET /jobs/1/paid
  def pay
    @job = Job.find(params[:id])
    # sets the job status to 'paid'
    @job.job_status_id = 4
    @job.save
    redirect_to @job
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)
    # sets the job status to 'created'
    @job.job_status_id = 1
    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    authorize @job
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:title, :description, :tenant_available_time, :job_category_id, :price, :street_number, :street_name, :city, :postcode, :state, :job_status_id, images: [])
    end

    # creates the user _job entry when a job is creates
    def create_user_job
      @user_job = UserJob.new 
      @user_job.user_id = current_user.id
      @user_job.job_id = Job.last.id
      @user_job.save
    end

    def is_trader?
      user = current_user.user_profile
      if user.abn.nil? && user.insurance.nil?
        redirect_to edit_user_profile_path(user.id, :abn_insurance => 0)
      end
    end

end
