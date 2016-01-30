class CreateTextbooks < ActiveRecord::Migration
  def change
    create_table :textbooks do |t|
      t.string :title, :author, :isbn, :college, :email, :fblink
      t.decimal :price
      t.boolean :sold

      t.timestamps null: false
    end
  end
end
