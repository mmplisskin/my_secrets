class Post < ActiveRecord::Base
  belongs_to :user
  has_many :postrecipients
  has_many :recipients, through: :postrecipients
end
