require 'framework/distance_calculator'
require 'framework/calcualte_fare'

class BookingsController < ApplicationController
  include 'distance'
  include 'fare'

  before_action :authenticate_user!
  before_action :check_active_bookings, only: :new

  def new
    @taxi_types = TaxiType.all
    @driver = nil
    render :partial => 'form'
  end

  def create
    source = params[:source_location]
    destination = params[:destination_location]
    taxi_type = TaxiType.find(params[:taxi_type])

    if @error.nil?
      distance = calculate_distance(source.split(','), destination.split(',')).round(2)
      taxi_color = taxi_type.color == 'pink'? 'pink' : nil 
      fare = calculate_fare(taxi_color)	
      if !taxi_color.nil?
        @driver = Driver.get_pink_taxi(source, taxi_color)
      else
      	@driver = Driver.get_driver(source)
      end

      if @driver.nil?
        @error = 'Sorry. There are No taxies available for the given source or destination.'
      else
	@booking = Booking.new(params[:booking])
	@booking.price = total
	@booking.user = params[:user]
	@booking.status = 1
        
	if @booking.save!
          @driver.available = false #The taxi won't be available until he finishes his current ride
          session[:current_booking] = @booking.id
	  flash[:message] = 'Found a taxi for you! have a safe journey'
	  redirect_to :action => 'login', :controller => 'user'
        else
          @error = @driver.errors.full_messages.fist
        end
      end
    end

end

  def update

    @booking = Booking.find(session[:current_booking])
    if @booking.update!(booking_params)
      distance = calculate_distance(params[:booking][:source].split(','), params[:booking][:destination].split(','))
      total = calculate_fare(distance, @booking.taxi_type)
      puts total
      @booking.distance = distance
      @booking.price = total
      @booking.save!
    else
      @error = @booking.errors.full_messages.first
    end
	flash[:message] = 'The taxi booking is updated successfully'
  end

  def confirm
    @booking = Booking.find(session[:current_booking])
    @booking.status = 2    #Booking is confirmed
    @booking.save!
    render :action => 'save_card_info', :controller => 'user'
  end

  def current
    @booking = Booking.find(session[:current_booking])
    @driver = @booking.driver
    @taxi_type = @booking.taxi_type
  end

  def cancel
    @booking = Booking.find(session[:current_booking])
    @booking.status = 4
    @booking.save!
    session[:current_booking] = nil
	flash[:message] = 'Booking is canceled'
  end

  def complete
    @booking = Booking.find(session[:current_booking])
    @booking.update(status: 3)
    session[:current_booking] = nil
    flash[:message] = 'The journey is completed !!! Thank You!!'
  end

  private

  def check_active_bookings
	redirect_to :action => 'current' if session[:current_booking].nil?
	flash[:message] = 'The booking is available your journey'
 end

end
