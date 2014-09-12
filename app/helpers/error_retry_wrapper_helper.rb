module ErrorRetryWrapperHelper

  def self.run_until_no_error(&block)
    retry_time = 0
    stop_loop = false
    loop do
      begin
        block.call
        stop_loop = true
      rescue Exception => e
        retry_time = retry_time + 1
        puts "Retry time #{retry_time} " + e.message
        puts e.backtrace
        stop_loop = false
      end
      break if stop_loop or retry_time >30
    end
  end
end
