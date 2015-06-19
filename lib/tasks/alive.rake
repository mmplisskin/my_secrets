namespace :db do
  desc "Checks db for inactive users"
  task :alive => :environment do

      posts = Post.where("last_update > ?", 1.day.ago)

      posts.each do |post|

        puts  @title = post.title
        puts @description = post.description

        puts  @name = post.user.name

        post.recipients.each do |recipient|

             puts recipient[:email]
        end
      end

      #fix this should push in array or something
      # puts @recipients = recipient.class

  end
end
