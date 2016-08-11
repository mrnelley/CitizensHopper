class UserCreatedBill < ActiveRecord::Base
  has_many_and_belongs_to :authorships
  has_many :users, through: :authorships
end
