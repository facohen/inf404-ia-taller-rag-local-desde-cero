# Guia del alumno

## Que vamos a construir

Un mini chatbot bancario educativo en un notebook.

Va a poder responder preguntas simples sobre:

- Caja de ahorro.
- Cuenta corriente.
- Tarjeta de debito.
- Prestamos personales.
- Home Banking y BNA+.
- Sucursales ficticias de Cordoba.

Tambien va a rechazar o derivar preguntas que no debe responder, como saldo,
inflacion, dolar, tasas vigentes o aprobaciones.

## Como correr

```bash
cd rag-qdrant-clase
make setup
make notebook
```

## Mapa mental simple

```text
documentos
   |
   v
fragmentos
   |
   v
embeddings
   |
   v
similitud entre frases
   |
   v
Qdrant: busqueda por similitud
   |
   v
contexto recuperado
   |
   v
prompt
   |
   v
respuesta o derivacion
```

## Palabras importantes

Documento:
Un texto con informacion. En esta clase lo representamos como JSON dentro del notebook.

Fragmento:
Una parte chica de un documento.

Embedding:
Una lista de numeros que representa el significado de un texto.

Busqueda semantica:
Buscar textos parecidos por significado, no solo por palabras exactas.

RAG:
Una tecnica donde primero buscamos informacion relevante y despues una LLM responde usando esa informacion.

Fuera de alcance:
Una pregunta que el chatbot no debe responder porque no esta en los documentos,
requiere datos personales o requiere informacion actualizada.

## Que observar

Pregunta guia de la clase:

```text
Que requisitos necesito para abrir una cuenta corriente?
```

Cuando corramos el paso intermedio:

- La pregunta se transforma en embedding.
- El embedding tiene muchos numeros.
- Se calculan puntajes de similitud.
- Se recuperan los fragmentos mas cercanos.

Cuando corramos el chatbot:

- Primero se muestra el contexto recuperado.
- Despues se muestra el prompt.
- Finalmente aparece la respuesta o derivacion.

## Experimento facil

En el notebook, modificar `documentos_banco` y agregar una sucursal ficticia.

Despues volver a ejecutar desde la celda:

```text
De documentos a fragmentos
```

Pregunta para pensar:

> Por que tuvimos que recalcular embeddings?
