#!/usr/bin/env python3
"""
This is a module to insert a document into a collection
using pymongo
"""


def insert_school(mongo_collection, **details):
    """
    This is a method that inserts a document into a collection
    using python's pymongo library (python and mongodb)
    Args:
        mongo_collection (pymongo)
        details (dict) key-value pairs
    Returns:
        Inserted Data id
    """
    stu_id = mongo_collection.insert_one(details)
    return stu_id.inserted_id
