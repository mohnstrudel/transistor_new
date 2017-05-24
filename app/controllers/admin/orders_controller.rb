class Admin::OrdersController < AdminController
  
  include CrudConcern

  before_action :find_order, only: [:edit, :update, :destroy]

  def index
    @orders = index_helper("Order")
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    create_helper(@order, "edit_admin_order_path")
  end

  def update
    update_helper(@order, "edit_admin_order_path", order_params)
  end

  def edit
  end

  def destroy
    destroy_helper(@order, "admin_orders_path")
  end

  private

  def find_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(Order.attribute_names.map(&:to_sym))
  end
end

