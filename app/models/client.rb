class Client < ApplicationRecord
  has_one_attached :document
  validates :phone, ten_digit_phone_number: true, allow_blank: true
  validate :must_opt_in_to_one

  def must_opt_in_to_one
    if !text_opt_in && !email_opt_in
      errors.add(:must_opt_in_to_one, "Please choose one")
    end
  end
end
