#!/usr/bin/env bash

# get all users
echo "***************************"
echo "Testing get all users"
curl -X GET http://0.0.0.0:5000/api/v1/users

# get one user valid id
echo "***************************"
echo "Testing get one user valid id"
curl -X GET http://0.0.0.0:5000/api/v1/users/00a11245-12fa-436e-9ccc-967417f8c30a

# get one user invalid id
echo "***************************"
echo "Testing get one user invalid id"
curl -X GET http://0.0.0.0:5000/api/v1/users/not_an_id



# delete one user valid id
echo "***************************"
echo "Testing delete one user valid id"
curl -X DELETE http://0.0.0.0:5000/api/v1/users/00e93fc3-53ff-4da4-8e72-faa5216f81bb

# delete the same user valid id again to test 404
echo "***************************"
echo "Testing delete one user valid id again"
curl -X DELETE http://0.0.0.0:5000/api/v1/users/0de009d0-7d25-4516-8e00-0694d381ad82

# delete one user invalid id
echo "***************************"
echo "Testing delete one user invalid id"
curl -X DELETE http://0.0.0.0:5000/api/v1/users/not_an_id


# post one user
echo "***************************"
echo "Testing post one user"
curl -X POST http://0.0.0.0:5000/api/v1/users -H "Content-Type: application/json" -d '{"email": "emad@gmail.com", "password": "hello this is emad"}' -vvv


# post one user with password missing
echo "***************************"
echo "Testing post one user with no name"
curl -X POST http://0.0.0.0:5000/api/v1/users -H "Content-Type: application/json" -d '{"email": "emad@gmail.com"}' -vvv

# post one user with email missing
echo "***************************"
echo "Testing post one user with no name"
curl -X POST http://0.0.0.0:5000/api/v1/users -H "Content-Type: application/json" -d '{"password": "hello this is emad"}' -vvv



# put one user valid id with email it should not change
echo "***************************"
echo "Testing put one user valid id"

curl -X PUT http://0.0.0.0:5000/api/v1/users/00a11245-12fa-436e-9ccc-967417f8c30a -H "Content-Type: application/json" -d '{"email": "OooooOOOOMGGGGGGGGGGGGG"}'

# put one user valid id with password it should change
echo "***************************"
echo "Testing put one user valid id"

curl -X PUT http://0.0.0.0:5000/api/v1/users/00a11245-12fa-436e-9ccc-967417f8c30a -H "Content-Type: application/json" -d '{"passowrd": "OooooOOOOMGGGGGGGGGGGGG"}'
