class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :status
      t.date :book_lent_on
      t.date :book_returned_on

      t.timestamps
    end
  end
end
