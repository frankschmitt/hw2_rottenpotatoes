module ApplicationHelper
  def sortable(title, column, id)
#flash[:notice] = "sort_column: #{sort_column}"
    h = Hash.new
    selected_ratings.each {|r| h[r] = 1}
    link_to title, {:sort => column, :ratings => h }, { :id => id }
  end

  def css_class(title)
    sort_column == title ? "hilite" : nil
  end  
end
