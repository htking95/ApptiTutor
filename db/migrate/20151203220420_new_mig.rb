class NewMig < ActiveRecord::Migration
  def change
  	add_column :userlogins, :questions1, :string
  end
end
