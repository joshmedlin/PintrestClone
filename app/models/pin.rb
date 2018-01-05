class Pin < ActiveRecord::Base
	acts_as_votable
	belongs_to :user

	has_attached_file :image, :styles => { :medium => "300x300>" },
	            :storage => :s3,
	            :bucket => ENV['AWS_BUCKET'],
              :s3_bucket => ENV['AWS_BUCKET'],
              :s3_permissions => 'public_read_write',
              :s3_protocol => 'https',
              :s3_host_name => 'us-east-2.amazonaws.com',
              :s3_host_alias => 'us-east-2.amazonaws.com',
              :s3_region => ENV['AWS_REGION'],
              :s3_credentials => { :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                                   :secret_access_key => ENV['AWS_SECRET_KEY_ID'],
                                   :endpoint => 'us-east-2.amazonaws.com' }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
end
