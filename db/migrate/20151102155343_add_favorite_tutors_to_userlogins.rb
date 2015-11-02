class AddFavoriteTutorsToUserlogins < ActiveRecord::Migration
  def change
    add_column :userlogins, :favoriteTutors, :string
    add_column :userlogins, :classes, :string
    add_column :userlogins, :price, :string
    add_column :userlogins, :ratings, :string
    add_column :userlogins, :reviews, :string
    add_column :userlogins, :skills, :string
    add_column :userlogins, :birthday, :datetime
  end
end
