class Notification < ApplicationRecord
  audited

  belongs_to :actor, class_name: 'User'
  belongs_to :user, class_name: 'User'
  belongs_to :target, polymorphic: true, optional: true
  belongs_to :second_target, polymorphic: true, optional: true
  # belongs_to :third_target, polymorphic: true, optional: true

  scope :unread, -> { where(read_at: nil) }

  def read?
    self.read_at.present?
  end

  def actor_name
    return '' if self.actor.blank?
    self.actor.nickname
  end

  def actor_avatar_url
    self.actor.display_headshot
  end

  def self.notice(user_id, actor_id, type, content, target, target_name, target_url=nil, second_target=nil, second_target_name=nil, second_target_url=nil)
    create({
      user_id: user_id,
      actor_id: actor_id,
      notify_type: type,
      content: content,
      target: target,
      target_name: target_name,
      target_url: target_url,
      second_target: second_target,
      second_target_name: second_target_name,
      second_target_url: second_target_url
    })
  end
end
