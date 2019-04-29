class User < ApplicationRecord
  has_one_attached :avater

  variant :medium, resize: "500x500", auto_orient: true
end
