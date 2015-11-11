class Userlogin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  searchkick
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

<<<<<<< HEAD
  after_create :send_admin_mail

  def send_admin_mail
    UserMailer.welcome_email(self).deliver
  end
=======
>>>>>>> user_search
end
