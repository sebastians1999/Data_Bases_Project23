import parseGeneratedEntities
import os
import mysql.connector

db_host = os.environ.get('DB_HOST')
db_user = os.environ.get('DB_USER')
db_password = os.environ.get('DB_PASSWORD')
db_database = os.environ.get('DB_DATABASE')

conn = mysql.connector.connect(
    host=db_host,
    user=db_user,
    password=db_password,
    database=db_database
)

cursor = conn.cursor()

#parse the text_file
path_of_file_to_parse = "generated_entities.txt"
parsed_entities = parseGeneratedEntities.parse_generated_entities(path_of_file_to_parse)

#just trying items for now

for entity in parsed_entities:
    if 'Item' == entity['category']:
        # print(entity)
        query = "INSERT INTO items (itemId, name) VALUES (%s, %s)"
        values = (entity['id'], entity['item_name'])
        cursor.execute(query, values)

conn.commit()
conn.close()