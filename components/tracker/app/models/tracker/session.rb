module Tracker
  class Session < ApplicationRecord
    has_many :visits
  end
end
