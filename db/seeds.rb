# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# #
# # Examples:
# #
#   # cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   # Mayor.create(name: 'Emanuel', city: cities.first)
#   # Build a list to be used for users and posts
#   nums = ["first", "second", "third"]
#   #
  # # Build a list to be used for potential recipients
  # recv = ["one", "two", "three", "four", "five"]
  #
  # # Iterate over the list of items to be created for users and posts
  # nums.each do |num|
  #
  #     # Create the user
  #     u = Ouser.create(name: num + " user", email: num + "@gmail.com", last_update: Time.now )
  #
  #     # Loop again to then create the posts for this user
  #     nums.each do |num|
  #
  #         # Create the post
  #         post = u.posts.create(title: num + " post", description: num + " description")
  #
  #         # Grab two random recipients and loop them
  #         recv.sample(2).each do |r|
  #
  #             # Find the recipient (or create it if it doesn't exist)
  #             recipient = Recipient.find_or_create_by(ouser_id: u.id, email: r + "@recipient.com") do |rec|
  #
  #                 # This internal block only runs when a recipient needs to be created
  #                 puts "Now creating recipient: " + r + " for user: " + u.name
  #                 rec.name = "Recipient " + r
  #
  #             end
  #
  #             # Associate the recipient with the post
  #             post.recipients << recipient
  #
  #         end
  #
  #     end
  #
  # end
