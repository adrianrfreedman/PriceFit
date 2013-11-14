class BrandSize < ActiveRecord::Base
  belongs_to :brand

  # Validations
  validates :size,     presence: true,
                       inclusion: { in: (4..18).step(2).to_a }
  validates :bust,     presence: true,
                       numericality: { greater_than_or_equal_to: 71,
                                       less_than_or_equal_to: 115 }
  validates :waist,    presence: true,
                       numericality: { greater_than_or_equal_to: 58,
                                       less_than_or_equal_to: 91.5 }
  validates :hip,      presence: true,
                       numericality: { greater_than_or_equal_to: 78,
                                       less_than_or_equal_to: 117 }
  validates :brand_id, presence: true
  validates :legend,   presence: true,
                       length: { maximum: 25 }
end
