module ApplicationHelper
  def show_sub_category_menus(cat,d)
    d = d + '<ul class="dropdown-menu">'
    cat.child_categories.each do |subcat|
      if subcat.present?
        if subcat.child_categories.count == 0
	        d = d + '<li><a href="'+category_path(subcat.slug)+'">'+subcat.title.upcase+'</a></li>'
        else
	        d = d + '<li class="dropdown-submenu"><a href="'+category_path(subcat.slug)+'">'+subcat.title.upcase+'</a>'
		      d = d + show_sub_category_menus(subcat,'')
	        d = d + '</li>'
        end
      end
    end
    d = d + '</ul>'
    d
  end
end
