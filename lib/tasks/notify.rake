namespace :user do
  desc "Checks db for inactive users"

  task :notify => :environment do

    puts "*****==== checking for inactive users =====*****"
      #do not touch this line or add space it wont work if u add space
    users = Ouser.where("updated_at < ?", 26.days.ago)
      #loop over erery user
      users.each do |user|
        puts "**==== here is " + user.name + " he is inactive ====**"
            @inac_name = user.name

            @recipient = user.email

            @title = "Hi " + user.name + " are you Ok?"

            @description = 'If you do not check in soon your secrets will be delivered '

            UserMailer.delay.notify_email(@title,@description,@inac_name,@recipient)



      end
  end
  puts "$%$%$%$%$%$% ALL USERS HAVE BEEN ACCOUNTED FOR $%$%$%$%$%$%"
end
