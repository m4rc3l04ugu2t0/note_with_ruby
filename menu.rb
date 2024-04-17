# frozen_string_literal: true

require_relative './manager'
require_relative './note'

# menu apllication
class Menu
  def initialize
    @manager = Manager.new
  end

  def enter_a_number
    index = gets.chomp.to_i
    return puts ' Invalid input '.center 50, '*' if index < 1

    index
  end

  def add
    print 'Note: '
    text = gets.chomp
    note = Note.new text
    @manager.store note
    puts ' Note created '.center 50, '#'
  end

  def show_all
    @manager.show_all
  end

  def edit
    @manager.show_all
    print 'Enter Number to Edit: '
    index = gets.chomp.to_i
    return puts 'Invalid input' if index < 1

    edited_note index
  end

  def edited_note(index)
    note = @manager.fetch_note index - 1
    return puts ' Invalid input '.center 50, '*' unless note

    print 'Note: '
    text = gets.chomp.to_s
    note.text_note text
    @manager.store note
    puts ' Entry Updated '.center 50, '*'
  end

  def delete
    @manager.show_all
    print 'Enter Number to Delete: '
    index = gets.chomp.to_i
    return puts 'Invalid input' if index < 1

    deleted index
  end

  def deleted(index)
    note = @manager.fetch_note index - 1
    return puts 'Invalid input' unless note

    @manager.delete note
    puts ' Entry Deleted '.center 50, '*'
  end
end
