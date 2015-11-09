class Userlogin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  searchkick
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
