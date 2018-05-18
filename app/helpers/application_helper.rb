module ApplicationHelper
  include Breadcrumbs
  include DeviseHelper
  include SelectHelper

  def notification_class_for(flash_type)
    {
        notice: 'alert-success',
        error: 'alert-danger',
        alert: 'alert-warning',
        info: 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end
end
