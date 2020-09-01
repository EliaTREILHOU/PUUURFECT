
class UserMailer < ApplicationMailer
    default from: 'oranechaper.pro@gmail.com'

  
    def welcome_email(user)
      @user = user
      mail(
      to: @user.email,
      delivery_method_options: { api_key: 'MJ_APIKEY_PUBLIC', secret_key: 'MJ_APIKEY_PRIVATE' }
    )
    end
end
