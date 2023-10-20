class Player:
    def __init__(self, player_id=None, email=None, name=None, client_socket=None):
        self.id = player_id
        self.email = email
        self.name = name
        self.client_socket = client_socket

    def __str__(self):
        return f"Player ID: {self.id}, Email: {self.email}, Name: {self.name}"
