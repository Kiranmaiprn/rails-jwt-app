class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  has_many :device_infos, dependent: :destroy
  has_many :posts, dependent: :destroy
  before_save :check_user_name
  validate :validate_address

  validates :email, uniqueness: true
  validates :name, :email, :address, presence: true
  def send_notification_to_user
    payload = {payload: { title: "alert" , description: "Checking description" } }
    android_condition = "device_type = 'android' and user_id = #{id.to_i}"
    # ios_condition = "device_type = 'ios' and user_id = #{id.to_i}"
    send_notification(payload, android_condition, 'android')
    # send_notification(payload, ios_condition, 'ios')
    puts "calling send_notification_to_user"
  end

  def send_notification(payload, condition, device_type)
    tokens = DeviceInfo.where(condition).pluck(:token).compact
      DeviceInfo.send_notification(tokens, payload, device_type)
      puts "calling send_notification"
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  devise :database_authenticatable, :registerable, :validatable, 
         :jwt_authenticatable, jwt_revocation_strategy: self

        def jwt_payload
           super
        end

        def on_jwt_dispatch(token, payload)
          @auth_token = token
        end
        def auth_token
          @auth_token
        end

        def check_user_name
          self.name = self.email if name.nil?
        end

        def validate_address
          return if address.nil?
           
          # unless test
            
          # end
        end
    def say_hello
      "Hello World!"
    end

    def has_vowels?(str)
      !!(str =~ /[aeiou]+/i)
    end
    
end

