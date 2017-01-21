class Comment < ApplicationRecord
  belongs_to :product

  validates_presence_of :title, :body, :name, :email
end
