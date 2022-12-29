class AddPersonToEmails < ActiveRecord::Migration[6.1]
  def change
    add_reference :emails, :person, null: false, foreign_key: true
  end
end
