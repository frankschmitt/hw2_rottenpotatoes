module ApplicationHelper
  def sortable(column)
    title = column.titleize
    link_to title, :sort => column
  end
end
