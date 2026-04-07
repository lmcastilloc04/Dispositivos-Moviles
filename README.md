# Fake Store App - Flutter

Aplicación móvil/web desarrollada en Flutter para consumir la Fake Store API.  
Este proyecto fue realizado como parcial de la asignatura **Programación para dispositivos móviles**.

## Descripción

La aplicación permite:

- Consultar productos desde la API (`GET /products`)
- Ver el detalle de cada producto
- Crear productos mediante formulario (`POST /products`)
- Manejar estados de carga y errores
- Mostrar una interfaz sencilla y funcional

## Tecnologías utilizadas

- Flutter
- Dart
- HTTP package
- Fake Store API

## API utilizada

- Base URL: `https://fakestoreapi.com`
- Documentación: `https://fakestoreapi.com/docs`

## Estructura del proyecto

```text
lib/
 ├── main.dart
 ├── models/
 │    └── product.dart
 ├── services/
 │    └── api_service.dart
 ├── screens/
 │    ├── home_screen.dart
 │    ├── product_detail_screen.dart
 │    └── create_product_screen.dart
 └── widgets/
      └── product_card.dart
