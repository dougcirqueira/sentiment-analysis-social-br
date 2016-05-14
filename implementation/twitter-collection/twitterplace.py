class TwitterPlace(object):
	"""This class represents a Twitter post."""
	def __init__(self, place):

		# If it`s a city, usually the "city name, state", else only specific location name or country.
		self.full_name = place["full_name"]
		# Only specific location, city or country name.
		self.name = place["name"]
		self.country = place["country"]
		self.place_type = place["place_type"]
		self.bounding_box = place["bounding_box"]