class Api::V1::CentersController < ApplicationController
  def create
    if fields_empty? || fields_missing?
      render json: {Error: 'You have missing fields!'}, status: 400
    else
      coords = Geocoder.new(params[:address]).coords
      center = Center.new(center_params.merge(coords))
      if center.save
        render json: center, status: 201
      else
        render json: {error: center.errors.full_messages.join('. ')}, status: 400
      end
    end
  end

  def index
    render json: Center.all
  end

  private

  def center_params
    params.require(:center).permit(:name, :address, :phone, :website, :email)
  end

  def fields_empty?
    params[:address] == "" || params[:email] == "" || params[:phone] == "" || params[:website] == ""
  end

  def fields_missing?
    center_params.keys.length < 4
  end
end
