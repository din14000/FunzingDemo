class Activity < ApplicationRecord
  has_many :orders, dependent: :destroy
  after_initialize :init

  has_one_attached :thumbnail
  has_rich_text :description

  validates :title, length: { minimum: 5 }
  validates :max_attendees, inclusion: { in: 1..50 }
  validates :description, length: { minimum: 15 }
  validates :ticket_price, numericality: { greater_than: 0 }
  validates_date :date, on: :create, on_or_after: :today
  
  self.per_page = 10
  
  def init
    self.tickets_left ||= max_attendees
  end
  
 
  def optimized_image(image, x, y)
    image.variant(resize_to_fill: [x, y]).processed
  end
end
