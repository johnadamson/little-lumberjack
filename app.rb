require 'pretty_request'

%w[ * ].each do |route|

  get route do
    write_to_log(PrettyRequest.new(request).print)
    200
  end

  post route do
    write_to_log(PrettyRequest.new(request).print)
    200
  end

  put route do
    write_to_log(PrettyRequest.new(request).print)
    200
  end

  delete route do
    write_to_log(PrettyRequest.new(request).print)
    200
  end

end

def write_to_log(string)
  File.open('log/request.log', 'a') do |file|
    file << string
  end
end
