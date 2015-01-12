class CreateGrants < ActiveRecord::Migration
  def change
    create_table :grants do |t|
      t.integer :amount
      t.date :start
      t.date :complete
      t.string :source
      t.references :from, index: true
      t.references :to, index: true

      t.timestamps null: false
    end
    add_foreign_key :grants, :froms
    add_foreign_key :grants, :tos
  end
end
