class Professor < ApplicationRecord
  belongs_to :department
	has_many :class_list, dependent: :destroy
end
