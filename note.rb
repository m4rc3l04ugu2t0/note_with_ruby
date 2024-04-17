# frozen_string_literal: true

require 'securerandom'

# Format notes
class Note
  attr_reader :id

  def initialize(text)
    @id = SecureRandom.uuid
    @text = text
    @date = Time.now
  end

  def to_s
    "Date: #{@date.strftime '%d/%m/%Y %H:%M:%S'}\nNote: #{@text}"
  end

  def text_note(text)
    @text = text
    @date = Time.now
  end
end
