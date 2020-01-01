class Chore < ActiveRecord::Base

    belongs_to :user
    has_many :gadgets
end