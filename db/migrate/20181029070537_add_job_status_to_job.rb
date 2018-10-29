class AddJobStatusToJob < ActiveRecord::Migration[5.2]
  def change
    add_reference :jobs, :job_statuses, foreign_key: true
  end
end
