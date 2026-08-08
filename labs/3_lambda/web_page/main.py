from typing import Any

# El contexto es como si fuera metadatos.
#  Ejem:
#   - El nombre de la función lambda.
#   - El ambiente donde se está ejecutando.
#   - Un ID único que se genera automáticamente cada vez que se inicia la ejecución de una función lambda.
#  Normalmente no son útiles para lógica de negocio pero si para auditoría.
#  Por ser una clase especial no se puede definir un tipado tan fuerte.

# En python se pueden definir un tipado fuerte, en event será un diccionario con key: value,
#  donde la key es un string y el value puede ser cualquier cosa.
def handler(event: dict[str, Any], context: Any):
  print("El evento es: ", event)
  with open("index.html") as archivo_html:  # with: ContextManager. Garantiza que un recurso se abra, se use y se cierre correctamente.
    return {  # Se retorna un diccionario
      "statusCode": 200,
      "headers": {"Content-Type": "text/html; charset=UTF-8"},  # Adicional por si hay error de tildes.
      "body": archivo_html.read(),
    }