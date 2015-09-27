class Provider < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => [:slugged]
  validates_presence_of :name, uniqueness: true

  def should_generate_new_friendly_id?
    !slug? || name_changed?
  end

  def to_s
    name
  end
end
