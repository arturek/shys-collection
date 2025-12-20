# Automatische Bewässerung mit ESPHome

Ein intelligentes Bewässerungssystem mit 4 kapazitiven Bodenfeuchtesensoren und 4 Pumpen. Das System kann vollständig autonom arbeiten oder in Home Assistant integriert werden. Die Steuerung erfolgt über zwei Taster direkt am Gerät oder über Home Assistant.

## Übersicht

Das Bewässerungssystem nutzt einen ESP8266 ESP-01 (1MB) mit ESPHome in Kombination mit einem MCP23017 GPIO-Expander und einem ADS1115 ADC. Es kann bis zu 4 Pflanzen unabhängig voneinander bewässern und arbeitet dabei komplett autonom oder in Home Assistant integriert.

**Hauptfunktionen:**
- Automatische Bewässerung basierend auf Bodenfeuchtigkeit
- 3 Betriebsmodi (Auto / Manuell / Notaus)
- 4 unabhängige Bewässerungskreise
- Interlock-System (nur eine Pumpe gleichzeitig aktiv)
- Wassertank-Überwachung mit automatischem Notaus
- Automatische Wiederaufnahme nach Tank-Füllung
- Integration in Home Assistant
- Lokale Steuerung über 2 Taster

---

## Detaillierte Funktionsbeschreibung

### Sensoren

Das System nutzt **4 Bodenfeuchtesensoren**:

- **Messbereich:** 0-6V
- **Funktionsweise:** Abhängig vom verwendeten Sensor-Typ
  - **Kapazitive Sensoren** (empfohlen): Hoher Wert = Trocken, niedriger Wert = Feucht
  - **Resistive Sensoren**: Niedriger Wert = Trocken, hoher Wert = Feucht
  - Die Bewässerungslogik ist für **kapazitive Sensoren** optimiert
- **Update-Intervall:** Konfigurierbar (Standard: 10 Sekunden)
- **Filter:** Gleitender Durchschnitt über 5 Messwerte für stabile Werte
- **Schwellwerte:** Individuell pro Sensor über Home Assistant einstellbar

> **Hinweis:** Die Beispielwerte in dieser Anleitung (z.B. 2V = trocken, 0,6V = feucht) gelten für kapazitive Sensoren und können je nach Sensor-Modell abweichen. Eine Kalibrierung ist immer erforderlich!

### Pumpen

Das System steuert **4 Tauchpumpen (12V)** mit diversen Sicherheitsfunktionen:

- **Automatischer Schutz:**
  - Pumpen starten nur bei ausreichend Wasser im Tank
  - **Interlock:** Nur eine Pumpe läuft gleichzeitig (verhindert Überlastung)
  - **Timeout-Schutz:** Maximale Laufzeit konfigurierbar (verhindert Dauerlauf)
  - **Notaus bei leerem Tank:** Sofortiges Abschalten aller Pumpen

### Wassertank-Überwachung

- **Schwimmer-Sensor** am MCP23017 (GPIO 7)
- **Notaus-Funktion:** Bei leerem Tank werden automatisch alle Pumpen gestoppt
- Pumpen können nur bei gefülltem Tank gestartet werden

### Betriebsmodi

#### Auto
- **Automatische Bewässerung** basierend auf Bodenfeuchtigkeit
- Prüfintervall über Home Assistant konfigurierbar (Standard: 5 Minuten)
- **Bewässerungslogik (für kapazitive Sensoren):**
  - Sensor-Wert **> Schwellwert** → Zu trocken → Bewässern
  - Sensor-Wert **≤ Schwellwert** → Ausreichend feucht → Nicht bewässern
- **Sensorfehler-Behandlung:** Bei NaN/Fehler wird NICHT bewässert
- Bewässerungsdauer pro Pumpe konfigurierbar
- 2 Sekunden Pause zwischen Pumpen (Interlock)

