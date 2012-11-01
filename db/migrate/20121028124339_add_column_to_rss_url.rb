class AddColumnToRssUrl < ActiveRecord::Migration
  def change
    add_column :rss_urls, :Site_Name, :string
    add_column :rss_urls, :Site_Url, :string
  end
end
