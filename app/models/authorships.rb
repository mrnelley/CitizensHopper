class Authorship < ActiveRecord::Base
  belongs_to :users
  # I would definitely always avoid using has_many_and_belongs_to, especially here-- has_many_and_belongs_to is a way of *not creating* a join model but still creating a join table in PSQL. You definitely would not want to do this in your join model
  has_many_and_belongs_to :usercreatedbills
end
