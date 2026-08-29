class OrdersController < ApplicationController
  def index
    orders = Order.includes(:meal).order(created_at: :desc)
    meals = Meal.where(available: true).order(:name)

    render inertia: {
      orders: orders.map do |order|
        {
          id: order.id,
          employee_name: order.employee_name,
          delivery_date: order.delivery_date,
          status: order.status,
          meal: {
            id: order.meal.id,
            name: order.meal.name,
            price: order.meal.price
          }
        }
      end,

      meals: meals.map do |meal|
        {
          id: meal.id,
          name: meal.name,
          price: meal.price
        }
      end
    }
  end

  def create
    order = Order.new(order_params)

    if order.save
      redirect_to orders_path
    else
      redirect_to orders_path, inertia: { errors: order.errors }
    end
  end

  def cancel
    order = Order.find(params[:id])

    order.cancel

    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(
      :meal_id,
      :employee_name,
      :delivery_date
    )
  end
end