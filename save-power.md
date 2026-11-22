# SAVE POWER
## Documento de visión y análisis preliminar de requisitos

**Versión:** 0.1 — Borrador de trabajo  
**Fecha:** 22 de noviembre de 2026  
**Estado:** Work in Progress (WIP) — Fase de descubrimiento y definición del problema  
**Referencia metodológica:** Memoria del Trabajo Fin de Grado «Desarrollo de una aplicación web para la gestión de cursos online con módulo de recomendación».

> **Aviso — Work in Progress (WIP) y uso de inteligencia artificial**
>
> Este proyecto se encuentra en desarrollo activo, por lo que su documentación, requisitos y decisiones técnicas están sujetos a revisión y evolución.
>
> Se utilizan herramientas de inteligencia artificial como apoyo para agilizar la investigación, estructurar la documentación y organizar la información del repositorio. No obstante, las decisiones técnicas y arquitectónicas adoptadas son investigadas, contrastadas y revisadas por el autor, quien asume la responsabilidad de su justificación y aplicación.
>
> El proyecto se fundamenta, además, en la experiencia acumulada por el autor durante **7 años de uso de sistemas Linux** y **5 años de formación en el Grado en Ingeniería Informática**.

---

# 1. Introducción

## 1.1. Descripción del proyecto

Save Power es un proyecto personal de ingeniería del software cuyo propósito es investigar, diseñar, implementar y evaluar un entorno de escritorio para Linux, centrado en la eficiencia de interacción, la reducción del consumo de recursos y la minimización del esfuerzo de mantenimiento.

El proyecto surge de la necesidad de disponer de un entorno gráfico que permita gestionar aplicaciones y ventanas de forma rápida, sencilla y predecible, priorizando las interacciones mediante teclado y manteniendo la compatibilidad con herramientas gráficas convencionales.

No se establece inicialmente la obligación de desarrollar un gestor de ventanas propio. La decisión entre adoptar, configurar, extender o implementar una solución se tomará tras un análisis de alternativas y viabilidad técnica.

## 1.2. Antecedentes y experiencia previa

El usuario cuenta con experiencia utilizando distintos entornos de escritorio y gestores de ventanas, entre ellos KDE, GNOME, i3 y Hyprland.

GNOME destacó por su sencillez y facilidad de utilización durante un periodo prolongado.

Posteriormente, Hyprland proporcionó una experiencia especialmente satisfactoria gracias a su minimalismo, su gestión mediante teclado y sus posibilidades de personalización.

Sin embargo, su utilización también puso de manifiesto diversos inconvenientes:

- Esfuerzo considerable de configuración e integración manual.
- Necesidad de mantener copias de seguridad de la configuración.
- Problemas de estabilidad asociados a determinadas actualizaciones.
- Incompatibilidades ocasionadas por cambios en los controladores gráficos o en la sintaxis de configuración.
- Tiempo adicional dedicado a recuperar el funcionamiento del entorno.

Estas dificultades motivan la búsqueda de una solución que preserve las ventajas de los gestores minimalistas sin reproducir sus problemas de mantenimiento.

## 1.3. Problema a resolver

El problema principal consiste en encontrar un equilibrio entre cuatro propiedades:

1. Eficiencia de interacción con el sistema.
2. Bajo consumo de recursos computacionales.
3. Estabilidad y facilidad de mantenimiento.
4. Personalización y adaptación a los flujos de trabajo del usuario.

Los entornos de escritorio completos proporcionan integraciones y funcionalidades convenientes, pero pueden incorporar componentes innecesarios para determinados escenarios.

Por otra parte, los gestores minimalistas ofrecen mayor control, aunque pueden trasladar al usuario responsabilidades adicionales de integración, configuración y mantenimiento.

Save Power pretende investigar si es posible combinar las ventajas de ambas aproximaciones sin incrementar innecesariamente la complejidad técnica ni cognitiva.

# 2. Filosofía y principios de diseño

## 2.1. Lema del proyecto

**Save Power — Less computing. Less thinking. Less maintenance.**

El concepto de eficiencia comprende tres dimensiones:

**Eficiencia computacional:** reducción del consumo innecesario de CPU, memoria y energía.

