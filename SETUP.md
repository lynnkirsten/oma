# Ter herinnering aan Willy — Setup

Deze handleiding brengt je in ~15 minuten van deze code naar een echte
website die je met familie kunt delen.

Je hebt nodig:
- Een GitHub-account (heb je) → de code staat al in
  `lynnkirsten/oma`
- Een Supabase-account (heb je) → gratis
- 15 minuten

---

## Deel 1 — Supabase opzetten (10 min)

### Stap 1. Nieuw project

1. Log in op [supabase.com/dashboard](https://supabase.com/dashboard).
2. Klik rechtsboven op **New project**.
3. Vul in:
   - **Name**: `willy` (jouw keuze)
   - **Database password**: laat Supabase 'n sterk wachtwoord genereren
     en sla die ergens veilig op (heb je later nooit meer nodig).
   - **Region**: **West EU (Ireland)** of **Frankfurt** — dicht bij NL.
4. Klik **Create new project** en wacht ~1 minuut.

### Stap 2. Storage bucket voor de foto's

1. Linkerzijbalk → **Storage** (schijf-icoon).
2. Klik **New bucket**.
3. Vul in:
   - **Name**: `photos` (exact zo, kleine letters)
   - **Public bucket**: ✅ **aanzetten**
4. Klik **Save**.

### Stap 3. Tabel + toegangsregels (SQL)

1. Linkerzijbalk → **SQL Editor** (database-icoon).
2. Klik **New query**.
3. Open in deze repo het bestand **`supabase-setup.sql`**, kopieer de
   hele inhoud.
4. Plak in de SQL Editor.
5. Klik rechtsonder op **Run**.

Je hoort **"Success. No rows returned"** te zien. Klaar.

### Stap 4. Twee waarden ophalen

1. Linkerzijbalk → **Settings** (tandwiel onderin) → **API**.
2. Kopieer twee dingen naar Kladblok / Notes:
   - **Project URL** — begint met `https://` en eindigt op
     `.supabase.co`
   - **Project API keys** → de rij **`anon` `public`** — die lange
     string na "Copy" klikken

> **Belangrijk om te weten:** de `anon public` key is **bedoeld om
> publiek te zijn**. Supabase noemt hem letterlijk zo. Hij mag in de
> HTML staan en op GitHub. De echte beveiliging zit in de "Row Level
> Security" regels die de SQL van stap 3 heeft aangemaakt. Wat je
> **nooit** deelt is de **`service_role`** key — die staat op dezelfde
> pagina en geeft volledige toegang.

---

## Deel 2 — De twee sleutels invullen (2 min)

Nu plak je de twee waarden uit stap 4 op de juiste plek in `index.html`.

### Optie A — via GitHub (makkelijkst)

1. Ga naar https://github.com/lynnkirsten/oma
2. Wissel bovenaan naar de branch
   **`claude/memorial-slideshow-photos-10q1e0`**.
3. Klik op **`index.html`**.
4. Klik rechtsboven op het **potloodje** (Edit this file).
5. Druk **Ctrl+F** (of Cmd+F op Mac) en zoek naar `🔧 CONFIG`.
6. Je ziet drie regels:
   ```js
   const SUPABASE_URL = "";
   const SUPABASE_ANON_KEY = "";
   const UPLOAD_WACHTWOORD = "";
   ```
7. Vul in tussen de quotes:
   - `SUPABASE_URL` → jouw project-URL
   - `SUPABASE_ANON_KEY` → jouw anon public key
   - `UPLOAD_WACHTWOORD` → een wachtwoord dat je met familie deelt
     (bijv. `"willy-orchidee"`). Simpel is prima — dit is een
     familie-website, geen bank.
8. Scroll naar beneden, klik **Commit changes**.

### Optie B — lokaal

1. Open `index.html` in een teksteditor (VS Code, Notepad++, TextEdit).
2. Zoek naar `🔧 CONFIG` en vul dezelfde drie regels in.
3. Sla op en push naar GitHub (of gebruik lokaal).

---

## Deel 3 — De site live zetten (3 min)

### GitHub Pages inschakelen

1. Ga naar https://github.com/lynnkirsten/oma
2. Klik bovenin op **Settings**.
3. Linkerzijbalk → **Pages**.
4. Onder **Source**: kies **Deploy from a branch**.
5. Onder **Branch**: kies
   `claude/memorial-slideshow-photos-10q1e0` en `/ (root)`.
6. Klik **Save**.
7. Wacht 1–2 minuten.

Je site staat nu live op:
```
https://lynnkirsten.github.io/oma/
```

Deel die link met familie. Klaar.

---

## Deel 4 — Gebruiken

- **Bezoekers** zien de rouwkaart-diashow direct.
- **Foto's toevoegen**: klik rechtsboven op **+**, voer het wachtwoord
  in dat je bij stap 2 hebt gekozen, sleep of kies foto's, klik
  **Uploaden**.
- **Diashow-tempo**: klik op het tandwieltje rechtsboven om
  automatisch afspelen aan/uit te zetten of de snelheid aan te passen.
- **Toetsenbord**: ← / → om door te bladeren, spatie om te
  pauzeren.
- **Controls verdwijnen** na 4 seconden zonder muisbeweging voor een
  schone weergave — beweeg je muis en ze komen terug.

---

## Problemen?

**"Bijna klaar" scherm blijft komen** → de twee waarden bij CONFIG zijn
nog leeg. Ga terug naar Deel 2.

**Uploaden mislukt** → de SQL uit `supabase-setup.sql` is (nog) niet
uitgevoerd, of maar deels. Ga terug naar Deel 1, stap 3.

**Foto's verschijnen niet** → de bucket `photos` in Supabase is niet
public. Storage → photos → Settings → Public: **aan**.

**Live site is nog niet online** → GitHub Pages heeft 1–2 minuten
nodig na de eerste keer 'Save'. Ververs de pagina.
