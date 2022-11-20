class ClassList < ApplicationRecord
  belongs_to :department
  belongs_to :professor
	has_many :students, :through => :class_statuses
end

def my_dep
	Department.where(dep_id: self.department_id).dep_name
end

