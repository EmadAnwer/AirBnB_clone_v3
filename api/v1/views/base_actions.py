from models import storage


class REST_actions():
    def get(cls):
        """gets all objects"""
        return (list(map(lambda state: state.to_dict(),
                         storage.all(cls).values())))

    def get_by_id(cls, id):
        """gets an object by its id"""
        selected_object = storage.get(cls, id)
        if selected_object:
            return {'status code': 200,
                    'object dict': selected_object.to_dict()}
        else:
            return {'status code': 404}

    def delete(cls, id):
        """deletes an object"""
        obj_to_delete = storage.get(cls, id)
        if obj_to_delete:

            storage.delete(obj_to_delete)
            storage.save()
            return {'status code': 200}
        else:
            return {'status code': 404}

    def post(obj):
        """creates a new object"""
        storage.new(obj)
        storage.save()
        return {'status code': 201, 'object dict': obj.to_dict()}

    def put(obj, args_to_ignore, request_body):
        args = dict(
            filter(lambda a: a[0] not in args_to_ignore, request_body.items()))
        print(type(obj))
        obj_dict = obj.to_dict()
        for k, v in args.items():
            obj_dict[k] = v
        
        storage.save()

        return {'status code': 201, 'object dict': obj.to_dict()}
