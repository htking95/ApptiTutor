class SkillsChanges < ActiveRecord::Migration
  def change
  	remove_column :skills, :One
  	remove_column :skills, :AAC
  	remove_column :skills, :created_at
  	remove_column :skills, :updated_at
  	add_column :skills, :skillCol, :string
  end
end
