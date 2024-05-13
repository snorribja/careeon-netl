source venv/bin/activate
lsof -ti:8000 | xargs kill -9
python manage.py runserver &
while ! nc -z localhost 8000; do   
  sleep 0.1
done
open "http://localhost:8000/jobs"

