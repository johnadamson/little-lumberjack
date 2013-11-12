class PrettyRequest
  attr_reader :request, :output

  def initialize(request)
    @request = request
  end

  def print
    write_date
    write_headers
    write_body
    output.string
  end

  private

  def write_date
    output << "\n#{Time.now}\n"
  end

  def write_headers
    output << "== HEADERS ==\n"
    keys_without_rack_and_sinatra.each do |key|
      output << "#{key}: #{request.env[key]}\n"
    end
  end

  def keys_without_rack_and_sinatra
    request.env.keys.reject do |key|
      key =~ /\Arack/ or key =~ /\Asinatra/
    end.sort
  end

  def write_body
    output << "== BODY ==\n"
    write_body_size
    write_form_data
    write_raw_body
  end

  def write_form_data
    output << "FORM DATA:\n"
    request.params.keys.sort.each do |key|
      value = request.params[key]
      output << "  #{key}: #{value}\n"
    end
  end

  def write_body_size
    output << "BODY LENGTH: #{request.body.length}\n"
  end

  def write_raw_body
    output << "RAW BODY:\n#{request.body.read}\n"
  end

  def output
    @output ||= StringIO.new
  end

end
