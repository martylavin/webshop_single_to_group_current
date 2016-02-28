class UserMailer < ActionMailer::Base
  default from: "from@example_Martylavin.com"

  def contactus(user)
    @user = user
    @greeting = "Hi"
    #attachments['rails.png'] = File.read("app/assets/images/rails.png")
    #attachments['rails.2016_JanFebNL.pdf'] = File.read("app/assets/images/2016_JanFebNL.pdf")
    attachments['rails.2016_MARAPR_v1.pdf'] = File.read("app/assets/images/2016_MARAPR_v1.pdf")
    mail(to: user.email, subject: "The Legion Post 854 Email for #{user.name } ")
  end

  def newsletter(users)
    @greeting = "Hi"
    @users = users
  
    mail_array = [] 
    @users.each do |user| 
      mail_array << user.email 
    end 
    mail_array_string_final = mail_array.join(',')
    @mail_array_string_final = mail_array_string_final
    #attachments['rails.png'] = File.read("app/assets/images/rails.png")
    #attachments['rails.2016_JanFebNL.pdf'] = File.read("app/assets/images/2016_JanFebNL.pdf")
    attachments['rails.2016_MARAPR_v1.pdf'] = File.read("app/assets/images/2016_MARAPR_v1.pdf")
    mail(to: mail_array_string_final, subject: "Legion Post 854 Newsletter is attached")
   
  end

end
