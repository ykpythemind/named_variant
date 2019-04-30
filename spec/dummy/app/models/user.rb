class User < ApplicationRecord
  has_one_attached :avatar

  variant :medium, resize: "500x500", auto_orient: true
end
