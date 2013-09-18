class CreateBlogsTags < ActiveRecord::Migration
  def up
    create_table :'blogs_tags' do |t|
      t.references :blog
      t.references :tag
    end
  end

  def down
    drop_table :'blogs_tags'
  end
end