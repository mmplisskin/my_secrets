require 'clockwork'
require File.expand_path('../../config/boot', __FILE__)
require File.expand_path('../../config/environment', __FILE__)

module Clockwork
  handler do |job|
    puts "Running #{job}"
  end


  # every(10.seconds, 'rake alive:check')
  every(10.minutes, 'rake recipient clear'){
    `rake recipient:clear`
  }


  every(10.minutes, 'rake alive'){
    `rake user:alive`
  }

end
