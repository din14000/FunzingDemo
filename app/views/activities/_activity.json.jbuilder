json.extract! activity, :id, :title, :max_attendees, :description, :user_id, :created_at, :updated_at, :tickets_left, :ticket_price
json.url activity_url(activity, format: :json)
