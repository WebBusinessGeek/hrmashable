ActiveAdmin.register Blog do
  index do
    column :title
    column :description
    column :slug
    column :author do |blog|
      blog.author.username
    end
    column :category
    column :visitors_count

    default_actions
  end

  filter :author
  filter :category
  filter :title
  filter :description
  filter :slug
  filter :created_at
  filter :updated_at

  show do
    attributes_table do
      row :id
      row :title
      row :description do
        simple_format blog.description
      end
      row :main_pic do
        image_tag blog.main_pic
      end
      row :slug
      row :visitors_count
      row :author
      row :category
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs '' do
      f.input :author, include_blank: false, collection: Author.all.map { |author| [author.username, author.id] }
      f.input :category, include_blank: false
      f.input :title
      f.input :description
      f.input :main_pic
      f.input :slug
    end

    f.actions
  end
end