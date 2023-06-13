class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :fullName, limit: 100, default: 'NULL', null: true
      t.string :username, limit: 100, default: 'NULL', null: true
      t.string :mobile, limit: 29, default: 'NULL', null: true
      t.string :email, limit: 90, default: 'NULL', null: true
      t.string :password_digest, limit: 56, default: 'NULL', null: true

      t.timestamps
    end

    add_index :users, :email
  end
end