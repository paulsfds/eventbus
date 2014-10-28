# Constraints:
# 1. event names are arbitrary strings
# 2. event data is always a hash
# 3. calling a proc is just: proc.call(data)

class EventBus
  attr_accessor :events

  def initialize
    @events = {}
  end

  def emit(event_name, data)
    event = events[event_name]

    unless event.nil?
      events[event_name].each do |event|
        event.call(data)
      end
    end
  end

  def subscribe(event_name, callback)
    event = events[event_name]

    event = [] if events[event_name].nil?

    event << callback

    events[event_name] = event
  end
end

#----------------------------------------

emitter = EventBus.new

error_callback = proc { |data| puts "Error 1. #{data[:message]}" }
error_callback2 = proc { |data| puts "Error 2. #{data[:message]}" }
success_callback = proc { |data| puts "SUCCESS! #{data[:message]}" }

emitter.emit "error", { message: "Error one." }

emitter.subscribe "error", error_callback
emitter.emit "error", { message: "Second error." }

emitter.subscribe "error", error_callback2
emitter.emit "error", { message: "Yet another error." }

emitter.subscribe "success", success_callback
emitter.emit "success", { message: "Great success!" }

# Expected output:

# Error 1. Second error.
# Error 1. Yet another error.
# Error 2. Yet another error.
# SUCCESS! Great success!

