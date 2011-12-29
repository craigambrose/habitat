# encoding: utf-8

class Unit
  def self.format_unit(value)
    return nil if value.blank?
    value = value.gsub('^2', '²')
    value = value.gsub('^3', '³')
    value
  end
  
  def self.format_amount_and_unit(amount, unit, options = {})
    return nil if unit.blank? 
    if options[:hide_one] && amount == 1.0
      amount = nil
    else
      return nil if amount.blank? 
    end
    if amount.to_i.to_f == amount
      amount = amount.to_i
    end
    if options[:pluralize_unit] && amount && amount > 1
      unit = unit.pluralize
    end
    [amount, Unit.format_unit(unit)].reject(&:blank?).join(' ')
  end
end