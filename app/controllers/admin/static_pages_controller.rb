class Admin::StaticPagesController < AdminController
  
  include CrudConcern

  before_action :find_static_page, only: [:edit, :update, :destroy]

  def index
    @static_pages = index_helper("StaticPage")
  end

  def new
    @static_page = StaticPage.new
  end

  def create
    @static_page = StaticPage.new(static_page_params)
    create_helper(@static_page, "edit_admin_static_page_path")
  end

  def update
    update_helper(@static_page, "edit_admin_static_page_path", static_page_params)
  end

  def edit
  end

  def destroy
    destroy_helper(@static_page, "admin_static_pages_path")
  end

  private

  def find_static_page
    @static_page = StaticPage.find(params[:id])
  end

  def static_page_params
    params.require(:static_page).permit(StaticPage.attribute_names.map(&:to_sym))
  end
end