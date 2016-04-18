require "rack"

class App
  def self.call(env)
    uri = env["REQUEST_URI"]


    if uri.include?("bentpixels")

      ['301', { 'Location' => uri.sub("bentpixels", "paladinsoftware") }, []]
    else
      ['200', { }, ["Must be hosted on bentpixels domain"] ]
    end
  end
end

run App


##
# App to handle change of domain and ssl
# if the url contains bentpixels, it substitutes it with paladinsoftware
# so it should work for any subdomain, as long as that subdomain is
# a) removed from original heroku app (drm.bentpixels.com app)
# b) added to bp-redirect heroku app
# c) dns record set for ssl
# d) you wait for a while and beg to whomever god you have
##
