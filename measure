class DressSize < ActiveRecord::Base
  # before_saves

  # Validations
  validates :brand, presence: true,
                    length: { maximum: 30 }
  validates :size,  presence: true,
                    inclusion: { in: (4..18).step(2).to_a }
  validates :bust,  presence: true,
                    numericality: { greater_than_or_equal_to: 71,
                                    less_than_or_equal_to: 108.5 }
  validates :waist, presence: true,
                    numericality: { greater_than_or_equal_to: 51,
                                    less_than_or_equal_to: 91.5 }
  validates :hip,   presence: true,
                    numericality: { greater_than_or_equal_to: 78,
                                    less_than_or_equal_to: 116 }
end
