class Trailer < ApplicationRecord
  belongs_to :truck, optional: true
  belongs_to :company
end
