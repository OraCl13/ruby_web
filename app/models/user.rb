class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :tickets
end

# In production, :host should be set to the actual host of your application.
#  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
# * Required for all applications. *
#  2. Ensure you have defined root_url to *something* in your config/routes.rb.
# For example:
#  root to: "home#index"
#
# * Not required for API-only Applications *
#
#   3. Ensure you have flash messages in app/views/layouts/application.html.erb.
#    For example:
#     <p class="notice"><%= notice %></p>
#        <p class="alert"><%= alert %></p>
