class Restrictions < ActiveRecord::Migration
  def change
    create_table :restrictions do |t|
      t.references :discount
      t.string :description
      t.timestamps null: false
    end
  end
end
