build-image:
	docker build -t flask-chat .

run-image:
	docker run -d -p 5000:5000 --name flask-chat flask-chat

build-compose:
	docker-compose up --build -d

run-compose:
	docker-compose up -d

stop-compose:
	docker-compose down
