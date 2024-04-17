# frozen_string_literal: true

require 'io/console'
require_relative './menu'

# App
class App
  attr_accessor :run

  def initialize
    @menu = Menu.new
    @run = true
    @choice = ''
  end

  def app_run
    while run
      show_menu
      @choice = gets.chomp
      options?
    end
  end

  def show_menu
    puts ' Simple note application '.center(50, '#')
    puts 'a) add'
    puts 'b) edit'
    puts 'c) delete'
    puts 'q) quit'
    print 'Select: '
  end

  def options?
    $stdout.clear_screen
    case @choice
    when 'a' then @menu.add
    when 'b' then @menu.edit
    when 'c' then @menu.delete
    when 'd' then @menu.show_all
    when 'e' then show_menu
    when 'q' then @run = false
    end
  end
end
