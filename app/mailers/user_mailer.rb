# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def register_confirmation(user)
    @user = user
    mail(to: user.email, subject: 'Registered', from: ENV['SENDMAIL_USERNAME'])
  end
end
