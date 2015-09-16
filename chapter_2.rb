def basic_thread_example
  100.times do
    Thread.new { sleep }
  end

  puts Process.pid
  sleep
end

# top -l1 -pid PID_HERE -stats pid,th

# Processes: 271 total, 3 running, 3 stuck, 265 sleeping, 1283 threads 
# 2015/09/16 00:00:22
# Load Avg: 2.04, 1.97, 1.92 
# CPU usage: 7.27% user, 41.81% sys, 50.90% idle 
# SharedLibs: 12M resident, 8740K data, 0B linkedit.
# MemRegions: 69996 total, 3382M resident, 61M private, 952M shared.
# PhysMem: 8043M used (1785M wired), 7759M unused.
# VM: 678G vsize, 1067M framework vsize, 16161590(0) swapins, 17484797(0) swapouts.
# Networks: packets: 152118590/63G in, 139212928/41G out.
# Disks: 33492155/2509G read, 15825397/368G written.
#
# PID    #TH
# 29891  102

# Non Determinsistic Context Switching
#
# Deterministic:
# In mathematics and physics, a deterministic system is a system in which no randomness is involved
# in the development of future states of the system. A deterministic model will thus always produce
# the same output from a given starting condition or initial state

# TIP:
# Its good to avoid lazy instansiation when working with threads.
#
# WORDS:
# An atomic operation is one which cannot be interrupted before it's complete

# requiring thread, just loads the Queue library
puts defined? Queue
require "thread"
puts defined? Queue
