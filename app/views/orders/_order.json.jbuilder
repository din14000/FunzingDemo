json.extract! order, :id, :activity_id, :number_of_tickets, :total_order_price, :created_at, :updated_at
json.url order_url(order, format: :json)
