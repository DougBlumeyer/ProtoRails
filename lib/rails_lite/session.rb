require 'json'
require 'webrick'

class Session

  def initialize(req)
    cookie = req.cookies.find { |c| c.name == '_integrated_active_record_lite_and_rails_lite_app' }
    @data = cookie ? JSON.parse(cookie.value) : {}
  end

  def [](key)
    @data[key]
  end

  def []=(key, val)
    @data[key] = val
  end

  def store_session(res)
    res.cookies << WEBrick::Cookie.new('_integrated_active_record_lite_and_rails_lite_app', @data.to_json)
  end
end
