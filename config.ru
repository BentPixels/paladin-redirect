require "rack"

class App
  def self.call(env)
    return ['200', {}, [env.inspect]]

    if env["HOST"].include?("bentpixels")
      host = env["HOST"].sub('bentpixels', 'paladinsoftware')
      url = "#{host}/#{env["REQUEST_URI"]}"
      ['200', { 'Location' => url }, []]
    else
      ['200', { }, ["Must be hosted on bentpixels domain"] ]
    end
  end
end

run App
