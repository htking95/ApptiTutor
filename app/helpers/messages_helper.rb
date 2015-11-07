module MessagesHelper
  def recipients_options
    s = ''
    Userlogin.all.each do |user|
      s << "<option value='#{user.id}'>#{user.email}</option>"
    end
    s.html_safe
  end
end