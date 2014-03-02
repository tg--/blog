# Site Settings
AUTHOR = 'Thomas Gstaedtner'
CONTACT = 'thomas@gstaedtner.net'
SITENAME = 'tg'
SITEURL = 'http://gstaedtner.net/pelican_test/output'
TIMEZONE = 'Europe/Berlin'
LOCALE = 'de_DE.UTF-8'

# Look'n'Feel
DEFAULT_PAGINATION = 5
DISPLAY_POSTS_ON_MENU = 5
DISPLAY_PAGES_ON_MENU = 5
DISPLAY_CATEGORIES_ON_MENU = 10
DISPLAY_TAGS_ON_MENU = 30
ARTICLE_URL = '{date:%Y}/{date:%m}/{date:%d}/{slug}/'
ARTICLE_SAVE_AS = '{date:%Y}/{date:%m}/{date:%d}/{slug}/index.html'
THEME = 'tg'
CSS_FILE = 'tg.css'
SUMMARY_MAX_LENGTH = 200

# Feed Settings
FEED_RSS = None
CATEGORY_FEED_ATOM = 'feeds/category-%s.atom.xml'
TAG_FEED_ATOM = 'feeds/tag-%s.atom.xml'
