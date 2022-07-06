class Van < ApplicationRecord
  belongs_to :train

  enum kind: [:business, :econom]
end
