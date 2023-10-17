import parseGeneratedEntities
import os
import mysql.connector

# gets the host, user, password and database from the environment variables
# this way, one does not have to type his password in the code
db_host = os.environ.get('DB_HOST')
db_user = os.environ.get('DB_USER')
db_password = os.environ.get('DB_PASSWORD')
db_database = os.environ.get('DB_DATABASE')


db_host = "localhost"
db_user = "root"
db_password = "Bordcomputer3"
db_database = "MysticQuestDBgit"

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

def clear_key_constraints(table_to_clear):
    query = "ALTER TABLE " + table_to_clear + " DISABLE KEYS;"
    cursor.execute(query)

#simple method to clear a table
def clear_table(table_to_clear):
    query = "DELETE FROM " + table_to_clear
    #print(query)
    cursor.execute(query)

#clearing all tables before entering info again
clear_table("characters")
clear_table("item")
clear_table("enemy")
clear_table("event")
clear_table("npc")
clear_table("team")

for entity in parsed_entities:
    #Character table is being a big piece of shit poopy idiot idk try to see if you can fix it
    #NEVERMIND :DDDD
    # Character
    if 'Character' == entity['category']:
        # print(entity)
        query = "INSERT INTO characters (id, name, race, class) VALUES (%s, %s, %s, %s)"
        values = (entity['id'], entity['first_name'] + " " + entity['firstname'], entity['race'], entity['class'])
        cursor.execute(query, values)
        
    # Enemy
    if 'Enemy' == entity['category']:
        # print(entity)
        query = "INSERT INTO enemy (id, name, type) VALUES (%s, %s, %s)"
        values = (entity['id'], entity['enemy_name'], entity['enemy_type'])
        cursor.execute(query, values)

    # Events
    if 'Event' == entity['category']:
        # print(entity)
        query = "INSERT INTO event (id, name) VALUES (%s, %s)"
        values = (entity['id'], entity['event_name'])
        cursor.execute(query, values)

    # Guilds
    if 'GuildName' == entity['category']:
        #print(entity)
        query = "INSERT INTO guild"

    # Items
    if 'Item' == entity['category']:
        # print(entity)
        query = "INSERT INTO item (id, name) VALUES (%s, %s)"
        values = (entity['id'], entity['item_name'])
        cursor.execute(query, values)

    # NPC
    if ('NPC' == entity['category'] or 'Vendors' == entity['category']):
        # print(entity)
        query = "INSERT INTO npc (id, name, role) VALUES (%s, %s, %s)"
        values = (entity['id'], entity['first_name'] + " " + entity['last_name'], entity['npc_type'])
        cursor.execute(query, values)

    # Team
    if 'Team' == entity['category']:
        # print(entity)
        query = "INSERT INTO team (id, name, number_of_players) VALUES (%s, %s, %s)"
        values = (entity['id'], entity['team_name'], entity['n_members'])
        cursor.execute(query, values)

conn.commit()
conn.close()