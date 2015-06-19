namespace :db do
  desc "Checks db for inactive users"

  task :alive => :environment do

    puts "==== checking for inactive users ====="
      #do not touch this line or add space it wont work if u add space
    users = User.where("last_update > ?", 1.day.ago)
      #loop over erery user
      users.each do |user|
        puts "=== here is a " + user.email + " dead guy ===="  #loop over all of their posts
           user.posts.each do |post|
            puts "=== here is  " + user.email + " " + post.title + " secret ===="

              @title = post.title
              @description = post.description
              #get the user to send to
              recipeints = post.recipients.each do |recipient|
                puts recipient [:email]
                sleep(2.seconds)
              end
           end

      end
  end
end
