class Subcategory < ActiveRecord::Base
  belongs_to :category
  has_many :products, dependent: :destroy

  mount_uploader :logo, CategorypicUploader
end
