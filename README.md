# BIRK Rottweil – Karriereseite

Recruiting-Landingpage für die **Niederlassung Rottweil** der BIRK
(Gebäudetechnik-Großhandel, Teil der G.U.T. GRUPPE).
Ausgeschriebene Stellen: **Lager**, **Verkauf** und **Ausbildung** (m/w/d) –
und ausschließlich diese drei.

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
und `api-v2.lead-table.com` (Egress-Policy). Diese Werte sind deshalb
hergeleitet und sollten einmal gegengeprüft werden:

| Was | Aktueller Wert | Woher |
|---|---|---|
| CI-Rot | `#c8102e` | aus dem BIRK-Favicon im Browser-Screenshot gemessen (Farbton ≈ 350°) |
| Schrift | Barlow | technisch-industrieller Charakter, DIN-nah; kein Styleguide verfügbar |
| Logo | Schriftzug-Fallback | **Original-Logo bitte nach `bilder/logo.svg` legen** – wird dann automatisch eingebunden |
| Bewerbungs-Mail | `bewerbung@birk.de` | Annahme (Domain verifiziert, Postfach nicht) |
| Impressum / Datenschutz | `gut-gruppe.de/impressum` bzw. `/datenschutz` | Annahme |

Mail-Adresse und Rechts-Links stehen gesammelt im `CONFIG`-Objekt ganz oben im
`<script>` am Seitenende – dort einmal ändern, die ganze Seite zieht nach.

## CI anpassen

Farben und Schriften stecken **ausschließlich** im `:root`-Block ganz oben in
`index.html`. Dort einmal ändern – der Rest der Seite zieht automatisch nach.

```css
--brand:#c8102e;      /* BIRK-Rot                            */
--brand-dark:#a60d26; /* Hover-Zustand                       */
--brand-700:#9b0c22;  /* Rot-Ton für Text auf Hell           */
--brand-900:#141a21;  /* Anthrazit: Headlines, Hero, Footer  */
--brand-soft:#fdecef; /* heller Rot-Ton für Flächen          */
--on-brand:#ffffff;   /* Textfarbe AUF Rot (Kontrast 5,9:1)  */
--f-display / --f-body: Barlow
```

## Stellen pflegen

Alle drei Stellen stehen in **einer** Config (`var JOBS` im `<script>` am
Seitenende). Sie speist gleichzeitig:

- die Stellenkarten in der Sektion „Offene Stellen"
- die Stellenauswahl im Formular
- die **Screening-Fragen** der jeweiligen Stelle
- den Hero-Text bei `?stelle=…`
- die JobPosting-Structured-Data

Eine Stelle ändern heißt also: **einen** Eintrag anfassen.

```js
{ key:"verkauf", title:"Mitarbeiter Verkauf (m/w/d)", kurz:"Verkauf",
  teaser:"…",            // Einzeiler unter dem Titel im Formular
  hook:"…",              // Hero-Text bei ?stelle=verkauf
  aliase:["verkauf", …], // weitere Schreibweisen für den Deeplink
  tags:[…], aufgaben:[…], must:[…], profil:[…], bieten:[…],
  webhook:"https://…",   // eigene Lead-Table-Kachel
  questions:[…] }        // 3–5 Screening-Fragen, s. u.
```

### Deeplinks für die Anzeigen

```
https://saviold.github.io/birk/?stelle=lager
https://saviold.github.io/birk/?stelle=verkauf
https://saviold.github.io/birk/?stelle=azubi
```

Der Auswahl-Schritt entfällt dann komplett (ein Schritt weniger), und der
Hero wird auf die Stelle getextet.

---

## Das Formular

### Fragen je Stelle

Jede Stelle hat **eigene Fragen**, weil sich die K.-o.-Kriterien
unterscheiden – eine abgeschlossene Ausbildung als Pflichtkriterium würde
bei der Ausbildungsstelle jede gültige Bewerbung aussortieren.
Alle drei Stellen haben **4 Fragen**, die Schrittzahl ist dadurch immer gleich
(6 Schritte, bzw. 5 beim Deeplink).

| Stelle | Frage | Kategorie |
|---|---|---|
| **Lager** | Art der Tätigkeit (körperlich aktiv) | **Pflicht** |
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
| Lager | `6ac4ab5d44c0b238e9e395d6` |
| Verkauf | `6ac4ab4cd635372441581df2` |
| Ausbildung | `6ac4ab66d635372441584187` |

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
