class User < ActiveRecord::Base
    include BCrypt

  validates :full_name, presence: true
  validates :email, uniqueness: true, presence: true

# These are virtual attributes, aka getter and setter
# methods for something that ISN'T in our db table
  def password=(new_password)
    @raw_password = new_password
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def password
    @password ||= Password.new(password_hash)
  end

# finds the user by email.
# if a user exists, return true. Otherwise, return nil.
# and if the password the user enters is equal to the hashed password, 
# then the user exists. If not, user doesnt exist. 

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    return nil unless user
    user.password == password ? user : nil
  end
end
