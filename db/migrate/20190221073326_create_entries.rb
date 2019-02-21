class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.boolean :is_expense
      t.integer :category_id
      t.integer :user_id
      t.date :date
      t.integer :amount
      t.string :description

      t.timestamps
    end
  end
end
