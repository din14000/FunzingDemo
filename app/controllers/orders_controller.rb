class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.joins(:activity).where(user: current_user).order('date DESC')
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    end
  
  # GET /orders/new
  def new
    @activity = Activity.find(params[:activity_id])
    @order = @activity.orders.new
  end

  # GET /orders/1/edit
  def edit; end

  # POST /orders
  # POST /orders.json
  def create
    @activity = Activity.find(params[:order][:activity_id])
    @order = @activity.orders.new(order_params)
    delta = @activity.tickets_left - @order.number_of_tickets
    @activity.update_column(:tickets_left, delta)
    @order.total_order_price = @order.number_of_tickets * @activity.ticket_price
    @order.user = current_user

    respond_to do |format|
      if @order.save! 
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update

    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(:number_of_tickets, :total_order_price, :activity_id)
  end


end
