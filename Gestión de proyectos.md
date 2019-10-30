# Gestión de proyectos

### `git`, `GitHub`, `GitKraken`

<img style="float: left; margin: 15px 15px 15px 15px;" src="http://conociendogithub.readthedocs.io/en/latest/_images/Git.png" width="180" height="50" />
<img style="float: left; margin: 15px 15px 15px 15px;" src="https://c1.staticflickr.com/3/2238/13158675193_2892abac95_z.jpg" title="github" width="180" height="50" />
<img style="float: left; margin: 15px 15px 15px 15px;" src="https://www.gitkraken.com/downloads/brand-assets/gitkraken-keif-teal-sq.png" title="gitkraken" width="180" height="50" />

## Qué es `git`
<img style="float: right; margin: 15px 15px 15px 15px;" src="http://conociendogithub.readthedocs.io/en/latest/_images/Git.png" title="git" width="180" height="50">

- *Software* de código aberto.

- Control de versiones.

- Lleva registro de los cambios en los archivos.

- Coordina el trabajo que varias personas realizan sobre archivos compartidos.


#### Referencas

- Documentación oficial de `git`: https://git-scm.com/doc
- Control de versiones wiki: https://es.wikipedia.org/wiki/Control_de_versiones
- `git` wiki: https://es.wikipedia.org/wiki/Git
- Tutorial git: https://try.github.io/
- Tutorial branching en `git`: http://learngitbranching.js.org


## Qué es `GitHub`
<img style="float: right; margin: 15px 15px 15px 15px;" src="https://c1.staticflickr.com/3/2238/13158675193_2892abac95_z.jpg" title="git" width="180" height="50">

- Ofrece servicios de *hosting* para repositorios git.

> Con `git` trabajas control de versiones de manera local.
>
> Usando `git` y `Github` en conjunto, trabajas de forma remota con archivoos compartidos.


#### Referencias:
- Página oficial de `GitHub`: https://github.com
- http://conociendogithub.readthedocs.io/en/latest/data/introduccion/


## Tutorial de GitHub
- https://guides.github.com/activities/hello-world/


## ¿Qué es `GitKraken`?
<img style="float: right; margin: 15px 15px 15px 15px;" src="https://www.gitkraken.com/downloads/brand-assets/gitkraken-keif-teal-sq.png" title="git" width="180" height="50">

- Es la interfaz gráfica de `git` para usarlo con `GitHub`

`git` viene con algunas herramientas *GUI* (Graphical User Interface) por defecto con su instalación. Aún así, existen varias GUI desarrolladas por otras compañías para brindar una experiencia más cómoda según el sistema operativo.

`GitKraken` es entonces una de estas GUI, **gratuita para el uso no comercial**, que tiene versiones para los sistemas operativos *Windows*, *Mac* y *Linux*.


Referencias:
- https://git-scm.com/downloads/guis
- https://support.gitkraken.com/getting-started/guide


### Primeros pasos con `GitKraken`

1. Descargar e instalar `GitKraken`.
2. Abrir `GitKraken`. Cuando nos pida autenticación, nos autenticamos con la cuenta existente de `GitHub`.
3. Ir a la pestaña superior derecha de *Preferences* para ver *Profiles* (por defecto el de GitHub) y *Authentication*.
    - En *Authentication*, como estamos autenticados con `GitHub` ya deberíamos estar conectados.
    - Picarle en *Generate SSH key and add to GitHub*. Esto nos ahorrará estarnos autenticando en `GitHub` para cuando queramos actualizar el repositorio remoto.
    - En la parte superior izquierda picarle en *Exit Preferences*.
4. Picarle a la carpeta en la esquina superior izquierda. Tres opciones:
    - *Open*: abrir un repositorio local ya existente.
    - ** *Clone*: clonar un repositorio remoto.**
    - *Init*: empezar a hacer control de versiones en un proyecto desde cero.
5. Picarle en *Clone*. Como ya estamos autenticados en `GitHub`, aparecerán todos los repositorios disponibles en nuestra cuenta de `GitHub` (en este caso solo tendremos `hello-world`).
    - En *Browse*, buscar el directorio/carpeta donde quieren que el repositorio sea clonado.
    - Picar en `hello-world`.
    - Picar en *Clone the repo*.
