class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title, null: false
      t.string :slug
      t.references :parent_category, default: 0

      t.timestamps
    end

    add_index :categories, :slug, unique: true
  end
end
