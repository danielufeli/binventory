class CreateApiV1Lenses < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_lenses do |t|
      t.string :colour
      t.text :description
      t.integer :prescription_type
      t.integer :lens_type
      t.integer :stock
      t.float :price

      t.timestamps
    end
  end
end
