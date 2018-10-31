class ChargesController < ApplicationController
    def new
    end

    def create
        @job = Job.find(params[:job_id])
    
        customer = Stripe::Customer.create(
            :email => params[:stripeEmail],
            :source  => params[:stripeToken]
        )
        
        charge = Stripe::Charge.create(
            :customer    => customer.id,
            :amount      => @job.price,
            :description => @job.title,
            :currency    => 'aud'
        )
        
        current_user.jobs << @job
        
        redirect_to @job
        
        rescue Stripe::CardError => e
            flash[:error] = e.message
            redirect_to new_charge_path
        end
end
