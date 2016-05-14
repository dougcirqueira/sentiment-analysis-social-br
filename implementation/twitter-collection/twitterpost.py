# -*- coding: utf-8 -*-

import re
from bs4 import BeautifulSoup

from twitterplace import TwitterPlace
from twitteruser import TwitterUser


class TwitterPost(object):
	"""This class represents a Twitter post."""
	def __init__(self, tweet):

		self.created_at = tweet["created_at"]
		self.id_str = tweet["id_str"]

		self.entities = Entities(tweet["entities"])

		self.external_sources = {"instagram": False, "foursquare": False, "swarm": False, "path": False}
		for url_data in self.entities.urls:
			match_external_sources = re.findall('instagram|swarmapp|foursquare|path', url_data['expanded_url'], re.I)

			if match_external_sources != []:
				self.external_sources[match_external_sources[0]] = True

		self.in_reply_to_user_id_str = tweet["in_reply_to_user_id_str"]
		self.contributors = tweet["contributors"]
		self.text = tweet["text"]
		self.retweet_count = tweet["retweet_count"]
		self.in_reply_to_status_id_str = tweet["in_reply_to_status_id_str"]
		self.id = tweet["id"]
		self.in_reply_to_user_id = tweet["in_reply_to_user_id"]

		# Place
		# ISSUES:
		# 1 - Sometimes location checkin coordinates is not where the location really is.
		# 2 - Sometimes a specific name, a city name or country.
		# 3 - Match location names with coordinates?
		# 4 - Check if location is within bbox of each city? (Belem in first case)
		if tweet["place"] is not None:
			self.place = TwitterPlace(tweet["place"])

			coordinates = self.place.bounding_box["coordinates"]

			# If coordinates for latitutde and longitude are the same, get those as the coordinates of the location.
			if len(set([coordinates[0][0][1], coordinates[0][1][1], coordinates[0][2][1], coordinates[0][3][1]])) == 1 and len(set([coordinates[0][0][0], coordinates[0][1][0], coordinates[0][2][0], coordinates[0][3][0]])) == 1:
				self.location_coordinates = (coordinates[0][0][1], coordinates[0][0][0])

			# Else, take the mean of those as coordinates of a location (centroid).
			else:

				mean_lat = (coordinates[0][0][1] + coordinates[0][2][1]) / 2
				mean_lon = (coordinates[0][0][0] + coordinates[0][1][0]) / 2

				self.location_coordinates = (mean_lat, mean_lon)


		# User
		if tweet["user"] != None:
			self.user = TwitterUser(tweet["user"])
			

		self.in_reply_to_screen_name = tweet["in_reply_to_screen_name"]

		# Treat source field
		self.source = tweet["source"]
		html = BeautifulSoup(self.source, "lxml")
		tag = html.findAll("a")[0]
		self.source = tag.contents[0]


class Entities(object):
	"""This class represents a Twitter post."""
	def __init__(self, entities):
		self.urls = entities["urls"] if "urls" in entities.keys() else []
		self.hashtags = entities["hashtags"] if "hashtags" in entities.keys() else []
		self.user_mentions = entities["user_mentions"] if "user_mentions" in entities.keys() else []

