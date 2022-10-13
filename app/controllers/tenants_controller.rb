class TenantsController < ApplicationController
    def index 
        tenants = Tenant.all 
        render json: tenants, status: :ok 
    end

    def show 
        tenant = Tenant.find(params[:id])
        render json: tenant, status: :ok 
    end

    def create 
        tenant = Tenant.create(number: params[:number])
        render json: tenant, status: :created 
    end

    def update 
        tenant = Tenant.find(tenant_params)
        tenant.update(tenant_params)
        render json: tenant, status: :accepted 
    end

    def destroy 
        tenant = Tenant.find(params[:id])
        tenant.leases.destroy
        tenant.destroy
        render json: tenant, status: :accepted
    end

    private 
    def tenant_params
        params.permit(:name, :age)
end
