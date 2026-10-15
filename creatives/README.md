# Creatives · BIRK Rottweil

Anzeigenmotive und Werbetexte für die beiden aktiven Stellen
(**Verkauf Lüftung** und **Ausbildung**). Die Lager-Stelle ist auf der
Karriereseite deaktiviert und kommt hier deshalb nicht vor.

## Dateien

| Datei | Format | Größe | Platzierung |
|---|---|---|---|
| `verkauf-lueftung_feed-4x5_foto.jpg` | 4:5 | 1080 × 1350 | Feed, Instagram |
| `verkauf-lueftung_feed-4x5_leistungen.jpg` | 4:5 | 1080 × 1350 | Feed, Instagram |
| `verkauf-lueftung_story-9x16.jpg` | 9:16 | 1080 × 1920 | Story, Reels |
| `ausbildung_feed-4x5_foto.jpg` | 4:5 | 1080 × 1350 | Feed, Instagram |
| `ausbildung_feed-4x5_leistungen.jpg` | 4:5 | 1080 × 1350 | Feed, Instagram |
| `ausbildung_story-9x16.jpg` | 9:16 | 1080 × 1920 | Story, Reels |

`werbetexte.md` – pro Stelle drei Primärtexte, eine Überschrift, eine
Beschreibung, dazu die Hinweise zur Schaltung.

## Woher die Fotos kommen

Ausschließlich die von BIRK gelieferten Fotos aus `../bilder/`. Keine
Stockbilder, keine KI-Bilder.

| Motiv | Foto |
|---|---|
| Verkauf Lüftung, Foto + Story | `einblick-verkauf.jpg` |
| Verkauf Lüftung, Leistungen | kein Foto – rein typografisch |
| Ausbildung, alle drei | `einblick-ausbildung.jpg` |

Das Leistungs-Motiv für die Lüftungsstelle kommt bewusst ohne Foto aus:
Der Fuhrpark-Lkw trägt die Aufschrift „Bad / Heizung / Energie", und die
Stelle ist ausdrücklich für die **Lüftung** ausgeschrieben.

**Es fehlt weiterhin ein Foto aus der Lüftung** – und eines vom Lager,
falls die Stelle zurückkommt.

## Motive ändern

Alle sechs Motive stehen in **einer** Quelldatei: `vorlagen.html`.
Jede `.board`-Box ist ein Motiv in Originalgröße.

```bash
python3 -m http.server 8177          # im Projektordner
node tools/creatives-export.mjs      # alle Motive neu exportieren
node tools/creatives-export.mjs v-a  # oder einzeln
```

| id | Motiv |
|---|---|
| `v-a` | Verkauf Lüftung · Feed · Foto |
| `v-b` | Verkauf Lüftung · Feed · Leistungen |
| `v-c` | Verkauf Lüftung · Story |
| `a-a` | Ausbildung · Feed · Foto |
| `a-b` | Ausbildung · Feed · Leistungen |
| `a-c` | Ausbildung · Story |

Die Story-Motive halten oben 250 px und unten 380 px frei, damit die
Bedienelemente von Instagram und Facebook nichts überdecken.
