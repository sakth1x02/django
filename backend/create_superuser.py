from django.core.management.base import BaseCommand
from django.contrib.auth import get_user_model

class Command(BaseCommand):
    help = 'Create a dummy superuser with username "admin" and password "2309"'

    def handle(self, *args, **kwargs):
        User = get_user_model()

        # Check if the user already exists
        if not User.objects.filter(username="admin").exists():
            # Create the superuser
            User.objects.create_superuser("admin", "admin@example.com", "2309")
            self.stdout.write(self.style.SUCCESS("Successfully created superuser with username 'admin' and password '2309'"))
        else:
            self.stdout.write(self.style.SUCCESS("Superuser 'admin' already exists"))
