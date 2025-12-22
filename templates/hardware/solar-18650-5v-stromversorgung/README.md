# 18650 Solar-Platine für 5V DIY-Stromversorgung

Kompakte Solar-Ladeplatine auf Basis einer 18650-Zelle zur autarken 5V-Stromversorgung von DIY-Projekten.  
Das Projekt ist **reine Hardware** und kommt vollständig ohne ESP, Firmware oder Software aus.

Ziel ist eine einfache, sichere und effiziente Stromversorgung für kleine Verbraucher wie Sensoren, Mikrocontroller oder USB-Geräte.

---

## Übersicht

Die Platine kombiniert Solar-Laderegler, Tiefentladeschutz und einen 5V-Step-Up-Wandler auf einer kompakten Leiterplatte.

**Hauptfunktionen:**
- Laden einer einzelnen 18650 Li-Ion Zelle per Solarpanel
- Integrierter Tiefentladeschutz für den Akku
- Stabile 5V Ausgangsspannung
- Kompakte Bauform für DIY-Projekte
- Kein Mikrocontroller, keine Software notwendig

---

## Typische Einsatzszenarien

- Autarke 5V-Versorgung für Sensoren
- Stromversorgung für ESP-Projekte mit externem Regler
- Kleine Solar-Experimente
- Pufferstromversorgung
- Testaufbauten und Prototypen

---

## Technische Eckdaten

- **Akkutyp:** 1x 18650 Li-Ion
- **Eingang:** Solarpanel
- **Ausgang:** 5V
- **Schutzfunktionen:** Tiefentladeschutz integriert
- **Steuerung:** vollständig hardwarebasiert

---

## Aufbau und Nutzung

- Akku einsetzen oder anschließen
- Solarpanel verbinden
- Verbraucher an den 5V-Ausgang anschließen
- Fertig

Es sind keine Einstellungen, Programmierung oder Konfiguration nötig.

---

## Verwendete Bauteile

- [TP4056 Modul mit Schutz (DW01 + FS8205A)](https://amzn.to/3TiPULB)
- [TPS61023 5 V Boost-Modul](https://amzn.to/3ZV1U9W)
- [SS12D10 Mini-Schiebeschalter (2x)](https://amzn.to/4kCRfZP)
- [SS54 Schottky-Dioden (3x)](https://amzn.to/4mY9MRS)
- 18650 Akkus (Markenzellen empfohlen!)
- [18650 Halterung](https://amzn.to/3ZuWAtH)
- [Mini-Solarpanels (0.5–1 W)](https://amzn.to/43GxydJ)
- [Sicherungshalter + 500 mA bis 2 A träge Sicherung](https://amzn.to/4dZyNbb)
- [10 µF Kondensator (1206)](https://amzn.to/3HQMrS0)

---

## Sicherheitshinweise

- Nur hochwertige 18650-Zellen verwenden
- Polarität beim Anschluss beachten
- Keine beschädigten Akkus einsetzen
- Projekt ist für Bastel- und DIY-Anwendungen gedacht


---

## Weitere Informationen

Eine ausführliche Projektbeschreibung mit Hintergrundinfos, Bildern und Gedanken zur Entwicklung findest du im Blog:

👉 https://www.smarthomeyourself.de/blog/18650-solar-platine-fuer-5v-diy-stromversorgung-mit-tiefentladeschutz
