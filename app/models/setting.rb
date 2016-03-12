class Setting < ActiveRecord::Base
	store_accessor :social_media

	mount_uploader :logo, ImageUploader

	has_one :image
	accepts_nested_attributes_for :image, allow_destroy: true
end
