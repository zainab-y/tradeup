class JobMailer < ApplicationMailer

    # when the job is created, the confirmation email sent to the creator
    def job_posted_email
        @user = params[:user]
        email_with_name = %("#{@user.username}" <#{@user.email}>)
        mail(to: email_with_name, subject: 'Your job posting was successful!')
    end

    def job_taken_email
        @user = params[:user]
        email_with_name = %("#{@user.username}" <#{@user.email}>)
        mail(to: email_with_name, subject: 'Your job was taken')
    end

    def payment_reminder_email
        @user = params[:user]
        email_with_name = %("#{@user.username}" <#{@user.email}>)
        mail(to: email_with_name, subject: 'Your job is complete. Please make the payment')
    end

    # when the job is paid, the email sent to the payer
    def payment_received_email
        @user = params[:user]
        email_with_name = %("#{@user.username}" <#{@user.email}>)
        mail(to: email_with_name, subject: 'You are paid!')
    end

end
