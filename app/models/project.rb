class Project < ApplicationRecord
  belongs_to :user
  has_rich_text :description
  has_one_attached :thumbnail # add this line
  has_many :comments, as: :commentable # rename comments => commentable
end
