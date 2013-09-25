class AddSubCategoryToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :sub_category_id, :integer
  end
end
