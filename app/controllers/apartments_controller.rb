class ApartmentsController < ApplicationController
    def index 
        apartments = Apartment.all 
        render json: apartments, status: :ok 
    end

    def show 
        apartment = Apartment.find(params[:id])
        render json: apartment, status: :ok 
    end

    def create 
        apartment = Apartment.create(number: params[:number])
        render json: apartment, status: :created 
    end

    def update 
        apartment = Apartment.find(params[:id])
        apartment.update(apartment_params)
        render json: apartment, status: :accepted 
    end

    def destroy 
        apartment = Apartment.find(params[:id])
        apartment.leases.destroy
        apartment.destroy
        render json: apartment, status: :accepted
    end
end
