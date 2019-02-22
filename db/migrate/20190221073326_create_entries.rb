class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.references :category, index: true
      t.integer :user_id
      t.date :date
      t.integer :amount
      t.string :description

      t.timestamps
    end
    add_foreign_key :entries, :categories
  end
end
