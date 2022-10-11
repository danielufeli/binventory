class CreateApiV1CurrencyRates < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_currency_rates do |t|
      t.string :symbol
      t.float :rate

      t.timestamps
    end
  end
end
