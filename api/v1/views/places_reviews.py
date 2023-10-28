#!/usr/bin/python3"
"""handles all default RESTFul API actions for Reviews objects"""

from flask import jsonify, abort, request
from api.v1.views import app_views
from models import storage
from models.user import User
from models.place import Place
from models.city import City
from models.review import Review
from api.v1.views.base_actions import REST_actions
