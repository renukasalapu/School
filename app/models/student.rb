class Student < ApplicationRecord
	has_many :student_marks

	accepts_nested_attributes_for :student_marks


	def get_total_marks
		self.student_marks.sum(:marks)
	end
end
