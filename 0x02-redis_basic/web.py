#!/usr/bin/env python3
"""
Module to track web cache
"""
import redis
import requests
from functools import wraps
from typing import Callable


def count_url_access(fn: Callable) -> Callable:
    """
    This is a decorator for get_page function
    """
    @wraps(fn)
    def wrapper(url: str) -> str:
        """
        This is a wrapper function
        """
        client = redis.Redis()
        client.incr(f'count:{url}')
        cached_page = client.get(f'{url}')
        if cached_page:
            return cached_page.decode('utf-8')
        response = fn(url)
        client.set(f'{url}', response, 10)
        return response
    return wrapper


@count_url_access
def get_page(url: str) -> str:
    """
    Method to obtain the HTML content of a particular webpage
    """
    response = requests.get(url)
    return response.text


if __name__ == "__main__":
    get_page('http://www.google.co.uk')
