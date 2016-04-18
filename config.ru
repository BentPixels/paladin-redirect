require "rack"

class App
  def self.call(env)
    uri = env["REQUEST_URI"]

    if uri.include?("bentpixels")
      ['200', { 'Location' => uri.sub("bentpixels", "paladinsoftware") }, []]
    else
      ['200', { }, ["Must be hosted on bentpixels domain"] ]
    end
  end
end

run App
