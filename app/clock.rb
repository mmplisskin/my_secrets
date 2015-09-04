require 'clockwork'
require File.expand_path('../../config/boot', __FILE__)
require File.expand_path('../../config/environment', __FILE__)

module Clockwork
  handler do |job|
    puts "Running #{job}"
  end


  # every(10.seconds, 'rake alive:check')
  every(1.week, 'rake recipient clear'){
    `rake recipient:clear`
  }


  every(10.minutes, 'rake alive'){
    `rake user:alive`
  }

  every(12.hours , 'rake user notify'){
    `rake user:notify`
  }

  every(1.day , 'rake user subscribe'){
    `rake user:subscribe`
  }


end
