# 0x01. NoSQL

## Resources

Read or watch:

- <a href="https://riak.com/resources/nosql-databases/" target="_blank">NoSQL Databases Explained</a>
- <a href="https://www.youtube.com/watch?v=qUV2j3XBRHc" target="_blank">What is NoSQL ?</a>
- <a href="https://www.youtube.com/watch?v=E-1xI85Zog8" target="_blank">MongoDB with Python Crash Course - Tutorial for Beginners</a>
- <a href="https://www.youtube.com/watch?v=CB9G5Dvv-EE" target="_blank">MongoDB Tutorial 2 : Insert, Update, Remove, Query</a>
- <a href="https://www.mongodb.com/docs/manual/aggregation/" target="_blank">Aggregation</a>
- <a href="https://realpython.com/introduction-to-mongodb-and-python/" target="_blank">Introduction to MongoDB and Python</a>
- <a href="https://www.mongodb.com/docs/manual/reference/method/" target="_blank">mongo Shell Methods</a>
- <a href="https://www.mongodb.com/docs/mongodb-shell/#mongodb-binary-bin.mongosh" target="_blank">Mongosh</a>

## Learning Objectives

At the end of this project, you are expected to be able to explain to anyone, without the help of Google:

### General

- What `NoSQL` means
- What is difference between `SQL` and `NoSQL`
- What is `ACID`
- What is a document storage
- What are `NoSQL types`
- What are benefits of a `NoSQL` database
- How to query information from a `NoSQL` database
- How to insert/update/delete information from a `NoSQL` database
- How to use `MongoDB`

## Requirements

### MongoDB Command File

- All your files will be interpreted/compiled on `Ubuntu 18.04 LTS` using `MongoDB (version 4.2)`
- All your files should end with a new line
- The first line of all your files should be a comment: ```// my comment```
- A `README.md` file, at the root of the folder of the project, is mandatory
- The length of your files will be tested using `wc`

### Python Scripts

- All your files will be interpreted/compiled on `Ubuntu 18.04 LTS` using `python3 (version 3.7)` and `PyMongo (version 3.10)`
- All your files should end with a new line
- The first line of all your files should be exactly `#!/usr/bin/env python3`
- A `README.md` file, at the root of the folder of the project, is mandatory
- Your code should use the `pycodestyle style (version 2.5.*)`
- The length of your files will be tested using `wc`
- All your modules should have a documentation (`python3 -c 'print(__import__("my_module").__doc__)'`)
- All your functions should have a documentation (`python3 -c 'print(__import__("my_module").my_function.__doc__)`'
- Your code should not be executed when imported (by using `if __name__ == "__main__":`)

### More Info

#### Install MongoDB 4.2 in Ubuntu 18.04

<a href="https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-ubuntu/" target="_blank">Official installation guide</a>

> ```shell
> $ wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | apt-key add -
> $ echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-4.2.list
> $ sudo apt-get update
> $ sudo apt-get install -y mongodb-org
> ...
> $  sudo service mongod status
> mongod start/running, process 3627
> $ mongo --version
> MongoDB shell version v4.2.8
> git version: 43d25964249164d76d5e04dd6cf38f6111e21f5f
> OpenSSL version: OpenSSL 1.1.1  11 Sep 2018
> allocator: tcmalloc
> modules: none
> build environment:
>     distmod: ubuntu1804
>     distarch: x86_64
>     target_arch: x86_64
> $  
> $ pip3 install pymongo
> $ python3
> >>> import pymongo
> >>> pymongo.__version__
> '3.10.1'
>```

Potential issue if documents creation doesn’t work or this error: `Data directory /data/db not found., terminating` (<a href="https://bryantson.medium.com/fixing-data-db-not-found-error-in-macos-x-when-starting-mongodb-d7b82abb2479" target="_blank">source</a> and <a href="https://stackoverflow.com/questions/37702957/mongodb-data-db-not-found" target="_blank">source</a>)

> ```$ sudo mkdir -p /data/db```

Or if `/etc/init.d/mongod` is missing, please find here an example of the file:

Click to expand/hide file contents

#### Use `“container-on-demand”` to run MongoDB

- Ask for container Ubuntu 18.04 - MongoDB
- Connect via SSH
- Or via the WebTerminal
- In the container, you should start MongoDB before playing with it:

> ```shell
> $ service mongod start
> * Starting database mongod                                              [ OK ]
> $
> $ cat 0-list_databases | mongo
> MongoDB shell version v4.2.8
> connecting to: mongodb://127.0.0.1:27017/?compressors=disabled&> gssapiServiceName=mongodb
> Implicit session: session { "id" : UUID("70f14b38-6d0b-48e1-a9a4-0534bcf15301") }
> MongoDB server version: 4.2.8
> admin   0.000GB
> config  0.000GB
> local   0.000GB
> bye
> $
> ```

---

Dukeson Ehigboria