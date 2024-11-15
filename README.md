## my-app: Chart de Helm para Despliegue Modular de Aplicaciones

Este proyecto proporciona un **Chart de Helm** llamado **my-app** para el despliegue de una aplicación modular que consta de componentes de **frontend**, **backend** y **base de datos**. Cada componente está encapsulado en un **sub-chart**, permitiendo una gestión escalable y reutilizable.

## Tabla de Contenidos

*   [Descripción](#descripci%C3%B3n)
*   [Estructura del Chart](#estructura-del-chart)
*   [Requisitos Previos](#requisitos-previos)
*   [Instalación](#instalaci%C3%B3n)
*   [Configuración](#configuraci%C3%B3n)
    *   [Frontend](#frontend)
    *   [Backend](#backend)
    *   [Base de Datos](#base-de-datos)
*   [Escalado Independiente](#escalado-independiente)
*   [Persistencia de Datos](#persistencia-de-datos)
*   [Validación y Pruebas](#validaci%C3%B3n-y-pruebas)
*   [Buenas Prácticas y Soporte](#buenas-pr%C3%A1cticas-y-soporte)
*   [Contribución](#contribuci%C3%B3n)
*   [Licencia](#licencia)

## Descripción

El Chart **my-app** utiliza Helm para simplificar la gestión y despliegue de aplicaciones complejas en Kubernetes. Mediante el uso de sub-charts, facilita la modularización y reutilización del código, permitiendo que cada componente pueda ser escalado y configurado de forma independiente. Además, sigue las convenciones de la comunidad open-source, lo que facilita el soporte y la colaboración.

## Estructura del Chart

perl

Copiar código

`my-app/ ├── Chart.yaml ├── values.yaml ├── charts/ │   ├── frontend/ │   │   ├── Chart.yaml │   │   ├── values.yaml │   │   └── templates/ │   │       ├── deployment.yaml │   │       ├── service.yaml │   │       └── _helpers.tpl │   ├── backend/ │   │   ├── Chart.yaml │   │   ├── values.yaml │   │   └── templates/ │   │       ├── deployment.yaml │   │       ├── service.yaml │   │       └── _helpers.tpl │   └── database/ │       ├── Chart.yaml │       ├── values.yaml │       └── templates/ │           ├── deployment.yaml │           ├── service.yaml │           ├── persistentvolumeclaim.yaml │           └── _helpers.tpl`

## Requisitos Previos

*   **Helm 3** instalado en tu máquina local.
*   Acceso a un **clúster de Kubernetes** donde desplegar la aplicación.
*   Permisos adecuados para crear recursos en el clúster.

## Instalación

**Clonar el repositorio** o copiar el directorio del Chart **my-app** en tu máquina local.

**Actualizar las dependencias** del Chart:

**Desplegar el Chart** en tu clúster de Kubernetes:

Reemplaza `my-release` con el nombre que desees para tu release.

## Configuración

El Chart es altamente configurable a través del archivo `values.yaml`. A continuación, se detallan las configuraciones disponibles para cada componente.

### Frontend

*   **replicaCount**: Número de réplicas del frontend.
*   **image.repository**: Repositorio de la imagen del contenedor del frontend.
*   **image.tag**: Etiqueta de la imagen.
*   **service.type**: Tipo de servicio (por ejemplo, `ClusterIP`, `NodePort`, `LoadBalancer`).
*   **service.port**: Puerto en el que el servicio estará disponible.

### Backend

*   **replicaCount**: Número de réplicas del backend.
*   **image.repository**: Repositorio de la imagen del contenedor del backend.
*   **image.tag**: Etiqueta de la imagen.
*   **service.type**: Tipo de servicio.
*   **service.port**: Puerto en el que el servicio estará disponible.

### Base de Datos

*   **replicaCount**: Número de réplicas de la base de datos (generalmente 1 para bases de datos).
*   **image.repository**: Repositorio de la imagen del contenedor de la base de datos.
*   **image.tag**: Etiqueta de la imagen.
*   **service.type**: Tipo de servicio.
*   **service.port**: Puerto en el que el servicio estará disponible.
*   **persistentVolumeClaim.accessModes**: Modos de acceso del volumen (por ejemplo, `ReadWriteOnce`).
*   **persistentVolumeClaim.resources.requests.storage**: Cantidad de almacenamiento solicitada (por ejemplo, `1Gi`).

### Personalización

Puedes personalizar los valores creando un archivo `my-values.yaml` y sobrescribiendo los valores predeterminados:

yaml

Copiar código

`frontend:  replicaCount: 3  image:    repository: tu-repositorio/frontend    tag: "v2.0.0" backend:  replicaCount: 2  image:    repository: tu-repositorio/backend    tag: "v2.0.0" database:  image:    repository: postgres    tag: "13"  persistentVolumeClaim:    resources:      requests:        storage: 5Gi`

Luego, instala el Chart usando tu archivo de valores personalizado:

bash

Copiar código

`helm install my-release my-app/ -f my-values.yaml`

## Escalado Independiente

Cada componente puede escalarse de forma independiente modificando el valor `replicaCount` correspondiente en `values.yaml` o utilizando el comando `helm upgrade`:

bash

Copiar código

`helm upgrade my-release my-app/ --set frontend.replicaCount=5`

## Persistencia de Datos

El componente de **base de datos** utiliza un `PersistentVolumeClaim` para garantizar la persistencia de los datos:

*   **persistentVolumeClaim.accessModes**: Define cómo se puede acceder al volumen.
*   **persistentVolumeClaim.resources.requests.storage**: Especifica la cantidad de almacenamiento necesaria.

Asegúrate de que tu clúster de Kubernetes tenga provisionamiento dinámico de volúmenes o configura manualmente un `PersistentVolume` que satisfaga el `PersistentVolumeClaim`.

## Validación y Pruebas

**Validar el Chart**:

**Renderizar las plantillas** para verificar la configuración:

**Desplegar en un entorno de prueba** antes de producción para asegurar que todo funcione correctamente.

## Buenas Prácticas y Soporte

Este Chart sigue las **buenas prácticas de Helm y Kubernetes**, incluyendo:

*   Uso de **sub-charts** para modularidad y reutilización.
*   Definición de **valores configurables** en `values.yaml`.
*   **Plantillas documentadas** con comentarios claros.
*   **Etiquetado y anotaciones** siguiendo las convenciones estándar.

Al seguir estas prácticas, facilitamos el soporte y la colaboración con la comunidad open-source.

## Contribución

Las contribuciones son bienvenidas. Por favor, sigue estos pasos:

1.  **Fork** del repositorio.
2.  Crea una **rama** para tu característica o corrección (`git checkout -b feature/nueva-funcionalidad`).
3.  **Realiza los cambios** y asegúrate de que el Chart sigue siendo válido (`helm lint`).
4.  **Haz un commit** de tus cambios (`git commit -am 'Agrega nueva funcionalidad'`).
5.  **Empuja** la rama (`git push origin feature/nueva-funcionalidad`).
6.  Abre un **Pull Request**.

## Licencia

Este proyecto está licenciado bajo la Licencia MIT.

bash

Copiar código

`helm template my-release my-app/`

bash

Copiar código

`helm lint my-app/`

bash

Copiar código

`helm install my-release my-app/`

bash

Copiar código

`helm dependency update my-app/`