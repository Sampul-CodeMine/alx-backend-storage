#!/usr/bin/env python3
"""
This is a simple module to practise projects on how to use redis
for caching and to use the redis client in python
"""
from redis import Redis
import uuid as uid
from typing import Union, Callable, Optional


class Cache:
    """
    This is a class to implement caching using redis
    """
    def __init__(self):
        """Class constructor for Cache"""
        self._redis = Redis()
        self._redis.flushdb(True)

    def store(self, data: Union[str, bytes, int, float]) -> str:
        """
        This is a method that stores data using a random key generated from
        the uuid library:

        Args:
            data (str | bytes | int | float) - input data to be written to the
            redis database

        Returns:
            String (str) result
        """
        u_id = str(uid.uuid4())
        self._redis.set(u_id, data)
        return u_id
