class Product < ActiveRecord::Base

	validates :category, :subcategory, :description, :intro_text, presence: true

	include Filterable

	scope :voltage, -> (voltage) { joins(:options).where('options.power' => voltage) }

	scope :hot, lambda{ where(hotproduct: true) }

	mount_uploader :main_slider_image, CategorypicUploader

	belongs_to :category
	belongs_to	:subcategory
	
	has_many :options, dependent: :destroy
	accepts_nested_attributes_for :options, allow_destroy: true

	has_many :images
	accepts_nested_attributes_for :images, allow_destroy: true, reject_if: { minimum: 2 }

	has_many :line_items

	has_many :product_tags
	has_many :tags, through: :product_tags

	before_destroy :ensure_not_referenced_by_any_line_item

	before_save :set_keywords

	def self.search(keyword)
		if keyword.present?
			where('keywords LIKE ?', "%#{keyword.downcase}%")
		else
			limit(5).order("RANDOM()")
			# find(:all, :order => "type_id desc", :limit => 5).reverse
		end
	end

	def to_keywords
		name.split(" ")
	end

	def to_title
		name
	end


	protected
		def set_keywords
			self.keywords = [name, description, sku.to_s, intro_text].map(&:downcase).join(' ')
		end

	private 

	def ensure_not_referenced_by_any_line_item
		if line_items.empty?
			return true
		else
			errors.add(:base, 'Line Items present')
			return false
		end
	end
end