#### Manuell
- Pumpen werden nur manuell gesteuert (über Home Assistant oder Set-Button)
- Keine automatische Bewässerung basierend auf Sensoren
- Alle Sicherheitsfunktionen bleiben aktiv (Wasserstand, Timeout, Interlock)

#### Notaus
- **Sicherheitsmodus:** Alle Pumpen sind deaktiviert
- **Automatische Aktivierung:** Wird automatisch aktiviert wenn der Wassertank leer ist
- **Manuelle Aktivierung:** Über "🚨 NOTAUS" Button in Home Assistant
- **Automatische Deaktivierung:** Wechselt automatisch zurück zu Auto-Modus, sobald der Tank wieder gefüllt ist
- Im Notaus-Modus können keine Pumpen gestartet werden (weder manuell noch automatisch)

### Taster-Funktionen

#### Mode-Button (GPIO14)
- Wechselt den Betriebsmodus zyklisch: **Auto ↔ Manuell**
- **Sperre:** Deaktiviert bei leerem Wassertank (nur Notaus-Modus aktiv)

#### Set-Button (GPIO16)
- **Kurzdruck (<500ms):** Wechselt zur nächsten Pumpe und aktiviert sie für konfigurierbare Zeit (Standard: 5s)
- **Langdruck (>1s):** Aktiviert aktuelle Pumpe, solange gedrückt (mit Timeout-Schutz)
- Funktioniert in den Modi **Auto** und **Manuell**
- Im **Notaus-Modus** werden Pumpen blockiert
- Nur wenn Wasser im Tank verfügbar

**Pumpen-Zyklus:** Pumpe 1 → 2 → 3 → 4 → 1 (abhängig von `anzahl_pumpen` Einstellung)

### Konfigurierbare Parameter

Alle wichtigen Parameter können über Home Assistant angepasst werden:

**Schwellwerte (4x):**
- **Schwellwert Sensor 1-4:** Feuchtigkeitsschwelle in Volt (0,0 - 6,0V)
- Standard: 1,5V (Mittelwert zwischen feucht ~0,6V und trocken ~2V)

**Pumpendauer:**
- **Pumpendauer (Auto-Modus):** Laufzeit pro Bewässerung (1 - 60s), Standard: 10s
- **Pumpendauer (Set-Button):** Laufzeit bei Kurzdruck (1 - 30s), Standard: 5s

**Sicherheit:**
- **Max. Laufzeit (Timeout):** Maximale Pumpen-Laufzeit (10 - 300s), Standard: 60s

**Timing:**
- **Auto-Modus Intervall:** Prüfintervall in Sekunden (60 - 3600s), Standard: 300s (5 Minuten)

### Automatik-Timing

**Sensor-Update:** Die Sensoren werden alle 10 Sekunden ausgelesen (konfigurierbar)

**Automatik-Prüfung:** Die Bewässerungslogik wird im konfigurierbaren Intervall ausgeführt (Standard: 5 Minuten)

**Pumpen-Ablauf:** Bei Bewässerungsbedarf werden die Pumpen nacheinander aktiviert, mit 2 Sekunden Pause zwischen den Durchgängen (verhindert gleichzeitigen Betrieb)

---

## Installation

### Voraussetzungen

- ESPHome installiert (über Home Assistant Add-on oder standalone)
- Fertige Platine aus dem Projekt oder selbst aufgebaut nach Schaltplan
- 12V Netzteil für Pumpen
- Wassertank mit Schwimmer-Sensor
- 4x Kapazitive Bodenfeuchtesensoren
- 4x Tauchpumpen (12V)
- Schläuche und Verbindungen

### Konfiguration

Die gesamte Konfiguration erfolgt über die **Substitutions** am Anfang der `bewaesserung.yaml` Datei. Der Rest des Codes kann unverändert bleiben.

#### 1. Geräte-Identifikation

```yaml
device_name: bewaesserung
device_friendly_name: "Bewässerung"
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

#### 3. Friendly Names anpassen (optional)

```yaml
sensor1_name: "Feuchtigkeit Sensor 1"
sensor2_name: "Feuchtigkeit Sensor 2"
sensor3_name: "Feuchtigkeit Sensor 3"
sensor4_name: "Feuchtigkeit Sensor 4"

