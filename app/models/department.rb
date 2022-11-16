class Department < ApplicationRecord
	has_many :professors, dependent: :destroy
end
