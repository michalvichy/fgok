# Change body into text
class ChangeBodyInArticles < ActiveRecord::Migration
  def change
    change_column :articles, :body, :text
  end
end