**Eficiencia cognitiva:** reducción del esfuerzo mental, las distracciones, las decisiones repetitivas y las interacciones necesarias para completar tareas.

**Eficiencia de mantenimiento:** reducción del tiempo y esfuerzo requeridos para configurar, actualizar, reparar y recuperar el entorno.

## 2.2. Principios fundamentales

- *Keyboard-first, mouse-compatible:* priorizar el teclado manteniendo la compatibilidad con el ratón.
- *Predictability over automation:* favorecer comportamientos consistentes y comprensibles.
- *Minimal cognitive overhead:* minimizar la complejidad de interacción y memorización.
- *Stability over novelty:* priorizar la estabilidad frente a funcionalidades experimentales.
- *Minimalism without sacrificing functionality:* eliminar elementos superfluos sin perder capacidades necesarias.
- *Reproducibility by design:* favorecer configuraciones reproducibles, versionadas y recuperables.

## 2.3. Identidad visual

Se plantea una estética inspirada en terminales UNIX, estaciones de trabajo clásicas y sistemas informáticos retro.

Se priorizarán interfaces sobrias, información relevante, coherencia visual y herramientas CLI/TUI cuando resulten apropiadas.

La estética retro no deberá limitar el uso de aplicaciones GUI modernas ni imponer restricciones funcionales artificiales.

# 3. Objetivos del proyecto

## 3.1. Objetivo general

Analizar, diseñar, implementar y evaluar un entorno de gestión de ventanas para Linux que optimice la interacción mediante teclado, reduzca la carga cognitiva y computacional y favorezca la estabilidad, mantenibilidad y reproducibilidad, aplicando técnicas sistemáticas de ingeniería del software.

## 3.2. Objetivos específicos preliminares

**O1.** Investigar gestores de ventanas y compositores existentes, identificando sus arquitecturas, capacidades, limitaciones y posibilidades de extensión.

**O2.** Especificar los requisitos funcionales y no funcionales del entorno a partir de los flujos de trabajo reales del usuario.

**O3.** Diseñar un modelo de interacción híbrido que combine distribución automática de ventanas con control manual.

**O4.** Diseñar una organización flexible de espacios de trabajo que admita espacios persistentes, independientes y agrupaciones opcionales por proyecto.

**O5.** Evaluar alternativas técnicas mediante criterios de eficiencia, estabilidad, compatibilidad, complejidad y mantenimiento.

**O6.** Implementar una solución funcional, utilizando componentes existentes o desarrollos propios según la evaluación de viabilidad.

**O7.** Diseñar mecanismos de configuración reproducible, recuperación ante fallos y mantenimiento.

**O8.** Validar la solución mediante pruebas funcionales, técnicas y de usabilidad.

# 4. Perfil de uso y necesidades identificadas

## 4.1. Interacción

El teclado será el mecanismo principal de interacción.

El ratón permanecerá disponible para operaciones convencionales y como alternativa cuando resulte más cómodo utilizar una sola mano.

Se priorizarán interacciones rápidas, consistentes y fáciles de recordar.

## 4.2. Gestión de ventanas

**Decisión confirmada: modelo híbrido.**

El gestor distribuirá automáticamente las ventanas por defecto, permitiendo al usuario modificar su disposición cuando sea necesario.

Se contemplan las siguientes operaciones:

- Cambiar el foco entre ventanas.
- Mover y redimensionar ventanas.
- Cambiar entre diseños de distribución.
- Utilizar ventanas flotantes.
- Desplazar ventanas entre espacios de trabajo.
- Recuperar distribuciones automáticas después de modificaciones manuales.

Las operaciones deberán tener un comportamiento predecible y, cuando proceda, reversible.

## 4.3. Espacios persistentes

Se necesitan espacios fácilmente accesibles para aplicaciones y servicios frecuentes:

- Spotify.
- WhatsApp Web.
- Gmail.
- Google Calendar.
- Investing y herramientas de consulta financiera.

No se ha determinado todavía si cada aplicación tendrá un espacio exclusivo o si algunas compartirán uno.

