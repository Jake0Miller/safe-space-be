class Api::V1::CentersController < ApplicationController
  def create
    # Center.create!(center_params)
    binding.pry
    Geocoder.new(params[:address]).coords
  end

  private

  def center_params
    params.permit(:address, :phone, :website, :email)
  end
end
