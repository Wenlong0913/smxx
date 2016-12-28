class Order < ApplicationRecord
  audited
  belongs_to :user
  belongs_to :site
  before_create :generate_code

  validates_uniqueness_of :code

  private

  def generate_code
    time = Time.now.strftime('%Y%m%d%H%M%S')
    max_length = 30
    time_length = time.length
    site_length = site.id.to_s.length
    rnd_length = max_length - time_length - site_length - 1
    fail "run out of order code!!!" if rnd_length < 1
    loop do
      r = SecureRandom.random_number(10**rnd_length)
      self.code = "#{time}#{r.to_s.ljust(rnd_length, '0')}0#{site.id}"
      break unless self.class.where(code: self.code).exists?
    end
  end
end
