class Recipient < ActiveRecord::Base
  has_many :post_recipients
  has_many :posts, through: :post_recipients
  belongs_to :user
end
