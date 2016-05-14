# -*- coding: utf-8 -*-

import urllib
import json
import pandas
import csv
import re
import sys
import os
import time
import xml.etree.ElementTree as ET

reload(sys)
sys.setdefaultencoding("utf8")

log = open('translations/twitter_data_NEGATIVE_TRANSLATIONS_log.txt', 'a')

data = pandas.read_csv('twitter_data_NEGATIVE.csv')

text = ''

request_url = 'https://translate.yandex.net/api/v1.5/tr.json/translate?key=&lang=pt-en&format=plain&options=0'

data_to_output = []

indices_saved = []

filename = 'translations/twitter_data_NEGATIVE_TRANSLATIONS.csv'

sum_characters = 0
current_comments_translated = 0
total_comments_translated = 0

'''
with open(filename, 'a') as fp:
	csv_writer = csv.writer(fp, delimiter=',')
	csv_writer.writerows([['IdComment', 'Message', 'MessageTranslated', 'Success']])
'''

for index, row in data.iterrows():
	print 'Index: ', index
	old_text = text
	raw_text = str(row['Message']).strip().replace('\n', ' ').replace('\r', '').replace('#', '')
	current_text = '&text=' + raw_text
	text += current_text

	sum_characters += len(raw_text)

	if len(request_url % text) > 10000:
		data = json.load(urllib.urlopen(request_url % old_text))

		if data['code'] == 200:
			text_list = data['text']

			for idx, t in enumerate(text_list):
				
				data_to_output.append([indices_saved[idx]['IdComment'], indices_saved[idx]['Message'], t, 1])

			with open(filename, 'a') as fp:
				csv_writer = csv.writer(fp, delimiter=',')
				csv_writer.writerows(data_to_output)

			data_to_output = []
			old_text = ''
			text = ''
			indices_saved = []

			total_comments_translated += current_comments_translated
		
		else:
			print 'ERROR'
			sys.exit()

		

		# Translating current text
		data = json.load(urllib.urlopen(request_url % current_text))
		if data['code'] == 200:
			text_list = data['text'][0]

			data_to_output.append([row['IdComment'], row['Message'], text_list, 1])

			with open(filename, 'a') as fp:
				csv_writer = csv.writer(fp, delimiter=',')
				csv_writer.writerows(data_to_output)

			data_to_output = []

			total_comments_translated += 1

		else:
			print 'ERROR'
			sys.exit()

		message1 = '%d current comments translated' % current_comments_translated
		message2 = '%d total comments translated' % total_comments_translated
		message3 = 'Sum Characters: %d' % sum_characters

		print message1
		print message2
		print message3
		print 'Sleeping for 5s...'
		print '\n'

		log.write(message1 + '\n')
		log.write(message2 + '\n')
		log.write(message3 + '\n')
		log.write('\n')

		current_comments_translated = 0

		time.sleep(5)

	else:
		#indices_saved.append( {'IdComment': row['Index'], 'Message': row['Message']} )
		indices_saved.append( {'IdComment': row['IdComment'], 'Message': row['Message']} )

		current_comments_translated += 1

		if (current_comments_translated % 100) == 0:
			print 'Current Number of Comments to be translated > : %d' % current_comments_translated
			print 'Sum Characters: %d' % sum_characters
			print '\n'


if text != '':

	print 'Action out of loop'
	data = json.load(urllib.urlopen(request_url % text))
	if data['code'] == 200:
		text_list = data['text']

		for idx, t in enumerate(text_list):
			
			data_to_output.append([indices_saved[idx]['IdComment'], indices_saved[idx]['Message'], t, 1])

		with open(filename, 'a') as fp:
			csv_writer = csv.writer(fp, delimiter=',')
			csv_writer.writerows(data_to_output)

		data_to_output = []
		old_text = ''
		text = ''
		indices_saved = []

		total_comments_translated += current_comments_translated
	
	else:
		print 'ERROR'
		sys.exit()

message1 = '%d current comments translated' % current_comments_translated
message2 = '%d total comments translated' % total_comments_translated
message3 = 'Sum Characters: %d' % sum_characters

print message1
print message2
print message3
print 'DONE!'
print '\n'

log.write(message1 + '\n')
log.write(message2 + '\n')
log.write(message3 + '\n')
log.write('\n')
