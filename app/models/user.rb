class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation

  has_secure_password
  #self.salt = Digest::SHA2.hexdigest("#{Time.now.utc}") if !self.exists?
  validates_presence_of :password, :on => :create

  email_regex = /\A[\w+\-.]+@+[a-z\d\-.]+[a-z]+\z/i

  validates :name,  :presence   => true,
                    :length     => {:maximum => 50},
                    :uniqueness => {:case_sensitive => false}

  validates :email, :presence   => true,
                    :format     => {:with => email_regex},
                    :uniqueness => {:case_sensitive => false}

end

