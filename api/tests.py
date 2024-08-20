from django.urls import reverse
from rest_framework import status
from rest_framework.test import APITestCase
from .models import Note


class NoteTests(APITestCase):
    def setUp(self):
        self.note = Note.objects.create(title="Test Note", body="This is a test note.")

    def test_create_note(self):
        url = reverse("note-list")
        data = {"title": "New Note", "body": "This is a new note."}
        response = self.client.post(url, data, format="json")
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

    def test_get_notes(self):
        url = reverse("note-list")
        response = self.client.get(url, format="json")
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data), 1)