La persistencia del espacio no implicará necesariamente mantener la aplicación ejecutándose permanentemente.

## 4.4. Espacios de trabajo asociados a actividades

El usuario utiliza diferentes espacios para separar las herramientas que participan en una actividad.

Como referencia, durante el desarrollo del TFG empleaba:

| Espacio | Herramienta | Función |
|---|---|---|
| Código | Visual Studio Code | Desarrollo |
| Pruebas | Navegador | Interfaz de la aplicación |
| Requisitos | GitHub o enunciado | Consulta y seguimiento |
| Memoria | Editor LaTeX | Elaboración de documentación |
| Documento compilado | Okular | Revisión del PDF |

Este patrón demuestra la importancia de mantener una organización espacial estable que facilite el cambio de contexto.

## 4.5. Organización de proyectos

**Propuesta pendiente de validación:** espacios independientes con agrupaciones de proyectos opcionales.

Los espacios constituirán las unidades fundamentales del sistema.

Las agrupaciones permitirán asociar varios espacios a una actividad o proyecto, sin convertir dicha asociación en obligatoria.

El modelo deberá permitir:

- Espacios globales accesibles permanentemente.
- Espacios independientes no asociados a proyectos.
- Agrupaciones opcionales por proyecto.
- Varios proyectos abiertos simultáneamente.
- Acceso directo a cualquier espacio independientemente de su grupo.

## 4.6. Navegación entre espacios

**Decisión confirmada: navegación combinada.**

Se utilizarán tres mecanismos complementarios:

1. Accesos directos para espacios frecuentes.
2. Navegación secuencial entre espacios relacionados.
3. Selector global para buscar espacios por nombre o función.

Se estudiará adicionalmente la posibilidad de alternar entre los últimos espacios utilizados.

Como hipótesis inicial, la navegación secuencial podría limitarse a los espacios de un grupo activo, manteniendo un mecanismo independiente de navegación global.

## 4.7. Configuración de monitores

**Decisión confirmada: diseño prioritario para un único monitor.**

El escenario habitual de utilización comprende:

- Pantalla integrada del portátil.
- Monitor externo grande.
- Uso excepcional de una segunda pantalla para dashboards o monitorización.

El diseño deberá funcionar correctamente con una sola pantalla y adaptarse a distintas resoluciones.

El soporte multimonitor se mantendrá como funcionalidad secundaria.

Se evitará, cuando sea posible, que la organización lógica de los espacios dependa de identificadores físicos de monitores.

# 5. Requisitos funcionales preliminares

| ID | Descripción | Prioridad |
|---|---|---|
| RF-01 | Distribución automática de ventanas | Obligatorio |
| RF-02 | Navegación entre ventanas mediante teclado | Obligatorio |
| RF-03 | Movimiento y redimensionamiento manual | Obligatorio |
| RF-04 | Cambio entre diseños de distribución | Obligatorio |
| RF-05 | Soporte para ventanas flotantes | Obligatorio |
| RF-06 | Movimiento entre espacios de trabajo | Obligatorio |
| RF-07 | Restauración de distribución automática | Deseable |
| RF-08 | Interacción alternativa mediante ratón | Deseable |
| RF-09 | Espacios persistentes | Obligatorio |
| RF-10 | Espacios asociados opcionalmente a proyectos | Obligatorio |
| RF-11 | Navegación directa entre espacios | Obligatorio |
| RF-12 | Reglas de asignación de aplicaciones | Obligatorio |
| RF-13 | Movimiento de ventanas entre espacios | Obligatorio |
| RF-14 | Identificación del espacio y grupo activos | Importante |
| RF-15 | Activación de agrupaciones de proyecto | Deseable |
| RF-16 | Recuperación de la organización de sesiones | Deseable |
| RF-17 | Accesos directos estables | Obligatorio |
| RF-18 | Navegación secuencial por espacios | Obligatorio |
| RF-19 | Selector de espacios | Obligatorio |
| RF-20 | Navegación local y global | Deseable |
| RF-21 | Regreso al espacio utilizado anteriormente | Importante |
| RF-22 | Identificadores estables de espacios | Importante |
| RF-23 | Funcionamiento completo con un monitor | Obligatorio |
| RF-24 | Adaptación a distintas resoluciones | Obligatorio |
| RF-25 | Utilización de monitor externo principal | Obligatorio |
| RF-26 | Soporte para segunda pantalla | Deseable |

