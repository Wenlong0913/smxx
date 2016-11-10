class User::Mobile < ApplicationRecord
  self.table_name = 'user_mobiles'
  belongs_to :user

end
