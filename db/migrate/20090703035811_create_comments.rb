class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string "flickr_id"
      t.string "author"
      t.string "author_name"
      t.string "permalink"
      t.string "photo_id"
      t.string "text"

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
