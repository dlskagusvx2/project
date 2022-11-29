class ClassList < ApplicationRecord
  belongs_to :department
  belongs_to :professor
	has_many :students, :through => :class_statuses
	
	def day_to_dayko
		day = ['m','t','w','th','f']
		day_ko = ['월','화','수','목','금']
		class_day = self.lecture_time
		class_day_ko = []
		for a in day
			for i in 1..8
				x = a + "#{i}"
				y = day.index(a)
				if class_day.include? x
					class_day_ko << day_ko[y]+"#{i}"
				end
			end
		end
		return class_day_ko
	end
	
	
end



