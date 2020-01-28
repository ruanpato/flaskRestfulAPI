import sqlalchemy as db

class Database():
    # Replace after // first postgres is the user and the second is the password urll encoded
    engine = db.create_engine(
        'postgresql://postgres:postgres@localhost/bnh',
        connect_args={'client_encoding':'utf8'})
    def __init__(self):
        try:
            self.connection = self.engine.connect()
            print("Database Instance Created")
        except:
            print("Error on try create Database Instance")

    def executeQuery(self, query):
        try:
            fetchQuery = self.connection.execute(query)
            print "Query successfully executed."
            return fetchQuery
        except:
            print "Error in: executeQuery"