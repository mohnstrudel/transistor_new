class DeliveriesController < ApplicationController

  def show
    @delivery = Delivery.find(params[:id])

    respond_to do |format|
      format.json { render json: @delivery }
    end
  end
end
