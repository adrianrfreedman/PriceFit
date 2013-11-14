class Brand < ActiveRecord::Base
  has_many :brand_sizes, dependent: :destroy
  default_scope -> { order('name ASC') }

  validates :name,    presence: true,
                      length: { maximum: 50 },
                      uniqueness: { case_sensitive: false }
  validates :website, length: { maximum: 50 }
  validates :country, length: { maximum: 50 }
end
