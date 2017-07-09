class CreateSkus < ActiveRecord::Migration[5.1]
  def change
    create_table :skus do |t|
      t.string :identifier 
      t.timestamps
    end

    add_reference :skus, :product
  end
end
