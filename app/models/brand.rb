class Brand < ActiveRecord::Base
  validates :name,    presence: true,
                      length: { maximum: 50 },
                      uniqueness: { case_sensitive: false }
  validates :website, length: { maximum: 50 }
  validates :country, length: { maximum: 50 }
end
