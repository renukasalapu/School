class SubjectsController < ApplicationController
	def index
		@subjects = Subject.all
	end

	def create
		@subject = Subject.create(subject_name: params[:subject][:subject_name])
	end

end
