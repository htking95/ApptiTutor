class Userlogin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  searchkick word_start: [:aboutMe, :email, :skills, :classes]
  def search_data 
    {
    email: email,
    aboutMe: aboutMe,
    skills: skills,
    classes: classes
  }
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :send_admin_mail
  

  ratyrate_rateable 'overall', 'clarity', 'knowledge', 'politeness', 'flexibility'
  ratyrate_rater

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
  acts_as_messageable

  def mailboxer_name
    self.first
  end

  def mailboxer_email(object)
    self.email
  end


  def send_admin_mail
    UserMailer.welcome_email(self).deliver
  end
end
