class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer :user_id, null: false
      t.integer :category_id, null: false
      t.integer :amount, null: false
      t.string :description
      t.string :transaction_type, null: false  # "income" or "expense" として保存する
      t.date :date, null: false
      t.timestamps
    end
  end
end
