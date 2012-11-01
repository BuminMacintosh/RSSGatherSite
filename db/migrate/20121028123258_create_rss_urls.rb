class CreateRssUrls < ActiveRecord::Migration
  def change
    create_table :rss_urls do |t|
      t.integer :Rss_Url_id_seq

      t.timestamps
    end
  end
end