*Las prioridades son preliminares. Los requisitos deberán revisarse para eliminar duplicidades y definir criterios de aceptación verificables.*

# 6. Requisitos no funcionales preliminares

| ID | Descripción | Prioridad |
|---|---|---|
| RNF-01 | Estabilidad frente a actualizaciones ordinarias | Crítico |
| RNF-02 | Recuperación de configuraciones funcionales | Crítico |
| RNF-03 | Consumo eficiente de recursos | Importante |
| RNF-04 | Bajo esfuerzo de mantenimiento | Crítico |
| RNF-05 | Baja carga cognitiva | Crítico |
| RNF-06 | Coherencia visual minimalista | Importante |
| RNF-07 | Independencia de identificadores físicos de monitor | Importante |
| RNF-08 | Adaptación sencilla al cambiar de pantalla | Importante |

Pendiente: definir métricas, umbrales, condiciones de prueba y mecanismos de verificación.

# 7. Arquitectura conceptual preliminar

Se propone investigar una separación entre tres responsabilidades:

**Gestión de ventanas y composición:** distribución, posicionamiento, foco, entrada y salidas gráficas.

**Gestión de espacios y contextos:** espacios persistentes, agrupaciones, navegación y asignación de aplicaciones.

**Configuración y recuperación:** versionado, despliegue reproducible, automatizaciones, validación y restauración.

Esta separación es conceptual y no implica que deban desarrollarse tres componentes independientes.

La arquitectura definitiva dependerá de las capacidades de los gestores evaluados y del coste de integración.

# 8. Alternativas de implementación

Se contemplan tres estrategias:

**A. Configuración de un gestor existente.** Personalización mediante configuraciones, scripts y herramientas complementarias.

**B. Extensión de una solución existente.** Incorporación de funcionalidades propias aprovechando bibliotecas o interfaces disponibles.

**C. Desarrollo de un gestor o compositor propio.** Implementación de las funcionalidades necesarias, con alcance condicionado por la viabilidad técnica.

La elección deberá justificarse mediante una evaluación multicriterio.

# 9. Evaluación y validación

El proyecto deberá comprobar tanto las capacidades técnicas como los beneficios reales para el usuario.

Se proponen los siguientes escenarios experimentales:

- Apertura de un entorno de desarrollo.
- Navegación entre código, pruebas y documentación.
- Localización de ventanas.
- Alternancia entre espacios frecuentes.
- Organización manual de ventanas.
- Cambio de pantalla principal.
- Actualización del entorno.
- Restauración después de un fallo.
- Reproducción de la configuración en una instalación limpia.

Posibles indicadores:

- Tiempo necesario para completar tareas.
- Número de acciones e interacciones.
- Errores de navegación.
- Carga cognitiva percibida.
- Consumo de CPU, RAM y energía.
- Tiempo dedicado al mantenimiento.
- Frecuencia de fallos y duración de la recuperación.

Las pruebas deberán realizarse bajo condiciones comparables y considerar el aprendizaje del usuario con cada alternativa.

# 10. Decisiones arquitectónicas propuestas

## ADR-001 — Organización de espacios de trabajo

**Estado:** Propuesta.

**Decisión:** utilizar espacios independientes con agrupaciones lógicas opcionales.

**Motivación:** mantener flexibilidad y permitir varios proyectos simultáneos sin imponer una estructura jerárquica rígida.

**Validación pendiente:** comprobar la complejidad de navegación, agrupación y mantenimiento mediante prototipos.

## ADR-002 — Arquitectura orientada a un único monitor

**Estado:** Propuesta.

**Decisión:** priorizar el funcionamiento con un único monitor y mantener soporte multimonitor secundario.

**Motivación:** adecuar el diseño al escenario habitual y evitar complejidad innecesaria.

**Validación pendiente:** comprobar el comportamiento al alternar entre la pantalla del portátil y un monitor externo, y al utilizar dos pantallas simultáneamente.

