class Product < ActiveRecord::Base

	before_create :set_default
	before_save :set_keywords
	before_destroy :ensure_not_referenced_by_any_line_item

	validates :category, :subcategory, :intro_text, :description, :name, presence: true

	include Filterable

	scope :sizing, -> (size) { joins(:options).where('options.size' => size) }

	scope :hot, lambda{ where(hotproduct: true) }

	mount_uploader :main_slider_image, CategorypicUploader
	mount_uploader :main_infographic, ImageUploader
	mount_uploader :sizes_infographic, ImageUploader
	mount_uploader :table_infographic, ImageUploader

	belongs_to :category
	belongs_to	:subcategory
	
	has_many :options, dependent: :destroy
	accepts_nested_attributes_for :options, allow_destroy: true

	has_many :images, dependent: :destroy
	accepts_nested_attributes_for :images, allow_destroy: true, reject_if: { minimum: 2 }

	has_many :line_items

	has_many :product_tags
	has_many :tags, through: :product_tags

	has_many :coloralizations
	has_many :colors, through: :coloralizations

	has_many :comments

	

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

	def to_param
		my_name = Translit.convert(name, :english)
    	"#{id} #{my_name}".parameterize
  	end


	protected
		def set_keywords
			self.keywords = [name, description, sku.to_s, intro_text].map(&:downcase).join(' ')
		end

	private 

	def set_default
		self.sku ||= self.id
	end

	def ensure_not_referenced_by_any_line_item
		if line_items.empty?
			return true
		else
			errors.add(:base, 'Line Items present')
			return false
		end
	end
end
