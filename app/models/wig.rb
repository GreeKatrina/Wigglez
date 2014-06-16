class Wig < ActiveRecord::Base
  belongs_to :donor, class_name: "User"
  belongs_to :receiver, class_name: "User"
end
