#!/usr/bin/env python3
"""
Module to solve Task 11
"""


def schools_by_topic(mongo_collection, topic: str) -> list:
    """
    This is a method that returns a list of schools having the same topic
    Args:
        mongo_collection (pymongo)
        topic (list of strings)
    Returns:
        list of strings
    """
    docs = mongo_collection.find({"topics": topic})
    return [doc for doc in docs]
