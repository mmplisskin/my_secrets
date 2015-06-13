namespace :db do
  desc "Checks db for inactive users"
  task :alive => :environment do
  @post = Post.where("last_update <= ?", 30.days.ago)
  puts "#{@post}"
  puts "..^ this is the post"

@post.each do |secret|
    puts "in the loop"
    puts "#{secret.title}"
  end

  end
end
