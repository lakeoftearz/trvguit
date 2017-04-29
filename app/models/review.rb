class Review < ApplicationRecord
  
    before_save { self.email = email.downcase }
  belongs_to :fcomp
  default_scope -> { order(created_at: :desc) }
  validates :title,  presence: true, length: { maximum: 100 }
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
   format: { with: VALID_EMAIL_REGEX }
  validates :fullname,  presence: true, length: { maximum: 100 }
  validates :country, presence: true
  validates :content,  presence: true


 def country_name
    country = self.country
    ISO3166::Country[country]
   end
  
end
