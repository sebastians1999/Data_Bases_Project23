import parseGeneratedEntities
import parseGeneratedEvents
import os
import mysql.connector

# gets the host, user, password and database from the environment variables
# this way, one does not have to type his password in the code
db_host = os.environ.get('DB_HOST')
db_user = os.environ.get('DB_USER')
db_password = os.environ.get('DB_PASSWORD')
db_database = os.environ.get('DB_DATABASE')


# db_host = "localhost"
# db_user = "root"
# db_password = "Bordcomputer3"
# db_database = "MysticQuestDBgit"

conn = mysql.connector.connect(
    host=db_host,
    user=db_user,
    password=db_password,
    database=db_database
)

cursor = conn.cursor()
cursor = conn.cursor(buffered=True)

#parse the text_file
path_of_file_to_parse = "generated_entities.txt"
parsed_entities = parseGeneratedEntities.parse_generated_entities(path_of_file_to_parse)
path_of_file_to_parse = "generated_events.txt"
parsed_events = parseGeneratedEvents.parse_generated_events(path_of_file_to_parse)

#method to clear a tables foreign key constraints
def clear_key_constraints(table_to_clear):
    query = "ALTER TABLE " + table_to_clear + " DISABLE KEYS;"
    cursor.execute(query)

#simple method to clear a table
def clear_table(table_to_clear):
    query = "DELETE FROM " + table_to_clear
    #print(query)
    cursor.execute(query)

#method to reset the auto_increment of a table
def reset_auto_increment(table_to_reset):
    query = "ALTER TABLE " + table_to_reset + " AUTO_INCREMENT = 1"
    cursor.execute(query)

#method to insert e.g. 'race' from a character into the race table
#returns the id of the race to insert into the race_id table
def insert_entity_data(table_name, table_to_insert_to, entity, conn, cursor):
    exists_query = "SELECT IF(EXISTS(SELECT * FROM {} WHERE name LIKE %s), 'YES', 'NO')".format(table_name)
    entity_name = entity[table_name.lower()]  # assumes the entity name is a column with lowercase name

    cursor.execute(exists_query, (entity_name,))
    result = cursor.fetchone()

    if result is not None and result[0] == 'YES':
        # entity exists
        pass
    else:
        # entity doesnt exist, insert it here
        insert_query = "INSERT INTO {} (name) VALUES (%s)".format(table_name)
        cursor.execute(insert_query, (entity_name,))
        conn.commit()

    # get the id of the entity
    id_query = "SELECT id FROM {} WHERE name LIKE %s".format(table_name)
    cursor.execute(id_query, (entity_name,))
    entity_id = cursor.fetchone()

    if entity_id is not None:
        entity_id = entity_id[0]
        return entity_id

#clearing all tables before entering info again
# clear_key_constraints("characters")
clear_table("characters")
clear_table("item")
clear_table("enemy")
clear_table("event")
clear_table("npc")
clear_table("team")
clear_table("race")
reset_auto_increment("race")
reset_auto_increment("class")

for entity in parsed_entities:
    # Character
    if 'Character' == entity['category']:
        # print(entity)
        race_id = insert_entity_data('race', 'Character', entity, conn, cursor)
        class_id = insert_entity_data('class', 'Character', entity, conn, cursor)

        query = "INSERT INTO characters (id, name, race_id, class_id) VALUES (%s, %s, %s, %s)"
        values = (entity['id'], entity['first_name'] + " " + entity['firstname'], race_id, class_id)
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
        kingdom_id = insert_entity_data('kingdom', 'Team', entity, conn, cursor)
        
        query = "INSERT INTO team (id, name, number_of_players, kingdom_id) VALUES (%s, %s, %s, %s)"
        values = (entity['id'], entity['team_name'], entity['n_members'], kingdom_id)
        cursor.execute(query, values)

# for event in parsed_events[:10]:
#     print(event)


conn.commit()
cursor.close()
conn.close()