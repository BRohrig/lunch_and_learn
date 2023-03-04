class Error
  attr_reader :messages, :status

  def initialize(error)
    @messages = find_messages(error)
    @status = find_status[error.class].to_s
  end

  def find_messages(error)
    if error.instance_of?(ActiveModel::Errors)
      error.full_messages
    else
      [error.message]
    end
  end

  def find_status
    {ActiveRecord::StatementInvalid => 404}
  end

end