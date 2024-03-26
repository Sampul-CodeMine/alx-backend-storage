#!/usr/bin/env python3
"""
Module for Task 12"""
from pymongo import MongoClient


ALLOWED_METHODS = ['GET', 'POST', 'PUT', 'PATCH', 'DELETE']


def log_nginx_stats(mongo_collection, option=None):
    """
    This scripts provides statistics about NGINX logs stored in MongoDB
    """
    items = {}
    if option:
        value = mongo_collection.count_documents(
            {"method": {"$regex": option}})
        print(f"\tmethod {option}: {value}")
        return

    result = mongo_collection.count_documents(items)
    print(f"{result} logs")
    print("Methods:")
    for method in ALLOWED_METHODS:
        log_nginx_stats(nginx_collection, method)
    status_check = mongo_collection.count_documents({"path": "/status"})
    print(f"{status_check} status check")


if __name__ == '__main__':
    nginx_collection = MongoClient('mongodb://127.0.0.1:27017').logs.nginx
    log_nginx_stats(nginx_collection)
