# INF - 404 Inteligencia Artificial

## INF404 IA - Taller RAG local desde cero: embeddings y prompting con LLM

Docente: Federico A. Cohen

---

# Clase: chatbot bancario con embeddings y RAG

Notebook autocontenido para una clase introductoria de inteligencia artificial.

Caso: chatbot educativo inspirado en Banco Nacion, con datos ficticios sobre
productos simples: caja de ahorro, cuenta corriente, tarjetas, prestamos,
canales digitales y sucursales de Cordoba.

Importante: no es informacion bancaria oficial. Es una demo para aprender RAG.

## Prerrequisitos

- Python 3.10 o superior.
- Jupyter Notebook, instalado por `make setup`.
- Conexion a internet la primera vez, para instalar paquetes y descargar el modelo de embeddings.
- Memoria suficiente para cargar `sentence-transformers/paraphrase-multilingual-MiniLM-L12-v2`, un modelo chico para embeddings multilingues.
- Una sesion gratuita de Colab alcanza para la demo. GPU es opcional, pero acelera la generacion con la LLM.

## Por que sin Docker

Para una primera clase conviene reducir infraestructura. El notebook usa
Qdrant local en memoria, sin Docker y sin servidor externo.

Conceptualmente:

```text
pregunta -> embedding -> query a Qdrant -> contexto -> chatbot
```

Mas adelante se puede reemplazar Qdrant en memoria por Qdrant persistente,
Pinecone, Weaviate, Elasticsearch vectorial u otra base vectorial.

## Como correr

```bash
cd rag-qdrant-clase
make setup
make notebook
```

Notebook principal:

[notebooks/01_chatbot_banco_rag.ipynb](notebooks/01_chatbot_banco_rag.ipynb)

## Que incluye el notebook

- Celda inicial para instalar paquetes con `%pip install`.
- Pregunta guia para recorrer todo el flujo: requisitos para abrir una cuenta corriente.
- Documentos JSON definidos dentro del notebook.
- Fragmentacion de documentos.
- Generacion de embeddings.
- Mini experimento de similitud entre frases antes de usar la base vectorial.
- Carga de embeddings en Qdrant local en memoria.
- Ejemplo de frase normal convertida en query embebida.
- Ejemplos de query vectorial a Qdrant.
- Salidas tabulares con `pandas` para fragmentos, resultados y metricas.
- Paso intermedio de la query.
- Prompt pedagogico del chatbot.
- Ejemplo de chatbot ingenuo que alucina.
- Reformulacion con guardrails para rechazar o derivar preguntas fuera de alcance.
- Chatbot simulado sin depender de una LLM.
- Chatbot RAG con LLM real local: descarga Gemma con `transformers` y genera sin API externa de chat.
- Evaluacion simple con `precision_top_1`, `recuperacion_contexto` y `accuracy_politica`.
- Salidas esperadas documentadas en Markdown.
- Checklist final para repasar lo aprendido.

## Ruta sugerida para 1 hora

- 0 a 10 min: documentos JSON y fragmentos.
- 10 a 25 min: embeddings y similitud entre frases.
- 25 a 40 min: Qdrant y paso intermedio de la query.
- 40 a 50 min: prompt, chatbot ingenuo y alucinacion.
- 50 a 60 min: guardrails, metricas y Gemma local como cierre.

## Preguntas para mostrar que funciona

- `Que necesito para abrir una cuenta corriente?`
- `Que necesito para abrir una caja de ahorro?`
- `Cual es la diferencia entre caja de ahorro y cuenta corriente?`
- `Que sucursales hay en Cordoba?`
- `Perdi mi tarjeta de debito, que hago?`

## Preguntas para mostrar limites

- `Cuanto saldo tengo en mi cuenta?`
- `Cual es la inflacion de este mes?`
- `A cuanto esta el dolar hoy?`
- `Me aprobas un prestamo personal?`
- `Que tasa tiene hoy un prestamo personal?`

La respuesta correcta no debe inventar. Debe derivar o decir que no tiene
informacion suficiente.

## Estructura

```text
rag-qdrant-clase/
  notebooks/01_chatbot_banco_rag.ipynb  notebook autocontenido
  data/                                 copia de datos en JSON
  lesson/guia_clase.md                  guion docente
  lesson/guia_alumno.md                 guia simple para estudiantes
  lesson/preguntas_demo.md              preguntas buenas y fuera de alcance
```
