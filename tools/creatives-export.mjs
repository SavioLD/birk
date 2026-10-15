/* ---------------------------------------------------------------------------
   Exportiert die Motive aus creatives/vorlagen.html als JPG in Originalgroesse.

     node tools/creatives-export.mjs            # alle Motive
     node tools/creatives-export.mjs v-a a-c    # nur einzelne

   Voraussetzung: ein lokaler Webserver im Projektordner, z. B.
     python3 -m http.server 8177
   --------------------------------------------------------------------------- */
import pkg from '/opt/node-tools/node_modules/playwright/index.js';
const { chromium } = pkg;

const BASIS = process.env.BASIS || 'http://127.0.0.1:8177';
const ZIEL  = process.env.ZIEL  || 'creatives';

const MOTIVE = [
  { id:'v-a', datei:'verkauf-lueftung_feed-4x5_foto',      w:1080, h:1350 },
  { id:'v-b', datei:'verkauf-lueftung_feed-4x5_leistungen',w:1080, h:1350 },
  { id:'v-c', datei:'verkauf-lueftung_story-9x16',          w:1080, h:1920 },
  { id:'a-a', datei:'ausbildung_feed-4x5_foto',             w:1080, h:1350 },
  { id:'a-b', datei:'ausbildung_feed-4x5_leistungen',       w:1080, h:1350 },
  { id:'a-c', datei:'ausbildung_story-9x16',                w:1080, h:1920 }
];

const nur = process.argv.slice(2);
const liste = nur.length ? MOTIVE.filter(m=>nur.includes(m.id)) : MOTIVE;

const browser = await chromium.launch();
const ctx = await browser.newContext({ viewport:{width:1400,height:1000}, deviceScaleFactor:1 });
const page = await ctx.newPage();
page.on('pageerror', e => console.log('  Fehler:', String(e)));
await page.goto(`${BASIS}/creatives/vorlagen.html`, { waitUntil:'networkidle' });
await page.evaluate(()=>document.fonts.ready);
await page.waitForTimeout(1500);

for (const m of liste){
  const el = await page.$('#'+m.id);
  if(!el){ console.log(`  ${m.id}: nicht gefunden`); continue; }
  const box = await el.boundingBox();
  if (Math.round(box.width)!==m.w || Math.round(box.height)!==m.h){
    console.log(`  ${m.id}: WARNUNG Groesse ${Math.round(box.width)}x${Math.round(box.height)} statt ${m.w}x${m.h}`);
  }
  await el.screenshot({ path:`${ZIEL}/${m.datei}.jpg`, type:'jpeg', quality:92 });
  console.log(`  ${m.datei}.jpg  ${Math.round(box.width)}x${Math.round(box.height)}`);
}
await browser.close();
