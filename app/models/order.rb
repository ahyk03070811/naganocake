class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer



  enum payment_method: { "credit_card": 0, "transfer": 1 }
  enum status: { "waiting_for_payment": 0, "confirmation": 1, "creating": 2, "preparing": 3, "shipped": 4 }

end
