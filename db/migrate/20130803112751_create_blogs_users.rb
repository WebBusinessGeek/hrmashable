class CreateBlogsUsers < ActiveRecord::Migration
  def up
    create_table :'blogs_users' do |t|
      t.references :blog
      t.references :user
    end
  end

  def down
    drop_table :'blogs_users'
  end
end