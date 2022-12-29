class CreateEmails < ActiveRecord::Migration[6.1]
  def change
    create_table :emails do |t|
      t.string :email_address
      t.text :comment

      t.timestamps
    end
  end
end
