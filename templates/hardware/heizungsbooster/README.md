# Heizungsbooster mit ESPHome

Ein intelligenter Heizungsbooster zur besseren Wärmeverteilung im Raum. Das Gerät steuert einen Lüfter automatisch basierend auf der Temperaturdifferenz zwischen Heizkörper und Raumtemperatur, um die Wärme effizienter im Raum zu verteilen.

## Übersicht

Der Heizungsbooster nutzt einen ESP8266 mit ESPHome, um einen PC-Lüfter intelligent zu steuern. Er kann vollständig autonom arbeiten oder in Home Assistant integriert werden. Die Steuerung erfolgt über zwei Taster direkt am Gerät oder über Home Assistant.

**Hauptfunktionen:**
- Automatische Lüftersteuerung basierend auf Temperaturdifferenz
- Manuelle Betriebsmodi (OFF, MANUAL, AUTO)
- Integration in Home Assistant
- Lokale Steuerung über Taster
- Intelligente Temperatursensor-Priorisierung

---

## Detaillierte Funktionsbeschreibung

### Temperatursensoren

Das System nutzt mehrere Temperatursensoren mit einer klaren Priorisierung:

1. **Heizungstemperatur (DS18B20 #1)**
   - Wird direkt am Heizkörper montiert
   - **Hauptsensor für die Einschaltlogik** - entscheidet, wann der Lüfter aktiviert wird
   - Muss mindestens die minimale Heizungstemperatur erreichen, damit der Lüfter überhaupt aktiviert werden kann

2. **Raumtemperatur (Prioritätssystem)**
   - **Priorität 1:** Home Assistant Sensor (falls konfiguriert)
   - **Priorität 2:** DS18B20 #2 (lokaler Raumtemperatursensor)
   - **Priorität 3:** Standard-Raumtemperatur (Fallback-Wert)
   
   Die Raumtemperatur wird für die Berechnung der Temperaturdifferenz benötigt. Wenn kein Home Assistant Sensor verfügbar ist, wird automatisch der lokale DS18B20-Sensor verwendet. Falls auch dieser ausfällt, greift der konfigurierbare Standard-Wert.

### Betriebsmodi

#### OFF
- Der Lüfter ist komplett ausgeschaltet
- Keine automatische Steuerung aktiv

#### MANUAL
- Der Lüfter läuft mit einer manuell einstellbaren Geschwindigkeit
- Geschwindigkeit kann über den Set-Button in 25% Stufen geändert werden (0% → 25% → 50% → 75% → 100% → 0%)
- Oder über Home Assistant direkt auf jeden Wert zwischen 0-100% eingestellt werden

#### AUTO
- **Automatische Steuerung basierend auf Temperaturdifferenz**
- Der Lüfter schaltet ein, wenn:
  - Die Heizungstemperatur ≥ minimale Heizungstemperatur ist
  - Die Temperaturdifferenz (Heizung - Raum) ≥ Schwellwert ist
- **Geschwindigkeitssteuerung:**
  - Linear zwischen minimaler und maximaler Heizungstemperatur
  - Bei minimaler Heizungstemperatur: 0% (aus)
  - Bei maximaler Heizungstemperatur: 100%
  - Mindestens 25% Geschwindigkeit wenn eingeschaltet (außer bei 0%)
- **Hysterese:** 1°C Differenz zum Ausschalten, um Flackern zu vermeiden

### Taster-Funktionen

#### Mode-Button (GPIO14)
- Wechselt den Betriebsmodus zyklisch: **OFF → MANUAL → AUTO → OFF**
- Funktioniert in allen Modi

#### Set-Button (GPIO16)
- **Nur im MANUAL-Modus aktiv**
- Ändert die Lüftergeschwindigkeit in 25% Stufen: **0% → 25% → 50% → 75% → 100% → 0%**

### Konfigurierbare Parameter

Alle wichtigen Parameter können über Home Assistant angepasst werden:

- **Temperatur-Schwellwert:** Temperaturdifferenz zum Einschalten (0.0 - 10.0°C)
- **Minimale Heizungstemperatur:** Unter diesem Wert bleibt der Lüfter aus (20.0 - 40.0°C)
- **Maximale Heizungstemperatur:** Ab diesem Wert läuft der Lüfter mit 100% (40.0 - 80.0°C)
- **Standard-Raumtemperatur:** Fallback-Wert wenn keine Sensoren verfügbar sind (15.0 - 30.0°C)
- **Manuelle Lüftergeschwindigkeit:** Geschwindigkeit im MANUAL-Modus (0 - 100%)

### Automatik-Intervall

Die Automatik-Logik wird alle 10 Sekunden ausgeführt (konfigurierbar über `automatik_interval`). Die Sensoren aktualisieren sich alle 9 Sekunden, um sicherzustellen, dass aktuelle Werte verfügbar sind.

---

## Installation

### Voraussetzungen

- ESPHome installiert (über Home Assistant Add-on oder standalone)
- fertige Platine aus dem Projekt oder selbst verbunden anhand Schaltplan
- 3D Drucker für Gehäuse oder alternative Halterung für Technik/Ventilatoren

### Konfiguration

Die gesamte Konfiguration erfolgt über die **Substitutions** am Anfang der `heizungsbooster.yaml` Datei. Der Rest des Codes kann unverändert bleiben.

#### 1. Geräte-Identifikation

```yaml
device_name: shys-heizungsbooster
device_friendly_name: SHYS Heizungsbooster
```

#### 2. Sicherheit & Netzwerk

In der ESPHome Secrets-Datei müssen folgende Werte definiert werden:

```yaml
api_encryption_key: "base64_encrypted_key_hier_eintragen=="
ota_password: "Ihr_OTA_Passwort"
ap_password: "Ihr_AP_Passwort"
wifi_ssid: "Ihr_WLAN_Name"
wifi_password: "Ihr_WLAN_Passwort"
```

#### 3. Lüfter-Konfiguration

```yaml
pin_fan: GPIO12
fan_pwm_frequency: 25000 Hz  # 4-Pol PC-Lüfter: 25000Hz
                             # 3-Pol Lüfter mit Mosfet: 1000Hz
```

#### 4. Temperatursensor-Adressen

Die DS18B20-Adressen müssen aus dem ESPHome-Log ausgelesen werden:

1. ESPHome-Konfiguration einmal kompilieren und hochladen
2. Im Log nach den gefundenen DS18B20-Sensoren suchen
3. Die Adressen in die Konfiguration eintragen:

```yaml
ds18b20_address_heizung: "0xd70122113b001828"  # Aus Log auslesen
ds18b20_address_raum: "0xea0122113698f828"      # Aus Log auslesen
```

#### 5. Home Assistant Integration (optional)

Falls ein Raumtemperatursensor aus Home Assistant verwendet werden soll:

```yaml
raum_temp_entity: "sensor.raum_temperatur"  # Entity-ID in Home Assistant
```

Falls kein HA-Sensor verwendet werden soll, einfach einen Dummy-Eintrag stehen lassen - das System nutzt dann automatisch den lokalen DS18B20.

#### 6. Standardwerte anpassen

Die Initialwerte können nach Bedarf angepasst werden.
Dabei handelt es sich aber nur um Initiale Werte der Number Entitäten. Diese lassen sich jeder Zeit in Home Assistant beliebig ändern.  

Folgende Werte existieren aktuell:  

```yaml
initial_temp_threshold: "3.0"              # Temperaturdifferenz zum Einschalten
initial_min_heizung_temp: "30.0"           # Minimale Heizungstemperatur
initial_max_heizung_temp: "50.0"           # Maximale Heizungstemperatur
initial_default_raum_temp: "21.0"          # Fallback-Raumtemperatur
initial_manual_fan_speed: "50.0"           # Manuelle Geschwindigkeit
```

#### 7. Timing (optional)

```yaml
automatik_interval: 10s      # Intervall für Automatik-Steuerung
sensor_update_interval: 9s  # Sollte etwas kürzer sein als automatik_interval
```

### Pin-Belegung

Die Pin-Belegung ist bereits in den Substitutions vorkonfiguriert:

- **GPIO12** = FAN (IRLZ Mosfet)
- **GPIO13** = DS18B20 (One-Wire)
- **GPIO14** = Mode Button
- **GPIO16** = Set Button
- **GPIO5** = SCL (I2C)
- **GPIO4** = SDA (I2C)
- **GPIO3** = RX
- **GPIO1** = TX

### Flashen des ESP8266

1. ESPHome-Konfiguration kompilieren
2. Über USB oder OTA auf den ESP8266 flashen
3. Gerät sollte sich automatisch mit dem WLAN verbinden
4. In Home Assistant sollte das Gerät automatisch erkannt werden

### Betrieb ohne Home Assistant

Für den **Standalone-Betrieb ohne Home Assistant** steht eine angepasste Konfigurationsdatei unter `esphome/variants/heizungsbooster-standalone.yaml` zur Verfügung. Diese Variante hat den `api:`-Block und den `homeassistant` Sensor-Block auskommentiert sowie den Template-Sensor angepasst, sodass nur noch der lokale DS18B20-Sensor und der Fallback-Wert verwendet werden. Das System funktioniert dann vollständig autonom über die lokalen Taster und Sensoren ohne regelmäßige Neustarts.

### Erste Inbetriebnahme

1. Nach dem Flashen die DS18B20-Adressen aus dem Log auslesen und in die Konfiguration eintragen
2. Konfiguration erneut kompilieren und hochladen
3. In Home Assistant die Parameter nach Bedarf anpassen
4. Betriebsmodus auf AUTO setzen
5. System sollte nun automatisch arbeiten

---

## Home Assistant Dashboard

Ein Beispiel-Dashboard für Home Assistant findet sich unter `assets/dashboard-example.yaml`. Dieses kann als Basis für ein individuelles Dashboard verwendet werden.

---

## Verwendete Bauteile

- 3x [60x60 Lüfter Günstig](https://amzn.to/4pwRt7u) oder [Noctua NF-A6x25](https://amzn.to/4iGnE1n)

- 1x [ESP 12F](https://amzn.to/4px21mF)  
  (12E Funktioniert genau so)  

- 7x SMD Widerstände 10k (1206 SMD)  

- 1x SMD Widerstand 4,7k (1206 SMD)  

- 1x 100nF Kondensator (1206 SMD)  

- 1x NCP1117-33_SOT223 (12V IN / 3.3V OUT)  

- 1x [IRLZ34N oder IRLZ44N (N-MOSFET)](https://amzn.to/48bMdP7)  
  (Kann auch alternativer mit gleicher Pinbelegung sein der mit 12V Umgehen kann. Dieser ist überdimensioniert, aber lag hier noch rum)  

- 2x [DS18B20 Temperatursensoren](https://amzn.to/47WWrE1)  

- 3x 3-Pin Fan-Header  
  (Da die Lüfter eh 2.54mm Rastermaß haben, können hier auch die normalen Pinheader verwendet werden. Ich habe mich aber für richtige Lüfter Anschlüsse entschieden)  

- [3x 3-fach Terminal Blocks (2,54mm Rastermaß) für Sensoranschluss](https://amzn.to/4pwMoeV)  
  (auch hier sind normale Pinheader möglich)  

- 1x [2-fach Terminal Block (5mm Rastermaß) für 12V Eingang](https://amzn.to/4ijQjJy)  

- [Pinheader 2.54mm](https://amzn.to/4o8oaGz)  
  

Die Bauteilliste mit Zuordnung, was wo auf die Platine kommt, findet sich auch in der BOM (`manufacturing/bom.csv`) oder Du schaust ins KiCad-Projekt.  
Für die Kleinteile schaust du am besten bei Mouser, Reichelt, Pollin o.ä. für eine möglichst günstige und zuverlässige Bestellung.

  
**Die Platine findet Ihr auch bei ELECROW.com unter folgendem Link:**  
https://www.elecrow.com/sharepj/diy-heating-booster-with-esphome-1125.html

---

## Video zum Projekt

**Video zum Heizungs-Booster mit ESPHome:**  
[![Heizungs-Booster](http://img.youtube.com/vi/QziFyC4AdUs/0.jpg)](https://www.youtube.com/watch?v=QziFyC4AdUs "Video zum Heizungs-Booster")

---

## Weitere Informationen

Weitere Informationen zum Projekt findet Ihr auch noch im Blog unter:  
https://smarthomeyourself.de/blog/heizungs-booster-mit-esphome/
