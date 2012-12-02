class AddLimitCountToRssUrl < ActiveRecord::Migration
  def change
    remove_column :rss_urls, :limit
    add_column :rss_urls, :limit_count, :int
  end
end
