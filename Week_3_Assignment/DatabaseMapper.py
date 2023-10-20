import mysql.connector
import Message

class DatabaseMapper:
    def __init__(self, host, user, password, database):
        self.connection = mysql.connector.connect(
            host=host,
            user=user,
            password=password,
            database=database
        )
        self.cursor = self.connection.cursor()


    def insert_message(self, message):
        query = "INSERT INTO message (player,chat,text) VALUES (%s, %s, %s)"
        data = (message.player_id, message.chat_id, message.content)
        self.cursor.execute(query, data)
        self.connection.commit()

    def get_player_id_for_email(self, email):
        query = "SELECT id FROM player WHERE email = %s"
        self.cursor.execute(query, (email,))  
        result = self.cursor.fetchone()

        if result:
            player_id = result[0]  
            return player_id
        else:
            return None  
    
    def delete_message(self, message_id):
        query = "DELETE FROM messages WHERE id = %s"
        self.cursor.execute(query, (message_id,))
        self.connection.commit()

    def login_player(self, username, password):
        query = "SELECT * FROM player WHERE email = %s AND password = %s"
        try:
            self.cursor.execute(query, (username, password))
            result = self.cursor.fetchone()

            if result:
                print("Player successfully found in Database")
                return True
            else:
                print("Player could not be found in Database")
                return False
        except mysql.connector.Error as err:
            print(f"Error: {err}")
            return False


    def close(self):
        self.cursor.close()
        self.connection.close()
