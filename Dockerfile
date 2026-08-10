FROM python:3.11-slim

WORKDIR /app

COPY . /app

RUN apt-get update && apt-get install -y libgomp1

RUN pip install -r requirements.txt

RUN python -c "import nltk; nltk.download('stopwords'); nltk.download('wordnet')"

CMD ["python3", "flask_api/main.py"]