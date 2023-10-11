class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :created_at, :auth_token
  # def token_type 
  #   "Bearer"
  # end
  attribute :created_date do |user|
    user.created_at && user.created_at.strftime('%m/%d/%Y')
  end
end
