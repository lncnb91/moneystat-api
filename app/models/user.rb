class User < ApplicationRecord
  has_many :entries

  belongs_to :wallet
end
