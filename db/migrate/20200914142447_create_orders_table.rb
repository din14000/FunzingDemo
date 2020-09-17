class CreateOrdersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :orders_tables do |t|
      t.integer :number_of_tickets
      t.integer :total_order_price
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :activity, null: false, foreign_key: true
    end
  end
end
