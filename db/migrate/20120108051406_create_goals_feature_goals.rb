class CreateGoalsFeatureGoals < ActiveRecord::Migration
  def change
    create_table :goals_feature_goals do |t|
      t.string :name
      t.text :description
      t.integer :project_id
      t.timestamps
    end
  end
end