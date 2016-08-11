class Usercreatedbill < ActiveRecord::Base
  has_many :authorships
  has_many :users, through: :authorships
end
