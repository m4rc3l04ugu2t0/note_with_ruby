# frozen_string_literal: true

require_relative './database'

# manager database
class Manager
  def initialize
    @database = Database.new
  end

  def store(note)
    @database.store note
  end

  def show_all
    entries = @database.all_notes

    puts 'No Entries Found'.center 50, '-' if entries.empty?

    entries.each_with_index do |item, index|
      puts (index + 1).to_s.center 50, '-'
      puts item
      puts ''.center 50, '-'
    end
  end

  def fetch_note(index)
    entries = @database.all_notes
    entries.fetch index, false
  end

  def all_notes
    @database.all_notes
  end

  def delete(note)
    @database.delete note
  end
end
