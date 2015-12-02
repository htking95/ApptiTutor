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
  
  acts_as_messageable

has_many :userreviews


  def mailboxer_name
    self.first
  end

  def mailboxer_email(object)
    self.email
  end


  def send_admin_mail
    UserMailer.welcome_email(self).deliver
  end

  def calculate_age(birthday)
    if (birthday.blank?) then 
      birthday = Time.now.utc.to_date
      now = Time.now.utc.to_date
      now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
    else
    now = Time.now.utc.to_date
    now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
    end
  end
end
