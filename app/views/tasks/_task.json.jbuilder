json.extract! task, :id, :title, :content, :deadline, :status, :created_at, :updated_at
json.url task_url(task, format: :json)
