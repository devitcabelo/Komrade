module ApplicationHelper
  def humanize_boolean(boolean)
    I18n.t((!!boolean).to_s)
  end

  def bootstrap_flash name
    case name
      when 'alert'
        return 'danger'
      when 'notice'
        return 'warning'
      when 'message'
        return 'success'
    end
    return name
  end
end
