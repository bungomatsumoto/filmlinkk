if Rails.env.test?
  ActionMailer::Base.delivery_method = :test
elsif Rails.env.development?
  ActionMailer::Base.delivery_method = :letter_opener_web
  ActionMailer::Base.default_url_options = { host: 'localhost', port: 3000 }
else
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings  = {
    # :address => 'smtp.sendgrid.net',
    # :port => '587',
    # :domain => 'heroku.com',
    # :authentication => :plain,
    # :user_name => ENV["SENDGRID_USERNAME"],
    # :password => ENV["SENDGRID_PASSWORD"]
    user_name: ENV["SENDGRID_USERNAME"],
    password: ENV["SENDGRID_PASSWORD"],
    address: "smtp.sendgrid.net",
    domain: 'heroku.com',
    port: 587,
    authentication: 'plain',
    enable_starttls_auto: true
  }
end
