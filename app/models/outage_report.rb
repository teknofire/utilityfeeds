class OutageReport < ActiveRecord::Base
  belongs_to :service
  belongs_to :provider
end
