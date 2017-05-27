class AdminController < ActionController::Base
  layout 'admin'

  before_action :authenticate_admin_admin!, :verify_has_access

  private

  def verify_has_access
    (current_admin_admin.nil?) ? redirect_to(root_path) : (redirect_to(edit_admin_admin_registration_path) unless current_admin_admin.has_access?)
  end
end