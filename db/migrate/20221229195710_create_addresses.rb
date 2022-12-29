class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :town
      t.string :zip_code
      t.string :state
      t.integer :country

      t.timestamps
    end
  end
end
