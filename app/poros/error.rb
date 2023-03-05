# frozen_string_literal: true

class Error
  attr_reader :messages, :status

  def initialize(error)
    @messages = find_messages(error)
    @status = find_status[error.class].to_s
  end

  def find_messages(error)
    error.full_messages
  end

  def find_status
    { ActiveRecord::StatementInvalid => 404 }
  end
end
