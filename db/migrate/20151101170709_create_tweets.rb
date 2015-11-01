class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :twitter_account_id, null: false
      t.string :content, null: false
      t.foreign_key :twitter_accounts, options: 'ON UPDATE NO ACTION ON DELETE NO ACTION'

      t.timestamps null: false
    end
  end
end
