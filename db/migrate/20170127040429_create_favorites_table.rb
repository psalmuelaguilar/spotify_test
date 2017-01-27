class CreateFavoritesTable < ActiveRecord::Migration[5.0]
  def self.up
    create_table :favorites do |t|
      t.string  :spotify_id
      t.string  :external_urls
      t.string  :genres
      t.string  :name
      t.string  :href
    end
  end

  def self.down
    drop_table :favorites
  end
end
