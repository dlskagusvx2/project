class ClassStatus < ApplicationRecord
  belongs_to :student
  belongs_to :class_list
	
	def overlap?
		ClassStatus.where(student_id: self.student_id, class_list_id: self.class_list_id).size > 0
	end
	
	def full?
		ClassStatus.where(class_list_id: self.class_list_id, status: "신청").size >= ClassList.find(self.class_list_id).limit_num
	end
	
	def transfer?
		ClassStatus.where(class_list_id: self.class_list_id, status: "신청").size < ClassList.find(self.class_list_id).limit_num
	end

end
