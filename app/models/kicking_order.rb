class KickingOrder < ApplicationRecord
  belongs_to :game, :autosave => true
end
