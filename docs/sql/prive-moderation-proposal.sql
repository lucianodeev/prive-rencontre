-- Privé Rencontre: esquema de moderação proposto para revisão.
-- NÃO APLICADO ao Supabase. Rever esquema existente e políticas antes da execução.
-- Moderadores usam backend privado com service_role; nunca expor essa chave no navegador.
begin;
create table if not exists public.prive_profile_reports (
  id uuid primary key default gen_random_uuid(),
  profile_user_id uuid not null references auth.users(id) on delete cascade,
  reporter_user_id uuid not null references auth.users(id) on delete cascade,
  reason text not null check (reason in ('minor','impersonation','coercion','nonconsensual','spam','other')),
  details text not null default '' check (char_length(details) <= 2000),
  status text not null default 'pending' check (status in ('pending','reviewing','resolved','dismissed')),
  created_at timestamptz not null default now(),
  reviewed_at timestamptz,
  constraint different_reporter check (reporter_user_id <> profile_user_id)
);
create index if not exists prive_reports_pending_idx on public.prive_profile_reports(status, created_at);
alter table public.prive_profile_reports enable row level security;
revoke all on public.prive_profile_reports from anon, authenticated;
grant insert, select on public.prive_profile_reports to authenticated;
drop policy if exists "reporter_insert_own" on public.prive_profile_reports;
create policy "reporter_insert_own" on public.prive_profile_reports for insert to authenticated
with check ((select auth.uid()) = reporter_user_id and status = 'pending' and reviewed_at is null);
drop policy if exists "reporter_read_own" on public.prive_profile_reports;
create policy "reporter_read_own" on public.prive_profile_reports for select to authenticated
using ((select auth.uid()) = reporter_user_id);
-- No UPDATE/DELETE policy for authenticated: only trusted server administration.
commit;
