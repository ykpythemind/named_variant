class User < ApplicationRecord
  has_one_attached :avatar

  variant_name :medium, resize: "500x500", auto_orient: true
end
