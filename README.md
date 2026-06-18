# INF-404: Inteligencia Artificial

## Taller RAG Local desde Cero: Embeddings y Prompting con LLMs

**Docente:** Federico A. Cohen

---

# Workshop: Chatbot Bancario con Embeddings y RAG

Este es un notebook totalmente autocontenido diseñado para un **workshop introductorio** de Inteligencia Artificial enfocado en RAG (Retrieval-Augmented Generation).

**Caso práctico:** Un chatbot  inspirado en el Banco de la Nación Argentina, que utiliza datos ficticios sobre productos básicos (caja de ahorro, cuenta corriente, tarjetas, préstamos, canales digitales y sucursales de la provincia de Córdoba).

> [!IMPORTANT]
> Esta demo **no contiene información bancaria oficial**. Es una maqueta con fines puramente educativos para aprender a construir e implementar un flujo RAG.

---

## Requisitos Previos

- **Python 3.10** o superior.
- **Jupyter Notebook**, que se instala automáticamente al ejecutar `make setup`.
- **Conexión a internet** (solo la primera vez) para instalar las dependencias y descargar el modelo de embeddings.
- **Memoria RAM suficiente** para cargar `sentence-transformers/paraphrase-multilingual-MiniLM-L12-v2`, un modelo compacto y optimizado para embeddings multilingües.
- **Google Colab** (opcional): Una sesión gratuita es suficiente para ejecutar esta demo. Contar con GPU es opcional, pero acelerará la generación de texto con el LLM local.

---

## ¿Por qué sin Docker?

Para un workshop introductorio es fundamental reducir la complejidad de la infraestructura. Por eso, este notebook utiliza **Qdrant local en memoria**, evitando la necesidad de configurar contenedores Docker o servidores externos.

El flujo conceptual es el siguiente:

```text
Pregunta -> Generación de Embedding -> Búsqueda en Qdrant -> Inserción de Contexto -> Respuesta del Chatbot (LLM)
```

> [!NOTE]
> En entornos de producción, Qdrant en memoria se puede reemplazar fácilmente por una instancia persistente de Qdrant, o por otras bases de datos vectoriales como Pinecone, Weaviate o Elasticsearch Vector Search.

---

## Instrucciones de Ejecución

Clona el repositorio, accede a la carpeta del proyecto y ejecuta los siguientes comandos:

```bash
# Configurar el entorno virtual e instalar dependencias
make setup

# Iniciar Jupyter Notebook
make notebook
```

El notebook principal del workshop se encuentra en:
👉 **[01_chatbot_banco_rag.ipynb](file:///c:/Users/fcohen/repos/inf404-ia-taller-rag-local-desde-cero/notebooks/01_chatbot_banco_rag.ipynb)**

---

## Contenido del Notebook

El notebook está estructurado paso a paso y cubre las siguientes etapas:

- **Instalación de paquetes:** Celda inicial configurada con `%pip install` para facilitar la configuración en Google Colab.
- **Pregunta guía:** Un caso de uso de referencia para validar todo el flujo (requisitos para abrir una cuenta corriente).
- **Datos locales:** Documentos en formato JSON definidos directamente dentro del código.
- **Fragmentación (Chunking):** Estrategias básicas para dividir la información.
- **Generación de Embeddings:** Uso del modelo multilingüe para vectorizar texto.
- **Experimento de Similitud:** Ejercicio práctico para comprender la distancia/similitud del coseno antes de usar bases vectoriales.
- **Base de Datos Vectorial:** Carga y consulta de embeddings en una base de datos local en memoria con **Qdrant**.
- **Prompt Engineering:** Diseño de un prompt pedagógico con guardrails para evitar que el chatbot alucine o responda consultas fuera de alcance.
- **Simulación vs LLM Real:**
  - Un modelo ingenuo simulado (para entender el flujo de datos sin depender de APIs).
  - Un LLM real ejecutándose localmente (descarga de Gemma con `transformers` y generación offline).
- **Evaluación básica:** Métricas sencillas de precisión y adherencia a políticas (`precision_top_1`, `recuperacion_contexto` y `accuracy_politica`).
- **Resultados de referencia:** Resultados esperados documentados para contrastar salidas.
- **Checklist de aprendizaje:** Resumen de conceptos clave revisados.


## Consultas de Prueba (Respuestas Dentro del Alcance)

- `¿Qué necesito para abrir una cuenta corriente?`
- `¿Qué necesito para abrir una caja de ahorro?`
- `¿Cuál es la diferencia entre caja de ahorro y cuenta corriente?`
- `¿Qué sucursales hay en Córdoba?`
- `Perdí mi tarjeta de débito, ¿qué hago?`

---

## Consultas de Prueba (Fuera de Alcance / Límites del Sistema)

- `¿Cuánto saldo tengo en mi cuenta?`
- `¿Cuál es la inflación de este mes?`
- `¿A cuánto está el dólar hoy?`
- `¿Me aprobás un préstamo personal?`
- `¿Qué tasa tiene hoy un préstamo personal?`

> [!TIP]
> El chatbot bien configurado no debe alucinar respuestas. La respuesta correcta debe derivar al canal correspondiente o indicar con claridad que no posee la información solicitada.

---

## Estructura del Repositorio

- 📁 [notebooks/](file:///c:/Users/fcohen/repos/inf404-ia-taller-rag-local-desde-cero/notebooks): Contiene el notebook del workshop.
  - 📄 [01_chatbot_banco_rag.ipynb](file:///c:/Users/fcohen/repos/inf404-ia-taller-rag-local-desde-cero/notebooks/01_chatbot_banco_rag.ipynb): Código principal del workshop.
- 📁 [data/](file:///c:/Users/fcohen/repos/inf404-ia-taller-rag-local-desde-cero/data): Carpeta con datos de prueba.