class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.bigint :chip_count, default: 10000
      t.timestamps
    end
  end
end
