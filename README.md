# Fast_Config

<p align="center">
  <img src="https://img.shields.io/badge/OS-CachyOS%20%7C%20Arch%20Linux-04D9C4?style=for-the-badge&logo=archlinux&logoColor=white" alt="OS Badge">
  <img src="https://img.shields.io/badge/Terminal-Kitty-000000?style=for-the-badge&logo=kitty&logoColor=white" alt="Terminal Badge">
  <img src="https://img.shields.io/badge/Shell-Zsh-F15A24?style=for-the-badge&logo=zsh&logoColor=white" alt="Shell Badge">
  <img src="https://img.shields.io/badge/Config-Fastfetch-FF007F?style=for-the-badge&logo=linux&logoColor=white" alt="Fastfetch Badge">
</p>

---

## Acerca del Proyecto (..＞◡＜..)

**fast_config** es un repositorio dedicado a compartir una configuración altamente personalizada, estética y optimizada para **Fastfetch**. Diseñada específicamente para la personalización de la terminal y sobre todo para facilitar el entendimiento de las modificaciones en general.

Si te apasiona el diseño de interfaces en terminales y buscas llevar la personalización de tu sistema de una forma que puedas entender sencillamente este repositorio es para ti.

---

## Pre instalación /ᐠ｡‸｡ᐟ\

### 1. Debes tener instalada la herramienta git (sino como clonas el repositorio? :p) 
Es necesaria para clonar el repositorio sino la tienes  ejecuta segun tu caso lo siguiente en la terminal:

```bash
    #Arch y derivados 
    sudo pacman -S git

    #Debian y derivadas
    sudo apt update
    sudo apt install git

    #Fedora y derivadas
    sudo dnf install git
```
* Debes tener ubicado tu terminal como **konsole**, **kitty**,  **Ghostty** o la que tu ocupes de preferencia con un protocolo de imagenes (Recomendado: Kitty), junto su interprete como **zsh**, **bash**, **fish** o cualquier otra.

### 2. Instalar fuentas (opcional... creo)
Puedes instalar fuentes para tu terminal y asi darle mejor apariencia, pero realmente para lo que importan es para los iconos decorativos del mismo fastfetch, para esto recomiendo sin duda **[NerdFonts](https://www.nerdfonts.com/#home)** ya sera trabajo tuyo el instalarlo en tu terminal pero es realmente facil

---

## Guía de instalación y uso （｡>‿‿<｡ ）

* Como **recomendacion preinstalación** hazlo en una carpeta bien ubicada para llevar un orden en los archivos antes de ejecutar, sino sabes como hacerlo solo ejecuta lo siguiente:

```bash
    #Es un ejemplo, tu deberas poner el nombre de la carpeta
    cd ~/Documentos
```

### 1. Primer paso:  
Una vez ubicado en la carpeta bien ubicada debes clonar este repositorio con el siguiente comando en terminal:

```bash
    git clone https://github.com/Px135/fast_config
```

### 2. Segundo paso:
Accede a la carpeta del repositorio llamada **"fast_config"** para esto tines 2 opciones, la primera es dar click derecho dentro de la carpeta donde se ven todos los configs y presionar **"Abrir terminal aqui"** o ejecutar:

```bash
    #Deberas acceder a la carpeta del repositorio
    cd fast_config
    
    #Esto solo es una comprobación de que estas en la carpeta correcta debes ver los archivos .jsonc, una carpeta llamada Img-fast y 2 scripts
    ls
```

### 3. Tercer paso: 
Una vez comprobada la carpeta deberas dar permiso de ejecusion al archivo **install.sh** y ejecutarlo con los siguientes comandos:

```bash
    #Si desconfias de los procesos el codigo es totalmente visible con nano o algun editor de texto
    
    #Comando para darle permiso de ejecusion con sudo
    chmod +x install.sh

    #Despues de ejecutar deberas ejecutar el install con el siguiente comando 
    ./install.sh
```

* **(｡•́︿•̀｡) Información Crítica:** Una ves instalado muestra datos sobre tu CPU, GPU dedicada, uso exacto de memoria, almacenamiento, fuentes de terminal, entornos de intérprete de comandos activos de forma limpia y puede mostrar tu IP publica y local si descomentas las lineas que se encargan de ello, si lo haces es **Bajo tu responsabilidad** si lo muestras a alguien más o si lo muestras a grupos grandes así que es preferible que no lo hagas.

---

## Previsualización (⸝⸝⸝-﹏-⸝⸝⸝)

Aquí tienes unas muestras de cómo luce la configuración en acción:

<p align="center">
  <img src="https://i.imgur.com/yeVXRNH.png" alt="Fastfetch Preview" width="800">
</p>
<p align="center">
  <img src="https://i.imgur.com/Sv65wHk.png" alt="Fastfetch Preview" width="800">
</p>
<p align="center">
  <img src="https://i.imgur.com/A8eZscj.png" alt="Fastfetch Preview" width="800">
</p>
<p align="center">
  <img src="https://i.imgur.com/zqhSZln.png" alt="Fastfetch Preview" width="800">
</p>

*(Nota: Esta es mi configuración pero tu puedes reemplazar la imagen por defecto con cualquier ilustración o logo ASCII de tu elección).*

---

## Post instalación ╮(︶︿︶)╭

### 1. Opcional （・□・；）

Crear un alias para rotar los configs sin cerrar la terminal y/o probar las modificaciones realizadas, para esto debes hacer lo siguiente:

```bash
    #Debes ubicar tu interpretador de terminal (zsh, bash, fish, etc.)
    echo "$SHELL" 
```
Una vez ubicado ejecutaras lo siguiente para entrar al archivo de configuración: (Si tienes otro interpretador te tocara investigar)
```bash
    #Zsh
    nano ~/.zshrc
    
    #Bash
    nano ~/.bashrc

    #Nota si no tienes nano pones el mismo comando que con git pero cambias por nano, ejemplo:
    sudo pacman -S nano
```

Estando en el archivo de configuración vas hasta abajo **LITERALMNET HASTA LO ULTIMO DEL ARCHIVO** y ahi pondras

```bash
    #"nombre" es un ejemplo, le puedes poner el nombre que quieras ademas si manualmente modificaste el nombre o la ruta
    #te toca ajustarlas para que coincidan 
    alias nombre='~/.local/bin/script01.sh'

    #Despues recarga la configuración con
    source ~/.zshrc
    o
    source ~/.bashrc
```
Y por ultimo prueba ejecutar el comando con el nombre que le pusiste.

### 2. Personalización ( ´ ▽ ` )b
Si abres cualquiera de los **configs.jsonc (config1.jsonc, config2.js, etc,)** con Visual Studio, nano, Vim, NeoVim o cualquier editor de texto de tu preferencia podras ver todos los archivos **documentados** para que puedas modificar sin ningun problema y ademas aprendas como fncionan por si quieres hacer personalizaciónes propias.

---
# Creditos (≧◡≦)
## Principalmente a todos los colaboradores de [Fastfetch](https://github.com/fastfetch-cli/fastfetch) (≧◡≦).
* Los configs originalmente son de su repositorio, especificamente del apartado **prests > examples** yo solo modifique esos archivos para desglosar una mayor documentación y modificar los elementos para guiar en su personalización
## zakerh ≽^•⩊•^≼
Un youtuber del cual me inspire para este proyecto y del cual tome una parte de sus scripts, pueden ver el video de [zakerh](https://youtu.be/JNnBq2nwz7s?si=eYXpVxv7paxsR4Pn) o su propio [repositorio](https://github.com/zakf4-blip/fastfetch-carousel).
