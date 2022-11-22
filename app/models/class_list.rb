class ClassList < ApplicationRecord
  belongs_to :department
  belongs_to :professor
	has_many :students, :through => :class_statuses
end

def my_dep
	Department.where(dep_id: self.department_id).dep_name
end

def transfer
		self.each do |class_list|
			if class_list.empty?
				@reserve = class_list
				@reserve.status = "예약"
				@reserve.save
			end
		end
end

