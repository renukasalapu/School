class StudentsController < ApplicationController
	def index
		# @students = Student.all
		@pagy, @students = pagy(Student.all, items: 10) 

		@subjects = Subject.all
		@student_marks = StudentMark.new
	end

	def new
		@student = Student.new
		@subjects = Subject.all
	end

	def append_data
		# @student = Student.find_by(id: params[:id])
		@subjects = Subject.all

	end

	def create
		@student = Student.new(first_name: params[:student][:first_name], last_name: params[:student][:last_name])
		if @student.save
				update_marks
				notice = "Student created succesfully"
				redirect_to students_path, flash: {notice: notice}
		else
			alert = "Student not created"
			redirect_to students_path,flash: {alert: alert}
		end
	end

	def edit
		@student = Student.find_by(id: params[:id])
	end

	def show
		@student = Student.find_by(id: params[:id])
	end

	def update
		@student = Student.find_by(id: params[:id])
		if @student.update(first_name: params[:student][:first_name], last_name: params[:student][:last_name])
			update_marks
			notice = "Student updated succesfully"
			redirect_to students_path, flash: {notice: notice}
		else
			alert = "Student not updated"
			redirect_to students_path, flash: {alert: alert}
		end
	end

	def update_marks
		if params[:subjects].present?
			params[:subjects].each do |s|
				if s["marks"].present? && s["subject_id"].present?
					student_mark = @student.student_marks.find_by(subject_id: s["subject_id"])
					if student_mark.present?
						student_mark.update!(marks: s["marks"])
					else
						@student.student_marks.create!(subject_id: s["subject_id"], marks: s['marks'])
					end
				end
			end
		end
	end

	def destroy
		@student = Student.find_by(id: params[:id])
		if @student.destroy
			flash[:notice] = "Student deleted"
			redirect_to students_path, flash: {notice: notice}
		else
			flash[:alert] = "Student not deleted"
			redirect_to students_path, flash: {alert: alert}
		end

	end
end
