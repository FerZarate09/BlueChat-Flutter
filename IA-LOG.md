# 🤖 IA-LOG.md

## Prompt 1:
**Prompt:** “¿Cómo conecto dos teléfonos por Bluetooth en Flutter?”
**Respuesta (de la IA):**Para lograr la conexión entre dos teléfonos Android mediante Flutter, te expliqué que es necesario utilizar el paquete `flutter_bluetooth_serial`, el cual permite manejar conexiones Bluetooth clásicas de manera directa. Te detallé que uno de los teléfonos debe actuar como **servidor** (escuchando conexiones entrantes), mientras el otro funciona como **cliente** (buscando y conectándose al servidor mediante la dirección MAC).  

También te mostré cómo establecer la conexión usando: 
```dart
final connection = await BluetoothConnection.toAddress(address);

y cómo escuchar los datos recibidos con:

connection.input.listen((data) {
  print('Dato recibido: ${ascii.decode(data)}');
});


Además, te advertí que en Android 12 o superior se necesitan permisos adicionales como BLUETOOTH_CONNECT y BLUETOOTH_SCAN, y te guié para agregarlos correctamente en el archivo AndroidManifest.xml. Finalmente, te sugerí usar la app Serial Bluetooth Terminal (SBT) para hacer pruebas iniciales y verificar la comunicación antes de integrar todo en Flutter.

**Aprendizaje:** Aprendimos la estructura básica del chat Bluetooth y cómo escuchar conexiones, Con esta guía comprendiste cómo funciona la estructura básica de un chat Bluetooth, la relación entre cliente y servidor, y la forma en que los datos son enviados y recibidos entre los dispositivos..

---

## Prompt 2:
**Prompt:** “Por qué mi app se cierra cuando pulso el ícono de búsqueda?”
**Respuesta (resumen):** Analicé tu error y te expliqué que el cierre repentino se debía a la falta de permisos en tiempo de ejecución. La función getBondedDevices() del paquete flutter_bluetooth_serial requiere permisos de Bluetooth y ubicación activa.

Te guié paso a paso para solucionarlo: primero agregando los permisos correctos en el AndroidManifest.xml:

<uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />
<uses-permission android:name="android.permission.BLUETOOTH_SCAN" />
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />


Después, te mostré cómo solicitar esos permisos en ejecución usando el paquete permission_handler, envolviendo la función de búsqueda dentro de una validación de permisos y un bloque try-catch para evitar cierres inesperados.

Te enseñé también cómo verificar que el Bluetooth estuviera activado antes de ejecutar cualquier acción de búsqueda.

**Aprendizaje:** Entendimos cómo manejar los permisos en Android 12+ (`BLUETOOTH_CONNECT`, `BLUETOOTH_SCAN`).

---

## Prompt 3:
**Prompt:** “Cómo hago que un teléfono actúe como servidor?”
**Respuesta (resumen):** Te expliqué que, aunque el paquete flutter_bluetooth_serial permite escuchar conexiones, en muchos dispositivos Android puede fallar o requerir permisos especiales. Por ello, te propuse una solución más práctica y confiable: usar la aplicación Serial Bluetooth Terminal (SBT) como servidor externo.

Te detallé los pasos:

Abrir SBT en el teléfono que funcionará como servidor.

Activar el Bluetooth y dejar el dispositivo visible.

Esperar la conexión entrante desde el otro teléfono (cliente).

Desde tu app Flutter, buscar el dispositivo del servidor con el botón de búsqueda y conectarte a él.

También te mostré el código para enviar y recibir mensajes desde Flutter:

connection.output.add(Uint8List.fromList(utf8.encode("Hola desde BlueChat!")));
connection.input.listen((data) {
  print('Mensaje recibido: ${utf8.decode(data)}');
});


De esta forma lograste establecer la conexión real entre los dos teléfonos, uno actuando como servidor con SBT y el otro como cliente con BlueChat.

Esta parte fue clave, porque permitió comprobar que la app funcionaba correctamente en la práctica y que los mensajes se transmitían sin errores.

**Aprendizaje:** Pudimos finalmente establecer conexión real entre dos teléfonos.

---

## Prompt 4:
**Prompt:** “Cómo generar el archivo APK para instalar en mis teléfonos?”
**Respuesta (resumen):** Te guié para crear el archivo APK de tu aplicación usando los comandos oficiales de Flutter. Te expliqué que existen dos tipos de compilación:

Debug: ideal para pruebas internas.

Release: optimizada para la entrega final.

Te indiqué los comandos:

flutter build apk --debug


y

flutter build apk --release


Además, te enseñé que el archivo resultante se guarda en:

build/app/outputs/flutter-apk/


y te recomendé renombrarlo como bluechat_final.apk para su entrega.
También te mostré cómo resolver errores de compilación ejecutando:

flutter clean
flutter pub get


para limpiar y reconstruir el proyecto antes de volver a generar el APK.

Con esto pudiste instalar la app directamente en tus teléfonos y verificar su funcionamiento real, probando la conexión Bluetooth en condiciones reales de uso.

**Aprendizaje:** Aprendimos a compilar y probar nuestra app en modo real.

---

## Prompt 5:
**Prompt:** “Qué debo entregar para mi proyecto final de Bluetooth?”
**Respuesta (resumen):** Te ayudé a estructurar todo tu proyecto final de manera profesional y organizada. Te indiqué que el proyecto debía incluir los siguientes entregables:

Repositorio en GitHub con el código completo y un archivo README.md explicando cómo ejecutar la aplicación.

Log de interacción con IA (IA-LOG.md) con los prompts y aprendizajes documentados.

Tablero ágil (Trello o GitHub Projects) con tus historias de usuario en columnas de “Pendiente”, “En progreso” y “Hecho”.

APK funcional listo para instalar (bluechat_final.apk).

Video demo mostrando la conexión y el envío de mensajes en tiempo real entre los dos teléfonos.

Además, te mostré cómo redactar correctamente el README con formato Markdown, cómo crear el archivo IA-LOG y cómo presentar todo como un producto final bien documentado.

**Aprendizaje:** Logramos estructurar todo el proyecto como un producto ágil y bien documentado.

---

## Conclusión general:
**Prompt:** Durante el desarrollo del proyecto BlueChat-Flutter, ChatGPT actuó como asistente técnico y pedagógico, explicando paso a paso la configuración de Bluetooth, los permisos en Android, el envío y recepción de datos, la compilación del APK y la organización final del proyecto.
Gracias a la interacción constante con la IA, se logró crear una aplicación funcional, documentada y lista para presentación académica.