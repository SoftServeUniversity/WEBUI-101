class PagedownInput < SimpleForm::Inputs::TextInput
  def input
    out = ""
    out << "#{@builder.text_area(attribute_name, input_html_options.merge(
      { :class => 'wmd-input', :id => "wmd-input-#{attribute_name}"})) }"
    if input_html_options[:preview]
      out << "<div id=\"wmd-preview-#{attribute_name}\" class=\"wmd-preview\"></div>"
    end
    out.html_safe
  end
end