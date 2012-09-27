class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :conversation

  attr_accessible :conversation_id, :user_id, :content, :photo
  has_attached_file :photo,
                    :styles => { :small => "300x300>" },
                    :storage => :s3, 
                    :s3_credentials => S3_CREDENTIALS
                    
  validates_attachment :photo, :size => { :in => 0..500.kilobytes }
  
  validates_presence_of :user, :conversation

  scope :order, "created_at ASC"

end
