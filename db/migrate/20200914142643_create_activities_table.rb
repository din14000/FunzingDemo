class CreateActivitiesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :activities_tables do |t|
      t.string :title
      t.integer :max_attendees
      t.integer :ticket_price
      t.integer :tickets_left
      t.references :orders
      t.date :date
      t.string :owner
    end
  end
end
