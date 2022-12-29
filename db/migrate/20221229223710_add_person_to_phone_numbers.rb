class AddPersonToPhoneNumbers < ActiveRecord::Migration[6.1]
  def change
    add_reference :phone_numbers, :person, null: false, foreign_key: true
  end
end
