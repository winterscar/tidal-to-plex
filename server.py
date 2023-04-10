from tidal_dl.events import *
from tidal_dl.settings import *
import tidalapi

SETTINGS.read(getProfilePath())
TOKEN.read(getTokenPath())
TIDAL_API.apiKey = apiKey.getItem(SETTINGS.apiKeyIndex)

loginByConfig()


session = tidalapi.Session()
session.load_oauth_session('Bearer', TOKEN.accessToken)

favorites = tidalapi.Favorites(session, session.user.id)
for track in favorites.tracks():
    try:
        start(f'https://listen.tidal.com/album/{track.album.id}')
        favorites.remove_track(track.id)
    except:
        pass