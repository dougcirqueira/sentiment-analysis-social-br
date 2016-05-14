class TwitterUser(object):
	"""This class represents a Twitter post."""
	def __init__(self, user):
		
		self.name = user["name"]
		self.profile_image_url = user["profile_image_url"]
		self.profile_image_url_https = user["profile_image_url_https"]
		self.created_at = user["created_at"]
		self.location = user["location"]
		self.profile_link_color = user["profile_link_color"]
		self.id_str = user["id_str"]
		self.entities = UserEntities(user["entities"])
		self.favourites_count = user["favourites_count"]
		self.url = user["url"]
		self.utc_offset = user["utc_offset"]
		self.id = user["id"]
		self.listed_count = user["listed_count"]
		self.profile_text_color = user["profile_text_color"]
		self.lang = user["lang"]
		self.followers_count = user["followers_count"]
		self.protected = user["protected"]
		self.profile_background_color = user["profile_background_color"]
		self.verified = user["verified"]
		self.geo_enabled = user["geo_enabled"]
		self.time_zone = user["time_zone"]
		self.description = user["description"]
		self.default_profile_image = user["default_profile_image"]
		self.profile_background_image_url = user["profile_background_image_url"]
		self.statuses_count = user["statuses_count"]
		self.friends_count = user["friends_count"]
		self.screen_name = user["screen_name"]


class UserEntities(object):
	"""This class represents a Twitter post."""
	def __init__(self, entities):
		self.url = entities["urls"] if "urls" in entities.keys() else {}
		self.description = entities["description"] if "description" in entities.keys() else {}