class Review < ApplicationRecord
  searchkick
  belongs_to :movie
    belongs_to :user
end
