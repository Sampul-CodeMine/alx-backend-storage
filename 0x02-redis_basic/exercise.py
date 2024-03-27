#!/usr/bin/env python3
"""
This is a simple module to practise projects on how to use redis
for caching and to use the redis client in python
"""
from redis import Redis
import uuid as uid
from typing import Union, Callable, Optional
from functools import wraps


def count_calls(method: Callable) -> Callable:
    """
    This is a decorator function that takes a callable and returns a Callable
    """
    key = method.__qualname__

    @wraps(method)
    def incr_func(self, *args, **kwargs):
        """increments the count for the key """
        self._redis.incr(key)
        return method(self, *args, **kwargs)
    return incr_func


class Cache:
    """
    This is a class to implement caching using redis
    """
    def __init__(self):
        """Class constructor for Cache"""
        self._redis = Redis()
        self._redis.flushdb(True)

    @count_calls
    def store(self, data: Union[str, bytes, int, float]) -> str:
        """
        This is a method that stores data using a random key generated
        from the uuid library:

        Args:
            data (str | bytes | int | float) - input data to be written
            to the redis database

        Returns:
            String (str) result
        """
        u_id = str(uid.uuid4())
        self._redis.set(u_id, data)
        return u_id

    def get(self, key: str, fn: Callable = None) \
            -> Union[str, bytes, int, float]:
        """
        The is a method that gets data from Redis and converts it into
        python type

        Args:
            key (str) - the key of the data to fetch from redis
            fn (Callable function) - function to call

        Returns:
            (str | float | int | bytes) any of these datatypes
        """
        result = self._redis.get(key)
        if fn:
            return fn(result)
        return result

    def get_str(self, key: str) -> str:
        """
        This is a method that retrieves string data from the redis storage

        Args:
            key (str) - the key of the data to fetch

        Returns:
            String data (str)
        """
        return self.get(key, lambda x: x.decode('utf-8'))

    def get_int(self, key: str) -> int:
        """
        This is a method that retrieves integer data from the redis storage

        Args:
            key (str) - the key of the data to fetch

        Returns:
            Integer data (int)
        """
        return self.get(key, lambda x: int(x))
