import ConfigParser
from TwitterAPI import TwitterAPI
import sys
#import time

class TwitterUtil(object):

	config_file = "twitter.cfg"

	@staticmethod
	def get_twitter():
		""" Read the config_file and construct an instance of TwitterAPI.
		Args:
		  config_file ... A config file in ConfigParser format with Twitter credentials
		Returns:
		  An instance of TwitterAPI.
		"""

		config = ConfigParser.ConfigParser()
		config.read(TwitterUtil.config_file)
		twitter = TwitterAPI(
		               config.get('twitter', 'consumer_key'),
		               config.get('twitter', 'consumer_secret'),
		               config.get('twitter', 'access_token'),
		               config.get('twitter', 'access_token_secret'))

		print('Established Twitter connection.')

		return twitter

	@staticmethod
	def robust_request(twitter, resource, params, max_tries=5):
	    """ If a Twitter request fails, sleep for 15 minutes.
	    Do this at most max_tries times before quitting.
	    Args:
	      twitter .... A TwitterAPI object.
	      resource ... A resource string to request.
	      params ..... A parameter dictionary for the request.
	      max_tries .. The maximum number of tries to attempt.
	    Returns:
	      A TwitterResponse object, or None if failed.
	    """
	    for i in range(max_tries):
	        request = twitter.request(resource, params)
	        if request.status_code == 200:
	            return request
	        else:
	            print >> sys.stderr, 'Got error:', request.text, '\nsleeping for 15 minutes.'
	            sys.stderr.flush()
	            time.sleep(61 * 15)