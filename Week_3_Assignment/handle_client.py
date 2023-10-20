import socket
import threading
from datetime import datetime
from Message import Message
from DatabaseMapper import DatabaseMapper
from Player import Player

  

class Server:

    def __init__(self, host, port, DB_host, user, password, database):
        self.host = host
        self.port = port
        self.server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.messages = []  # Store messages from clients
        self.chat_ids = [8,9]
        self.players = []
        self.data_mapper = DatabaseMapper(DB_host, user, password, database)



    def start(self):
        self.server_socket.bind((self.host, self.port))
        self.server_socket.listen(2)
        print(f"Server is listening for connections on {self.host}:{self.port}...")

        while len(self.players) < 2:
            try:
                client, addr = self.server_socket.accept()
            except BlockingIOError:
                continue  # No incoming connections, continue to the next iteration
            client_handler = threading.Thread(target=self.handle_client, args=(client, addr))
            client_handler.start()
    
    def broadcast_message(self, sender_client_socket, message):
        for player in self.players:
            if player.client_socket != sender_client_socket:
                player.client_socket.send(message.encode())


    def handle_client(self, client_socket, client_address):

        print(f"New client connected: {client_address}")

        while True:
            message = client_socket.recv(1024).decode()
            if not message:
                break

            # Check if the message is an authentication request
            if message.startswith("AUTH"):
                _, email, password = message.split()
                if self.data_mapper.login_player(email, password):
                    client_socket.send("AUTH_SUCCESS".encode())
                    self.players.append(Player(self.data_mapper.get_player_id_for_email(email),email, None, client_socket))
                    print(f"{email} has authenticated.")
                else:
                    client_socket.send("AUTH_FAILED".encode())
                    print(f"Authentication failed for {email}")
            # Inside your message handling code
            else:
                timestamp = self.get_current_timestamp()
                print(f"Received message: {message}")

                parts = message.split(':', 1)
                if len(parts) == 2:
                    email, content = parts

                    messageObject = Message(self.data_mapper.get_player_id_for_email(email),self.chat_ids[1], content)

                    self.messages.append(messageObject)
                    self.data_mapper.insert_message(messageObject)

                    self.broadcast_message(client_socket, message)

                else:
                    print(f"Received an invalid message format: {message}")



        client_socket.close()

    
    def get_current_timestamp(self):
        current_time = datetime.now()
        return current_time.strftime("%Y-%m-%d %H:%M:%S")
    
    def get_id_by_name(name_to_find, player_data):
        for name, player_id in player_data:
            if name == name_to_find:
                return player_id
        return None  # Return None if the name is not found
    
    

if __name__ == "__main__":
    server = Server('0.0.0.0', 8080,'localhost','root','Bordcomputer3','MysticQuestDB')
    server.start()
