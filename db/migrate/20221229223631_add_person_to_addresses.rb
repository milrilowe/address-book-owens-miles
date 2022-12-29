class AddPersonToAddresses < ActiveRecord::Migration[6.1]
  def change
    add_reference :addresses, :person, null: false, foreign_key: true
  end
end
