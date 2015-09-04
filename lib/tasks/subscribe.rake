namespace :user do
  desc "Checks db for users that need to pay"

  task :subscribe => :environment do

    puts "*****==== checking for users that have not paid =====*****"
      #do not touch this line or add space it wont work if u add space
    users = Ouser.where("last_payment < ?", 1.year.ago)
      #loop over erery user
      users.each do |user|
        puts "**==== here is " + user.name + " he has not paid ====**"
          user.paid = false
          user.save!

      end
  end
  puts "$%$%$%$%$%$% ALL USER Subscriptions HAVE BEEN ACCOUNTED FOR $%$%$%$%$%$%"
end
