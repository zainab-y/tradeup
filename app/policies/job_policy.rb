class JobPolicy < ApplicationPolicy
  attr_reader :user, :job

  def initialize(user, job)
    @user = user
    @job = job
  end

  def edit?
    @user == @job.user
  end

  def destroy?
    @user == @job.user
  end
 
end
