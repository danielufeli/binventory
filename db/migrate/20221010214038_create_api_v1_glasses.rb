class CreateApiV1Glasses < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_glasses do |t|
      t.float :total
      t.references :user, null: false, foreign_key: true
      t.references :api_v1_frame, null: false, foreign_key: true
      t.references :api_v1_lense, null: false, foreign_key: true
      t.references :api_v1_currency_rate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
