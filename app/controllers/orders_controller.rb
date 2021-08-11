class OrdersController < ApplicationController
  before_action :set_customers, only: %i[new edit create]
  before_action :set_role, only: %i[new edit]
  before_action :set_event, only: %i[new edit]
  before_action :set_order, only: %i[show edit update destroy]

  def index
    @orders = case Current.user.role
              when 'admin'
                Order.all
              when 'customer'
                Current.user.customer.orders
              else
                []
              end
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def create
    attributes = order_params.deep_dup
    if Current.user.role == 'customer'
      attributes[:customer_id] = Current.user.customer.id
    end
    @order = Order.new(attributes)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: "Order was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: "Order was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :raw_material, :process_type, :material_quantity)
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def set_customers
    @customers = Customer.all.order(:name)
  end

  def set_role
    @role = Current.user.role
  end

  def set_event
    @event = params[:action]
  end
end
