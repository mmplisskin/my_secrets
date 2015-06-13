class Recipient < ActiveRecord::Base
  has_many :postrecipients
  has_many :posts, through: :postrecipients
end
