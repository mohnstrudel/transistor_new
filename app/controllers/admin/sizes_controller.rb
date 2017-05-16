class Admin::SizesController < AdminController
	before_action	:find_size, only: [:edit, :update, :show, :destroy]

  def index
  	@sizes= Size.all
  end

  def show
  end

  def edit
  end

  def new
    @size = Size.new
  end

  def create
    @size = Size.new(size_params)
    if @size.save
      redirect_to admin_sizes_path
      flash[:success] = 'Успешно создано'
    end
  end

  def update
    if @size.update!(size_params)
      redirect_to admin_sizes_path
      flash[:success] = 'Успешно обновлено'
    end
  end

  def destroy
    if @size.destroy
      redirect_to admin_sizes_path
      flash[:info] = 'Удалено успешно'
    end
  end

  private

	  def find_size
	  	@size = Size.find(params[:id])
	  end

	  def size_params
	  	params.require(:size).permit(:value)
	  end

end
