class ClassStatus < ApplicationRecord
  belongs_to :student
  belongs_to :class_list
	
	def overlap?
		ClassStatus.where(student_id: self.student_id, class_list_id: self.class_list_id, status: "신청").size > 0
	end
	
	def full?
		ClassStatus.where(class_list_id: self.class_list_id, status: "신청").size >= ClassList.find(self.class_list_id).limit_num
	end
	
	def empty?
		ClassStatus.where(class_list_id: self.class_list_id, status: "신청").size < ClassList.find(self.class_list_id).limit_num
	end
	
	def retake?
		@retake = ClassStatus.where(student_id: self.student_id, class_list_id: self.class_list_id)
		@retake.each do |retake|
			if retake.status == "신청"
				return true
			end
		end
		return false
	end
	
	def time_duplicate?
		@my_applicate_class = ClassStatus.where(student_id: self.student_id, status: "신청")
		day = ['m','t','w','th','f']
		app_day = self.class_list.lecture_time
		for i in 1..8
			for a in day
				x = a + "#{i}"
				@my_applicate_class.each do |my_class|
					class_day = my_class.class_list.lecture_time
					is_class_day = class_day.include? x
					is_app_day = app_day.include? x
					if is_class_day && is_app_day
						return true
					end
				end
			end
		end
		return false
	end
	
	def credit_exceed?
		@credit_sum = self.class_list.credit
		@my_applicate_class.each do |app_class|
			@credit_sum = @credit_sum + app_class.class_list.credit
		end
		if @credit_sum > 4
			return true
		else
			return false
		end
	end
	

end
