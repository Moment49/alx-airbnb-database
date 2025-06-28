import mysql.connector

my_connection = mysql.connector.connect(
    host= 'localhost',
    user= 'root',
    password = 'Momentum.12345'
)

my_cursor = my_connection.cursor()
my_cursor.execute("CREATE DATABASE IF NOT EXISTS Alx_AirBnB")

