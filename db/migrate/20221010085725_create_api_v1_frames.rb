class CreateApiV1Frames < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_frames do |t|
      t.string :name
      t.text :description
      t.integer :status
      t.integer :stock
      t.float :price

      t.timestamps
    end
  end
end
