class Discounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.references :company
      t.integer :discount_percent
      t.references :restriction
      t.references :user
      t.timestamps null: false
    end
  end
end
