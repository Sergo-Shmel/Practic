import config
import os
import re
import psycopg2
from datetime import datetime, date

class Log:
    def __init__(self):
        self.ip = 'Нет данных'
        self.date = date.today()
        self.method = 'Нет данных'
        self.url = 'Нет данных'
        self.status = 'Нет данных'
        self.user_agent = 'Нет данных'

    def __repr__(self):
        return f'ip: {self.ip}, date: {self.date}, method: {self.method}, url: {self.url}, status: {self.status}, user_agent: {self.user_agent}'

    def to_tuple(self):
        return (self.ip, self.date, self.method, self.url, self.status, self.user_agent)

data_patterns = {
    '%h': r'\b(?:\d{1,3}\.){3}\d{1,3}\b',
    '%t': r'\[\d{2}\/[A-Za-z]{3}\/\d{4}:\d{2}:\d{2}:\d{2} \+\d{4}\]',
    '%r': r'"([^ ]*) ([^ ]*) HTTP/1\.[01]"',
    '%>s': r'\b\d{3}\b',
    '%b': r'\b\d+\b'
}

class LogManager:
    def __init__(self, files, data_patterns):
        self.files = files
        self.data_patterns = data_patterns

    def read_logs(self):
        logs = []
        for file_path, file_format in self.files:
            if not os.path.exists(file_path):
                print(f'File not found: {file_path}')
                continue

            with open(file_path, 'r', encoding='utf-8') as file:
                for line in file:
                    log = self.parse_log(line, file_format)
                    if log:
                        logs.append(log)
        return logs

    def parse_log(self, line, file_format):
        log = Log()
        for pattern in file_format:
            if pattern in self.data_patterns:
                match = re.search(self.data_patterns[pattern], line)
                if not match:
                    continue
                if pattern == '%h':
                    log.ip = match.group()
                elif pattern == '%t':
                    date_str = match.group().strip('[]')
                    log.date = datetime.strptime(date_str, '%d/%b/%Y:%H:%M:%S %z').date()
                elif pattern == '%r':
                    log.method, log.url = match.groups()
                elif pattern == '%>s':
                    log.status = match.group()
                elif pattern == '%b':
                    log.user_agent = match.group()
        return log if any(getattr(log, attr) != 'Нет данных' for attr in log.__dict__) else None

class DatabaseManager:
    def __init__(self, db_info):
        self.connection = None
        self.db_info = db_info

    def connect(self):
        self.connection = psycopg2.connect(**self.db_info)

    def execute_query(self, query):
        if not self.connection:
            self.connect()
        with self.connection.cursor() as cursor:
            cursor.execute(query)
            return cursor.fetchall()
