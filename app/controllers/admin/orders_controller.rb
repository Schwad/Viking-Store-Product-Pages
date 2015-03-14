class Admin::OrdersController < AdminController
  def destory
  end

  def index
  end

  def new
    @order = Orders.new
  end

  def create
    # @order = Order.find()
  end
end
