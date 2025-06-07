# app_template

Plantilla base para el desarrollo de aplicaciones móviles en Flutter de Superlikers.

## Guía de inicio

Este proyecto es una plantilla preconfigurada que proporciona una estructura inicial para el desarrollo ágil de aplicaciones en Flutter, incorporando varias funcionalidades y herramientas esenciales.

### Contenido del proyecto

1. Estructura inicial de las capas `domain` e `infrastructure`, con implementaciones base para autenticación (Auth) y gestión de contenido (Blog).
2. Protección de rutas implementada para controlar el acceso según el estado de autenticación.
3. Configuración de notificaciones push para plataformas Android e iOS.
4. Pantallas y vistas básicas predefinidas para una experiencia inicial funcional.
5. Conjunto de widgets reutilizables listos para uso inmediato.
6. Integración de autenticación biométrica mediante plugin compatible.
7. Configuración de `SharedPreferences` para almacenamiento local de tokens.
8. Inclusión de `Isar` como solución de base de datos local, lista para usar.

## Configuración del proyecto

1. Ejecutar `flutter pub get` para instalar las dependencias necesarias.
2. El proyecto incluye una configuración de notificaciones basada en un proyecto de Firebase anterior.  
   **¡Importante!** Para utilizar esta plantilla correctamente:
   - Crear un nuevo proyecto en Firebase.
   - Reemplazar el contenido del archivo `firebase_options.dart` con los datos del nuevo proyecto.
3. Cambiar el nombre de la aplicación según el proyecto.  
   Esto se puede hacer con la dependencia `change_app_package_name` (ya incluida).  
   Consultar la [documentación oficial](https://pub.dev/packages/change_app_package_name) para más información.
4. Personalizar el ícono de la aplicación utilizando la dependencia `flutter_launcher_icons` (ya incluida).  
   Revisar la [documentación oficial](https://pub.dev/packages/flutter_launcher_icons) para su configuración.

## Consideraciones importantes

- Si el proyecto falla al compilar debido a la falta de configuración de Firebase (por ejemplo, con errores relacionados a FCM o notificaciones), realizar los siguientes pasos:

  1. Tener instalado `flutterfire_cli` e iniciar sesión con la cuenta que tenga acceso al proyecto en Firebase.
  2. Ejecutar el comando:  
     ```bash
     flutterfire configure
     ```
  3. Seleccionar el proyecto, elegir las plataformas deseadas (Android/iOS) y completar la configuración.
  4. Esto generará automáticamente el archivo `firebase_options.dart`, además de **descargar y ubicar correctamente el archivo `google-services.json`**, requerido para compilar en Android.

### Advertencia Android

Si no se encuentra el archivo `google-services.json`, el proyecto **no podrá compilar en Android**. Asegúrate de que este archivo esté ubicado en: android/app/google-services.json

### Advertencia para iOS

En proyectos iOS puede aparecer relacionado con el APN al utilizar Firebase Messaging:

Este error indica que el token APNS aún no está disponible. Asegúrate de:

- Solicitar correctamente los permisos para recibir notificaciones push.
- Llamar explícitamente a `getAPNSToken()` después de que el usuario haya concedido los permisos.
- Verificar que el proyecto esté correctamente configurado en Firebase y Apple Developer Console, incluyendo los certificados de notificación push.

---

Para más información sobre buenas prácticas de desarrollo con Flutter, consulta la [documentación oficial de Flutter](https://docs.flutter.dev/).
