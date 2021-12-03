class UserMailer < ApplicationMailer
    default from: 'notification@OlaCab.com'

    def welcome_email
        @user = params[:user]
        mail(to: @user.email, subject: 'Welcome to Ola Cab Booking App')
    end
end
