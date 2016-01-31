class CreateTextbooks < ActiveRecord::Migration
  def change
    create_table :textbooks do |t|
      t.string :title, :author, :isbn, :college, :email, :fblink
      t.decimal :price, precision: 6, scale: 2
      t.boolean :sold, default: false

      t.timestamps null: false
    end
  end
end
