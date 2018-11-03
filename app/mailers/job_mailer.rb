class JobMailer < ApplicationMailer

    def job_posted_email
        @user = params[:user]
        mail(to: @user.email, subject: 'You have posted a job on TradeUp')
      end
end
