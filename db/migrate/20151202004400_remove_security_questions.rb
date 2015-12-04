class RemoveSecurityQuestions < ActiveRecord::Migration
  def change
  	remove_column :userlogins, :passwordRecoverQuestion1
  	remove_column :userlogins, :passwordRecoverQuestion2
  	remove_column :userlogins, :passwordRecoverAnswer1
  	remove_column :userlogins, :passwordRecoverAnswer2
  end
end
