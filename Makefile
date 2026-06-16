.PHONY: setup notebook

setup:
	python3 -m venv .venv
	. .venv/bin/activate && pip install -r requirements.txt

notebook:
	. .venv/bin/activate && jupyter notebook notebooks/01_chatbot_banco_rag.ipynb
