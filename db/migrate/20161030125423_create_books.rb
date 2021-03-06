class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.string :cover_uri, null: false
      t.string :asin, index: true, null: false

      t.timestamps
    end
  end
end
