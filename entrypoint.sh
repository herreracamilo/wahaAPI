#!/bin/sh

# Inicia WAHA en segundo plano
node dist/main &

# Espera hasta que el servidor esté accesible
echo "Esperando a que WAHA esté listo..."
until curl -s http://localhost:3000/ > /dev/null; do
  echo "Aún no disponible, esperando..."
  sleep 2
done

# Iniciar sesión default automáticamente
echo "Iniciando sesión 'default'..."
curl -X POST http://localhost:3000/api/sessions/default/start -H "api_key: ${WAHA_API_KEY}"

# Mantener contenedor vivo
wait
