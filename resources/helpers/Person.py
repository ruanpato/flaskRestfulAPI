from Database import Database # Import database connection
from datetime import datetime # Import datetime lib to convert
db = Database()

class Person():
    # @Function: createPerson
    # @Argumens: dict{
    #               name: (string),
    #               title: (string), [maybe don't have this field]
    #               email: (string),
    #               date: (string),
    #            }
    # @Returns: 1 if successfully insert, otherwise 0
    # @Description: This function insert a row in database
    def createPerson(self, person):
        beginQuery = "INSERT INTO \"Person\" ("
        endQuery = "VALUES ("
        try:
            # This for mount the INSERT query correcly either if don't had title
            for _ in person:
                beginQuery += "\""+str(_)+"\", "
                if type(person[_]) == str:
                    endQuery += "\'"+str(person[_])+"\', "
                else:
                    endQuery += str(person[_])+", "
            beginQuery = beginQuery[:-2]+") " # Remove ", " at the last element and add ") "
            endQuery = endQuery[:-2]+");" # Remove ", " at the last element and add ") "
            db.executeQuery(beginQuery+endQuery) # Insert the person in database
            id = db.executeQuery("SELECT \"id\" FROM \"Person\" WHERE \"name\" = \'"+person['name']+'\';') # Get id of person inserted
            auxId = []
            for _ in id:
                auxId.append(_) # Get the info of the object
            db.executeQuery("INSERT INTO \"Contact\" (\"id\") VALUES ("+str(auxId[0][0])+");") # Insert person id on contact
            db.executeQuery("UPDATE \"Person\" SET \"id_Contact\" = "+str(auxId[0][0])+" WHERE \"Person\".\"id\"="+str(auxId[0][0])+";") # Update the id_Person on Person
            return 1 # Query Successfully executed
        except:
            return 0 # Can't insert the row in database

    # @Function: getAllPersons
    # @Argumens: N/A
    # @Returns: if succeded dict{
    #               id: [](int),
    #               name: [](string),
    #               title: [](string),
    #               email: [](string),
    #               date: [](string),
    #               id_Contact: [](int)
    #            }
    #           , otherwise returns 0
    # @Description: This function show all rows of table Person
    def getAllPersons(self):
        try:
            allPersons = {}
            result = db.executeQuery("SELECT * FROM \"Person\"") ## Returns a Tuple
            for _ in result:
                dic = dict(_) # Convert a tuple line in a dict
                for i in dic: # Iterate in keys above this dictionary
                    if i.encode("utf-8") not in allPersons.keys():
                        allPersons[i.encode("utf-8")] = []
                    
                    if type(dic[i]) == unicode: # To convert of unicode to string
                        allPersons[i.encode("utf-8")].append(dic[i].encode("utf-8"))
                    elif type(dic[i]) == int or type(dic[i]) == float or type(dic[i] != bool):
                        allPersons[i.encode("utf-8")].append(dic[i])
                    else:
                        allPersons[i.encode("utf-8")].append( dic[i].strftime("%d/%m/%Y") )
                        
            return allPersons
        except:
            return 0 # Can't get All Persons