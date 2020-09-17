class AddToColumns < ActiveRecord::Migration[6.0]
  def change
    add_timestamps(:orders)
    add_timestamps(:activities)
  end
end
