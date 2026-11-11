-- Limit consultation updates to the status field and verified admins.
revoke update on public.jjta_consultations from authenticated;
grant update(status) on public.jjta_consultations to authenticated;
create policy consultations_admin_update_status on public.jjta_consultations for update to authenticated using ((select jjta_private.is_admin())) with check ((select jjta_private.is_admin()) and status in ('Menunggu','Diproses','Dijadwalkan','Selesai','Dibatalkan'));
