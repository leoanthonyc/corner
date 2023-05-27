class RenameLinkNameToTitle < ActiveRecord::Migration[7.0]
  def change
    rename_column :links, :name, :title
  end
end
