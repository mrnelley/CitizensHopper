# UserBill/user_bill might be a little easier to read and write. see also comment in bills controller
class Usercreatedbill < ActiveRecord::Base
  has_many :authorships
  has_many :users, through: :authorships

  # add validations here
end
