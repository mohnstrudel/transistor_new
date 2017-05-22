class Setting < ActiveRecord::Base
	store_accessor :social_media

	mount_uploader :logo, LogoUploader

	has_one :image
	accepts_nested_attributes_for :image, allow_destroy: true

	def to_keywords
		keywords.split(" ")
	end
end
