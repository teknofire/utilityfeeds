class Provider < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => [:slugged]
  validates_presence_of :name, uniqueness: true

  has_many :provider_services
  has_many :services, through: :provider_services

  accepts_nested_attributes_for :services

  def should_generate_new_friendly_id?
    !slug? || name_changed?
  end

  def to_s
    name
  end
end
