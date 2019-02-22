class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.boolean :is_expense
      t.references :wallet, index: true

      t.timestamps
    end
    add_foreign_key :categories, :wallets
  end
end
