class User < ActiveRecord::Base
    attr_accessible :email, :password, :password_confirmation, :user_name, :user_address, :user_country, :user_zip, :user_province, :user_city
  
  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_presence_of :user_name
  validates_presence_of :user_address
  validates_presence_of :user_zip
  validates_presence_of :user_province
  validates_presence_of :user_country, :user_city, :password_confirmation
  validates_uniqueness_of :email

   validates :email, email_format: { message: "doesn't look like an email address" }
   validates :user_name, :format => { :with => /\A[a-zA-Z]+\z/,
    :message => "Only letters allowed" }

    validates :user_province, :user_country, :format => { :with => /\A[a-zA-Z]+\z/,
    :message => "Only letters allowed" }
    
    validates :user_name, :user_province, :user_zip, :user_country,  format: { without: /\s/ ,  :message => "No white space allowed"}

    validates :password, :format => {:with=> /^(?=.*\d)(?=.*([a-z]|[A-Z]))([\x20-\x7E]){6,40}$/ , :message => "should be atleast 6 character long and maximum of 40 characters, have atleast one digit, one upper case letter, lower case letter and one special character"}


  # paperclip stuff
  attr_accessible :avatar
  has_attached_file :avatar, :styles => { :medium => "390x480", :small=>"130x160", :thumb => "100x100>" }
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
