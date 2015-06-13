namespace :db do
  desc "Checks db for inactive users"
  task :alive => :environment do

    posts = Post.where("last_update > ?", 1.day.ago)

    posts.each do |post|

      puts  @title = post.title
      puts @description = post.description

      user = User.find(post.user_id)
      puts @name = user.name

      contact = Postrecipient.find(post.id)

      contact = Recipient.find(contact.recipient_id)

      puts @email = contact.email

      puts @name = contact.name


    end

  end
end
