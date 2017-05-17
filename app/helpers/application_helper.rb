module ApplicationHelper

	def article_description article
	  output = h truncate(article.description, length: 200, omission: ' ... ')
	  output += link_to('(более подробно)', '#description') if article.description.size > 200
	  output.html_safe
	end

	def setting(param)
		return Setting.first.send(param)
	end

	def hidden_div_if(condition, attributes = {}, &block)
		if condition
			attributes["style"] = "display: none"
		end
		content_tag('div', attributes, &block)
	end

	def link_to_add_fields(name, f, association)
		new_object = f.object.send(association).klass.new
		id = new_object.object_id
		fields = f.fields_for(association, new_object, child_index: id) do |builder|
			render(association.to_s.singularize + "_fields", f: builder)
		end
		link_to(name, '#', class: 'add_fields', data: {id: id, fields: fields.gsub("\n", "")})
	end

	def image_or_default(object, options = {})
		# Usage:
		# as object you give either the 'parent' object, for example a product. Or you can give a specific image, that's
		# where which_one: 'each' comes in.
		# options[:which_one] - you can specify 'first', 'second', 'last' etc. or 'each' if you need to loop through all images.
		# options[:class] - a css class to provide, optional
		# options[:thumb] - the name for thumbnail you specified in the uploader class

		which_one = options[:which_one] || 'first'		
		thumb = options[:thumb]
		attributes_array = Array.new
		# object.attribute_names.each { |attribute| attributes_array.push(object.send(attribute)) }

		alt = request.original_fullpath.split(/[\/-]/).join(" ")

		if which_one == :each
			return image_tag(object.image.url(thumb), class: options[:class], alt: alt)
		elsif object.try(:images)
			if object.images.any?
				return image_tag(object.images.send(which_one).image.url(thumb), class: options[:class], alt: alt)
			else
				return image_tag("default.png", size: "270x380")
			end
		else
			return image_tag(object.send(options[:image_name]).url(thumb), class: options[:class], alt: alt)
		end
	end

	def price_or_default(object)
		if object.options.any?
			unless object.options.first.price.nil?
				return "От #{object.options.first.price} #{"\u20BD".encode('utf-8')}"
			else
				return "Нет цены"
			end
		else
			return "Нет цены"
		end
	end

	def style_first_div(number, &block)
		if number.even?
			return content_tag('div', class: "col-md-3 col-sm-4", &block)
		else
			return content_tag('div', class: "col-md-3 col-sm-4 col-md-push-9 col-sm-push-8", &block)
		end
	end

	def style_second_div(number, &block)
		if number.even?
			return content_tag('div', class: "col-md-9 col-sm-8", &block)
		else
			return content_tag('div', class: "col-md-9 col-sm-8 col-md-pull-3 col-sm-pull-4", &block)
		end

	end

	def russianize(number)
		if number == 1
			return ""
		elsif number.between?(2,4)
			return "а"
		else
			return 'ов'
		end
	end
end
