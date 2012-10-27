class CreateUsers < ActiveRecord::Migration
  def change
    drop_table :users
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.boolean :is_admin, :default => false

      t.timestamps
    end
  end
end
