module UUID
  extend ActiveSupport::Concern

  included do
    before_create :generate_uuid
  end

  private

  def generate_uuid
    self.uuid = SecureRandom.hex.delete('-')
  end
end
