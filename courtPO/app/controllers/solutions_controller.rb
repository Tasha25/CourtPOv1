class SolutionsController < ApplicationController
  before_filter :load_case

  def create
    @user = User.find(params[:user_id])
    @case = Case.find(params[:case_id])
    @solution = Solution.new(params[:solution])

  #this goes to the show and helps to print out what you want to see form the database.
    if @solution.save
      redirect_to case_path
    else
      @users = User.all
      render :new
    end
  end

  def destroy
    Solution.find(params[:id]).destroy
    flash[:notice] = "Deleted solution"
    redirect_to case_path
  end

end
