# == Schema Information
#
# Table name: article_users
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  article_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ArticleUser < ApplicationRecord
  audited
  belongs_to :user
  belongs_to :article
end
