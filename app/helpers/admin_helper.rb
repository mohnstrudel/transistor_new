module AdminHelper
  def object_name(object)
    if object.is_a?(ActiveRecord::Relation)
      return object.model.name.underscore
    else
      return object.class.name.underscore
    end
  end

  def check_access?
    if admin_admin_signed_in? && current_admin_admin.has_access?
      return true
    else
      return false
    end
  end
end