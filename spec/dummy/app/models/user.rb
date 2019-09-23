class User < ApplicationRecord
  has_one_attached :avatar
  has_many_attached :images

  variant_name :medium, resize: "500x500", auto_orient: true
  variant_name :xsmall, resize: "30x30"
end
