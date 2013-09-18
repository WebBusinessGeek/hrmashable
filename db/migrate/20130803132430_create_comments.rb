class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :message, null: false
      t.references :user, null: false
      t.references :blog, null: false
      t.references :parent_comment, default: 0

      t.timestamps
    end
  end
end