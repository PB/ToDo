class AddSlugToLists < ActiveRecord::Migration
  def change
    add_column :lists, :slug, :string, unique: true
  end
end
