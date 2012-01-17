# encoding: utf-8

class SoilTestResult < ActiveRecord::Base
  RESULT_UNITS = ['pH Units', 'mg/L', 'me/100g', '%', 'g/mL', 'kg/ha', 'μg/g', 'units']
  belongs_to :soil_test
  belongs_to :soil_test_result_type
  
  validates_presence_of :name, :amount, :amount_unit
  validates_inclusion_of :amount_unit, :in => RESULT_UNITS, :allow_blank => true

  has_amount_with_unit
  can_assign_by_name :soil_test_result_type
  
  alias_method :name, :soil_test_result_type_name
  alias_method :name=, :soil_test_result_type_name=
end
