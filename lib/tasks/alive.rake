namespace :db do
  desc "Checks db for inactive users"

  task :alive => :environment do
      #do not touch this line or add space it wont work if u add space
    users = User.where("last_update > ?", 1.day.ago)
      #loop over erery user
      users.each do |user|
          #loop over all of their posts
           user.posts.each do |post|
            #get the secret
              @title = post.title
              @description = post.description
              #get the user to send to
              recipeints = post.recipients.each do |recipient|
                puts recipient [:email]
                sleep(2.seconds)
              end
           end

      end



      # posts = Post.where("last_update > ?", 1.day.ago)
      #
      # posts.each do |post|
      #
      #   puts  @title = post.title
      #   puts @description = post.description
      #
      #   puts  @name = post.user.name
      #
      #   post.recipients.each do |recipient|
      #
      #        puts recipient[:email]
      #   end
      # end

      #fix this should push in array or something
      # puts @recipients = recipient.class

  end
end
