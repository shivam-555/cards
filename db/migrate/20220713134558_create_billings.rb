class CreateBillings < ActiveRecord::Migration[5.2]
  def change
    create_table :billings do |t|
      t.string :card_holder_name
      t.integer :card_number
      t.integer :cvv_number
      t.date :valid_from
      t.date :valid_upto
      t.integer :card_id
      t.integer :card_type
      t.string :bank_name
      t.integer :total_amount
      t.integer :paid_amount
      t.integer :due_amount
      t.references :cards, foreign_key: true

      t.timestamps
    end
  end
end
