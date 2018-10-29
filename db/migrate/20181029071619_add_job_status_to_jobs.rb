class AddJobStatusToJobs < ActiveRecord::Migration[5.2]
  def change
    add_reference :jobs, :job_status, foreign_key: true
  end
end