pumpe1_name: "Pumpe 1"
pumpe2_name: "Pumpe 2"
pumpe3_name: "Pumpe 3"
pumpe4_name: "Pumpe 4"

wasserschwimmer_name: "Wassertank Schwimmer"
```

#### 4. Anzahl aktiver Pumpen

```yaml
anzahl_pumpen: "4"  # 1-4: wie viele Pumpen verwendet werden
```

Bei weniger als 4 Pumpen kann dieser Wert angepasst werden. Der Set-Button wechselt dann nur zwischen den konfigurierten Pumpen.

#### 5. Timing-Einstellungen (optional)

Diese Werte sind bereits sinnvoll vorkonfiguriert und müssen normalerweise nicht angepasst werden:

```yaml
# Sensor Update Intervall (wie oft werden die Sensoren ausgelesen)
sensor_update_interval: "10s"

# Pause zwischen Pumpen im Auto-Modus (Interlock-Verzögerung)
pause_zwischen_pumpen: "2s"
```

#### 6. Standardwerte anpassen

Die Initialwerte können nach Bedarf angepasst werden. Diese lassen sich jederzeit in Home Assistant beliebig ändern.

```yaml
# Schwellwerte für Sensoren (in Volt)
# WICHTIG: Diese Werte müssen nach der Kalibrierung angepasst werden!
initial_threshold_sensor1: "1.5"
initial_threshold_sensor2: "1.5"
initial_threshold_sensor3: "1.5"
initial_threshold_sensor4: "1.5"

# Pumpendauer für Auto-Modus (Sekunden)
initial_pumpen_dauer_auto: "10"

# Pumpendauer bei Set-Button Kurzdruck (Sekunden)
initial_pumpen_dauer_set: "5"

# Max. Laufzeit pro Pumpe (Timeout in Sekunden)
initial_max_laufzeit: "60"

