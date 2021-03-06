class Fcomp < ApplicationRecord
  filterrific(
  
  available_filters: [ 
    :search_query
  ]
)

 scope :search_query, lambda { |query|
    where("name ILIKE ?", "%#{query}%")
  }
   
  has_many :reviews, dependent: :destroy
  accepts_nested_attributes_for :reviews
  default_scope -> { order(:name) }
  mount_uploader :logo, LogoUploader
  validates :name, presence: true
  validates :country, presence: true
  validates :webpage, presence: true
  validates :rules, presence: true
  
   def country_name
    country = self.country
    ISO3166::Country[country]
   end
   
   



   
end