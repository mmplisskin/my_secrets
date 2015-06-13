class Recipient < ActiveRecord::Base
  belongs_to :user
  has_many :postrecipients
  has_many :posts, through: :postrecipients
end
