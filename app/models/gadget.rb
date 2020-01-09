class Gadget <ActiveRecord::Base

    belongs_to :chore
    
    validates :gizmo, presence: true
end