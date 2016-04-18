require "rack"

class App
  def self.call(env)
    host = env["HOST"].sub('bentpixels', 'paladinsoftware')
    url = "#{host}/#{env["REQUEST_URI"]}"
    ['200', { 'Location' => url }, []]
  end
end

run App
