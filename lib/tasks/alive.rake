namespace :user do
  desc "Checks db for inactive users"

  task :alive => :environment do

    puts "*****==== checking for inactive users =====*****"
      #do not touch this line or add space it wont work if u add space
    users = Ouser.where("updated_at < ?", 30.days.ago)
      #loop over erery user
      users.each do |user|
        if user.paid
          puts "**==== here is " + user.name + " he is a dead guy ====**"
              @inac_name = user.name
            #loop over all of their posts
             user.posts.each do |post|
              puts "  -->=== here is his  " + user.email + " " + post.title + " secret ===<--"

                @title = post.title
                puts "==got title==" + post.title
                @description = post.description
                puts "==got desc=="
                recipeints = post.recipients.each do |recipient|
                  puts "==in the loop=="
                  puts recipient.class
                  @recipient = recipient.email
                  puts "    $$$== we sent it to " + recipient.email + "==$$$"
                  # sleep(2.seconds)
                  # UserMailer.secrets_email(@title,@description,@inac_name,@recipient).deliver
                  UserMailer.delay.secrets_email(@title,@description,@inac_name,@recipient)

                  puts "*****==== Destroying the secret =====*****"

                  post.destroy
                end
              end
           end

      end
  end
  puts "$%$%$%$%$%$% ALL USERS HAVE BEEN ACCOUNTED FOR $%$%$%$%$%$%"
end
