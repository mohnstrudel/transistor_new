class Admin::TagsController < AdminController
  
  before_action :find_tag, only: [:edit, :show, :update]

  def index
    @tags = Tag.all
  end

  def show
  end

  def edit
  end

  def new
    @tag = Tag.new
  end

  def update
    if @tag.update(tag_params)
      redirect_to admin_tags_path
    else
      render 'edit'
    end
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to admin_tags_path
    else
      render 'new'
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name, :vertical_image, :remove_vertical_image, :description)
  end

  def find_tag
    @tag = Tag.find(params[:id])
  end
end
