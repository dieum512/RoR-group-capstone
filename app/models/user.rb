class User < ApplicationRecord
  has_many :foods, dependent: :destroy
end
