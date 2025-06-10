class TodoList < ApplicationRecord
  belongs_to :user
  validates :title, presence: true

  has_many :tasks, dependent: :destroy

  validate :debug_callback

  def debug_callback
    Rails.logger.info "Validating TodoList: #{self.inspect}"
    # Check if anything calls email on todo_list
    if respond_to?(:email)
      Rails.logger.info "TodoList has email method"
    else
      Rails.logger.info "TodoList has NO email method"
    end
  end
end