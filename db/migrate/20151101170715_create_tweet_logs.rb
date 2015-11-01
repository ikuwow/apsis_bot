class CreateTweetLogs < ActiveRecord::Migration
  def change
    create_table :tweet_logs do |t|
      t.integer :tweet_id, null: false
      t.datetime :tweeted_at, null: false
      t.timestamps null: false

      t.foreign_key :tweets, options: 'ON UPDATE NO ACTION ON DELETE NO ACTION'
    end
  end
end
