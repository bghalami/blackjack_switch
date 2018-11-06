class AddCurrentHandToGame < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :current_hand, :text
  end
end