# Auto-Modus Prüfintervall (Sekunden)
initial_auto_intervall: "300"  # 5 Minuten
```

#### 7. Hardware-Pins

Die Pin-Belegung ist für die Projekt-PCB vorkonfiguriert und sollte **nicht** geändert werden:

**I²C Bus:**
- **GPIO4** = SDA
- **GPIO5** = SCL

**Buttons:**
- **GPIO14** = Mode Button
- **GPIO16** = Set Button

**I²C Adressen:**
- GPIO Expander (MCP23017): 0x20
- Analog-Digital-Wandler (ADS1115): 0x48

### Sensor-Kalibrierung

**Wichtig:** Die Schwellwerte müssen an eure Sensoren angepasst werden!

1. **Sensor in trockene Erde stecken:** Wert ablesen (z.B. 2,0V)
2. **Sensor in feuchte Erde stecken:** Wert ablesen (z.B. 0,6V)
3. **Schwellwert berechnen:** Mittelwert bilden (z.B. 1,3V)
4. **In Home Assistant anpassen:** Schwellwert pro Sensor einstellen

**Logik für kapazitive Sensoren:**
- Hoher Wert = Trocken → Bewässern
- Niedriger Wert = Feucht → Nicht bewässern

### Flashen des ESP8266

1. ESPHome-Konfiguration kompilieren
2. Über USB (FTDI-Adapter) oder OTA auf den ESP-01 flashen
3. Gerät sollte sich automatisch mit dem WLAN verbinden
4. In Home Assistant sollte das Gerät automatisch erkannt werden

### Erste Inbetriebnahme

1. **Wassertank-Sensor prüfen:** 
   - **Tank leer:** Schwimmer sollte OFF sein → System wechselt automatisch in **Notaus-Modus**
   - **Tank füllen:** Schwimmer sollte ON sein → System wechselt automatisch zurück zu **Auto-Modus**

2. **Sensoren kalibrieren:**
   - Alle 4 Sensoren sollten Volt-Werte liefern
   - Schwellwerte nach Kalibrierung anpassen (siehe Abschnitt "Sensor-Kalibrierung")

3. **Pumpen testen:**
   - Im **Manuell-Modus** jede Pumpe einzeln testen
   - Prüfen ob nur eine Pumpe gleichzeitig läuft (Interlock)
   - Set-Button Kurz- und Langdruck testen
   - **Notaus-Test:** "🚨 NOTAUS" Button in Home Assistant drücken → Pumpen sollten blockiert sein

4. **Auto-Modus aktivieren:**
   - Betriebsmodus auf Auto setzen (falls nicht automatisch nach Tank-Füllung geschehen)
   - Intervall und Bewässerungsdauer nach Bedarf anpassen
   - System überwachen und Schwellwerte feintunen

---

## Verwendete Bauteile

**Elektronik:**

- 1x [ESP-01 (ESP8266 mit 1MB Flash)](https://amzn.to/4px21mF)

- 1x [MCP23017 I²C GPIO Expander (16x GPIO)](https://amzn.to/3D1234a)

- 1x [ADS1115 I²C ADC (4x Analog Input)](https://amzn.to/3D5678b)

- 4x [IRLZ34N oder IRLZ44N (N-MOSFET)](https://amzn.to/48bMdP7)

- 4x [Kapazitive Bodenfeuchtesensoren](https://amzn.to/3C9abcd)

- 4x [12V Tauchpumpen](https://amzn.to/4A1efgh)

- 1x [Schwimmer-Sensor (Wassertank)](https://amzn.to/3B2ijkl)

- 10x SMD Widerstände 10k (1206 SMD)

- 4x SMD Widerstände 2,2k (1206 SMD) für LEDs

- 2x 100nF Kondensatoren (1206 SMD)

- 1x NCP1117-33_SOT223 (12V IN / 3.3V OUT)

- [Pinheader 2.54mm](https://amzn.to/4o8oaGz)

- [Terminal Blocks für Anschlüsse](https://amzn.to/4pwMoeV)

**Mechanik:**

- 1x Wassertank (Größe nach Bedarf)
- Schläuche (passend zu Pumpen)
- Schlauchverbinder

Die Bauteilliste mit Zuordnung, was wo auf die Platine kommt, findet sich auch in der BOM (`manufacturing/bom.csv`) oder im KiCad-Projekt.

**Die Platine findet Ihr auch bei ELECROW.com unter folgendem Link:**  
https://www.elecrow.com/sharepj/smart-plant-watering-with-esphome-esp8266-1250.html

---

## Video zum Projekt

**Video zur automatischen Bewässerung mit ESPHome:**  
[![Automatische Bewässerung](http://img.youtube.com/vi/xxxxxxxxx/0.jpg)](https://www.youtube.com/watch?v=xxxxxxxxx "Video zur automatischen Bewässerung")

---

## Weitere Informationen

Weitere Informationen zum Projekt findet Ihr auch noch im Blog unter:  
https://smarthomeyourself.de/blog/automatische-bewaesserung-mit-esphome/

---

## Mögliche Erweiterungen

Das System kann in Zukunft um folgende Features erweitert werden:

### Bewässerungs-Zeitfenster
- Bewässerung nur zwischen bestimmten Uhrzeiten erlauben (z.B. 06:00 - 22:00 Uhr)
- Benötigt: time component (SNTP), 4x Number für Zeitfenster-Konfiguration

### Pause-Funktion
- Auto-Bewässerung für X Stunden pausieren
- Nützlich nach manuellem Gießen oder bei Regen
- Benötigt: Number (Pause-Dauer), Button (Pause aktivieren)

### Statistiken
- Anzahl Bewässerungszyklen pro Pumpe
- Gesamte Betriebsstunden pro Pumpe
- Geschätzter Wasserverbrauch

Diese Features wurden bewusst nicht implementiert, um den Code übersichtlich zu halten und die wichtigsten Funktionen zu priorisieren. Sie können bei Bedarf leicht ergänzt werden.
