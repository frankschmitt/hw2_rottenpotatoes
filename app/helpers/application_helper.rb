module ApplicationHelper
  def sortable(title, column, id)
#title = column.titleize
#css_class = column == sort_column ? "current {sort_direction}" : nil
css_class = column == sort_column ? "hilite" : nil
#css_class = nil
    link_to title, {:sort => column}, { :id => id, :class => css_class}
  end
end
