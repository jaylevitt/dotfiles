require 'rubygems'
require 'wirble'
# require 'what_methods'

load File.dirname(FILE) + '/.railsrc' if $0 == 'irb' && ENV['RAILS_ENV']

IRB.conf[:AUTO_INDENT] = true

Wirble.init
colors = Wirble::Colorize.colors.merge({
    # delimiter colors
    :comma              => :purple,
    :refers             => :blue,

    # container colors (hash and array)
    :open_hash          => :red,
    :close_hash         => :red,
    :open_array         => :red,
    :close_array        => :red,

    # object colors
    :open_object        => :dark_gray,
    :object_class       => :purple,
    :object_addr_prefix => :blue,
    :object_line_prefix => :blue,
    :close_object       => :dark_gray,

    # symbol colors
    :symbol             => :black,
    :symbol_prefix      => :light_gray,

    # string colors
    :open_string        => :blue,
    :string             => :dark_gray,
    :close_string       => :blue,

    # misc colors
    :number             => :black,
    :keyword            => :brown,
    :class              => :red,
    :range              => :blue,
})
Wirble::Colorize.colors = colors
Wirble.colorize

alias q exit

# Easily print methods local to an object's class
class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end

