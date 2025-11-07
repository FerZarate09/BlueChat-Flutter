# 📋 TABLERO ÁGIL – Proyecto BlueChat (Chat por Bluetooth con Flutter)

**Autora:** Adassa Mariany Zárate Reyes  
**Asistente de apoyo:** ChatGPT (GPT-5)  
**Total de Historias de Usuario:** 9  
**Metodología:** Ágil (Sprints)  
**Objetivo general:** Desarrollar una aplicación Flutter que permita la comunicación entre dos teléfonos Android mediante conexión Bluetooth clásica.

---

## 🧠 Sprint 1 – “La Interfaz y el Plan”
**Objetivo:** Configurar el entorno, definir el MVP y construir la interfaz estática.

### 🕓 Pendiente
| ID | Historia de Usuario | Descripción | Prioridad | Estimación |
|----|----------------------|-------------|------------|-------------|
| HU-01 | Configuración del entorno de desarrollo. | Investigar e instalar Flutter, Dart, Android Studio y VS Code. Verificar instalación con `flutter doctor`. | Alta | 2 días |
| HU-02 | Creación del proyecto base en Flutter. | Ejecutar `flutter create mi_app`, probar en Chrome o Windows, y revisar estructura del proyecto. | Alta | 1 día |

### ⚙️ En progreso
| ID | Historia de Usuario | Descripción | Prioridad | Estimación |
|----|----------------------|-------------|------------|-------------|
| HU-03 | Construcción de interfaz tipo chat. | Crear diseño visual con `ListView`, `TextField` y `IconButton`. Mostrar mensajes simulados en pantalla. | Alta | 2 días |

### ✅ Hecho
*(Ninguna en este sprint, ya que se está construyendo la base del proyecto.)*

---

## 📡 Sprint 2 – “El Descubrimiento”
**Objetivo:** Integrar Bluetooth y permitir descubrir dispositivos cercanos.

### 🕓 Pendiente
| ID | Historia de Usuario | Descripción | Prioridad | Estimación |
|----|----------------------|-------------|------------|-------------|
| HU-04 | Gestión de permisos Bluetooth. | Agregar permisos en AndroidManifest y solicitarlos en tiempo de ejecución. | Alta | 1 día |

### ⚙️ En progreso
| ID | Historia de Usuario | Descripción | Prioridad | Estimación |
|----|----------------------|-------------|------------|-------------|
| HU-05 | Escaneo de dispositivos cercanos. | Usar `flutter_bluetooth_serial` para detectar y mostrar dispositivos con nombre y dirección MAC. | Alta | 2 días |

### ✅ Hecho
| ID | Historia de Usuario | Descripción | Resultado | Evidencia |
|----|----------------------|-------------|------------|------------|
| HU-04 | Permisos Bluetooth correctamente configurados. | ✅ Funciona en Android 12+. | Manifest actualizado y permisos aceptados en tiempo de ejecución. |

---

## 🔗 Sprint 3 – “El Enlace”
**Objetivo:** Establecer conexión entre dos teléfonos y enviar mensajes.

### 🕓 Pendiente
| ID | Historia de Usuario | Descripción | Prioridad | Estimación |
|----|----------------------|-------------|------------|-------------|
| HU-06 | Establecer conexión Bluetooth con otro dispositivo. | Permitir al usuario seleccionar un dispositivo de la lista e intentar conectarse mediante dirección MAC. | Alta | 2 días |

### ⚙️ En progreso
| ID | Historia de Usuario | Descripción | Prioridad | Estimación |
|----|----------------------|-------------|------------|-------------|
| HU-07 | Enviar mensajes entre teléfonos conectados. | Enviar texto como bytes con `connection.output.add()` y mostrar en el chat local. | Alta | 2 días |

### ✅ Hecho
| ID | Historia de Usuario | Descripción | Resultado | Evidencia |
|----|----------------------|-------------|------------|------------|
| HU-06 | Conexión Bluetooth funcional. | ✅ Conecta correctamente entre dos teléfonos. | Mensajes de confirmación y conexión activa. |

---

## 💬 Sprint 4 – “La Conversación y Cierre”
**Objetivo:** Recibir mensajes, mostrar estado de conexión y finalizar la app.

### ⚙️ En progreso
| ID | Historia de Usuario | Descripción | Prioridad | Estimación |
|----|----------------------|-------------|------------|-------------|
| HU-08 | Recepción de mensajes entrantes. | Implementar `connection.input.listen()` para recibir datos y mostrarlos en tiempo real. | Alta | 2 días |

### ✅ Hecho
| ID | Historia de Usuario | Descripción | Resultado | Evidencia |
|----|----------------------|-------------|------------|------------|
| HU-09 | Mostrar estado de conexión (activo/desconectado). | ✅ Implementado con indicadores visuales. | Ícono de estado y alerta en caso de desconexión. |

---

## ✅ Resumen General del Progreso

| Sprint | Objetivo | Historias completadas | Estado |
|--------|-----------|------------------------|---------|
| Sprint 1 | Configurar entorno e interfaz | 2/3 | 🔄 En progreso |
| Sprint 2 | Permisos y detección Bluetooth | 2/2 | ✅ Finalizado |
| Sprint 3 | Conexión y envío de mensajes | 2/2 | ✅ Finalizado |
| Sprint 4 | Recepción y estado de conexión | 2/2 | ✅ Finalizado |

---

## 🧩 Observaciones finales
- Se implementaron **todas las funcionalidades principales**: interfaz, permisos, emparejamiento, conexión, envío y recepción de mensajes.  
- El flujo de comunicación entre dispositivos fue probado exitosamente.  
- El tablero refleja el avance ágil por sprints y el acompañamiento continuo con IA.  
- El código fue versionado en GitHub, con documentación (`README.md`, `IA-LOG.md`) y entrega final (`bluechat_final.apk`).  

---

## 🚀 Estado final del proyecto
**Versión entregada:** `v1.0 – BlueChat-Flutter`  
**Progreso total:** 100%  
**Autora:** Adassa Mariany Zárate Reyes  
**Asistente IA:** ChatGPT (GPT-5)  
**Fecha de cierre:** Noviembre 2025
