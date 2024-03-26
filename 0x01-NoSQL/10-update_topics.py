#!/usr/bin/env python3
"""
This is a module to update documents in a collection
based on the name using pymongo
"""


def update_topics(mongo_collection, name: str, topics):
    """
    This is a method that updates documents in a collection
    using python's pymongo library (python and mongodb) based on the search
    criteria (names)
    Args:
        mongo_collection (pymongo)
        name (str) to search for
        topics (list of strings)
    """
    mongo_collection.update_many({"name": name},
                                 {"$set": {"topics": topics}})
