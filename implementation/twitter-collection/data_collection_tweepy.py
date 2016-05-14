#!/usr/bin/env python
# -*- coding: utf-8 -*-

import nltk
import sys
from tweepy.streaming import StreamListener
from tweepy import OAuthHandler
from tweepy import Stream
import tweepy
import json
import re
import csv

from twitterpost import TwitterPost

reload(sys)

sys.setdefaultencoding("utf8")



#Variables that contains the user credentials to access Twitter API 

access_token = ""
access_token_secret = ""
consumer_key = ""
consumer_secret = ""



#This is a basic listener that just prints received tweets to stdout.
class StdOutListener(StreamListener):
    def __init__(self, num_users, api=None):
        super(StdOutListener, self).__init__()
        self.output_file_non_matches = open('output_non_matches.txt', 'a')
        self.count = 0
        self.count_total = 0
        self.num_users = num_users
        self.data_to_csv = []
        self.data_to_csv.append(["Id", "UserName", "Text", "Retweets", "Hashtags", "Mentions", "TweetCoordinates", "CreatedAt", "UserLocation", "UserFollowers", "UserFriends"])

        with open("tweets_joao_weyl.csv", 'a') as f:
            wtr = csv.writer(f, delimiter= ',')
            wtr.writerows(self.data_to_csv)

        self.data_to_csv = []

    def on_data(self, data):


		tweet = json.loads(data)
		text = tweet['text']

		post = TwitterPost(tweet)

		register = tweet['created_at'] + '\t' + tweet['user']['screen_name'] + '\t' + text + '\n'

		if True:
			self.data_to_csv.append([
			    post.id_str,
			    post.user.screen_name,
			    post.text,
			    post.retweet_count,
			    post.entities.hashtags,
			    post.entities.user_mentions,
			    post.location_coordinates,
			    post.created_at,
			    post.user.location,
			    post.user.followers_count,
			    post.user.friends_count])

			print register

			with open("tweets_joao_weyl.csv", 'a') as f:
			    wtr = csv.writer(f, delimiter= ',')
			    wtr.writerows(self.data_to_csv)

			self.data_to_csv = []


			self.count += 1
		else:
		    self.output_file_non_matches.write(register)

		self.count_total += 1



		if (self.count_total % 200) == 0:
		    print "Count Total is: %d" % self.count_total
		    print "Count Useful Tweets is: %d" % self.count

		print self.count_total

		return True

    def on_error(self, status):
        print status


if __name__ == '__main__':


	query = ""

	output_filename = 'tweets.csv'

	data_to_csv = []

	data_to_csv.append(["Id", "IdStr", "UserName", "Text", "Retweets", "Hashtags", "Mentions", "TweetBoundingBox", "TweetCoordinates", "TweetPlaceName", "UserLocation", "UserFollowers", "UserFriends", "UserDescription", "CreatedAt"])

	with open(output_filename, 'a') as f:
	    wtr = csv.writer(f, delimiter= ',')
	    wtr.writerows(data_to_csv)

	data_to_csv = []

	auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
	auth.set_access_token(access_token, access_token_secret)

	api = tweepy.API(auth)

	for tweet in tweepy.Cursor(api.search,
		q=query,
		result_type="recent",
		lang="pt",
		count=100).items():
		print str(tweet.created_at) + '\t' + tweet.user.screen_name + '\t' + tweet.text
		print 'coordinates: ', tweet.coordinates
		print 'geo: ', tweet.geo
		print 'place: ', tweet.place
		location_coordinates = None

		text = unicode(tweet.text).encode("utf-8")
		text = text.replace('\n', ' ').replace('\r', '')

		if tweet.place != None:
			print 'boundingbox coords: ', tweet.place.bounding_box.coordinates#['bounding_box']['coordinates']
			print 'place full name: ', tweet.place.full_name
			print 'place type: ', tweet.place.place_type


			coordinates = tweet.place.bounding_box.coordinates


			# If coordinates for latitutde and longitude are the same, get those as the coordinates of the location.
			if len(set([coordinates[0][0][1], coordinates[0][1][1], coordinates[0][2][1], coordinates[0][3][1]])) == 1 and len(set([coordinates[0][0][0], coordinates[0][1][0], coordinates[0][2][0], coordinates[0][3][0]])) == 1:
				#location_coordinates = (coordinates[0][0][1], coordinates[0][0][0])
				location_coordinates = str(coordinates[0][0][1]) + ',' + str(coordinates[0][0][0])
				print 'One location found. Get coordinates for that: ', location_coordinates

			# Else, take the mean of those as coordinates of a location (centroid).
			else:
				
				mean_lat = (coordinates[0][0][1] + coordinates[0][2][1]) / 2
				mean_lon = (coordinates[0][0][0] + coordinates[0][1][0]) / 2

				#location_coordinates = (mean_lat, mean_lon)
				location_coordinates = str(mean_lat) + ',' + str(mean_lon)

				print 'boundingbox found. Get mean of coordinates: ', location_coordinates

		print '-----------------------------------------------------------------------------------------------------------------------------'
		print '\n'


		data_to_csv.append([
			tweet.id,
			tweet.id_str,
			tweet.user.screen_name,
			text,
			tweet.retweet_count,
			tweet.entities['hashtags'],
			tweet.entities['user_mentions'],
			tweet.place.bounding_box.coordinates if tweet.place != None else None,
			location_coordinates,
			tweet.place.full_name if tweet.place != None else None,
			tweet.user.location,
			tweet.user.followers_count,
			tweet.user.friends_count,
			tweet.user.description,
			tweet.created_at])

		with open(output_filename, 'a') as f:
			wtr = csv.writer(f, delimiter= ',')
			wtr.writerows(data_to_csv)

		data_to_csv = []
