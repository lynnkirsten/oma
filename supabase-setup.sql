-- ═══════════════════════════════════════════════════════════════════
--  Supabase setup voor "Ter herinnering aan Oma" diashow
-- ═══════════════════════════════════════════════════════════════════
--
--  Plak deze hele inhoud in de Supabase SQL Editor en druk op Run.
--  Zorg dat je eerst de storage bucket 'photos' hebt aangemaakt
--  (zie stap 2 in SETUP.md).
--
-- ═══════════════════════════════════════════════════════════════════


-- ─── Tabel voor foto-metadata ────────────────────────────────────
create table if not exists public.photos (
  id            uuid        primary key default gen_random_uuid(),
  storage_path  text        not null,
  caption       text,
  created_at    timestamptz not null default now()
);

comment on table  public.photos               is 'Foto-metadata voor de oma-diashow.';
comment on column public.photos.storage_path  is 'Pad binnen de photos bucket.';
comment on column public.photos.caption       is 'Optioneel bijschrift onder de foto.';


-- ─── Row Level Security aanzetten ─────────────────────────────────
alter table public.photos enable row level security;


-- ─── Toegangsregels voor de tabel ─────────────────────────────────
-- Iedereen mag foto's zien.
drop policy if exists "photos zichtbaar voor iedereen" on public.photos;
create policy "photos zichtbaar voor iedereen"
  on public.photos for select
  using (true);

-- Iedereen mag toevoegen (het wachtwoord aan de front-end kant is de
-- filter; voor familie-gebruik ruim voldoende).
drop policy if exists "photos toevoegen door iedereen" on public.photos;
create policy "photos toevoegen door iedereen"
  on public.photos for insert
  with check (true);


-- ─── Toegangsregels voor de storage bucket ────────────────────────
-- Iedereen mag bestanden uit de 'photos' bucket zien.
drop policy if exists "photos bucket zichtbaar voor iedereen" on storage.objects;
create policy "photos bucket zichtbaar voor iedereen"
  on storage.objects for select
  using (bucket_id = 'photos');

-- Iedereen mag uploaden naar de 'photos' bucket.
drop policy if exists "photos bucket upload door iedereen" on storage.objects;
create policy "photos bucket upload door iedereen"
  on storage.objects for insert
  with check (bucket_id = 'photos');
