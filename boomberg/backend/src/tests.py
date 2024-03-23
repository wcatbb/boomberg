import pytest
from src import create_app

@pytest.fixture
def app():
    app = create_app({'TESTING': True})
    yield app

def test_index_route(app):
    with app.test_client() as client:
        response = client.get('/')
        assert response.status_code == 200
