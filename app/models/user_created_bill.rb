class UserCreatedBill < ActiveRecord::Base
  belongs_to :authorship
  has_many :users, through: :authorship
end
