class Order < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  
validates :number_of_tickets, numericality: { greater_than: 0 }

end
