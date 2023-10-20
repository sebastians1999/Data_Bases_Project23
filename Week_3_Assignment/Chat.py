class Chat:
    def __init__(self, chatId=None, player1Id=None, player2Id=None):
        self.chatId = chatId
        self.player1Id = player1Id
        self.player2Id = player2Id
        self.players = []

    def add_player(self, player_id):
        self.players.append(player_id)

    def __str__(self):
        return f"Chat ID: {self.chatId}\nPlayer 1 ID: {self.player1Id}\nPlayer 2 ID: {self.player2Id}\nPlayers: {', '.join(map(str, self.players))}"


