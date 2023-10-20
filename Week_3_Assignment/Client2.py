import socket
import threading
import getpass  # Import getpass for password input

class Client:
    def __init__(self, server_address, server_port):
        self.client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.client_socket.connect((server_address, server_port))
        self.username = None

    def send_message(self):
        while True:
            # Send the message with the full username
            message = input(f"{self.username}: ")
            self.client_socket.send(f"{self.username}: {message}".encode())


    def receive_messages(self):
        while True:
            message = self.client_socket.recv(1024)
            print(f"{message.decode()}")

    def login(self):
        while True:
            self.username = input("Enter your E-Mail: ")
            password = input("Enter your password: ")  # Display the password as the user types it

            auth_message = f"AUTH {self.username} {password}"
            self.client_socket.send(auth_message.encode())
            response = self.client_socket.recv(1024).decode()

            if response == "AUTH_SUCCESS":
                print("Authentication successful.")
                break
            else:
                print("Authentication failed. Please try again.")


    def start(self):
        self.login()  # Call the login method to authenticate the user

        send_thread = threading.Thread(target=self.send_message)
        receive_thread = threading.Thread(target=self.receive_messages)

        send_thread.start()
        receive_thread.start()


if __name__ == "__main__":
    server_address = '127.0.0.1'
    server_port = 8080

    client = Client(server_address, server_port)
    client.start()
