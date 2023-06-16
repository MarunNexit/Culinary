class AddHtmlDetailsToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :html_details, :text
  end
end
