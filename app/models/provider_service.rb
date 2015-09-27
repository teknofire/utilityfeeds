class ProviderService < ActiveRecord::Base
  belongs_to :service
  belongs_to :provider
end
