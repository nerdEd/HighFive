class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string    "flickr_id"
      t.string    "username"
      t.string    "profile_url"
      t.integer   "score"

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
