class Authorship < ActiveRecord::Base
  belongs_to :users
  has_many_and_belongs_to :usercreatedbills
end
