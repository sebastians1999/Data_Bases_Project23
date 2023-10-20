
from DatabaseMapper import DatabaseMapper

# Replace these values with your actual database configuration
host = "localhost"
user = "root"
password = "Bordcomputer3"
database = "MysticQuestDB"

# Initialize the DatabaseMapper
db_mapper = DatabaseMapper(host, user, password, database)


db_mapper.close()

