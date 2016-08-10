class UserCreatedBill < ActiveRecord::Base
  has_many :users, through: :authorships
end
