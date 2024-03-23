from backend.src import create_app # for alembic migration, omit 'backend.' from create_app import (backend. is req for Docker web service to run)

app = create_app()

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)