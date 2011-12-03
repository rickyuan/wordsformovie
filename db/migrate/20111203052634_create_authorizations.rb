class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.string :provider
      t.string :uid
      t.string :uname
      t.integer :user_id

      t.timestamps
    end
  end
end
