# 8-in-1 Sensor für Home Assistant (ESPHome)

Dieses Projekt enthält die Hardware für einen selbstgebauten 8-in-1 Multisensor auf Basis eines NodeMCU v2.  
Der Sensor lässt sich vollständig lokal über ESPHome betreiben und kann direkt in Home Assistant eingebunden werden.  
Das Projekt basiert auf der Anleitung auf SmartHomeYourself.de:  
https://www.smarthomeyourself.de/unabhaengige-projekte/arduino-und-esp-projekte/8-in-1-sensor-fuer-home-assistant

---

## Features

Der 8-in-1 Sensor kombiniert mehrere Umweltsensoren und Ausgänge auf einer kompakten Platine:

- Temperatur
- Luftfeuchtigkeit
- Luftqualität über Gassensor (Analog)
- Helligkeit
- Geräuscherkennung
- PIR Bewegungsmelder
- Piezo Buzzer
- RGB-LED (z. B. WS2812 LED-Ring)

Alle Sensoren werden über eine ESPHome-Konfiguration bereitgestellt.

---

## Enthaltene Ordner

Die Struktur folgt den Hardware-Vorgaben der SHYS-Collection.

### `/kicad`
Enthält das komplette KiCad Projekt:
- Schaltplan
- PCB Layout

### `/manufacturing`
Daten für die Fertigung:
- Gerber Dateien
- Bohrdaten
- Stückliste (BOM)

### `/esphome`
Beispielkonfiguration auf Basis eines NodeMCU v2 (ESP8266):
- Einbindung aller Sensoren
- RGB-LED Ausgabe
- Buzzer
- API / OTA für Home Assistant

Diese YAML kann direkt als Basis genutzt werden. WLAN-Daten bitte anpassen.

### `/assets`
Bilder des Aufbaus oder der fertig bestückten Platine.

---

## Hardware Überblick

Die Platine ist für den **NodeMCU v2 (ESP8266)** ausgelegt.  
Sie stellt Anschlüsse bzw. Lötpads für folgende Module bereit:

- DHT-Sensor für Temperatur/Luftfeuchtigkeit
- Gassensor wie MQ-2 am ADC
- Fotowiderstand bzw. Helligkeitssensor
- Mikrofon-Modul / Geräuschsensor (digital)
- PIR Sensor (z. B. HC-SR501)
- Piezo Buzzer (digitaler Ausgang)
- WS2812 kompatible LEDs (Ring oder Streifen)

Alle Belegungen sind in Schaltplan und YAML dokumentiert.

---

## Gehäuse

Für das Projekt existiert ein 3D-druckbares Gehäuse in Pyramidenform.  
Es bietet Platz für:
- Platine
- NodeMCU
- Sensoren
- LED-Ring

Das Gehäuse
