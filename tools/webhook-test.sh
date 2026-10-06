#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# Testeintrag an die Lead-Table-Kacheln schicken.
#
#   ./tools/webhook-test.sh verkauf
#   ./tools/webhook-test.sh lager
#   ./tools/webhook-test.sh azubi
#   ./tools/webhook-test.sh alle
#
# Sendet exakt denselben Payload, den die Karriereseite auch sendet -
# gleiche Feldnamen, gleiche Reihenfolge, jedes Feld genau einmal.
# Danach in der Lead Table prüfen: Name, Telefon und E-Mail dürfen jeweils
# nur EINMAL und im richtigen Feld stehen.
# ---------------------------------------------------------------------------
set -euo pipefail

VERKAUF="https://api-v2.lead-table.com/api/webhook/generic/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0YWJsZUlEIjoiNmFjNGFiNGNkNjM1MzcyNDQxNTgxZGYyIiwiY3VzdG9tZXJJRCI6IjZhYzRhYjFlZDYzNTM3MjQ0MTU3ZDc3NCIsImFnZW5jeUlEIjoiNjliZDc3NzVlNGQxN2IzOGVkNjUzZDE2IiwiaWF0IjoxNzkxMjczODA0fQ.WJ09CLQ9kX5oYmHe-7NzHW-dvGT8AUnekkHdorqeol0"
LAGER="https://api-v2.lead-table.com/api/webhook/generic/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0YWJsZUlEIjoiNmFjNGFiNWQ0NGMwYjIzOGU5ZTM5NWQ2IiwiY3VzdG9tZXJJRCI6IjZhYzRhYjFlZDYzNTM3MjQ0MTU3ZDc3NCIsImFnZW5jeUlEIjoiNjliZDc3NzVlNGQxN2IzOGVkNjUzZDE2IiwiaWF0IjoxNzkxMjczODIxfQ.uSfY8W1mjtOJIwC7IgXXboHGV05wLqSZfImhVxaA24g"
AZUBI="https://api-v2.lead-table.com/api/webhook/generic/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0YWJsZUlEIjoiNmFjNGFiNjZkNjM1MzcyNDQxNTg0MTg3IiwiY3VzdG9tZXJJRCI6IjZhYzRhYjFlZDYzNTM3MjQ0MTU3ZDc3NCIsImFnZW5jeUlEIjoiNjliZDc3NzVlNGQxN2IzOGVkNjUzZDE2IiwiaWF0IjoxNzkxMjczODMwfQ.7S_8uXv0Yv3d0wGHYVzs3G7OgB8yWD84rgYxpSTmh1Y"

HEUTE="$(date +%d.%m.%Y)"
DS="Ja (Einwilligung mit Absenden, Art. 6 Abs. 1 lit. a DSGVO)"
QUELLE="Karriere-Landingpage BIRK Rottweil"
SEITE="https://saviold.github.io/birk/"

send(){ # $1 = name, $2 = url, $3 = json
  echo "── $1 ──────────────────────────────────────────"
  curl -sS -X POST "$2" -H 'Content-Type: application/json' \
       -w '\n[HTTP %{http_code}]\n' -d "$3"
  echo
}

j_verkauf=$(cat <<JSON
{"vorname":"Test","nachname":"Verkauf","telefon":"0151 00000001","email":"test.verkauf@example.com",
"stelle":"Mitarbeiter Verkauf (m/w/d)",
"ausbildung":"Abgeschlossene Ausbildung im technischen Bereich",
"branchenerfahrung":"Mehrjährige Berufserfahrung in Sanitär, Heizung, Lüftung oder Klima",
"vertriebsstaerke":"Ja, ich verkaufe aktiv und bin abschlusssicher",
"technikwissen":"Sehr gutes Produktwissen in Sanitär, Heizung und Lüftung",
"nicht_erfuellt":"–","datum":"$HEUTE","datenschutz":"$DS","quelle":"$QUELLE","seite":"$SEITE"}
JSON
)
j_lager=$(cat <<JSON
{"vorname":"Test","nachname":"Lager","telefon":"0151 00000002","email":"test.lager@example.com",
"stelle":"Mitarbeiter Lager (m/w/d)",
"taetigkeit":"Ja, körperlich aktives Arbeiten liegt mir",
"deutschkenntnisse":"Gut, ich verstehe und spreche sicher (B2)",
"staplerschein":"Ja, Staplerschein vorhanden",
"lagererfahrung":"Mehrjährige Erfahrung in Lager, Logistik oder Großhandel",
"nicht_erfuellt":"–","datum":"$HEUTE","datenschutz":"$DS","quelle":"$QUELLE","seite":"$SEITE"}
JSON
)
j_azubi=$(cat <<JSON
{"vorname":"Test","nachname":"Azubi","telefon":"0151 00000003","email":"test.azubi@example.com",
"stelle":"Auszubildende (m/w/d)",
"schulabschluss":"Schulabschluss vorhanden",
"deutschkenntnisse":"Muttersprache oder verhandlungssicher (C1-C2)",
"interesse":"Beides finde ich spannend",
"ausbildungsstart":"Zum nächsten Ausbildungsjahr",
"nicht_erfuellt":"–","datum":"$HEUTE","datenschutz":"$DS","quelle":"$QUELLE","seite":"$SEITE"}
JSON
)

case "${1:-alle}" in
  verkauf) send "VERKAUF" "$VERKAUF" "$j_verkauf" ;;
  lager)   send "LAGER"   "$LAGER"   "$j_lager"   ;;
  azubi)   send "AZUBI"   "$AZUBI"   "$j_azubi"   ;;
  alle)    send "VERKAUF" "$VERKAUF" "$j_verkauf"
           send "LAGER"   "$LAGER"   "$j_lager"
           send "AZUBI"   "$AZUBI"   "$j_azubi"   ;;
  *) echo "Nutzung: $0 [verkauf|lager|azubi|alle]"; exit 1 ;;
esac

echo "Fertig. Jetzt in der Lead Table prüfen:"
echo "  - Name steht EINMAL (Vorname und Nachname getrennt, nicht doppelt)"
echo "  - Telefon steht EINMAL und im Telefon-Feld"
echo "  - E-Mail  steht EINMAL und im E-Mail-Feld"
echo "  - Testeinträge danach wieder löschen."
