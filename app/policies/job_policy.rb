class JobPolicy < ApplicationPolicy
  attr_reader :user, :job

  def initialize(user, job)
    @user = user
    @job = job
  end

  def update?
    @user == @job.user
    user.admin? or not post.published?
  end

  def destroy?
    @user == @job.user
  end

 
end
