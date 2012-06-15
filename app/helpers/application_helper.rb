module ApplicationHelper
  def sortable(title, column, id)
#flash[:notice] = "sort_column: #{sort_column}"
    link_to title, {:sort => column}, { :id => id }
  end

  def css_class(title)
    sort_column == title ? "hilite" : nil
  end  
end
