class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.references :wallet, index: true

      t.timestamps
    end
    add_foreign_key :users, :wallets
  end
end
