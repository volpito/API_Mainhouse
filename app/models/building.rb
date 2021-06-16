class Building < ApplicationRecord
    has_many :owners
    has_many :events
end
