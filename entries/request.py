import json
import sqlite3
from sqlite3.dbapi2 import SQLITE_PRAGMA
from models import JournalEntry

def get_all_entries():
    with sqlite3.connect("./dailyjournal.db") as conn:
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        db_cursor.execute("""
        SELECT *
        FROM JournalEntries
        """)

        entries = []

        dataset = db_cursor.fetchall()

        for row in dataset:
            entry = JournalEntry(row['id'], row['concept'], row['entry'], row['mood_id'])
            entries.append(entry.__dict__)

    return json.dumps(entries)

def get_single_entry(id):
    with sqlite3.connect("./dailyjournal.db") as conn:
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        db_cursor.execute("""
        SELECT *
        FROM JournalEntries
        WHERE id = ?
        """, (id ,))

        data = db_cursor.fetchone()

        entry = JournalEntry(data['id'], data['concept'], data['entry'], data['mood_id'])
        return json.dumps(entry.__dict__)
