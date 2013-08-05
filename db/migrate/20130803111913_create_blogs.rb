class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title, null: false
      t.text :description
      t.string :main_pic
      t.string :slug
      t.integer :visitors_count, default: 0
      t.references :author, null: false
      t.references :category, null: false

      t.timestamps
    end

    add_index :blogs, :slug, unique: true
  end
end