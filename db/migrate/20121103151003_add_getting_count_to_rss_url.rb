class AddGettingCountToRssUrl < ActiveRecord::Migration
  def change
    add_column :rss_urls, :Getting_Count, :int
  end
end
