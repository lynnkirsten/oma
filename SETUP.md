# Ter herinnering aan Oma — Setup

Deze handleiding neemt je stap voor stap mee door het koppelen van de
diashow aan je Supabase project. Neem er rustig de tijd voor — je hoeft
het maar één keer te doen.

Nodig: **±10 minuten** en een Supabase account (heb je al).

---

## Stap 1 — Nieuw Supabase project maken

1. Ga naar [supabase.com/dashboard](https://supabase.com/dashboard) en
   log in.
2. Klik rechtsboven op **New project**.
3. Vul in:
   - **Name**: `oma` (of iets anders — jij kiest)
   - **Database password**: laat Supabase er een genereren en sla die
     ergens veilig op. Je hebt hem later niet nodig voor de diashow,
     maar wel als je ooit in de database wilt kijken.
   - **Region**: kies iets dicht bij Nederland, bijvoorbeeld
     **West EU (Ireland)**.
4. Klik op **Create new project**. Het opzetten duurt ongeveer een
   minuut.

---

## Stap 2 — De opslag (bucket) aanmaken

Hier komen de foto-bestanden zelf te staan.

1. Klik in de linkerzijbalk op **Storage** (icoontje van een schijf).
2. Klik op **New bucket**.
3. Vul in:
   - **Name**: `photos` (let op: exact zo, kleine letters)
   - **Public bucket**: **aanzetten** ✓ (zodat de foto's zichtbaar zijn
     op de site zonder inloggen)
4. Klik op **Save**.

---

## Stap 3 — De tabel en toegangsregels aanmaken

Nu maken we een tabel voor de bijschriften en volgorde, plus de regels
die bepalen wie mag lezen en uploaden.

1. Klik in de linkerzijbalk op **SQL Editor** (icoontje van een
   database).
2. Klik op **New query**.
3. Open het bestand **`supabase-setup.sql`** uit deze repo, kopieer de
   hele inhoud.
4. Plak het in de SQL Editor.
5. Klik rechtsonder op **Run**.

Je hoort onderin de melding **"Success. No rows returned"** te zien. Dat
is goed — het betekent dat alles is aangemaakt.

---

## Stap 4 — Je Supabase URL en anon key ophalen

1. Klik in de linkerzijbalk op het **tandwiel** (Settings), helemaal
   onderin.
2. Klik op **API**.
3. Je ziet twee dingen die je nodig hebt:
   - **Project URL** — begint met `https://` en eindigt op
     `.supabase.co`
   - **Project API keys** → kies de rij **`anon` `public`** en klik op
     **Copy**. Deze mag publiek gedeeld worden — hij is bewust bedoeld
     voor je website.

> **Let op:** kopieer NIET de `service_role` key. Die geeft volledige
> toegang tot je database en hoort geheim te blijven.

---

## Stap 5 — Waarden in `index.html` invullen

1. Open `index.html` in een tekstverwerker.
2. Zoek bovenin het `<script>`-blok naar deze regels:

   ```js
   const SUPABASE_URL = "";
   const SUPABASE_ANON_KEY = "";
   const UPLOAD_WACHTWOORD = "orchidee";
   ```

3. Vul in:
   - `SUPABASE_URL` — plak je Project URL tussen de quotes.
   - `SUPABASE_ANON_KEY` — plak je anon key tussen de quotes.
   - `UPLOAD_WACHTWOORD` — kies een wachtwoord dat je met familie deelt.
     Simpel is prima ("orchidee", "oma123", etc.). Deze site is voor
     familie, geen bank.

4. Sla het bestand op.

---

## Stap 6 — Testen

1. Open `index.html` in je browser (dubbelklikken werkt vaak, of sleep
   het bestand in je browservenster).
2. Je ziet een lege diashow met de tekst _"Nog geen herinneringen"_.
3. Klik rechtsboven op het **+** icoontje.
4. Voer je wachtwoord in.
5. Kies één of meer foto's.
6. Klik op **Uploaden**.

Als de foto verschijnt: het werkt! 🌸

---

## Stap 7 — Delen met familie

Om de site te delen met familie kun je hem gratis online zetten. Twee
makkelijke opties:

### Optie A — GitHub Pages (aanbevolen, gratis)

1. Push deze repo naar GitHub (dat gebeurt automatisch als Claude Code
   je code committeert).
2. Ga in de repo op github.com naar **Settings → Pages**.
3. Onder **Source**: kies **Deploy from a branch**.
4. **Branch**: kies de branch (bijvoorbeeld `main` of
   `claude/memorial-slideshow-photos-10q1e0`) en **/ (root)**.
5. Klik op **Save**.
6. Na een paar minuten is de site live op iets als
   `https://[jouw-naam].github.io/oma/`.

### Optie B — Netlify Drop (nog eenvoudiger)

1. Ga naar [app.netlify.com/drop](https://app.netlify.com/drop).
2. Sleep het `index.html` bestand in het venster.
3. Netlify geeft je meteen een openbare URL.

---

## Instellingen aanpassen

Rechtsboven in de diashow zit een tandwieltje. Daar kun je:

- De **naam** aanpassen die in de header staat (staat op "Oma" als
  standaard).
- **Automatisch afspelen** aan- of uitzetten.
- Het **aantal seconden per foto** kiezen (2 tot 30).

Deze instellingen worden lokaal in je browser opgeslagen — iedere
bezoeker kan het naar zijn eigen voorkeur zetten.

---

## Muziek toevoegen (later)

Je hebt aangegeven dat muziek er nu nog niet in hoeft, maar wel later
mogelijk moet zijn. Wanneer je zover bent: laat het me weten en ik voeg
een muziek-upload en achtergrondspeler toe. De ruimte is er in het
ontwerp al voor gereserveerd.

---

## Vragen of problemen?

Als iets niet werkt: kijk in de browser-console (rechtsklik → Inspect →
Console tab) voor foutmeldingen. De meest voorkomende oorzaken:

- **Foto's verschijnen niet** → Bucket is niet publiek. Ga naar
  Storage → photos → Settings → Public: aan.
- **Uploaden mislukt** → De SQL uit stap 3 is niet uitgevoerd, of niet
  volledig. Draai het bestand `supabase-setup.sql` nog een keer.
- **De site blijft "Bijna klaar" tonen** → De SUPABASE_URL of
  SUPABASE_ANON_KEY is niet ingevuld in `index.html`.
