class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.bigint :hands_played, default: 0
      t.bigint :win_loss, default: 0
      t.string :deck_id
      t.timestamps
    end
  end
end
