namespace :recipient do
  desc "Clear inactive recipients"

  task :clear => :environment do

      puts "********** Runing Clear Task *********"
      r = Recipient.all

      r.each do |recipient|

        unless recipient.posts.size > 0
          puts "*** " + recipient.email + " Is not tied to any posts ***"
          recipient.destroy
          puts  " ** " + recipient.email + " destroyed **"
        end
      end
  end
end
