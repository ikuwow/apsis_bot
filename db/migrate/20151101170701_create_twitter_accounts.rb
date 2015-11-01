class CreateTwitterAccounts < ActiveRecord::Migration
  def change
    create_table :twitter_accounts do |t|
      t.integer :user_id, null: false
      t.integer :twitter_user_id, limit: 8, null: false
      t.string :access_token
      t.string :access_token_secret
      t.foreign_key :users, options: 'ON UPDATE NO ACTION ON DELETE NO ACTION'

      t.timestamps null: false
    end
  end
end
