class ChangeCountryToBeStringInAddresses < ActiveRecord::Migration[6.1]
  def up
    change_column :addresses, :country, :string
  end

  def down
    change_column :addresses, :country, :integer
  end
end
