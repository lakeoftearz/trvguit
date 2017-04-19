class Review < ApplicationRecord
  
  belongs_to :fcomp
  default_scope -> { order(created_at: :desc) }
  
end
