ActiveAdmin.register Blog do
  index do
    column :title
    column :description do |blog|
      strip_tags(blog.description)[0..200]
    end
    column :slug
    column :author do |blog|
      blog.author.name
    end
    column :category
    column :visitors_count

    default_actions
  end
  
  controller do
    def edit
      @blog = Blog.find_by_slug(params[:id])
      cur_category = @blog.category
      @category = Array.new()
      @category << cur_category.id
      while cur_category.parent_category_id > 0
        cur_category = cur_category.parent_category
        @category << cur_category.id
        @parent_category = cur_category.id
      end
    end
    
    def update    
      cur_category = Category.find_by_id(params[:blog][:category_id])
      @category = Array.new()
      if cur_category.present?
        @category << cur_category.id
        while cur_category.parent_category_id.present? and cur_category.parent_category_id > 0
          cur_category = cur_category.parent_category
          @category << cur_category.id
          @parent_category = cur_category.id
        end
      end
      super
    end
    
    def create    
      cur_category = Category.find_by_id(params[:blog][:category_id])
      @category = Array.new()
      if cur_category.present?
        @category << cur_category.id
        while cur_category.parent_category_id.present? and cur_category.parent_category_id > 0
          cur_category = cur_category.parent_category
          @category << cur_category.id
          @parent_category = cur_category.id
        end
      end
      super
    end
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
        sanitize(blog.description)
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
  
  form :partial => "form" 
end
