class Post < ActiveRecord::Base
  belongs_to :user
  has_many :post_recipients
  has_many :recipients, through: :post_recipients

end
