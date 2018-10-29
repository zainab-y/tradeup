json.extract! job, :id, :title, :description, :tenant_available_time, :created_at, :updated_at
json.url job_url(job, format: :json)
