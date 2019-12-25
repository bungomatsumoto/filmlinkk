if Rails.env.test?
  ActionMailer::Base.delivery_method = :test
else
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings  = {
    :address => 'smtp.sendgrid.net',
    :port => '587',
    :domain => 'heroku.com',
    :authentication => :plain,
    :user_name => ENV["SENDGRID_USER"],
    :password => ENV["SENDGRID_PASS"]
  }
end
