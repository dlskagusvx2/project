class Professor < ApplicationRecord
  belongs_to :department
	has_many :class_lists, dependent: :destroy
end
