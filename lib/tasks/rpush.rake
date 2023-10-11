namespace :rpush do
  desc 'Create Rpush Android app'
  task android_app: [:environment] do
    Rpush::Gcm::App.create(name: 'android_app', connections: 1, environment: Rails.env, type: "Rpush::Client::ActiveRecord::Gcm::App", auth_key: "AAAAEGB2Lkw:APA91bHfo3H6Xg8iGDxYR_n3afgXDgVgkIZ9SNLFj6GBbSj2snCx_Ti52EF_yHuyveht8dtL5ifyjDsoPfP5RKt4pWk3YbaoPYZUJ-Ilcpnqb925HiTMzm4MRwYmHMbC7W_MgT3ZSLCx")
    puts "Rpush Android app created successfully"
  end

  desc 'Create Rpush Ios app'
  task ios_app: [:environment] do
    Rpush::Gcm::App.create(name: 'ios_app', connections: 1,  environment: Rails.env, type: "Rpush::Client::ActiveRecord::Gcm::App", auth_key: AUTH_KEY, certificate: File.read("config/file_name.p8"))
    puts "Rpush Ios app created successfully"
  end
end
