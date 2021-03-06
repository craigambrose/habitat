module RecordPresentationHelper
  def attribute_row(record, key, options = {}, &block)
    if !record.send(key).blank?
      content_tag(:tr) do
        if block
          value = yield
        else
          value = record.send(key)
          if options[:line_breaks]
            value = simple_format(value)
          end
        end
        
        content_tag(:td, content_tag(:strong, options[:label] || key.to_s.humanize)) +
        content_tag(:td, value)
      end
    end
  end
  
  def non_attribute_row(label_text)
    content_tag(:tr) do
      content_tag(:td, content_tag(:strong, label_text)) +
      content_tag(:td, yield)
    end
  end

  def non_attribute_wide_row(label_text)
    content_tag(:tr, :class => 'wide_header') do
      content_tag(:td, :colspan => 2) do
        content_tag(:strong, label_text, :class => 'wide_header') + yield
      end
    end
  end

  def table_link_footer(t, name, url, options = {})
    table_footer_row(t, link_to(name, url, options), :class => 'table_actions')
  end
  
  def table_help_footer(t, help_text)
    table_footer_row(t, help_text, :class => 'no-data')
  end
    
  def table_link_footer_cell(t, name, url, options = {})
    table_footer_cell(t, link_to(name, url, options), :class => 'table_actions')
  end
  
  def table_help_footer_cell(t, help_text)
    table_footer_cell(t, help_text, :class => 'no-data')
  end
    
  def table_footer_row(t, contents, cell_options = {})
    content_tag(:tfoot) do
      content_tag(:tr) do
        table_footer_cell(t, contents, cell_options = {})
      end
    end
  end 

  def table_footer_cell(t, contents, cell_options = {})
    content_tag(:td, contents, {:colspan => t.table_fields.length}.merge(cell_options))
  end
  
  def collection_has_value(collection, key)
    !collection.map(&key).reject(&:blank?).empty?
  end
end