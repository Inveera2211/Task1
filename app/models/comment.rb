class Comment < ActiveRecord::Base
  belongs_to :article
  
   validates :body, presence: true,
   length: { minimum: 2 }
end
