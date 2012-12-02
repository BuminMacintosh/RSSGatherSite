class AddSortNumberToRssUrl < ActiveRecord::Migration
  def change
    remove_column :rss_urls, :Rss_Url_id_seq
    add_column :rss_urls, :sort_number, :int

    remove_column :rss_urls, :Site_Name
    add_column :rss_urls, :name, :string

    remove_column :rss_urls, :Site_Url
    add_column :rss_urls, :url, :string

    remove_column :rss_urls, :Getting_Count
    add_column :rss_urls, :limit, :int
  end
end
