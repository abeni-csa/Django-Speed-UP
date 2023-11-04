#!/bin/bash

# List of folder names
folder_array=("blog" "css" "main")

# Loop through each folder name and create Django app
for folder_name in "${folder_array[@]}"
do
    # Create Django app using manage.py startapp command
    python3 manage.py startapp "$folder_name"

    # Change directory to the created folder
    cd "$folder_name"
    cat << EOF > urls.py
from django.urls import path
from . import views

urlpatterns = [
    path('path-they-want/', views.members, name=''),
]


EOF

    cd ..
done
