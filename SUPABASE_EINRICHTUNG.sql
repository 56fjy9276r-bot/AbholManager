-- In Supabase unter SQL Editor ausführen
create table if not exists public.pickups (
  id text primary key,
  customer text,
  order_no text,
  address text,
  tour text,
  captured_date date,
  due_date date,
  priority text,
  driver text,
  memo text,
  status text,
  slip_photo text,
  proof_photo text,
  completed_at timestamptz,
  completed_by text,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

alter table public.pickups enable row level security;

create policy "team read pickups"
on public.pickups for select
to anon
using (true);

create policy "team insert pickups"
on public.pickups for insert
to anon
with check (true);

create policy "team update pickups"
on public.pickups for update
to anon
using (true)
with check (true);

alter publication supabase_realtime add table public.pickups;
