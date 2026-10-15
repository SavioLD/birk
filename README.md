# BIRK Rottweil – Karriereseite

Recruiting-Landingpage für die **Niederlassung Rottweil** der BIRK
(Gebäudetechnik-Großhandel, Teil der G.U.T. GRUPPE).
Ausgeschriebene Stellen: **Verkauf Lüftung** und **Ausbildung** (m/w/d) –
und ausschließlich diese zwei.

> **Lager ist seit dem 15.10.2026 auf Kundenwunsch deaktiviert.** Der
> komplette Eintrag steht weiter in der Config, nur mit `aktiv:false`.
> Zum Wiedereinschalten genügt `aktiv:true` – siehe
> [Stellen pflegen](#stellen-pflegen).

## Inhalt

- `index.html` – die komplette Seite (self-contained, kein Build-Schritt nötig)
- `bilder/` – hier Logo und Fotos ablegen (siehe `bilder/HIER-BILDER-ABLEGEN.txt`)
- `tools/webhook-test.sh` – Testeintrag an die Lead-Table-Kacheln senden
- `.nojekyll` – sorgt dafür, dass GitHub Pages die Dateien 1:1 ausliefert

## Live schalten (GitHub Pages)

1. Repo-Settings → **Pages** → Source: **Deploy from a branch**, Branch: `main` / `/root`
2. Nach ein paar Minuten unter `https://saviold.github.io/birk/` erreichbar

---

## ⚠️ Vor dem Livegang bitte prüfen

Die Build-Umgebung hatte **keinen Netzzugriff** auf `gut-gruppe.de`, `birk.de`
und `api-v2.lead-table.com` (Egress-Policy). Farben und Logo liegen inzwischen
vor, offen sind nur noch Mail-Adresse und Rechts-Links:

| Was | Aktueller Wert | Status |
|---|---|---|
| CI-Blau | `#00508e` | ✅ verbindlich vom Kunden |
| CI-Rot | `#dd042b` | ✅ verbindlich vom Kunden |
| Logo | `bilder/logo.png` | ✅ Original, freigestellt – Farben unverändert |
| Schrift | Barlow | technisch-industrieller Charakter, DIN-nah; kein Styleguide verfügbar |
| Hero-Foto | `bilder/hero.jpg` | ✅ Fuhrpark am Standort |
| Einblick-Galerie | 3 Fotos | ✅ Verkauf, Ausbildung, Badausstellung |
| Bewerbungs-Mail | `bewerbung@birk.de` | ⚠️ Annahme (Domain verifiziert, Postfach nicht) |
| Impressum / Datenschutz | `gut-gruppe.de/impressum` bzw. `/datenschutz` | ⚠️ Annahme |
| Standort-Adresse | Rheinwaldstraße 10, 78628 Rottweil | ✅ extern bestätigt (ELEMENTS Rottweil) |
| Verkaufsstelle | ausdrücklich Lüftung | ✅ Rückmeldung BIRK 14.10.2026 |

### Rückmeldung BIRK vom 14.10.2026

Drei Punkte, alle umgesetzt:

1. **Die Verkaufsstelle war zu neutral.** Gesucht wird ausdrücklich für die
   **Lüftung** – nicht Sanitär, nicht Heizung – und die Abteilung wird in
   Rottweil **neu aufgebaut**. Titel, Aufgaben, Profil und zwei
   Screening-Fragen sind darauf umgestellt.
2. **Die Fotos zeigten nicht Rottweil** und nicht die eigene Ausstellung.
   Alle drei wurden gelöscht und durch vier eigene Aufnahmen von BIRK
   ersetzt: Fuhrpark (Hero), Arbeitsplatz Verkauf, Auszubildende am
   Katalog und die Badausstellung. Hero und Galerie blenden sich weiterhin
   aus, solange eine Datei fehlt – neue Bilder unter demselben Namen
   ablegen, dann erscheinen sie automatisch wieder.
3. **Beide Aussagen stehen auf der Seite**, direkt untereinander in der
   Sektion „Warum BIRK":
   - Überschrift: **„BIRK – Ihr Gebäudetechnik-Großhandel."**
   - darunter als Claim: **„Familiär geführtes Unternehmen in dritter
     Generation – mit dem Rückhalt einer starken Gruppe."**

   Die zweite Zeile hatte ich zunächst als Ersatz für die erste gelesen und
   entfernt – es war eine Ergänzung. Nachgeholt am 14.10.2026. Beides steht
   zusätzlich in der FAQ-Antwort „Was macht BIRK eigentlich?".

Mail-Adresse und Rechts-Links stehen gesammelt im `CONFIG`-Objekt ganz oben im
`<script>` am Seitenende – dort einmal ändern, die ganze Seite zieht nach.

## Woher die Inhalte stammen

Regel für dieses Projekt: **nichts raten, nichts erfinden.** Jede Aussage
lässt sich einer dieser drei Quellen zuordnen.

### 1. Wörtlich aus dem Briefing
Stellenbezeichnungen (Lager, Verkauf, Ausbildung) · die vier Benefits
(E-Bike-Leasing, Weihnachts- und Urlaubsgeld, 30 Tage Urlaub, Familie und
Beruf im Gleichgewicht, Firmenfitness) · die vier Zusatzleistungen im
Perks-Block · die K.-o.-Kriterien der Verkaufsstelle · Standort Rottweil ·
CI-Farben `#00508e` / `#dd042b`

### 2. Belegt über gut-gruppe.de und die BIRK-Stellenanzeigen

| Angabe | Wert |
|---|---|
| E-Mail Niederlassung | `rottweil@birk.de` |
| Telefon | +49 741 2605-0 |
| Adresse | Rheinwaldstraße 10, 78628 Rottweil |
| Datenschutz (Bewerbungen) | `gut-gruppe.de/de/datenschutzerklaerung-fuer-bewerbungen` |
| Produktbereiche Rottweil | Installation, Sanitär, Heizung, Lüftung, Photovoltaik |
| Unternehmen | inhabergeführt in dritter Generation, seit 2014 Teil der G.U.T. GRUPPE |
| Badausstellungen | Nürtingen, Rottweil, Heidenheim |
| Verkaufsstelle | Vollzeit; Aufgaben aus „Technischer Verkauf im Innendienst (w/m/d)", Niederlassung Rottweil |

Die im Briefing genannten K.-o.-Kriterien decken sich **wörtlich** mit dem
Profil dieser Stellenanzeige – das Briefing war also korrekt.

### 3. Mein Entwurf – braucht Freigabe von BIRK
Die **Aufgaben- und Profil-Listen von Lager (zurzeit deaktiviert) und
Ausbildung**. Für diese beiden
Stellen gibt es keine veröffentlichte Anzeige, deshalb sind das
branchenübliche Formulierungen, keine Angaben von BIRK. Ebenso die
**Screening-Fragen** von Lager und Ausbildung – das Briefing hat dafür
ausdrücklich eigene Ergänzungen erlaubt.

### Weiterhin offen

| Fehlt | Folge auf der Seite |
|---|---|
| Impressum-URL | Footer-Eintrag wird ausgeblendet |
| Ort des Badausstellungs-Fotos | Bildunterschrift ohne Ortsangabe – BIRK hat drei Ausstellungen |
| Vertragsart Lager und Ausbildung | kein Tag; nur für Verkauf ist Vollzeit belegt |
| Ablauf nach der Bewerbung | keine Zusage zu Rückmeldezeit oder Kanal |
| Konditionen der Benefits | Karten nennen nur die Leistung selbst |

Alles davon steht in `CONFIG` ganz oben im `<script>`. Leere Werte blendet die
Seite automatisch aus, statt auf ein geratenes Ziel zu zeigen.

> ⚠️ Der Impressum-Link sollte gesetzt sein, bevor die Seite in Werbeanzeigen
> läuft.

## CI anpassen

Farben und Schriften stecken **ausschließlich** im `:root`-Block ganz oben in
`index.html`. Dort einmal ändern – der Rest der Seite zieht automatisch nach.

```css
--blue:#00508e;       /* Hausfarbe Blau – verbindliche CI       */
--blue-dark:#003a68;  /* Hover / Tiefe                          */
--blue-soft:#e6effa;  /* heller Blau-Ton für Flächen            */
--dark:#00223d;       /* dunkle Flächen: Hero, Footer, Mid-CTA  */
--brand:#dd042b;      /* Rot – verbindliche CI                  */
--brand-dark:#b80323; /* Hover-Zustand                          */
--brand-700:#b80323;  /* Rot-Ton für kleinen Text (6,8:1)       */
--brand-900:#00508e;  /* Headlines in Hausfarbe Blau (8,3:1)    */
--brand-soft:#fdeaee; /* heller Rot-Ton für Flächen             */
--on-brand:#ffffff;   /* Textfarbe AUF Rot (5,1:1)              */
--f-display / --f-body: Barlow
```

### Farbaufteilung

Die Seite folgt dem Logo: **Blau trägt die Struktur, Rot ist die Aktionsfarbe.**

| Blau `#00508e` | Rot `#dd042b` |
|---|---|
| Überschriften | Buttons / CTAs |
| Icons und Icon-Flächen | Fortschrittsbalken |
| Stellen-Tags | ausgewählte Antwort im Formular |
| dunkle Flächen (Hero, Footer) | Kicker, Aufzählungspunkte, Schritt-Nummern |

Alle Kontraste erfüllen WCAG AA (kleinster Wert: Weiß auf Rot, 5,1:1).

## Bilder

| Datei | Wo |
|---|---|
| `logo.png` | Header, Hero, Footer |
| `hero.jpg` | grosses Bild im Kopfbereich |
| `einblick-beratung.jpg` | Galerie 1 |
| `einblick-badausstellung.jpg` | Galerie 2 |

Austauschen heisst: gleiche Datei überschreiben, committen, pushen. Die Seite
findet sie über den Namen, im Code ist nichts zu ändern. Fehlt eine Datei,
bleibt bei der Galerie die graue Fläche und beim Hero der blaue Verlauf stehen –
die Seite bricht nicht.

### Hero-Abdunklung

Über dem Hero-Foto liegt ein Scrim (`.hero__media::after`), damit die Headline
auf jedem Motiv lesbar bleibt.

**Desktop** (ab 821px): Das Foto läuft über die volle Hero-Fläche, der Scrim
dunkelt von links nach rechts ab.

**Handy und Tablet** (bis 820px): Das Foto steht in einem eigenen Band von
320px Höhe ganz oben und ist dort fast unabgedunkelt zu sehen. Erst darunter
– ab ca. 234px, also unterhalb der Logo-Platte – wird abgedunkelt, damit
Headline, Buttons und Fließtext klar lesbar bleiben. Das Band verläuft an
seiner Unterkante exakt in die Hero-Farbe `--dark`, deshalb ist keine Kante
sichtbar. Drei Stellschrauben, falls das Motiv wechselt:

| Was | Wo | Wirkung |
|---|---|---|
| `height` von `.hero__media` | Mobile-Query | wie hoch das Foto steht |
| `background-position` | Mobile-Query (aktuell `70% 50%`) | welcher Bildausschnitt im Hochformat sichtbar ist |
| erste Stops von `.hero__panel::before` | Mobile-Query | ab welcher Höhe abgedunkelt wird |

Nachgemessen mit dem aktuellen Foto, jeweils der schwächste Punkt:

| Viewport | Kicker | Headline | Fließtext | Haken-Zeile |
|---|---|---|---|---|
| 1440px | 5,2:1 | 11,9:1 | 10,0:1 | 12,8:1 |
| 768px | 11,4:1 | 16,4:1 | 13,1:1 | 10,6:1 |
| 390px | 11,5:1 | 16,4:1 | 13,3:1 | 10,5:1 |
| 320px | 11,5:1 | 16,6:1 | 13,4:1 | – |

WCAG AA verlangt 4,5:1. Bei einem deutlich helleren Motiv den ersten Stop des
Scrims erhöhen.

## Logo

- `bilder/logo.png` – freigestelltes Original, wird automatisch eingebunden
- `bilder/logo-original.jpg` – die hochgeladene Originaldatei

Das Logo wurde **nicht nachgebaut, nicht neu gezeichnet und nicht eingefärbt**.
Der weiße Hintergrund des JPEGs wurde exakt herausgerechnet (Un-Matting), die
Volltonfarben sind unverändert: `#004684` und `#c7002b`.

> Die Logo-Datei trägt also minimal andere Werte als die verbindliche CI
> (`#00508e` / `#dd042b`). Das ist Absicht – das Logo bleibt unangetastet,
> die Seite ringsum nutzt die offiziellen Farben.

Auf dunklem Grund (Hero, Footer) steht das Logo auf einer **weißen Platte**,
damit es unverändert bleiben kann und trotzdem lesbar ist. Falls es eine
**quer liegende** Logo-Variante gibt: als `bilder/logo-quer.png` ablegen und in
`loadLogo(...)` im Header vorziehen – im 74 px hohen Header wirkt sie ruhiger
als das gestapelte Signet.

## Stellen pflegen

Alle Stellen stehen in **einer** Config (`var ALLE_STELLEN` im `<script>` am
Seitenende). Sie speist gleichzeitig:

- die Stellenkarten in der Sektion „Offene Stellen"
- die Stellenauswahl im Formular
- die **Screening-Fragen** der jeweiligen Stelle
- den Hero-Text bei `?stelle=…`
- die JobPosting-Structured-Data

Eine Stelle ändern heißt also: **einen** Eintrag anfassen.

### Eine Stelle an- oder abschalten

```js
var JOBS = ALLE_STELLEN.filter(function(j){ return j.aktiv !== false; });
```

`aktiv:false` nimmt die Stelle **vollständig** von der Seite: keine
Stellenkachel, keine Auswahl im Formular, keine Structured Data, kein
Deeplink und kein Webhook-Versand. Texte, Fragen und Webhook-URL bleiben
im Code stehen.

Aktueller Stand:

| Stelle | `aktiv` |
|---|---|
| Lager | `false` – auf Kundenwunsch pausiert (15.10.2026) |
| Verkauf Lüftung | `true` |
| Ausbildung | `true` |

Beim Abschalten mitdenken: die Zähler im Text (`<title>`, Meta-Description,
og-Tags, Hero-Absatz, Überschrift „Zwei Stellen. Ein Team.") stehen als
Fließtext in der Seite und ändern sich nicht automatisch mit.

```js
{ aktiv:true,
  key:"verkauf", title:"Mitarbeiter Verkauf Lüftung (m/w/d)", kurz:"Verkauf Lüftung",
  teaser:"…",            // Einzeiler unter dem Titel im Formular
  hook:"…",              // Hero-Text bei ?stelle=verkauf
  aliase:["verkauf", …], // weitere Schreibweisen für den Deeplink
  tags:[…], aufgaben:[…], must:[…], profil:[…], bieten:[…],
  webhook:"https://…",   // eigene Lead-Table-Kachel
  questions:[…] }        // 3–5 Screening-Fragen, s. u.
```

### Deeplinks für die Anzeigen

```
https://saviold.github.io/birk/?stelle=verkauf
https://saviold.github.io/birk/?stelle=azubi
```

`?stelle=lager` zeigt, solange die Stelle deaktiviert ist, einfach die
normale Seite mit beiden aktiven Stellen – alte Anzeigenlinks laufen also
nicht ins Leere.

Der Auswahl-Schritt entfällt dann komplett (ein Schritt weniger), und der
Hero wird auf die Stelle getextet.

---

## Das Formular

### Fragen je Stelle

Jede Stelle hat **eigene Fragen**, weil sich die K.-o.-Kriterien
unterscheiden – eine abgeschlossene Ausbildung als Pflichtkriterium würde
bei der Ausbildungsstelle jede gültige Bewerbung aussortieren.
Alle Stellen haben **4 Fragen**, die Schrittzahl ist dadurch immer gleich
(6 Schritte, bzw. 5 beim Deeplink).

| Stelle | Frage | Kategorie |
|---|---|---|
| **Lager** *(deaktiviert)* | Art der Tätigkeit (körperlich aktiv) | **Pflicht** |
| | Deutschkenntnisse | **Pflicht** |
| | Staplerschein | optional |
| | Lagererfahrung | optional |
| **Verkauf** | Abgeschlossene Ausbildung (technisch/vertrieblich) | **Pflicht** |
| | Berufserfahrung in der Branche | **Pflicht** |
| | Vertriebsorientierung & Abschlusssicherheit | **Pflicht** |
| | Technisch fundiertes Wissen | optional |
| **Ausbildung** | Schulabschluss | **Pflicht** |
| | Deutschkenntnisse | **Pflicht** |
| | Interessenrichtung | optional |
| | Gewünschter Ausbildungsstart | optional |

In der Config:

```js
{ field:"ausbildung", label:"Ausbildung", pflicht:true,
  h:"Deine Ausbildung", hint:"Bitte ehrlich auswählen.",
  opts:[ {v:"Wert für die Lead Table", t:"Button-Text", s:"Kleingedrucktes", ok:1}, … ] }
```

- `pflicht:true` → eine Antwort **ohne** `ok:1` beendet die Bewerbung sofort
  (K.-o., kein Lead wird gesendet, keine anderen Stellen werden angeboten)
- `pflicht:false` → Bewerber kommt normal weiter; eine Antwort ohne `ok:1`
  wird im Feld `nicht_erfuellt` markiert und **mit übertragen**

Es werden ausschließlich berufsbezogene Kriterien abgefragt – keine Fragen zu
Alter, Herkunft, Gesundheit, Religion oder Familienstand (AGG).
Es gibt **keinen Lebenslauf-Upload und keine Dateianhänge**.

### Mobile Laufruhe

Beim Schrittwechsel passiert bewusst **nichts** außer Klassen, Breite und Text:

- kein `window.scrollTo`, kein `scrollIntoView`, kein `focus()`
- kein Reload, kein Anker-/Hash-Sprung
- feste Mindesthöhe über alle Schritte (`--form-min` / `--form-min-mobile`),
  damit der Container nicht springt
- Fortschrittsanzeige und Weiter-Button bleiben an fester Position
  (`margin-top:auto`)

Nachgemessen im Headless-Chromium bei 390 × 844 px (iPhone 14 Pro):
**0 px Versatz bei jedem einzelnen Schrittwechsel**, auch beim K.-o.-Abbruch
und beim Absenden. Ein Schritt passt mit 566 px vollständig auf den Schirm.

---

## Lead Table

Jede Stelle schreibt in ihre **eigene Kachel**:

| Stelle | tableID |
|---|---|
| Lager *(deaktiviert – bekommt keine neuen Bewerbungen)* | `6ac4ab5d44c0b238e9e395d6` |
| Verkauf | `6ac4ab4cd635372441581df2` |
| Ausbildung | `6ac4ab66d635372441584187` |

Die Lager-Kachel bleibt in der Lead Table bewusst bestehen: Die Seite sendet
nichts mehr dorthin, die bereits eingegangenen Bewerbungen bleiben erhalten,
und beim Wiedereinschalten der Stelle läuft sie ohne neue Einrichtung weiter.

Gesendet wird **ausschließlich** bei einer vollständigen, qualifizierten
Bewerbung. K.-o.-Abbrüche verlassen die Seite nie.

### Payload

Jedes Feld **genau einmal**. Vorname und Nachname bleiben getrennt – es gibt
bewusst **kein** kombiniertes Feld (`name`, `fullname`, `vollstaendiger_name`)
und kein Sammelfeld, das einzeln übergebene Werte noch einmal enthält.

```json
{
  "vorname": "Max",
  "nachname": "Mustermann",
  "telefon": "0151 23456789",
  "email": "max@beispiel.de",
  "stelle": "Mitarbeiter Verkauf (m/w/d)",
  "ausbildung": "…", "branchenerfahrung": "…",
  "vertriebsstaerke": "…", "technikwissen": "…",
  "nicht_erfuellt": "–",
  "datum": "06.10.2026",
  "datenschutz": "Ja (Einwilligung mit Absenden, Art. 6 Abs. 1 lit. a DSGVO)",
  "quelle": "Karriere-Landingpage BIRK Rottweil",
  "seite": "https://saviold.github.io/birk/"
}
```

Die vier Frage-Felder heißen je Stelle unterschiedlich (jede Stelle hat ja ihre
eigene Kachel), damit die Spalten in der Lead Table sprechende Namen bekommen.

### Testeintrag

Der Webhook-Host war aus der Build-Umgebung **nicht erreichbar**, der
Testeintrag konnte dort also nicht gesendet werden. Lokal geht er so:

```bash
./tools/webhook-test.sh alle      # oder: verkauf | lager | azubi
```

Danach in der Lead Table prüfen, dass Name, Telefon und E-Mail jeweils nur
**einmal** und im richtigen Feld ankommen – und die Testeinträge wieder löschen.
