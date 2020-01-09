class Chore < ActiveRecord::Base

    belongs_to :user
    has_many :gadgets

    validates :task, presence: true
end