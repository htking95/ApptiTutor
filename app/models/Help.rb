class Help

  include ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :subject, :content

  validates :subject,
    presence: true

  validates :content,
    presence: true

end