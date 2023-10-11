class DeviceInfosController < ApplicationController
  before_action :print_value 
  
  # skip_callback(:create, :before, :print_value)
  # set_callback(:create, :before, :print_value)
  def create
    device = DeviceInfo.create(user_id: params[:user_id], device_type: params[:device_type], token: params[:token])
    render json: device, status: 200
  end

  private
  def print_value
    puts "Checking callback"
  end
end
