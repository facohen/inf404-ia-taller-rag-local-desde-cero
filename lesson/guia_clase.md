# Guia docente: clase de 1 hora

## Objetivo

Que los estudiantes entiendan RAG sin pelearse con infraestructura:
documentos, fragmentos, embeddings, busqueda semantica, prompt y respuesta de
un chatbot con limites claros.

El notebook principal es:

[notebooks/01_chatbot_banco_rag.ipynb](../notebooks/01_chatbot_banco_rag.ipynb)

## Agenda sugerida

### 0 a 5 min - Motivacion

Pregunta disparadora:

> Si una LLM ya sabe mucho, por que necesitamos documentos del banco?

Ideas clave:

- La LLM no deberia inventar requisitos bancarios.
- Queremos respuestas trazables.
- Queremos derivar cuando la pregunta requiere saldo, datos personales o informacion actualizada.

### 5 a 12 min - Mirar los documentos

En el notebook, ir a la seccion `Documentos JSON dentro del notebook`.

Mostrar:

- `fuente`
- `categoria`
- `titulo`
- `secciones`
- `texto`

Mensaje docente:

> En un caso real, estos documentos podrian venir de PDFs, una web publica, manuales internos o una base documental.

### 12 a 22 min - Fragmentos y embeddings

Ejecutar las secciones:

- `De documentos a fragmentos`
- `Creamos embeddings`
- `Mini experimento: similitud entre frases`

Explicar:

- Un documento se parte en fragmentos.
- Cada fragmento se transforma en una lista de numeros.
- Esa lista de numeros es el embedding.
- No estamos entrenando una LLM.

Frase simple:

> El embedding es una forma numerica de representar significado.

Mostrar la tabla de similitud y remarcar que no estamos buscando palabras
identicas: estamos comparando cercania semantica entre vectores.

### 22 a 35 min - Paso intermedio de la query

Ejecutar:

```text
mostrar_paso_intermedio("Que requisitos necesito para abrir una cuenta corriente?")
```

Remarcar:

- La pregunta tambien se convierte en embedding.
- Se compara contra todos los fragmentos.
- Se ordenan los fragmentos por similitud.
- El top K se convierte en contexto.

Mensaje docente:

> Esta parte es el retrieval. Sin retrieval, la LLM responde solo con lo que trae de entrenamiento.

### 35 a 48 min - Chatbot simulado

Ejecutar:

```text
chatbot_simulado("Que requisitos necesito para abrir una cuenta corriente?", mostrar_prompt=True)
```

Explicar:

- El prompt es el contrato de comportamiento.
- El contexto recuperado se pega dentro del prompt.
- La respuesta debe citar fuentes.
- Si falta evidencia, no debe inventar.

### 48 a 56 min - Preguntas de limite

Ejecutar:

```text
chatbot_simulado("Cuanto saldo tengo en mi cuenta?")
chatbot_simulado("Cual es la inflacion de este mes?")
```

Discusion:

- Saldo requiere identidad y canal seguro.
- Inflacion requiere informacion actualizada.
- RAG ayuda, pero hay que disenar reglas y prompts.

### 56 a 60 min - Cierre

Resumen:

- Documentos: conocimiento propio.
- Fragmentos: unidades recuperables.
- Embeddings: texto convertido en numeros.
- Similitud: forma de ordenar textos por cercania semantica.
- Retrieval: buscar contexto relevante.
- Prompt: reglas para responder.
- Chatbot: responde o deriva.

## Mini desafio

Modificar `documentos_banco` en el notebook:

- Agregar una sucursal ficticia.
- Agregar un requisito nuevo para cuenta corriente.
- Agregar una politica nueva de fuera de alcance.

Despues volver a ejecutar desde la celda de fragmentacion.

Pregunta para pensar:

> Por que hay que recalcular embeddings cuando cambia un documento?
