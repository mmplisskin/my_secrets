class PostRecipient < ActiveRecord::Base
  belongs_to :post
  belongs_to :recipient

end
