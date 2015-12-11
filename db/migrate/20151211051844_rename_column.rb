class RenameColumn < ActiveRecord::Migration
  def change
  	rename_column :userlogins, :reviews, :age
  end
end
