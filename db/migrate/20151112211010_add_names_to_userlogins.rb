class AddNamesToUserlogins < ActiveRecord::Migration
  def change
    add_column :userlogins, :first, :string
    add_column :userlogins, :last, :string
  end
end
