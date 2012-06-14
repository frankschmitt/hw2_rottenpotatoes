module ApplicationHelper
  def sortable(title, column, id)
#title = column.titleize
#css = column == sort_column ? "current {sort_direction}" : nil
    link_to title, {:sort => column}, :id => id
  end
end
