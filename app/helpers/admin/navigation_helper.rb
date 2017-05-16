module Admin::NavigationHelper
  def nav_link(link_name, link_path, options={}, &block)
    class_name = current_page?(link_path) ? 'active' : ''
    additional_class = " #{options[:class]}"

    content_tag(:li, :class => "#{class_name}#{additional_class}") do
      link_to link_name, link_path, &block
    end
  end
end