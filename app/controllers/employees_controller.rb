# frozen_string_literal: true

class EmployeesController < ApplicationController
  include IdentityConcern
  before_action :set_employee, only: %i[show edit update destroy]

  def index
    @employees = Employee.all
  end

  def show
    # GET /employees/1
  end

  def new
    @employee = Employee.new
  end

  def edit
    # GET /employees/1/edit
  end

  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to employee_url(@employee), notice: "Employee was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to employee_url(@employee), notice: "Employee was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employees_url, notice: "Employee was successfully destroyed." }
    end
  end

  private

  def set_employee
    # @employee = Employee.find(params[:id])
    @employee = Employee.find_by_sql(["SELECT * FROM employees WHERE id = ? ", params[:id]]).first
  end

  def employee_params
    params.require(:employee).permit(:name, :position, :salary)
  end
end
