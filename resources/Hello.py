from flask_restful import Resource

class Hello(Resource):
    def get():
        return {"message": "Hello, World!"}

    def post():
        return {"message": "Hello, World!"}