6. Abrir el directorio `hello-world`, modificar el archivo `README.md` y guardar los cambios.
    - Cuando volvamos a `GitKraken`, veremos que se ha actualizado la modificación.
    - Picamos en el paso de la actualización y en la derecha veremos el archivo modificado.
    - Picamos en `README.md` y podremos ver la modificación que hicimos en el archivo.
    - Antes de llevar a cabo los cambios, ir al repositorio remoto en `GitHub` y ver que el archivo `README.md` no se ha modificado. Solo clonamos los archivos en el repositorio local.
    - Volvemos a `GitKraken`, picamos en *Stage file* y comentamos los cambios.
    - Picar en *Commit*.
7. Revisar el arbol de cambios. Hay un ícono que revela hasta donde están los cambios en `GitHub` y el otro revela que vamos un paso más adelante en el repositorio local. Este cambio aún no se hace en el repositorio remoto en `GitHub`.
8. Para sincronizar los cambios en el repositorio de `GitHub` debemos picar en *Push* en la parte superior. Los íconos deberían juntarse.
9. Ir a `GitHub` y ver que el cambio en efecto se realizó.
10. Estando en `GitHub` en el repositorio `hello-world`, picar en *Create new file*.
    - Normalmente la gente no crea ni edita archivos en `GitHub`, sin embargo esta será nuestra forma de emular que alguien incluyó un nuevo archivo en nuestro proyecto.
    - Darle algún nombre al archivo y poner algo en el cuerpo de texto.
    - Poner un mensaje describiendo que se añadió un nuevo archivo.
    - Picar en *Commit new file*.
    - Ver que en el repositorio remoto en `GitHub` ya existe el nuevo archivo, pero en el repositorio local no.
11. Revisar el arbol de cambios en `GitKraken`. Vemos que ahora el ícono que revela los cambios en `GitHub` va un paso adelante del ícono que revela los cambios en el repositorio local.
12. Para incorporar los cambios del repositorio remoto en el repositorio local debemos picar en *Pull* en la parte superior. De nuevo, los íconos deberían juntarse.
13. Revisar el repositorio local para ver que el nuevo archivo ya está ahí.


#### Ejercicio
>Añadir un archivo nuevo creando un *Branch* en **GitKraken**


___
## Forking
Una bifurcación (*fork*) es una copia de un repositorio. Bifurcar un repositorio te permite experimentar cambios libremente sin afectar el proyecto original.

Existen varias aplicaciones del *Forking*:

### Seguir un proyecto de otra persona
Como ejemplo, van a seguir el proyecto de la asignatura **Informatica-I**.

Los siguientes pasos nos enseñarán como mantener nuestro repositorio local actualizado con el repositorio de la asignatura.
1. Entrar al repositorio https://github.com/ArellanoMCarlos/Informatica-I.
2. En la esquina superior derecha, dar click en *fork* y esperar un momento. Esta acción copia en su cuenta de `GitHub` un repositorio idéntico al de la materia (con el mismo nombre).
3. Desde `GitKraken`, clonar el repositorio (el que ya está en su cuenta).
4. En la pestaña *REMOTE* dar click en el signo `+`.
    - Picar en `GitHub`.
    - Desplegar la pestaña y elegir esjimenezro/SimMat2018-1.
    - Picar en *Add remote*.
5. <font color=red>Añadiré un nuevo archvo en el repositorio de la materia y ustedes verán qué pasa en `GitKraken`</font>.
6. Arrastrar el repositorio remoto ajeno a la rama *master* y dar click en la opción *Merge ArellanoMCarlos/master into master*. Ya el repositorio local está actualizado.
7. Para actualizar el repositorio remoto propio hacer un *push*.

### Proyectos colaborativos
Normalmente, los *forks* se usan para proponer cambios en el proyecto de otra persona (hacer proyectos colaborativos).

<font color=red>Hacer un cambio en el repositorio propio y mostrar como hacer el *pull request* y el *merge*</font>.

**Referencias:**
- https://help.github.com/articles/fork-a-repo/
- https://guides.github.com/activities/forking/
