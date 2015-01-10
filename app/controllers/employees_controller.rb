class EmployeesController < ApplicationController
	def index
		@employees=Employee.all
	end

	def new
    	@employee = Employee.new
  	end

	def create
    @employee = Employee.new(employee_params)
    if @employee.save
      flash[:notice] = "Successfully Created "
      redirect_to @employee
    else
      flash[:error] = "Error while updating employee. Please try again"
      render action: "new"
    end
  	end

   	def show
    	@employee = Employee.find(params[:id])
    		respond_to do |format|
     		format.html
   		end
  	end
	
	private 

	def employee_params
		params.require(:employee).permit(:name,:age,:gender)
	end
end