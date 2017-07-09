class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :caption
      t.text :link
      t.references :imageable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end