class Article < ApplicationRecord
  # useful: uses ActiveRecord:Base methods which supplies rails models functions (C-reate,R-ead,U-pdate, D-estroy)
  validates :title, presence: true,
                    length: { minimum: 5}
end
