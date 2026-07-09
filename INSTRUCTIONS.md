# Execution Instructions

This guide explains how to initialize, populate, and query the Cinema DB SQLite database using the provided automation scripts and raw SQL definitions.

## 📋 Prerequisites

Before running the project, ensure you have the SQLite3 CLI installed on your machine.

* Linux (Ubuntu/Debian): run `sudo apt install sqlite3`
* macOS: run `brew install sqlite`
* Windows: Download the precompiled binaries from the official SQLite website.

---

## ⚡ Quick Start (Automated Script)

The repository includes a shell script (run.sh) that automates the entire process of setting up the database, loading the seed data, and executing test queries in sequence.

To run the automated script, open your terminal and execute these three commands in order:

```bash
cd sql
chmod +x run.sh
./run.sh
```

### What run.sh does under the hood:
```bash
sqlite3 projdb.db < create2.sql # Generates the relational schema tables
sqlite3 projdb.db < populate2.sql # Seeds the database with media and social data
sqlite3 projdb.db < quer01.sql # Runs data-retrieval validation queries
```

The script automatically generates a physical database file named "projdb.db" directly inside your sql folder.

---

## 🛠️ Manual Step-by-Step Execution

If you prefer to build the database step-by-step manually, execute the following commands from your terminal inside the sql/ directory:

1. Initialize the Relational Schema:
```
sqlite3 projdb.db < create2.sql
```
2. Populate with Sample Data:
```
sqlite3 projdb.db < populate2.sql
```
3. Run Sample Queries:
```
sqlite3 projdb.db < quer01.sql
```
---

## 🔍 Inspecting the Database Interactively

To open a live terminal session inside your generated SQLite database instance and check your tables, run:
```bash
sqlite3 projdb.db
```

Once inside the interactive SQLite prompt, use these customized meta-commands to test the relational schema:

* .tables — Lists all the tables in the system (you will see Utilizador, Filme, Serie, Atividade, etc.).
* .schema Utilizador — Inspect the specific constraints you built for users (like the password length validation or email uniqueness).
* .schema Atividade — Review the physical multi-key structure handling user ratings and progress logs.
* .mode column — Formats your SQL query result outputs cleanly into readable terminal columns.
* .headers on — Ensures that table attributes (like user name, movie release dates) appear right above the query results.
* .exit — Safely closes out the interactive terminal session.

### Example Inspection Queries to Try:
Once you turn columns and headers on, you can execute standard SQL directly in the prompt to test the seed data:
```sql
SELECT nome, email, nSeguidores FROM Utilizador;
```
```sql
SELECT Item.nome, Filme.duracao, Filme.linguagem FROM Filme JOIN Item ON Filme.idItem = Item.id;
```