class User < ActiveRecord::Base

    has_secure_password

    validates :username, presence: true
    validates_uniqueness_of :username
    validates :password, length: {in: 4..10}

    has_many :chores
end

