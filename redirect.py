import webapp2
import logging

class Redirector(webapp2.RequestHandler):
  """Redirect with trailing slash"""

  def get(self, *args, **kwargs):
    """Redirect all traffic with trailing slash"""
    logging.info("redirecting to %s/" % self.request.url)
    self.redirect(self.request.url + '/', permanent=True)

  def post(self, *args, **kwargs):
    self.get(args, kwargs)

app = webapp2.WSGIApplication([
  ('/.*', Redirector),
])

