class Inning < ApplicationRecord
    belongs_to :game, :autosave => true
end
