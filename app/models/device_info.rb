class DeviceInfo < ApplicationRecord
  enum :device_type, [:android, :ios]
    belongs_to :user
    delegate :email,to: :user
    def self.send_notification(tokens, payload, device_type='android')
      messenger = PushMessenger::Gcm.new
      begin
        messenger.deliver("#{device_type}_app", tokens, payload)
      rescue Exception => error
        Rails.logger.debug error
      end
    end
end
