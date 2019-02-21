class CreateBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :budgets do |t|
      t.date :month
      t.integer :category_id
      t.integer :amount

      t.timestamps
    end
  end
end