# 11. Riesgos preliminares

| Riesgo | Consecuencia |
|---|---|
| Complejidad excesiva de configuración | Incremento del mantenimiento |
| Dependencia de componentes inestables | Fallos tras actualizaciones |
| Exceso de atajos | Mayor carga cognitiva |
| Automatizaciones poco predecibles | Pérdida de control sobre las ventanas |
| Desarrollo propio demasiado ambicioso | Aumento desproporcionado del esfuerzo |
| Diferencias entre X11 y Wayland | Limitaciones de portabilidad |
| Restauración incompleta de sesiones | Pérdida del contexto de trabajo |
| Medición incorrecta de productividad | Conclusiones experimentales poco fiables |

# 12. Alcance inicial

El proyecto comprenderá:

- Investigación del estado del arte.
- Análisis y especificación de requisitos.
- Comparación de alternativas.
- Diseño de la solución.
- Implementación de un prototipo funcional.
- Configuración reproducible.
- Pruebas y evaluación de resultados.
- Documentación técnica de decisiones.

Quedarán inicialmente fuera del alcance:

- Desarrollo obligatorio de un compositor completo desde cero.
- Soporte avanzado para configuraciones multimonitor complejas.
- Compatibilidad universal con cualquier aplicación gráfica.
- Restauración perfecta del estado interno de todas las aplicaciones.
- Automatizaciones avanzadas no justificadas por requisitos.

Estos límites podrán modificarse tras el estudio de viabilidad.

# 13. Plan de trabajo preliminar

**Fase 1 — Descubrimiento y requisitos.** Definir necesidades, escenarios, restricciones y criterios de éxito.

**Fase 2 — Estado del arte.** Investigar X11, Wayland, modelos de tiling, compositores y arquitecturas relevantes.

**Fase 3 — Evaluación de alternativas.** Construir matrices comparativas y prototipos exploratorios.

**Fase 4 — Diseño.** Especificar arquitectura, modelo de interacción, organización de espacios y mecanismos de configuración.

**Fase 5 — Implementación.** Construir incrementalmente la solución seleccionada.

**Fase 6 — Validación.** Ejecutar pruebas funcionales, de rendimiento, estabilidad y usabilidad.

**Fase 7 — Conclusiones.** Evaluar el cumplimiento de objetivos, las limitaciones y las futuras líneas de desarrollo.

# 14. Cuestiones pendientes

Se deberán resolver durante las siguientes sesiones:

- Distribución Linux y hardware objetivo.
- Elección de X11 o Wayland y restricciones correspondientes.
- Gestores y compositores candidatos.
- Filosofía de asignación de atajos.
- Comportamiento de la navegación secuencial entre grupos.
- Gestión de ventanas flotantes y reglas por aplicación.
- Persistencia y restauración de sesiones.
- Gestión de configuraciones y mecanismos de recuperación.
- Herramientas CLI/TUI y GUI que deberán integrarse.
- Diseño visual y componentes de interfaz.
- Métricas y umbrales de aceptación.
- Viabilidad y alcance de un posible desarrollo propio.

# 15. Conclusión de la sesión

La primera sesión de análisis ha permitido concretar una visión inicial de Save Power como un entorno de escritorio Linux minimalista, centrado en la interacción mediante teclado y la gestión híbrida de ventanas.

Se ha identificado la necesidad de combinar espacios persistentes con espacios dinámicos o asociados a proyectos, incorporando navegación directa, secuencial y mediante selector.

También se ha establecido el uso de un único monitor como escenario principal, manteniendo la posibilidad de ampliar la configuración cuando resulte necesario.

La experiencia anterior con Hyprland ha puesto de manifiesto que la estabilidad y el mantenimiento son requisitos esenciales, y no simples consideraciones secundarias.

El proyecto pasa así de una idea general de cambio de gestor de ventanas a una propuesta de ingeniería del software con objetivos, requisitos, alternativas y criterios de evaluación preliminares.

**Próxima actividad:** elaboración del estado del arte y selección justificada de candidatos para evaluación técnica.

---

*Fin del borrador de la sesión 01 — Save Power, versión 0.1.*
