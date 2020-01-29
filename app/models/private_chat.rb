class PrivateChat < ApplicationRecord
  belongs_to :from, class_name: "User",optional: true
  belongs_to :to, class_name: "User",optional: true

end
