class ClassList < ApplicationRecord
  belongs_to :department
  belongs_to :professor
	has_many :students, :through => :class_statuses
	
	
end



