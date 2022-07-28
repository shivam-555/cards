class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :card_holder_name
      t.integer :card_number
      t.integer :cvv_number
      t.date :valid_from
      t.date :valid_upto
      t.integer :user_id
      t.integer :card_type
      t.string :bank_name
      t.references :users, foreign_key: true

      t.timestamps

    end
  end
end
