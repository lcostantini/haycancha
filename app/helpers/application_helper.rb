module ApplicationHelper

  def sortable(column, title = nil)
    title ||= column.titleize
    order = (column == params[:sort]) ? "#{params[:direction]}" : nil
    direction = (column == params[:sort] && params[:direction] == 'asc') ? 'desc' : 'asc'
    link_to title, { :sort => column, :direction => direction }, { :class => order }
  end

end
