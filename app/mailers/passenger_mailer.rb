class PassengerMailer < ApplicationMailer
  def after_booking_email
    @passenger = params[:passenger]
    @booking = params[:booking]
    email_with_name = %("#{@passenger.name}" <#{@passenger.email}>)
    mail(to: email_with_name, subject: 'Thanks for booking!')
  end
end