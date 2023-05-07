import mysql.connector
import json

from time import time, localtime, strftime


def get_current_date():
    return strftime('%Y-%m-%d', localtime(time()))


def get_current_datetime():
    return strftime('%Y-%m-%d %H:%M:%S', localtime(time()))


class Database:
    def __init__(self):
        self.config = {
            'user': 'root',
            'password': '15485863',
            'host': 'localhost',
            'database': 'networks_db',
            'raise_on_warnings': True
        }

        self.connection_time = time()
        self.delayed_insert_timeout = 300
        self.cnx = mysql.connector.connect(**self.config)
        self.cursor = self.cnx.cursor()

        print(f"Connected to {self.config['database']} database.")

        self.networks_table = Table(self, 'networks')
        self.configurations_table = Table(self, 'configurations')
        self.results_table = Table(self, 'results')
        self.training_process_table = Table(self, 'training_process')

    def check_connection(self):
        """Check if connection is still alive, if not, reconnect."""
        if time() - self.connection_time > self.delayed_insert_timeout:
            self.cnx.close()
            self.cnx = mysql.connector.connect(**self.config)
            self.cursor = self.cnx.cursor()
            self.connection_time = time()

    def query(self, query, params=None):
        """Execute query and return results."""
        self.check_connection()
        try:
            self.cursor.execute(query, params)
            print(f"Executed query: {query}")
        except mysql.connector.Error as err:
            print(err)
            return []
        return self.cursor.fetchall()

    def close(self):
        """Close connection."""
        self.cnx.close()


class Table:
    def __init__(self, database: Database, name: str):
        self.db = database
        self.name = name
        self.columns = self.db.query(f'SHOW COLUMNS FROM {self.name}')
        self.col_names = [x[0] for x in self.columns]

    def add_row(self, param) -> int:
        """Add row to table."""
        query = f'INSERT INTO {self.name} ' \
                f'({", ".join(self.col_names[1:])}) VALUES ' \
                f'({", ".join(["%s"] * len(self.col_names[1:]))})'
        self.db.query(query, param)
        self.db.cnx.commit()
        return self.db.cursor.lastrowid

    def get_rows(self, where=None):
        """Get rows from table."""
        query = f'SELECT * FROM {self.name}'
        if where:
            query += f" WHERE {where}"
        dict_result = []
        for row in self.db.query(query):
            dict_result.append(dict(zip([x[0] for x in self.columns], row)))
        return dict_result

    def remove_row(self, where=None):
        """Remove rows from table."""
        query = f'DELETE FROM {self.name}'
        if where:
            query += f" WHERE {where}"
        self.db.query(query)
        self.db.cnx.commit()


if __name__ == '__main__':
    db = Database()
    result = db.query('SHOW TABLES')
    print(f"Tables: {', '.join([x[0] for x in result])}.")

    config_id = 14
    # get results
    results = db.results_table.get_rows(f'configuration_id = {config_id}')
    print(f"Results for configuration {config_id}:")
    result = json.loads(results[0]['result'])
    # pair result index: result value
    result = {i: result[i] for i in range(len(result))}
    sorted_result = sorted(result.items(), key=lambda x: x[1], reverse=True)
    for key, value in sorted_result:
        print(f"{key}: {value}")

