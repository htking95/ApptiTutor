class Favorite < ActiveRecord::Base
  belongs_to :userlogin
  belongs_to :favorited, polymorphic: true
end
