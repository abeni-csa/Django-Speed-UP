#!/bin/env bash
pip install --upgrade django
django_version=$(python -m django --version)
echo "Django version $django_version has been installed."
# Create a new Django project
django-admin startproject demo_project
# Change directory to the project folder
cd demo_project
folder_array=("blog" "css" "main")
# Loop through each folder name and create Django app
for folder_name in "${folder_array[@]}"
do
    python3 manage.py startapp "$folder_name"

    # Change directory to the created folder
    cd "$folder_name"

    # Create urls.py file with the specified content
    cat << EOF > urls.py
from django.urls import path
from . import views

urlpatterns = [
    path('path-they-want/', views.members, name=''),
]
EOF
    
    cd ..
    ./manage.py runserver
done

echo "Demo project with starter apps has been created."
