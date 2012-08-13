class Task < ActiveRecord::Base
  attr_accessible :name, :content, :status, :user_id  
  belongs_to :user
  
  validates :content, presence: true
  validates :user_id, presence: true

  default_scope order: 'tasks.created_at DESC'

end
