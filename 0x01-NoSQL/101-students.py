#!/usr/bin/env python3
"""
Module for Task 101"""


def top_students(mongo_collection):
    """
    Returns all students sorted by their average scores
    """
    studs_at_top = mongo_collection.aggregate([
        {
            "$project": {
                "name": "$name",
                "averageScore": {"$avg": "$topics.score"}
            }
        },
        {"$sort": {"averageScore": -1}}
    ])
    return studs_at_top
