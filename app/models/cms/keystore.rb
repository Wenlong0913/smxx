class Cms::Keystore < ApplicationRecord
  audited
  belongs_to :site
  validates_presence_of :key, :value
  validates_uniqueness_of :key, scope: [:site_id]

  def self.get(key)
    self.find_by(key: key)
  end

  def self.put(key, value)
    ks = self.find_or_create_by(key: key)
    ks.value = value
    ks.save!
    true
  end

  def self.increment_value_for(key, amount = 1)
    self.incremented_value_for(key, amount)
  end

  def self.decrement_value_for(key, amount = -1)
    self.incremented_value_for(key, amount)
  end

  def self.incremented_value_for(key, amount = 1)
    new_value = nil

    ::Cms::Keystore.transaction do
      ks = self.find_or_create_by(key: key)
      ks.value = ks.value.to_i + amount
      ks.save!
      new_value = self.value_for(key)
    end

    return new_value
  end

  def self.value_for(key)
    self.get(key).try(:value)
  end
end
