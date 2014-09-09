class BanReasonChange 
  attr_reader :advertisment, :ban_reason

  def initialize(advertisment, ban_reason)
    @advertisment = advertisment
    @ban_reason = ban_reason
  end
end
