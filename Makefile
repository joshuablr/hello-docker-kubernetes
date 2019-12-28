setup:
	python3 -m venv ./.py-aws

install:
	pip install -r requirements.txt 

lint:
	pylint --load-plugins pylint_flask --disable=R,C hello.py
run:
	python hello.py

all: install lint run
