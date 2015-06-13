class Post < ActiveRecord::Base
  has_many :postrecipients
  has_many :recipients, through: :postrecipients
end
