
# First we spawn a new thread that is going to sleep for 3
#
# then we join that spawned thread to the current thread,
# meaning we will wait the 3 seconds the spawned thread is sleeping
# for before exiting this method.
def simple_join
  thread = Thread.new { sleep 3 }
  thread.join
end

# Thread.fork is the same as Thread.new
#
# when the thread with the exception is joined to the current thread,
# the exception is re-raises.
# If the thread was not joined, it would have failed without effecting
# the current thread.
def thread_with_exception
  thread = Thread.fork { raise StandardError.new("error in the spawned thread!") }
  begin
    thread.join
  rescue => e
    puts e
  end
end

# I can get the return value of the thread with #value
def thread_with_value
  thread = Thread.new { 1738 }
  puts thread.value
end

# value won't work with if the spawned thread raised an error
def thread_with_value_with_exception
  thread = Thread.new { raise StandardError.new("what's the value?") }

  begin
    thread.value
  rescue => e
    puts e
  end
end

# this produces:
# run
# sleep
# false
def thread_status
  thread = Thread.new { sleep 3 }
  puts thread.status
  sleep 1
  puts thread.status
  sleep 2
  puts thread.status
end

def thread_status_with_exception
  thread = Thread.new { raise StandardError }
  sleep 0.5
  puts thread.status.class
end

def nested_the_thread_constant_knows_its_current_thread
  puts Thread.current.object_id
  thread = Thread.new { Thread.current.object_id }
  puts thread.value
end
