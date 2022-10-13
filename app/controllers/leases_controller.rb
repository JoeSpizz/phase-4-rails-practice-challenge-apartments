class LeasesController < ApplicationController
    def create 
        lease = Lease.create(number: params[:number])
        render json: lease, status: :created 
    end


    def destroy 
        lease = Lease.find(params[:id])
        lease.leases.destroy
        lease.destroy
        render json: lease, status: :accepted
    end
end
