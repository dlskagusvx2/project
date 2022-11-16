class Department < ApplicationRecord
	has_many :professors, dependent: :destroy
	has_many :class_lists, dependent: :destroy
	has_many :students, dependent: :destroy
end
