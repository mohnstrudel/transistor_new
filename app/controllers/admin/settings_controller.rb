class Admin::SettingsController < ApplicationController
  
  before_action :find_setting, only: [:edit, :show, :update]

  def index
    @settings = Setting.all
  end

  def show
  end

  def edit
  end

  def new
    @setting = Setting.new
  end

  def update
    if @setting.update(setting_params)
      redirect_to admin_settings_path
    else
      render 'edit'
    end
  end

  def create
    @setting = Setting.new(setting_params)

    if @setting.save
      redirect_to admin_settings_path
    else
      render 'new'
    end
  end

  private

  def setting_params
    params.require(:setting).permit(:logo, :adv_text_1, :adv_text_2, :adv_text_3, :about, :phone1, :phone2, :mail, :opening, 
    	social_media: [:twitter, :instagram, :facebook, :vk ])
  end

  def find_setting
    @setting = Setting.find(params[:id])
  end
end
