class JobPolicy < ApplicationPolicy
  attr_reader :user, :job

  def initialize(user, job)
    @user = user
    @job = job
  end

  def edit?
    @user == @job.users.first
  end

  def destroy?
    @user == @job.users.first
  end
 
end
