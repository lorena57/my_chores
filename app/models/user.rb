class User < ActiveRecord::Base

    has_secure_password

    validates :username, presence: true
    validates_uniqueness_of :username
end