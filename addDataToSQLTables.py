import ast
import parseGeneratedEntities
import parseGeneratedEvents
import os
import mysql.connector
import json

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

cursor = conn.cursor(buffered=True)

#parse the text_file
path_of_file_to_parse = "generated_events.txt"
parsed_events = parseGeneratedEvents.parse_generated_events(path_of_file_to_parse)
path_of_file_to_parse = "generated_entities.txt"
parsed_entities = parseGeneratedEntities.parse_generated_entities(path_of_file_to_parse)

#method to clear a tables foreign key constraints
def clear_key_constraints(table_to_clear):
    query = "ALTER TABLE " + table_to_clear + " DISABLE KEYS;"
    cursor.execute(query)

#method to reset the auto_increment of a table
def reset_auto_increment(table_to_reset):
    query = "ALTER TABLE " + table_to_reset + " AUTO_INCREMENT = 1"
    cursor.execute(query)

#simple method to clear a table
def clear_table(table_to_clear):
    query = "DELETE FROM " + table_to_clear
    #print(query)
    cursor.execute(query)
    reset_auto_increment(table_to_clear)

#method to insert e.g. 'race' from a character into the race table
#returns the id of the race to insert into the race_id table
def insert_entity_data(table_name, table_to_insert_to, entity, conn, cursor) -> int:  # type: ignore
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
clear_table("action")
clear_table("characters")
clear_table("item")
clear_table("enemy")
clear_table("event")
clear_table("guild")
clear_table("npc")
clear_table("team")
clear_table("race")
clear_table("class")

for event in parsed_events:
    event_type = event['Event Type']
    event_type_parts = event_type.split('_')

    entity1 = ast.literal_eval(event['Entity1'])
    entity1_type = event_type_parts[0]
    entity2 = ast.literal_eval(event['Entity2'])
    entity2_type = event_type_parts[2]
    
    entity1_id = entity1.get('id')
    entity2_id = entity2.get('id')

    if 'Additional Entity' in event:
        additional_entity = ast.literal_eval(event['Additional Entity'])
        additional_entity_id = additional_entity.get('id')

        query = "INSERT INTO action (event_type, entity1_id, entity1_type, entity2_id, entity2_type, entity3_id, entity3_type, value) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
        values = (event_type, entity1_id, entity1_type, entity2_id, entity2_type, additional_entity_id, event['Additional Entity Type'], event['Value'])
        cursor.execute(query, values)

        # add correct category to the entity
        updated_entity1 = {'category' : entity1_type}
        updated_entity2 = {'category' : entity2_type}
        updated_additional_entity = {'category' : event['Additional Entity Type']}
        # add the rest of the entity to the added category
        updated_entity1.update(entity1)
        updated_entity2.update(entity2)
        updated_additional_entity.update(additional_entity)
        # append the parsed entities list with the newly updated entities
        parsed_entities.append(updated_entity1)
        parsed_entities.append(updated_entity2)
        parsed_entities.append(updated_additional_entity)
    
    else:
        query = "INSERT INTO action (event_type, entity1_id, entity1_type, entity2_id, entity2_type, value) VALUES (%s, %s, %s, %s, %s, %s)"
        values = (event_type, entity1_id, entity1_type, entity2_id, entity2_type, event['Value'])
        cursor.execute(query, values)
                
        # add correct category to the entity
        updated_entity1 = {'category' : entity1_type}
        updated_entity2 = {'category' : entity2_type}
        # add the rest of the entity to the added category
        updated_entity1.update(entity1)
        updated_entity2.update(entity2)
        # append the parsed entities list with the newly updated entities
        parsed_entities.append(updated_entity1)
        parsed_entities.append(updated_entity2)

for entity in parsed_entities:
    # Character
    if ('character' == entity['category'] or 'player' == entity['category']):
        # print(entity)
        race_id = insert_entity_data('race', 'Character', entity, conn, cursor)
        class_id = insert_entity_data('class', 'Character', entity, conn, cursor)

        query = "INSERT INTO characters (name, race_id, class_id) VALUES (%s, %s, %s)"
        values = (entity['first_name'] + " " + entity['firstname'], race_id, class_id)
        cursor.execute(query, values)

    # Dialogue
    if 'dialogue' == entity['category']:
        # print(entity)
        query = "INSERT INTO dialogue (text) VALUES (%s)"
        values = (entity['content'],)
        cursor.execute(query, values)

    # Enemy
    if 'enemy' == entity['category']:
        # print(entity)
        query = "INSERT INTO enemy (name, type) VALUES (%s, %s)"
        values = (entity['enemy_name'], entity['enemy_type'])
        cursor.execute(query, values)

    # Events
    if 'event' == entity['category']:
        # print(entity)
        query = "INSERT INTO event (name, time) VALUES (%s, %s)"
        values = (entity['event_name'], entity['event_time'])
        cursor.execute(query, values)

    # Guilds
    if 'guildname' == entity['category']:
        #print(entity)
        query = "INSERT INTO guild (name, type, number_of_players) VALUES (%s, %s, %s)"
        values = (entity['name'], entity['description'], entity['members'])
        cursor.execute(query, values)

    # Items
    if 'item' == entity['category']:
        # print(entity)
        query = "INSERT INTO item (name, type) VALUES (%s, %s)"
        values = (entity['item_name'], entity['item_type'])
        cursor.execute(query, values)

    # NPC
    if ('npc' == entity['category'] or 'vendors' == entity['category']):
        # print(entity)
        query = "INSERT INTO npc (name, role) VALUES (%s, %s)"
        values = (entity['first_name'] + " " + entity['last_name'], entity['npc_type'])
        cursor.execute(query, values)

    # Team
    if 'team' == entity['category']:
        # print(entity)
        kingdom_id = insert_entity_data('kingdom', 'Team', entity, conn, cursor)
        
        query = "INSERT INTO team (name, number_of_players, kingdom_id) VALUES (%s, %s, %s)"
        values = (entity['team_name'], entity['n_members'], kingdom_id)
        cursor.execute(query, values)

conn.commit()
cursor.close()
conn.close()