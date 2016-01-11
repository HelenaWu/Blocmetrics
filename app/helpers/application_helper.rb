module ApplicationHelper
  ALERT_TRANSLATION = {notice: 'info', error: 'danger', alert: 'warning'}.with_indifferent_access
  
  def alert_class(name)
    ALERT_TRANSLATION[name]
  end
end
