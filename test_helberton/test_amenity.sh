#!/usr/bin/env bash

# get all amenities
echo "***************************"
echo "Testing get all amenities"
curl -X GET http://0.0.0.0:5000/api/v1/amenities

# get one amenity valid id
echo "***************************"
echo "Testing get one amenity valid id"
curl -X GET http://0.0.0.0:5000/api/v1/amenities/017ec502-e84a-4a0f-92d6-d97e27bb6bdf

# get one amenity invalid id
echo "***************************"
echo "Testing get one amenity invalid id"
curl -X GET http://0.0.0.0:5000/api/v1/amenities/not_an_id



# delete one amenity valid id
echo "***************************"
echo "Testing delete one amenity valid id"
curl -X DELETE http://0.0.0.0:5000/api/v1/amenities/0d375b05-5ef9-4d43-aaca-436762bb25bf

# delete the same amenity valid id again to test 404
echo "***************************"
echo "Testing delete one amenity valid id again"
curl -X DELETE http://0.0.0.0:5000/api/v1/amenities/0d375b05-5ef9-4d43-aaca-436762bb25bf

# delete one amenity invalid id
echo "***************************"
echo "Testing delete one amenity invalid id"
curl -X DELETE http://0.0.0.0:5000/api/v1/amenities/not_an_id

# post one amenity
echo "***************************"
echo "Testing post one amenity"
curl -X POST http://0.0.0.0:5000/api/v1/amenities -H "Content-Type: application/json" -d '{"name": "TV"}' -vvv

# post one amenity with no name
echo "***************************"
echo "Testing post one amenity with no name"
curl -X POST http://0.0.0.0:5000/api/v1/amenities -H "Content-Type: application/json" -d '{"name": "TV"}' -vvv

# # post one amenity with no json
# echo "***************************"
# echo "Testing post one amenity with no json"
# curl -X POST http://0.0.0.0:5000/api/v1/amenities -H "Content-Type: application/json" -d '' -vvv

# put one amenity valid id
echo "***************************"
echo "Testing put one amenity valid id"
curl -X PUT http://0.0.0.0:5000/api/v1/amenities/017ec502-e84a-4a0f-92d6-d97e27bb6bdf -H "Content-Type: application/json" -d '{"name": "OooooOOOOMGGGGGGGGGGGGG"}'
