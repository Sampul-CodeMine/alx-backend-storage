#!/usr/bin/env python3
"""
This is a module to list all documents in a collection
using pymongo
"""


def list_all(mongo_collection):
    """
    This is a method that list all documents in a collection
    using python's pymongo library (python and mongodb)
    """
    return [doc for doc in mongo_collection.find()]