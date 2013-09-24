ActiveAdmin.register Category do

  controller do
    def get_sub_categories
      @sub_categories = Category.find_all_by_parent_category_id(params[:pid])
      unless @sub_categories.present?
        @sub_categories = nil
        @sub_categories = [{name:"Sub-Category Not Available", id:""}]
        render :json => @sub_categories
        return
      end
      respond_to do |format|
        format.json {
          render :json =>  @sub_categories.map{|s| {:name=>"#{s.title}", :id => s.id }}.to_json
        }
      end
    end
    
    def sub_categories_dropdown
      if (params[:pid].to_i > 0)
      @sub_categories = Category.find_all_by_parent_category_id(params[:pid]).map { |cat| [cat.title, cat.id] } 
      end
      render :partial=>"sub_categories_dropdown"
    end
  end
  
  form do |f|
    f.inputs do
      f.input :parent_category #, :collection=>Category.where("parent_category_id is null or parent_category_id = 0")
      f.input :title
    end
    f.actions
  end
end
