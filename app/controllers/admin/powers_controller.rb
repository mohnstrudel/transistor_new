class Admin::PowersController < ApplicationController
	before_action	:find_power, only: [:edit, :update, :show, :destroy]

  def index
  	@powers= Power.all
  end

  def show
  end

  def edit
  end

  def new
    @power = Power.new
  end

  def create
    @power = Power.new(power_params)
    if @power.save
      redirect_to admin_powers_path
      flash[:success] = 'Успешно создано'
    end
  end

  def update
    if @power.update!(power_params)
      redirect_to admin_powers_path
      flash[:success] = 'Успешно обновлено'
    end
  end

  def destroy
    if @power.destroy
      redirect_to admin_powers_path
      flash[:info] = 'Удалено успешно'
    end
  end

  private

	  def find_power
	  	@power = Power.find(params[:id])
	  end

	  def power_params
	  	params.require(:power).permit(:value)
	  end

end
