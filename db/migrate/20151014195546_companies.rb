class Companies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :url
      t.references :discount
      t.timestamps null: false
    end
  end
end
