class CreateBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :budgets do |t|
      t.date :month
      t.references :category, index: true
      t.integer :amount

      t.timestamps
    end
    add_foreign_key :budgets, :categories
  end
end
