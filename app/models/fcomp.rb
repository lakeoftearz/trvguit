class Fcomp < ApplicationRecord
  has_many :reviews, dependent: :destroy
  accepts_nested_attributes_for :reviews
  default_scope -> { order(:name) }
  mount_uploader :logo, LogoUploader
  validates :name, presence: true
  validates :country, presence: true
  validates :webpage, presence: true
  validates :rules, presence: true
end