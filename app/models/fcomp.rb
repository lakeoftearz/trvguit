class Fcomp < ApplicationRecord
  default_scope -> { order(:name) }
    mount_uploader :logo, LogoUploader
  validates :name, presence: true
  validates :country, presence: true
  validates :webpage, presence: true
  validates :rules, presence: true
end