class Admin::AccessoireTagsController < AdminController
  
  include CrudConcern

  before_action :find_accessoire_tag, only: [:edit, :update, :destroy]

  def index
    @accessoire_tags = index_helper("AccessoireTag")
  end

  def new
    @accessoire_tag = AccessoireTag.new
  end

  def create
    @accessoire_tag = AccessoireTag.new(accessoire_tag_params)
    create_helper(@accessoire_tag, "edit_admin_accessoire_tag_path")
  end

  def update
    update_helper(@accessoire_tag, "edit_admin_accessoire_tag_path", accessoire_tag_params)
  end

  def edit
  end

  def destroy
    destroy_helper(@accessoire_tag, "admin_deliveries_path")
  end

  private

  def find_accessoire_tag
    @accessoire_tag = AccessoireTag.find(params[:id])
  end

  def accessoire_tag_params
    params.require(:accessoire_tag).permit(AccessoireTag.attribute_names.map(&:to_sym))
  end
end
