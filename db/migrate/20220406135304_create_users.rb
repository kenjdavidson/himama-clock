class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :given_name
      t.string :surname
      t.string :email
      t.string :password_digest
      t.string :pincode_digest

      t.timestamps
    end
  end
end
