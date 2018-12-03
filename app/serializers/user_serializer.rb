class UserSerializer < ActiveModel::Serializer
  attributes :username, :chip_count, :api_key
end
