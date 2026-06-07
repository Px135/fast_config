#!/bin/bash

#  ══════════════════════════════════════════════════════════════════════════════════════
#  Instalador Automático de Fastfetch
# ══════════════════════════════════════════════════════════════════════════════════════

echo "Iniciando instalación... (♡≧ 𓎺 ≦)=ъ ♡"
echo ""

# 1. Comprobar e instalar fastfetch
if ! command -v fastfetch &> /dev/null; then
    echo "fastfetch no está instalado. Intentando instalar... ( ˘ ³˘)♥"
    if command -v pacman &> /dev/null; then
        sudo pacman -S --noconfirm fastfetch
    elif command -v apt &> /dev/null; then
        sudo apt update && sudo apt install -y fastfetch
    elif command -v dnf &> /dev/null; then
        sudo dnf install -y fastfetch
    else
        echo "No se pudo detectar el gestor de paquetes. Por favor, instala fastfetch manualmente. o(╥﹏╥)"
        exit 1
    fi
else
    echo "fastfetch ya está instalado. (˶˃ ᵕ ˂˶)"
fi

# 2. Comprobar y crear ~/.config/fastfetch
DIR_CONFIG="$HOME/.config/fastfetch"
if [ ! -d "$DIR_CONFIG" ]; then
    mkdir -p "$DIR_CONFIG"
    echo "El directorio $DIR_CONFIG creado. ┐(︶▽︶)┌"
fi

# 2.1. Copiar presets al directorio de configuración
# Se asume que el usuario ejecuta este script desde dentro de la carpeta del repositorio clonado
echo "Copiando presets y configuraciones... （・∀・)"
cp -r *.jsonc "$DIR_CONFIG/" 2>/dev/null
# Si tienes una carpeta de imágenes como Img-fast, la copiamos también
if [ -d "Img-fast" ]; then
    cp -r Img-fast "$DIR_CONFIG/"
fi
echo "Archivos de configuración copiados. (•⩊•)"

# 3. Comprobar y crear ~/.local/bin
DIR_BIN="$HOME/.local/bin"
if [ ! -d "$DIR_BIN" ]; then
    mkdir -p "$DIR_BIN"
    echo "El directorio $DIR_BIN creado. (⑉• ﻌ •⑉)"
fi

# 3.1 y 3.2. Copiar script01.sh y darle permisos de ejecución
if [ -f "script01.sh" ]; then
    cp script01.sh "$DIR_BIN/"
    chmod +x "$DIR_BIN/script01.sh"
    echo "El script alternador instalado y hecho ejecutable. （○゜ε＾○）"
else
    echo "Error: No se encontró script01.sh en la carpeta actual. （・□・；）"
    exit 1
fi

# 4. Comprobar intérprete (bash o zsh) y agregar a la primera línea
SHELL_RC=""
if [[ "$SHELL" == *"zsh"* ]]; then
    SHELL_RC="$HOME/.zshrc"
elif [[ "$SHELL" == *"bash"* ]]; then
    SHELL_RC="$HOME/.bashrc"
fi

if [ -n "$SHELL_RC" ] && [ -f "$SHELL_RC" ]; then
    LINEA_AUTO="~/.local/bin/script01.sh --silent"
    
    # Comprobar si ya existe para no duplicarla
    if ! grep -qF "$LINEA_AUTO" "$SHELL_RC"; then
        echo "Añadiendo ejecución automática a la primera línea de $SHELL_RC... (˶˃ᆺ˂˶)"
        
        # Crear un archivo temporal para insertar la línea al principio absoluto del documento
        TMP_FILE=$(mktemp)
        echo "# Ejecución de Fastfetch Dinámico" > "$TMP_FILE"
        echo "$LINEA_AUTO" >> "$TMP_FILE"
        echo "" >> "$TMP_FILE"
        cat "$SHELL_RC" >> "$TMP_FILE"
        
        # Sobrescribir el archivo original con el nuevo contenido
        mv "$TMP_FILE" "$SHELL_RC"
        echo "Configuración de terminal actualizada. (°▽°)/"
    else
        echo " (･ω･')? La ejecución automática ya estaba configurada en $SHELL_RC."
    fi
else
    echo "No se detectó un archivo .zshrc o .bashrc estándar mira el repositorio para más ayuda (,,¬﹏¬,,)"
fi

# 5. Ejecutar script01.sh silenciosamente para crear estado y config_run
echo "nicializando archivos complementarios... （｡>‿‿<｡ ）"
"$DIR_BIN/script01.sh" --silent > /dev/null 2>&1

# 6. Mensaje personalizado de finalización
echo ""
echo "════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"
echo "║ Tus configuraciones han sido aplicados correctamente. （´・｀ ）♡                                                        ║"
echo "║ (っ^з^)♪♬ Ahora solo disfruta ☆                                                                                          ║"
echo "║                                                                                                                          ║"
echo "║ Recuerda que este proyecto aunque busca darte una configuración ya lista para usar y que sea facil de modificar          ║"
echo "║ tambien busca que te intereses por entender cada elemento y en general la estructura de estas configuraciones            ║"
echo "║ así que no dudes en modificar los archivos que sean necesarios y sientete libre de aprender modificando ≽^•༚• ྀིྀ≼          ║"
echo "║                                                                                                                          ║"
echo "║ Antes de finalizar aunque ya esta dicho en el repositorio recordar que estas configuraciones son originales              ║"
echo "║ del repositorio oficial de fastfetch y yo solo las moifique para darles una apariencia nueva y así                       ║"
echo "║ poder explicarlas para todo el publico, creditos totales a todos los colaboradores de fastfecth no dudes en              ║"
echo "║ visitar su repositorio oficial y apoyarlos. (˶˃ ᵕ ˂˶)                                                                    ║"
echo "║                                                                                                                          ║"
echo "║ Ahora si solo queda abrir una nueva terminal para ver la magia, o usa el comando                                         ║"
echo "║ que configuraste como alias para rotar los diferentes configs. (Se muestra como hacerlo en el github) (⸝⸝⸝๑'﹏'๑⸝⸝⸝)     ║"
echo "════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"
echo ""
echo " ⌤ Instalación completada con éxito, no olvides personalizar y hacer que este proyecto sea unico para ti ⌤"
echo ""