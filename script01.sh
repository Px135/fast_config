#!/bin/bash

# ═══════════════════════════════════════════Rutas y Recursos═════════════════════════════════════════════════
DIR_PADRE="$HOME/.config/fastfetch"
ACTIVE_CONFIG="$DIR_PADRE/config_run.jsonc"
STATE="$DIR_PADRE/.fastfetch_state"

# ────────── MODIFICACIÓN DE VALORES (NÚMEROS) ──────────
TOTAL_CONFIGS=5  # Cambia este número si agregas config5, config6, etc.
# ───────────────────────────────────────────────────────

# ══════════════════════════════Verificaciones Iniciales (Primera Ejecución)═══════════════════════════════════
# 1. Verificar si existe la configuración activa, si no, crearla desde la config1
if [ ! -f "$ACTIVE_CONFIG" ]; then
    echo "Creando config_run.jsonc (˶˃ᆺ˂˶)"
    CONFIG1="$DIR_PADRE/config1.jsonc"
    
    if [ -f "$CONFIG1" ]; then
        cp "$CONFIG1" "$ACTIVE_CONFIG"
        echo "config_run.jsonc creado desde config1.jsonc (っ^з^)♪♬"
    else
        echo "Error: config1.jsonc no existe. No se puede crear config_run.jsonc (╥﹏╥)"
        exit 1
    fi
fi

# 2. Verificar si existe el archivo de estado, si no, crearlo en 0
if [ ! -f "$STATE" ]; then
    echo " ᕦ(⩾﹏⩽)ᕥ  Creando archivo de estado: $STATE"
    # Lo iniciamos en 0 para que la matemática de abajo lo convierta en 1 en la primera ejecución
    echo "0" > "$STATE"
    echo "Archivo de estado creado (≧︿≦)"
fi

# ════════════════════════════════════════════Lógica del script════════════════════════════════════════════════

# Leer el estado actual (qué config se mostró la última vez)
CURRENT_STATE=$(cat "$STATE")

# Calcular la SIGUIENTE configuración usando aritmética de Bash
# Si el estado actual es igual o mayor al total, vuelve a 1. Si no, suma 1.
if [ "$CURRENT_STATE" -ge "$TOTAL_CONFIGS" ]; then
    NEXT_STATE=1
else
    NEXT_STATE=$((CURRENT_STATE + 1))
fi

# Definir la ruta del archivo origen dinámicamente según el número que toca
CONFIG_ORIGEN="$DIR_PADRE/config${NEXT_STATE}.jsonc"

# Verificar si el archivo que queremos aplicar realmente existe
if [ -f "$CONFIG_ORIGEN" ]; then
    cp "$CONFIG_ORIGEN" "$ACTIVE_CONFIG"
    echo "$NEXT_STATE" > "$STATE"
    
    # Un mensaje personalizado según la config que se active usando 'case'
    
    # ════════════════════════════════════════════Mensajes de cambio════════════════════════════════════════════════

    #Este if solo muestra los mensajes si se hace el cambio manualmente y hace que no aparezcan cuando se abre la terminal
    if [ "$1" != "--silent" ]; then

        case $NEXT_STATE in
            1) echo "Cambiado a config1 (─‿‿─)" ;;
            2) echo "Cambiado a config2 (º﹃º)" ;;
            3) echo "Cambiado a config3 (★ω★)" ;; 
            4) echo "Cambiado a config4 (✧ω✧)" ;;

            #⚠ Nota: Esto sirve para personalizar los mensajes de cambio, puedes igonarlo si no te sirve ⚠
            #Si se quieren agregar más mensajes personalizados se pone:
            #5) echo "Mensaje" ;; 
            #es importante seguir la sintaxis para que funcione correctamente ( ´ ▽ ` )b 

            *) echo "Cambiado a config$NEXT_STATE (っ^з^)♪" ;; # Mensaje genérico que aparece si no se especifican más mensajes
        esac

    fi
else
    echo "Error: El archivo $CONFIG_ORIGEN no existe. (╥﹏╥)"
    exit 1
fi

echo ""

# Limpiar la terminal para evitar bugs gráficos con el protocolo de imágenes
#clear

# Mostrar fastfetch con la nueva config
fastfetch --config "$ACTIVE_CONFIG"
