class Team < ApplicationRecord
    has_many :players
    has_many :games
    belongs_to :user
    validates :name, presence: true
end
