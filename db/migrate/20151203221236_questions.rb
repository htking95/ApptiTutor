class Questions < ActiveRecord::Migration
  def change
  	add_column :userlogins, :questions2, :string
  	add_column :userlogins, :answers1, :string
  	add_column :userlogins, :answers2, :string
  end
end
