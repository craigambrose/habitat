class BudgetGoal < ActiveRecord::Base
  belongs_to :project
  belongs_to :budget_category
  
  validates_presence_of :project, :budget_category_name
  validates_numericality_of :timeframe_amount, :allow_blank => true, :greater_than => 0
  validates_inclusion_of :timeframe_amount_unit, :in => Unit::CALENDAR_TIME_UNITS, :allow_blank => true

  can_assign_by_name :budget_category  
end