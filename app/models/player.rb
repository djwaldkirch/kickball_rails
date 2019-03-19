class Player < ApplicationRecord
    validates :name, presence: true
    validates :gender, presence: true
    validates :p1, presence: true
    validates :p2, presence: true
    validates :p3, presence: true
    validates :p4, presence: true
    validates :p5, presence: true
    validates :p6, presence: true
    validates :p7, presence: true
    validates :p8, presence: true
    validates :p9, presence: true
    validates :p10, presence: true
    validates :active, presence: true
end
