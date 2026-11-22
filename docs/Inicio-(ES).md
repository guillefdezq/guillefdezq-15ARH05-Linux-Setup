$$\Huge{\text{¡Bienvenido a la wiki de LucidTypist-s-15ARH05-Linux-Guide!}}$$

$$\textit{Una guía unificada de instalación y trucos usado para instalar Linux en el portatil Lenovo legion 5 (15ARH05)}$$

# Un pequeño aviso
- Este repositorio está siendo escrito haciendo uso de varias guías de GitHub y de otras Wikis. Se añadirán referencias para más información.
- Estará esencialmente centrado en (pero puede cumplirse en otras circunstancias)):
  - Distros basadas en Arch (_ArchLinux_, _Endeavour_ and _Manjaro_), _Fedora_ y distros basadas en Ubuntu (_Pop_OS_!).
  - Escritorio de Gnome ([Veo que usas Gnome](https://youtu.be/rKHIhzXNNEY?t=59)).
  - Lenovo Legion 5 laptop, modelo 15ARH05, que lleva:
    - CPU Ryzen 7 4800H con Radeon Graphics
    - Nvidia Geforce GTX 1650 (TI?/para portátiles)
- **Software no libre será usado**, sólamente para los [drivers de NVIDIA](https://youtu.be/yLBuyL7vgWU?t=16)...
- Secciones o párrafos con:
  - un 📝 emoji de redacción emoji significa que la escritura está planificada.
  - un 🛂 emoji de control de pasaporte significa que la documentación debe ser revisada.
  - un 🚨 emoji de luz de coche de policía significa que la información puede ser imprecisa o que requiere de revisión.
- Voy a tratar de hacer que se ría mientras realiza todo este proceso.
- Por favor, [abra hilos en la sección de problemas pulsando aquí](https://github.com/lucidtyper/LucidTypist-s-15ARH05-Linux-Guide/issues/new) si encuentras algún problema, erratas, tienes sugerencias, o quieres hablar/debatir de cualquier cosa.

# Vamos a ello
Si estás leyendo esta publicación, estoy casi seguro que tienes experiencia utilizando ordenadores, así que entiendo que no hace falta que te explique cómo poner una imagen de un sistema Linux en un pendrive e instalarlo en un ordenador. El sistema de instalación es el mismo que en un ordenador normal, salvo que, como recomendación, arranques el ordenador y realices la instalación haciendo uso del "modo híbrido" para los recursos gráficos; en el "modo discreto" va a funcionar también, pero es muy probable que cuando acabes la instalación falten controladores de la tarjeta gráfica integrada. También hay que desactivar el arranque seguro y el inicio rápido si también usas Windows y quieres mirar sus particiones desde Linux.

# ¿Por qué el vídeo de la pantalla externa está convulsionando?
> 📝 Hace falta instalar los controladores que dan envidia.
Hasta que no se instalan los controladores envidiosos, la pantalla va a hacer cosas raras. Te recomiendo que instales los controladores no libres. Voy a mostrar cómo se instalan en los sistemas que suelo utilizar. 
> 🚨 ¡Ah!, por cierto: X11 funciona mejor para seleccionar el controlador que quieres utilizar y para pantallas con diferentes tasas de refresco. También recomiendo asegurarte de que se ha activado con `envycontrol -q` que realmente se está en modo `hybrid` y reiniciar un par de veces hasta que la pantalla externa funcione.

## Ubuntu 🚨
Si la memoria no me falla, se tiene que hacer uso del apartado de "Software y Drivers" o algo así.

## Pop_OS!
Haz uso de la imagen que proporcionan con la edición de Nvidia.

## Fedora
Asegúrate de usar el último kernel de Linux, poniendo el siguiente comando y reiniciando:
```bash
sudo dnf update -y # and reboot if you are not on the latest kernel
```
Ahora, abre dos terminales. En la primera inserta lo siguiente para que se instalen los controladores:
```bash
sudo dnf install akmod-nvidia # rhel/centos users can use kmod-nvidia instead
sudo dnf install xorg-x11-drv-nvidia-cuda #optional for cuda/nvdec/nvenc support
```
Y en la segunda inserta lo siguiente para reiniciar cuando se termine de instalar correctamente:
```
watch -g modinfo -F version nvidia; sleep 10; reboot
```
> 🛂 En la [documentación original en inglés](https://rpmfusion.org/Howto/NVIDIA#Current_GeForce.2FQuadro.2FTesla) se encuentra el motivo por el que se tienen que escribir todas estas órdenes.

## Arch Linux 🚨
Si utilizas el script de archinstall oficial, selecciona nvidia (privativo).

## Manjaro
Utiliza los ajustes de Manjaro para instalar los drivers desde aquí: tienes que seleccionar únicamente el driver no libre de nvidia (sólo el que pone Nvidia, ni prime, ni amd ni nada) y todos los drivers libres que aparecen de AMD.

## Endeavour
Este sistema operativo tiene un script/asistente (que por lo menos yo he tenido que descargar desde yay) instalar los controladores de Nvidia. Simplemente hay que poner en la terminal `nvidia-inst` y automáticamente se instalan todos los controladores. 🧙🏻

# Echo de menos Lenovo Vantage / Lenovo Legion Toolkit... y otros programas
Consulta las siguientes guías:
- Para limitar la carga de la batería:
   - https://github.com/cszach/linux-on-lenovo-legion?tab=readme-ov-file#battery-conservation-mode
   - https://github.com/cszach/linux-on-lenovo-legion/blob/main/src/battery-conservation
- [Software para personalizar la iluminación del teclado](https://github.com/4JX/L5P-Keyboard-RGB)
- [Software para modificar las curvas de velocidad del ventilador](https://github.com/johnfanv2/LenovoLegionLinux)

# El brillo de la pantalla interna no cambia cuando intento bajar la intensidad.
A día de hoy, usando el kernel 6.6 en adelante, no debería ocurrir este problema. En cualquier caso, el problema se debería solucionar actualizando el kernel del ordenador. Si no es posible, hago referencia a las siguientes guías:
- [cszach/linux-on-lenovo-legion#Brightness](https://github.com/cszach/linux-on-lenovo-legion?tab=readme-ov-file#brightness)
- [antony-jr/lenovo-legion5-15arh05-scripts/AMDGPUFIX](https://github.com/antony-jr/lenovo-legion5-15arh05-scripts/tree/main/AMDGPUFIX)

# Casos raros y más documentación
En los siguientes repositorios que pongo, hay algunos casos extra que convendría revisar, y aprovecho para mencionar que son buenísimos recursos que me han ayudado a lo largo de los años a instalar Linux:
- https://github.com/cszach/linux-on-lenovo-legion
- https://github.com/wottreng/Linux-Mint-on-Lenovo-Legion-5
- https://github.com/antony-jr/lenovo-legion5-15arh05-scripts