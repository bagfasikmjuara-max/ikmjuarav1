--
-- PostgreSQL database dump
--

\restrict 9XaJobbL6S1gfS0UsySzwfLnLm3OhC5ihlbQYVHxn2NjBVNcPgYrH9qxd9mMDBQ

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.konsultasi_pesan DROP CONSTRAINT IF EXISTS konsultasi_pesan_konsultasi_id_foreign;
ALTER TABLE IF EXISTS ONLY public.form_app_responses DROP CONSTRAINT IF EXISTS form_app_responses_template_id_foreign;
DROP INDEX IF EXISTS public.sessions_user_id_index;
DROP INDEX IF EXISTS public.sessions_last_activity_index;
DROP INDEX IF EXISTS public.pelaku_usaha_nib_kbli_index;
DROP INDEX IF EXISTS public.jobs_queue_index;
DROP INDEX IF EXISTS public.cache_locks_expiration_index;
DROP INDEX IF EXISTS public.cache_expiration_index;
ALTER TABLE IF EXISTS ONLY public.usulan_perubahan DROP CONSTRAINT IF EXISTS usulan_perubahan_pkey;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_username_unique;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_pkey;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_email_unique;
ALTER TABLE IF EXISTS ONLY public.tna_pertanyaans DROP CONSTRAINT IF EXISTS tna_pertanyaans_pkey;
ALTER TABLE IF EXISTS ONLY public.tna_pertanyaans DROP CONSTRAINT IF EXISTS tna_pertanyaans_nomor_soal_unique;
ALTER TABLE IF EXISTS ONLY public.tna_digitals DROP CONSTRAINT IF EXISTS tna_digitals_pkey;
ALTER TABLE IF EXISTS ONLY public.statistik_kecamatan DROP CONSTRAINT IF EXISTS statistik_kecamatan_pkey;
ALTER TABLE IF EXISTS ONLY public.statistik_kecamatan DROP CONSTRAINT IF EXISTS statistik_kecamatan_kecamatan_unique;
ALTER TABLE IF EXISTS ONLY public.siinas_industries DROP CONSTRAINT IF EXISTS siinas_industries_pkey;
ALTER TABLE IF EXISTS ONLY public.sessions DROP CONSTRAINT IF EXISTS sessions_pkey;
ALTER TABLE IF EXISTS ONLY public.registrasi_pelatihan DROP CONSTRAINT IF EXISTS registrasi_pelatihan_pkey;
ALTER TABLE IF EXISTS ONLY public.publikasi DROP CONSTRAINT IF EXISTS publikasi_pkey;
ALTER TABLE IF EXISTS ONLY public.peta_sebaran DROP CONSTRAINT IF EXISTS peta_sebaran_pkey;
ALTER TABLE IF EXISTS ONLY public.permohonan_hki_merek DROP CONSTRAINT IF EXISTS permohonan_hki_merek_pkey;
ALTER TABLE IF EXISTS ONLY public.pelaku_usahas DROP CONSTRAINT IF EXISTS pelaku_usahas_pkey;
ALTER TABLE IF EXISTS ONLY public.pelaku_usahas DROP CONSTRAINT IF EXISTS pelaku_usahas_nib_unique;
ALTER TABLE IF EXISTS ONLY public.pelaku_usaha DROP CONSTRAINT IF EXISTS pelaku_usaha_pkey;
ALTER TABLE IF EXISTS ONLY public.password_reset_tokens DROP CONSTRAINT IF EXISTS password_reset_tokens_pkey;
ALTER TABLE IF EXISTS ONLY public.migrations DROP CONSTRAINT IF EXISTS migrations_pkey;
ALTER TABLE IF EXISTS ONLY public.list_kegiatan DROP CONSTRAINT IF EXISTS list_kegiatan_pkey;
ALTER TABLE IF EXISTS ONLY public.kuesioner_evaluasi DROP CONSTRAINT IF EXISTS kuesioner_evaluasi_pkey;
ALTER TABLE IF EXISTS ONLY public.konsultasi DROP CONSTRAINT IF EXISTS konsultasi_pkey;
ALTER TABLE IF EXISTS ONLY public.konsultasi_pesan DROP CONSTRAINT IF EXISTS konsultasi_pesan_pkey;
ALTER TABLE IF EXISTS ONLY public.kbli DROP CONSTRAINT IF EXISTS kbli_pkey;
ALTER TABLE IF EXISTS ONLY public.kategori_konsultasis DROP CONSTRAINT IF EXISTS kategori_konsultasis_pkey;
ALTER TABLE IF EXISTS ONLY public.kategori_konsultasis DROP CONSTRAINT IF EXISTS kategori_konsultasis_nama_kategori_unique;
ALTER TABLE IF EXISTS ONLY public.jobs DROP CONSTRAINT IF EXISTS jobs_pkey;
ALTER TABLE IF EXISTS ONLY public.job_batches DROP CONSTRAINT IF EXISTS job_batches_pkey;
ALTER TABLE IF EXISTS ONLY public.form_app_templates DROP CONSTRAINT IF EXISTS form_app_templates_slug_unique;
ALTER TABLE IF EXISTS ONLY public.form_app_templates DROP CONSTRAINT IF EXISTS form_app_templates_pkey;
ALTER TABLE IF EXISTS ONLY public.form_app_responses DROP CONSTRAINT IF EXISTS form_app_responses_pkey;
ALTER TABLE IF EXISTS ONLY public.failed_jobs DROP CONSTRAINT IF EXISTS failed_jobs_uuid_unique;
ALTER TABLE IF EXISTS ONLY public.failed_jobs DROP CONSTRAINT IF EXISTS failed_jobs_pkey;
ALTER TABLE IF EXISTS ONLY public.database_hki_mereks DROP CONSTRAINT IF EXISTS database_hki_mereks_pkey;
ALTER TABLE IF EXISTS ONLY public.database_halals DROP CONSTRAINT IF EXISTS database_halals_pkey;
ALTER TABLE IF EXISTS ONLY public.cache DROP CONSTRAINT IF EXISTS cache_pkey;
ALTER TABLE IF EXISTS ONLY public.cache_locks DROP CONSTRAINT IF EXISTS cache_locks_pkey;
ALTER TABLE IF EXISTS public.usulan_perubahan ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tna_pertanyaans ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tna_digitals ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.statistik_kecamatan ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.siinas_industries ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.registrasi_pelatihan ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.publikasi ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.peta_sebaran ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.permohonan_hki_merek ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.pelaku_usahas ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.pelaku_usaha ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.migrations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.list_kegiatan ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.kuesioner_evaluasi ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.konsultasi_pesan ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.konsultasi ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.kbli ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.kategori_konsultasis ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.jobs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.form_app_templates ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.form_app_responses ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.failed_jobs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.database_hki_mereks ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.database_halals ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.usulan_perubahan_id_seq;
DROP TABLE IF EXISTS public.usulan_perubahan;
DROP SEQUENCE IF EXISTS public.users_id_seq;
DROP TABLE IF EXISTS public.users;
DROP SEQUENCE IF EXISTS public.tna_pertanyaans_id_seq;
DROP TABLE IF EXISTS public.tna_pertanyaans;
DROP SEQUENCE IF EXISTS public.tna_digitals_id_seq;
DROP TABLE IF EXISTS public.tna_digitals;
DROP SEQUENCE IF EXISTS public.statistik_kecamatan_id_seq;
DROP TABLE IF EXISTS public.statistik_kecamatan;
DROP SEQUENCE IF EXISTS public.siinas_industries_id_seq;
DROP TABLE IF EXISTS public.siinas_industries;
DROP TABLE IF EXISTS public.sessions;
DROP SEQUENCE IF EXISTS public.registrasi_pelatihan_id_seq;
DROP TABLE IF EXISTS public.registrasi_pelatihan;
DROP SEQUENCE IF EXISTS public.publikasi_id_seq;
DROP TABLE IF EXISTS public.publikasi;
DROP SEQUENCE IF EXISTS public.peta_sebaran_id_seq;
DROP TABLE IF EXISTS public.peta_sebaran;
DROP SEQUENCE IF EXISTS public.permohonan_hki_merek_id_seq;
DROP TABLE IF EXISTS public.permohonan_hki_merek;
DROP SEQUENCE IF EXISTS public.pelaku_usahas_id_seq;
DROP TABLE IF EXISTS public.pelaku_usahas;
DROP SEQUENCE IF EXISTS public.pelaku_usaha_id_seq;
DROP TABLE IF EXISTS public.pelaku_usaha;
DROP TABLE IF EXISTS public.password_reset_tokens;
DROP SEQUENCE IF EXISTS public.migrations_id_seq;
DROP TABLE IF EXISTS public.migrations;
DROP SEQUENCE IF EXISTS public.list_kegiatan_id_seq;
DROP TABLE IF EXISTS public.list_kegiatan;
DROP SEQUENCE IF EXISTS public.kuesioner_evaluasi_id_seq;
DROP TABLE IF EXISTS public.kuesioner_evaluasi;
DROP SEQUENCE IF EXISTS public.konsultasi_pesan_id_seq;
DROP TABLE IF EXISTS public.konsultasi_pesan;
DROP SEQUENCE IF EXISTS public.konsultasi_id_seq;
DROP TABLE IF EXISTS public.konsultasi;
DROP SEQUENCE IF EXISTS public.kbli_id_seq;
DROP TABLE IF EXISTS public.kbli;
DROP SEQUENCE IF EXISTS public.kategori_konsultasis_id_seq;
DROP TABLE IF EXISTS public.kategori_konsultasis;
DROP SEQUENCE IF EXISTS public.jobs_id_seq;
DROP TABLE IF EXISTS public.jobs;
DROP TABLE IF EXISTS public.job_batches;
DROP SEQUENCE IF EXISTS public.form_app_templates_id_seq;
DROP TABLE IF EXISTS public.form_app_templates;
DROP SEQUENCE IF EXISTS public.form_app_responses_id_seq;
DROP TABLE IF EXISTS public.form_app_responses;
DROP SEQUENCE IF EXISTS public.failed_jobs_id_seq;
DROP TABLE IF EXISTS public.failed_jobs;
DROP SEQUENCE IF EXISTS public.database_hki_mereks_id_seq;
DROP TABLE IF EXISTS public.database_hki_mereks;
DROP SEQUENCE IF EXISTS public.database_halals_id_seq;
DROP TABLE IF EXISTS public.database_halals;
DROP TABLE IF EXISTS public.cache_locks;
DROP TABLE IF EXISTS public.cache;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cache; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


--
-- Name: database_halals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.database_halals (
    id bigint NOT NULL,
    nik character varying(16),
    nib character varying(13),
    no_daftar character varying(255),
    nama_pu character varying(255) NOT NULL,
    merk_dagang character varying(255),
    tanggal_daftar character varying(255),
    status character varying(255) DEFAULT 'Terbit'::character varying NOT NULL,
    tanggal_sertifikat character varying(255),
    no_sertifikat character varying(255),
    nama_fasilitator character varying(255),
    jenis_produk character varying(255),
    link_sertifikat_halal text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: database_halals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.database_halals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: database_halals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.database_halals_id_seq OWNED BY public.database_halals.id;


--
-- Name: database_hki_mereks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.database_hki_mereks (
    id bigint NOT NULL,
    nik character varying(16),
    nib character varying(13),
    nomor_transaksi character varying(255),
    merek character varying(255) NOT NULL,
    kelas character varying(255),
    nomor_permohonan character varying(255),
    link_tanda_daftar text,
    tipe_permohonan character varying(255) DEFAULT 'Merek Dagang'::character varying NOT NULL,
    status_permohonan_merek character varying(255) DEFAULT '(TM) Didaftar'::character varying NOT NULL,
    link_sertifikat_merek text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: database_hki_mereks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.database_hki_mereks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: database_hki_mereks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.database_hki_mereks_id_seq OWNED BY public.database_hki_mereks.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: form_app_responses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.form_app_responses (
    id bigint NOT NULL,
    template_id bigint NOT NULL,
    nama_ikm character varying(255),
    answers json NOT NULL,
    total_score integer DEFAULT 0 NOT NULL,
    max_score integer DEFAULT 100 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: form_app_responses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.form_app_responses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: form_app_responses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.form_app_responses_id_seq OWNED BY public.form_app_responses.id;


--
-- Name: form_app_templates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.form_app_templates (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    penyelenggara character varying(255) DEFAULT 'Dinas Tenaga Kerja, Koperasi Usaha Kecil dan Menengah Kota Madiun'::character varying NOT NULL,
    lokasi character varying(255) DEFAULT 'Resto I Club Madiun (Aula Utama)'::character varying NOT NULL,
    tanggal date NOT NULL,
    slug character varying(255) NOT NULL,
    structure json NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    tanggal_selesai date,
    peserta_list text
);


--
-- Name: form_app_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.form_app_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: form_app_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.form_app_templates_id_seq OWNED BY public.form_app_templates.id;


--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


--
-- Name: jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: kategori_konsultasis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.kategori_konsultasis (
    id bigint NOT NULL,
    nama_kategori character varying(255) NOT NULL,
    deskripsi character varying(255),
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: kategori_konsultasis_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.kategori_konsultasis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: kategori_konsultasis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.kategori_konsultasis_id_seq OWNED BY public.kategori_konsultasis.id;


--
-- Name: kbli; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.kbli (
    id bigint NOT NULL,
    kode character varying(10) NOT NULL,
    judul text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    versi character varying(255) DEFAULT 'KBLI 2020'::character varying NOT NULL
);


--
-- Name: kbli_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.kbli_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: kbli_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.kbli_id_seq OWNED BY public.kbli.id;


--
-- Name: konsultasi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.konsultasi (
    id bigint NOT NULL,
    nama_ikm character varying(255) NOT NULL,
    jenis_usaha character varying(255) NOT NULL,
    keluhan text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    email character varying(255),
    jawaban text,
    status character varying(255) DEFAULT 'Belum Dijawab'::character varying NOT NULL,
    nik character varying(16),
    sumber character varying(50) DEFAULT 'Umum'::character varying NOT NULL
);


--
-- Name: konsultasi_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.konsultasi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: konsultasi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.konsultasi_id_seq OWNED BY public.konsultasi.id;


--
-- Name: konsultasi_pesan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.konsultasi_pesan (
    id bigint NOT NULL,
    konsultasi_id bigint NOT NULL,
    sender character varying(255) NOT NULL,
    pesan text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT konsultasi_pesan_sender_check CHECK (((sender)::text = ANY (ARRAY[('admin'::character varying)::text, ('user'::character varying)::text])))
);


--
-- Name: konsultasi_pesan_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.konsultasi_pesan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: konsultasi_pesan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.konsultasi_pesan_id_seq OWNED BY public.konsultasi_pesan.id;


--
-- Name: kuesioner_evaluasi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.kuesioner_evaluasi (
    id bigint NOT NULL,
    penyelenggara character varying(255) DEFAULT 'Dinas Tenaga Kerja, Koperasi Usaha Kecil dan Menengah Kota Madiun'::character varying NOT NULL,
    lokasi character varying(255) NOT NULL,
    tanggal date NOT NULL,
    nama_ikm character varying(255),
    jawaban_bagian_a json NOT NULL,
    jawaban_bagian_b json NOT NULL,
    jawaban_bagian_c json NOT NULL,
    jawaban_bagian_d json NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: kuesioner_evaluasi_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.kuesioner_evaluasi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: kuesioner_evaluasi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.kuesioner_evaluasi_id_seq OWNED BY public.kuesioner_evaluasi.id;


--
-- Name: list_kegiatan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.list_kegiatan (
    id bigint NOT NULL,
    nama_kegiatan character varying(255) NOT NULL,
    sub_pelaksana character varying(255),
    tgl_mulai date,
    tgl_selesai date,
    tempat_kegiatan character varying(255),
    kuota_peserta integer DEFAULT 0 NOT NULL,
    deskripsi_kegiatan text,
    status character varying(255) DEFAULT 'aktif'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: list_kegiatan_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.list_kegiatan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: list_kegiatan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.list_kegiatan_id_seq OWNED BY public.list_kegiatan.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


--
-- Name: pelaku_usaha; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pelaku_usaha (
    id bigint NOT NULL,
    nib character varying(13),
    nik character varying(16),
    skala_usaha character varying(255),
    jenis_perusahaan character varying(255),
    nama_perusahaan character varying(255),
    nama_proyek character varying(255),
    nama_pemilik character varying(255),
    alamat_usaha text,
    kecamatan character varying(255),
    kelurahan character varying(100),
    kbli character(5),
    uraian_kbli text,
    tingkat_risiko character varying(255),
    investasi bigint DEFAULT '0'::bigint NOT NULL,
    tenaga_kerja integer DEFAULT 0 NOT NULL,
    no_telp character varying(255),
    email character varying(255),
    tgl_terbit date,
    nama_usaha character varying(255),
    pemilik character varying(255),
    alamat text,
    latitude numeric(10,8),
    longitude numeric(11,8),
    kategori character varying(100),
    status character varying(255) DEFAULT 'Aktif'::character varying NOT NULL,
    sertifikat_halal character varying(255),
    bpom character varying(255),
    cppob character varying(255),
    sni character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    foto_ktp character varying(255)
);


--
-- Name: pelaku_usaha_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pelaku_usaha_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pelaku_usaha_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pelaku_usaha_id_seq OWNED BY public.pelaku_usaha.id;


--
-- Name: pelaku_usahas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pelaku_usahas (
    id bigint NOT NULL,
    nib character varying(13) NOT NULL,
    nik character varying(16) NOT NULL,
    skala_usaha character varying(255) NOT NULL,
    jenis_perusahaan character varying(255) NOT NULL,
    nama_perusahaan character varying(255) NOT NULL,
    nama_proyek character varying(255) NOT NULL,
    nama_pemilik character varying(255) NOT NULL,
    alamat_usaha text NOT NULL,
    kecamatan character varying(255) NOT NULL,
    kelurahan character varying(255) NOT NULL,
    kbli character(5) NOT NULL,
    uraian_kbli text NOT NULL,
    tingkat_risiko character varying(255) NOT NULL,
    investasi numeric(15,2) NOT NULL,
    tenaga_kerja integer NOT NULL,
    no_telp character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    tgl_terbit date NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: pelaku_usahas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pelaku_usahas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pelaku_usahas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pelaku_usahas_id_seq OWNED BY public.pelaku_usahas.id;


--
-- Name: permohonan_hki_merek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.permohonan_hki_merek (
    id bigint NOT NULL,
    nama_lengkap character varying(255) NOT NULL,
    nik character varying(16) NOT NULL,
    nib character varying(13) NOT NULL,
    nama_merek character varying(255) NOT NULL,
    kelas_merek character varying(255) NOT NULL,
    alamat_ktp text NOT NULL,
    alamat_usaha text NOT NULL,
    no_hp character varying(255) NOT NULL,
    file_ktp character varying(255),
    file_nib character varying(255),
    file_etiket_merek character varying(255),
    file_surat_pernyataan character varying(255),
    status character varying(255) DEFAULT 'Pending'::character varying NOT NULL,
    catatan_admin text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    uraian_barang_jasa text,
    link_gdrive_rekom text
);


--
-- Name: permohonan_hki_merek_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.permohonan_hki_merek_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: permohonan_hki_merek_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.permohonan_hki_merek_id_seq OWNED BY public.permohonan_hki_merek.id;


--
-- Name: peta_sebaran; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.peta_sebaran (
    id bigint NOT NULL,
    nama_usaha character varying(255),
    pemilik character varying(255),
    nib character varying(13),
    nik character varying(16),
    no_hp character varying(255),
    produk character varying(255),
    alamat_jalan character varying(255),
    alamat_no character varying(255),
    kelurahan character varying(255),
    kecamatan character varying(255),
    kota_madiun character varying(255) DEFAULT 'Kota Madiun'::character varying NOT NULL,
    kategori character varying(255),
    skala_usaha character varying(255),
    latitude character varying(255),
    longitude character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    tingkat_risiko character varying(255),
    kbli character varying(20),
    uraian_kbli text,
    investasi numeric(15,2) DEFAULT '0'::numeric NOT NULL,
    tenaga_kerja integer DEFAULT 1 NOT NULL,
    status_halal character varying(20) DEFAULT 'Belum'::character varying NOT NULL,
    no_halal character varying(50),
    status_bpom_cppob character varying(20) DEFAULT 'Belum'::character varying NOT NULL,
    no_bpom_cppob character varying(50),
    status_sni character varying(20) DEFAULT 'Belum'::character varying NOT NULL,
    no_sni character varying(50),
    status_hki_merek character varying(20) DEFAULT 'Belum'::character varying NOT NULL,
    no_hki_merek character varying(50),
    nama_merek character varying(100),
    tgl_terbit_legalitas date,
    link_gdrive_legalitas text,
    link_gdrive_nib text,
    link_gdrive_halal text,
    link_gdrive_bpom_cppob text,
    link_gdrive_sni text,
    link_gdrive_hki_merek text,
    tgl_berakhir_hki date,
    is_legalitas_tracked boolean DEFAULT true NOT NULL,
    status_tkdn character varying(255) DEFAULT 'Belum'::character varying NOT NULL,
    no_sertifikat_tkdn character varying(255),
    persentase_tkdn character varying(255),
    link_gdrive_tkdn character varying(255),
    nomor_transaksi_hki character varying(255),
    kelas_merek character varying(255),
    link_tanda_daftar_hki text,
    tipe_permohonan_hki character varying(255),
    no_daftar_halal character varying(255),
    tgl_daftar_halal character varying(255),
    tgl_sertifikat_halal character varying(255),
    nama_fasilitator_halal character varying(255)
);


--
-- Name: peta_sebaran_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.peta_sebaran_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: peta_sebaran_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.peta_sebaran_id_seq OWNED BY public.peta_sebaran.id;


--
-- Name: publikasi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.publikasi (
    id bigint NOT NULL,
    judul character varying(255) NOT NULL,
    gambar character varying(255) NOT NULL,
    tanggal date NOT NULL,
    waktu character varying(255),
    deskripsi text NOT NULL,
    status character varying(255) DEFAULT 'Informasi'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: publikasi_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.publikasi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: publikasi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.publikasi_id_seq OWNED BY public.publikasi.id;


--
-- Name: registrasi_pelatihan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.registrasi_pelatihan (
    id bigint NOT NULL,
    nama_kegiatan character varying(255) NOT NULL,
    nama_lengkap character varying(255) NOT NULL,
    nik character varying(16) NOT NULL,
    nib character varying(255),
    email character varying(255) NOT NULL,
    whatsapp character varying(255) NOT NULL,
    jenis_kelamin character varying(255),
    tanggal_lahir date,
    foto_ktp character varying(255),
    foto_produk json,
    nama_usaha character varying(255) NOT NULL,
    produk_diproduksi character varying(255),
    alamat_usaha text,
    kelurahan character varying(255),
    kecamatan character varying(255),
    kota character varying(255) DEFAULT 'Madiun'::character varying NOT NULL,
    jenis_usaha character varying(255),
    tahun_mulai character varying(10),
    skala_usaha character varying(255),
    omzet_bulanan character varying(255),
    stabilitas_omzet character varying(255),
    tantangan_usaha json,
    media_penjualan json,
    cakupan_pemasaran json,
    karyawan_tetap integer DEFAULT 0 NOT NULL,
    karyawan_tidak_tetap integer DEFAULT 0 NOT NULL,
    sistem_usaha character varying(255),
    level_digital character varying(255),
    pernah_pelatihan character varying(255),
    harapan_pelatihan text,
    target_6_bulan text,
    is_lolos boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    CONSTRAINT registrasi_pelatihan_jenis_kelamin_check CHECK (((jenis_kelamin)::text = ANY (ARRAY[('Laki-laki'::character varying)::text, ('Perempuan'::character varying)::text])))
);


--
-- Name: registrasi_pelatihan_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.registrasi_pelatihan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: registrasi_pelatihan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.registrasi_pelatihan_id_seq OWNED BY public.registrasi_pelatihan.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


--
-- Name: siinas_industries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.siinas_industries (
    id bigint NOT NULL,
    no_urut integer,
    nama_perusahaan character varying(255) NOT NULL,
    alamat_kantor_pusat text,
    provinsi_kantor character varying(255) DEFAULT 'Jawa Timur'::character varying,
    kode_provinsi_kantor character varying(255),
    kabkota_kantor character varying(255) DEFAULT 'Kota Madiun'::character varying,
    kode_kabkota_kantor character varying(255),
    kode_kelurahan_kantor character varying(255),
    kode_kecamatan_kantor character varying(255),
    alamat_pabrik text,
    provinsi_pabrik character varying(255) DEFAULT 'Jawa Timur'::character varying,
    kode_provinsi_pabrik character varying(255),
    kabkota_pabrik character varying(255) DEFAULT 'Kota Madiun'::character varying,
    kode_kabkota_pabrik character varying(255),
    kode_kelurahan_pabrik character varying(255),
    kode_kecamatan_pabrik character varying(255),
    kbli character varying(255),
    bidang_usaha text,
    tanggal_registrasi character varying(255),
    skala_usaha character varying(255),
    status_pelaporan character varying(255) DEFAULT 'Terverifikasi SIINas'::character varying,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: siinas_industries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.siinas_industries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: siinas_industries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.siinas_industries_id_seq OWNED BY public.siinas_industries.id;


--
-- Name: statistik_kecamatan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.statistik_kecamatan (
    id bigint NOT NULL,
    kecamatan character varying(255) NOT NULL,
    jumlah_ikm integer DEFAULT 0 NOT NULL,
    jumlah integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    total_kunjungan integer DEFAULT 12840 NOT NULL,
    pengunjung_aktif integer DEFAULT 42 NOT NULL,
    ikm_terdaftar integer DEFAULT 560 NOT NULL,
    kunjungan_hari_ini integer DEFAULT 0 NOT NULL,
    kunjungan_bulan_ini integer DEFAULT 0 NOT NULL,
    kunjungan_tahun_ini integer DEFAULT 0 NOT NULL,
    kunjungan_total integer DEFAULT 0 NOT NULL,
    sosial_media text,
    telp_dinas character varying(255) DEFAULT '(0351) 454288'::character varying,
    email_dinas character varying(255) DEFAULT 'disnaker@madiunkota.go.id'::character varying,
    fonnte_token character varying(255),
    admin_wa_number character varying(255),
    wa_notif_active boolean DEFAULT true NOT NULL,
    kunjungan_tahun_lalu integer DEFAULT 0 NOT NULL
);


--
-- Name: statistik_kecamatan_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.statistik_kecamatan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: statistik_kecamatan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.statistik_kecamatan_id_seq OWNED BY public.statistik_kecamatan.id;


--
-- Name: tna_digitals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tna_digitals (
    id bigint NOT NULL,
    ikm_id bigint,
    nama_usaha character varying(255) NOT NULL,
    pemilik character varying(255) NOT NULL,
    nik character varying(255),
    nib character varying(255),
    no_hp character varying(255),
    kecamatan character varying(255),
    kelurahan character varying(255),
    kendala_operasional json,
    keterampilan_kurang json,
    topik_pelatihan_prioritas json,
    materi_praktik_spesifik text,
    kebutuhan_ilmu_baru text,
    metode_efektif character varying(255),
    komitmen_penerapan character varying(255) DEFAULT 'Ya'::character varying NOT NULL,
    tag_antrean_pelatihan json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: tna_digitals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tna_digitals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tna_digitals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tna_digitals_id_seq OWNED BY public.tna_digitals.id;


--
-- Name: tna_pertanyaans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tna_pertanyaans (
    id bigint NOT NULL,
    bagian integer DEFAULT 1 NOT NULL,
    nomor_soal integer NOT NULL,
    teks_pertanyaan character varying(255) NOT NULL,
    jenis_soal character varying(255) DEFAULT 'checkbox'::character varying NOT NULL,
    opsi_jawaban json,
    placeholder character varying(255),
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: tna_pertanyaans_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tna_pertanyaans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tna_pertanyaans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tna_pertanyaans_id_seq OWNED BY public.tna_pertanyaans.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    username character varying(255),
    email character varying(255),
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    role character varying(50) DEFAULT 'admin'::character varying NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: usulan_perubahan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usulan_perubahan (
    id bigint NOT NULL,
    pelaku_usaha_id bigint,
    nib character varying(13),
    nik character varying(16),
    nama_perusahaan character varying(255),
    nama_pemilik character varying(255),
    alamat_usaha text,
    kecamatan character varying(255),
    kelurahan character varying(255),
    skala_usaha character varying(255),
    jenis_perusahaan character varying(255),
    tingkat_risiko character varying(255),
    investasi bigint,
    tenaga_kerja integer,
    no_telp character varying(255),
    email character varying(255),
    status_usulan character varying(255) DEFAULT 'pending'::character varying NOT NULL,
    catatan_admin text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    nama_proyek character varying(255),
    kbli character varying(255),
    uraian_kbli character varying(255),
    tgl_terbit date,
    status character varying(255),
    sertifikat_halal character varying(255),
    bpom character varying(255),
    cppob character varying(255),
    sni character varying(255),
    tipe_usulan character varying(20) DEFAULT 'perubahan'::character varying NOT NULL,
    latitude character varying(50),
    longitude character varying(50)
);


--
-- Name: usulan_perubahan_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.usulan_perubahan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: usulan_perubahan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.usulan_perubahan_id_seq OWNED BY public.usulan_perubahan.id;


--
-- Name: database_halals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.database_halals ALTER COLUMN id SET DEFAULT nextval('public.database_halals_id_seq'::regclass);


--
-- Name: database_hki_mereks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.database_hki_mereks ALTER COLUMN id SET DEFAULT nextval('public.database_hki_mereks_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: form_app_responses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.form_app_responses ALTER COLUMN id SET DEFAULT nextval('public.form_app_responses_id_seq'::regclass);


--
-- Name: form_app_templates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.form_app_templates ALTER COLUMN id SET DEFAULT nextval('public.form_app_templates_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: kategori_konsultasis id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kategori_konsultasis ALTER COLUMN id SET DEFAULT nextval('public.kategori_konsultasis_id_seq'::regclass);


--
-- Name: kbli id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kbli ALTER COLUMN id SET DEFAULT nextval('public.kbli_id_seq'::regclass);


--
-- Name: konsultasi id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.konsultasi ALTER COLUMN id SET DEFAULT nextval('public.konsultasi_id_seq'::regclass);


--
-- Name: konsultasi_pesan id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.konsultasi_pesan ALTER COLUMN id SET DEFAULT nextval('public.konsultasi_pesan_id_seq'::regclass);


--
-- Name: kuesioner_evaluasi id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kuesioner_evaluasi ALTER COLUMN id SET DEFAULT nextval('public.kuesioner_evaluasi_id_seq'::regclass);


--
-- Name: list_kegiatan id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.list_kegiatan ALTER COLUMN id SET DEFAULT nextval('public.list_kegiatan_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: pelaku_usaha id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pelaku_usaha ALTER COLUMN id SET DEFAULT nextval('public.pelaku_usaha_id_seq'::regclass);


--
-- Name: pelaku_usahas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pelaku_usahas ALTER COLUMN id SET DEFAULT nextval('public.pelaku_usahas_id_seq'::regclass);


--
-- Name: permohonan_hki_merek id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.permohonan_hki_merek ALTER COLUMN id SET DEFAULT nextval('public.permohonan_hki_merek_id_seq'::regclass);


--
-- Name: peta_sebaran id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.peta_sebaran ALTER COLUMN id SET DEFAULT nextval('public.peta_sebaran_id_seq'::regclass);


--
-- Name: publikasi id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.publikasi ALTER COLUMN id SET DEFAULT nextval('public.publikasi_id_seq'::regclass);


--
-- Name: registrasi_pelatihan id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registrasi_pelatihan ALTER COLUMN id SET DEFAULT nextval('public.registrasi_pelatihan_id_seq'::regclass);


--
-- Name: siinas_industries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.siinas_industries ALTER COLUMN id SET DEFAULT nextval('public.siinas_industries_id_seq'::regclass);


--
-- Name: statistik_kecamatan id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.statistik_kecamatan ALTER COLUMN id SET DEFAULT nextval('public.statistik_kecamatan_id_seq'::regclass);


--
-- Name: tna_digitals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tna_digitals ALTER COLUMN id SET DEFAULT nextval('public.tna_digitals_id_seq'::regclass);


--
-- Name: tna_pertanyaans id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tna_pertanyaans ALTER COLUMN id SET DEFAULT nextval('public.tna_pertanyaans_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: usulan_perubahan id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usulan_perubahan ALTER COLUMN id SET DEFAULT nextval('public.usulan_perubahan_id_seq'::regclass);


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cache (key, value, expiration) FROM stdin;
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: database_halals; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.database_halals (id, nik, nib, no_daftar, nama_pu, merk_dagang, tanggal_daftar, status, tanggal_sertifikat, no_sertifikat, nama_fasilitator, jenis_produk, link_sertifikat_halal, created_at, updated_at) FROM stdin;
2	3574012304850001	9120001234567	SH2025-1-1406364	SRI RAWATI	ABRA CULINERY	2026-08-03	Terbit	2026-08-10	ID35410038792090126	DISNAKERKUKM KOTA MADIUN	Makanan ringan siap santap	https://drive.google.com/file/d/12J2O4QOQjlIaLFK8lT0zz_JAEWCXkruk/view	2026-08-13 23:45:39	2026-08-14 01:37:13
3			SH2025-1-1321185	RISNA KUMALASARI	Dapoer Gendis	08/12/2025	Terbit SH	2025-12-17T07:13:38Z	ID35410037570181225	DISNAKERKUKM KOTA MADIUN	Produk bakeri	Sertifikat-DID2025066781.pdf	2026-08-13 23:45:39	2026-08-13 23:45:39
4			SH2025-1-1089663	SYABELLA RACHMADIAOCTA TATAKSMARA	SOEM	02/11/2025	Terbit SH	2025-11-05T04:37:25Z	ID35410033028921125	DISNAKERKUKM KOTA MADIUN	Garam, rempah, sup, saus, salad, serta produk protein	Sertifikat-JID2025066755.pdf	2026-08-13 23:45:39	2026-08-13 23:45:39
5			SH2025-1-1218988	PRIMAGITTA HERMAWATI	Prima Food	23/11/2025	Terbit SH	2025-11-29T17:26:07Z	ID35410035250951125	DISNAKERKUKM KOTA MADIUN	Makanan ringan siap santap	Sertifikat-JID2025066788.pdf	2026-08-13 23:45:39	2026-08-13 23:45:39
6			SH2025-1-1402037	ROKAYAH	Nurrofa	21/12/2025	Terbit SH	2025-12-25T13:04:36Z	ID35410038625451225	DISNAKERKUKM KOTA MADIUN	Garam, rempah, sup, saus, salad, serta produk protein		2026-08-13 23:45:39	2026-08-13 23:45:39
7			SH2025-1-1084383	HERI ELI NURIYANI	Pawoen D'Herli	01/11/2025	Terbit SH	2025-11-07T09:52:53Z	ID35410033263881125	DISNAKERKUKM KOTA MADIUN	Makanan ringan siap santap	Sertifikat-DID2025066751.pdf	2026-08-13 23:45:39	2026-08-13 23:45:39
8			SH2025-1-1103029	MOHAMAD NORIS	Kang Ois	04/11/2025	Terbit SH	2025-11-13T02:09:00Z	ID35410033841661125	DISNAKERKUKM KOTA MADIUN	Penyediaan makanan dan minuman dengan pengolahan	Sertifikat-DID2025066787.pdf	2026-08-13 23:45:39	2026-08-13 23:45:39
9			SH2025-1-1102587	DODIK	"AZK" COCO JELLY	04/11/2025	Terbit SH	2025-11-13T02:08:56Z	ID35410033839331125	DISNAKERKUKM KOTA MADIUN	Penyediaan makanan dan minuman dengan pengolahan	Sertifikat-DID2025066756.pdf	2026-08-13 23:45:39	2026-08-13 23:45:39
10			SH2025-1-1090273	SYABELLA RACHMADIAOCTA TATAKSMARA	SOEM	02/11/2025	Ditolak			DISNAKERKUKM KOTA MADIUN	Penyediaan makanan dan minuman dengan pengolahan	Sertifikat-JID2025066776.pdf	2026-08-13 23:45:39	2026-08-13 23:45:39
11			SH2025-1-1312872	ERNI PUJI HARTATI	Dapur Mbak Erni	07/12/2025	Terbit SH	2025-12-17T04:44:30Z	ID35410037541261225	DISNAKERKUKM KOTA MADIUN	Penyediaan makanan dan minuman dengan pengolahan	Sertifikat-DID2025066794.pdf	2026-08-13 23:45:39	2026-08-13 23:45:39
12			SH2025-1-1151603	FARDILA YENIS DWI FRASIWI	Dapur Sakko	13/11/2025	Terbit SH	2025-11-25T23:41:13Z	ID35410034933321125	DISNAKERKUKM KOTA MADIUN	Produk bakeri	Sertifikat-DID2025066762.pdf	2026-08-13 23:45:39	2026-08-13 23:45:39
13			SH2025-1-1112589	MARTATIK	KeChe Amanah	05/11/2025	Terbit SH	2025-11-28T05:47:25Z	ID35410035087341125	DISNAKERKUKM KOTA MADIUN	Minuman dengan pengolahan	Sertifikat-DID2025066802.pdf	2026-08-13 23:45:39	2026-08-13 23:45:39
14			SH2025-1-1112199	SULISTIYOWATI	FIANDYA	05/11/2025	Terbit SH	2025-11-28T05:46:31Z	ID35410035087011125	DISNAKERKUKM KOTA MADIUN	Garam, rempah, sup, saus, salad, serta produk protein		2026-08-13 23:45:39	2026-08-13 23:45:39
15			SH2025-1-1405553	TRI WULANSARI	Kedai Bunda Wulan (KevLie)	30/12/2025	Terbit SH	2026-01-13T00:46:36Z	ID35410039397270126	DISNAKERKUKM KOTA MADIUN	Penyediaan makanan dan minuman dengan pengolahan	Sertifikat-JID2025066797.pdf	2026-08-13 23:45:39	2026-08-13 23:45:39
16			SH2025-1-1078268	DINDA RAHMANDANI CAHYA SUWANDI	MALADIN	31/10/2025	Terbit SH	2025-11-13T02:06:24Z	ID35410033834311125	DISNAKERKUKM KOTA MADIUN	Penyediaan makanan dan minuman dengan pengolahan	Sertifikat-DID2025066811.pdf	2026-08-13 23:45:39	2026-08-13 23:45:39
17			SH2026-1-1703389	HERI ELI NURIYANI	Pawoen D'Herli	14/02/2026	Terbit SH	2026-02-22T22:09:29Z	ID35410043606360226	DISNAKERKUKM KOTA MADIUN	Buah dan sayur dengan pengolahan dan penambahan bahan tambahan pangan	Sertifikat-DID2025066792.pdf	2026-08-13 23:45:39	2026-08-13 23:45:39
18			SH2025-1-1146457	SITI RAHAYU	RAHAYU	12/11/2025	Terbit SH	2025-11-21T08:32:33Z	ID35410034612971125	DISNAKERKUKM KOTA MADIUN	Garam, rempah, sup, saus, salad, serta produk protein		2026-08-13 23:45:40	2026-08-13 23:45:40
19			SH2025-1-1158850	HASNA FADHILAH	SITINGGIL	14/11/2025	Terbit SH	2025-12-02T08:15:18Z	ID35410035874341225	DISNAKERKUKM KOTA MADIUN	Garam, rempah, sup, saus, salad, serta produk protein	Sertifikat-DID2025066791.pdf	2026-08-13 23:45:40	2026-08-13 23:45:40
20			SH2025-1-1147547	RIRIN RAHAYU PRIHATMI	Uni Ririn	12/11/2025	Terbit SH	2025-12-04T04:18:47Z	ID35410035636751225	DISNAKERKUKM KOTA MADIUN	Garam, rempah, sup, saus, salad, serta produk protein	Sertifikat-DID2025066796.pdf	2026-08-13 23:45:40	2026-08-13 23:45:40
21			SH2025-1-1283720	NISAR AYU LESTARI	Kusuka	03/12/2025	Terbit SH	2025-12-12T06:30:04Z	ID35410036645921225	DISNAKERKUKM KOTA MADIUN	Minuman dengan pengolahan	Sertifikat-DID2025066808.pdf	2026-08-13 23:45:40	2026-08-13 23:45:40
22			SH2025-1-1283588	Betty megayanti	LOKAMA JUICE	03/12/2025	Terbit SH	2025-12-12T06:29:25Z	ID35410036645801225	DISNAKERKUKM KOTA MADIUN	Minuman dengan pengolahan	Sertifikat-JID2025066766.pdf	2026-08-13 23:45:40	2026-08-13 23:45:40
23			SH2025-1-1311468	SUKMA KURNIASIH	Berry	07/12/2025	Terbit SH	2025-12-17T04:38:11Z	ID35410037540361225	DISNAKERKUKM KOTA MADIUN	Produk bakeri	Sertifikat-DID2025066761.pdf	2026-08-13 23:45:40	2026-08-13 23:45:40
24			SH2025-1-1307519	HANICHAND	HaniChand	06/12/2025	Terbit SH	2025-12-13T12:35:25Z	ID35410036863501225	DISNAKERKUKM KOTA MADIUN	Penyediaan makanan dan minuman dengan pengolahan	Sertifikat-JID2025066770.pdf	2026-08-13 23:45:40	2026-08-13 23:45:40
25			SH2025-1-1274901	PRIMAGITTA HERMAWATI	Kei Haus	01/12/2025	Terbit SH	2025-12-13T04:29:25Z	ID35410036788801225	DISNAKERKUKM KOTA MADIUN	Minuman dengan pengolahan	Sertifikat-DID2025066798.pdf	2026-08-13 23:45:40	2026-08-13 23:45:40
26			SH2025-1-1328798	SUSY KURNIASARI	GUSTI	09/12/2025	Terbit SH	2025-12-19T19:51:29Z	ID35410037949231225	DISNAKERKUKM KOTA MADIUN	Garam, rempah, sup, saus, salad, serta produk protein	Sertifikat-DID2025066793.pdf	2026-08-13 23:45:40	2026-08-13 23:45:40
27			SH2025-1-1328270	SUSY KURNIASARI	GUSTI	09/12/2025	Terbit SH	2025-12-19T19:51:25Z	ID35410037949081225	DISNAKERKUKM KOTA MADIUN	Penyediaan makanan dan minuman dengan pengolahan	Sertifikat-DID2025066795.pdf	2026-08-13 23:45:40	2026-08-13 23:45:40
28			SH2025-1-1103683	MOHAMAD NORIS	Kang Ois	04/11/2025	Terbit SH	2025-11-13T02:09:17Z	ID35410033843161125	DISNAKERKUKM KOTA MADIUN	Garam, rempah, sup, saus, salad, serta produk protein		2026-08-13 23:45:40	2026-08-13 23:45:40
29			SH2025-1-1143293	RIYANI	Foodie.ae	11/11/2025	Terbit SH	2025-11-20T00:18:39Z	ID35410034496001125	DISNAKERKUKM KOTA MADIUN	Produk bakeri	Sertifikat-DID2025066763.pdf	2026-08-13 23:45:40	2026-08-13 23:45:40
30			SH2025-1-1155005	MURNIATI	BU HJ. MUAWANAH	14/11/2025	Terbit SH	2025-12-02T08:12:41Z	ID35410035906051225	DISNAKERKUKM KOTA MADIUN	Garam, rempah, sup, saus, salad, serta produk protein	Sertifikat-DID2025066750.pdf	2026-08-13 23:45:40	2026-08-13 23:45:40
31			SH2025-1-1282964	Betty megayanti	Ny Pawoko	02/12/2025	Terbit SH	2025-12-12T06:27:46Z	ID35410036645651225	DISNAKERKUKM KOTA MADIUN	Produk bakeri	Sertifikat-DID2025066805.pdf	2026-08-13 23:45:40	2026-08-13 23:45:40
32			SH2025-1-1296035	GALUH KADISTA PRATIWI	Dapoer Uthieea	04/12/2025	Terbit SH	2025-12-13T14:51:08Z	ID35410036891071225	DISNAKERKUKM KOTA MADIUN	Produk bakeri	Sertifikat-DID2025066810.pdf	2026-08-13 23:45:40	2026-08-13 23:45:40
33			SH2025-1-1329594	SUSY KURNIASARI	Gusti	10/12/2025	Terbit SH	2025-12-19T19:51:30Z	ID35410037949281225	DISNAKERKUKM KOTA MADIUN	Produk bakeri		2026-08-13 23:45:40	2026-08-13 23:45:40
34			SH2026-1-1705055	KHARISMA RESTU MAWARNI	Pawoen D'Herli	14/02/2026	Terbit SH	2026-02-22T22:10:35Z	ID35410043606580226	DISNAKERKUKM KOTA MADIUN	Minuman dengan pengolahan	Sertifikat-JID2025066778.pdf	2026-08-13 23:45:40	2026-08-13 23:45:40
35			SH2025-1-1143766	UUNG SRIWULAN WIJAYANTI	USW FOOD - Mliwis Sambal Pecel Khas Kota Madiun	11/11/2025	Terbit SH	2025-11-22T07:33:59Z	ID35410034670801125	DISNAKERKUKM KOTA MADIUN	Garam, rempah, sup, saus, salad, serta produk protein	Sertifikat-DID2025066789.pdf	2026-08-13 23:45:40	2026-08-13 23:45:40
36			SH2025-1-1143573	WIWIK ISWAHRINI	Bu Wiwik	11/11/2025	Terbit SH	2025-11-22T12:26:26Z	ID35410034699121125	DISNAKERKUKM KOTA MADIUN	Makanan ringan siap santap	Sertifikat-DID2025066760.pdf	2026-08-13 23:45:40	2026-08-13 23:45:40
37			SH2025-1-1159063	HASNA FADHILAH	SITINGGIL	14/11/2025	Terbit SH	2025-11-26T12:26:25Z	ID35410034980041125	DISNAKERKUKM KOTA MADIUN	Makanan ringan siap santap	Sertifikat-DID2025066758.pdf	2026-08-13 23:45:40	2026-08-13 23:45:40
38			SH2025-1-1153464	AGUSTINA SUPRIATI	Kioe Kioe Bakery	13/11/2025	Terbit SH	2025-12-04T04:25:45Z	ID35410035638631225	DISNAKERKUKM KOTA MADIUN	Produk bakeri	Sertifikat-JID2025066753.pdf	2026-08-13 23:45:40	2026-08-13 23:45:40
39			SH2025-1-1308579	SMKN 3 MADIUN	SKIMA	06/12/2025	Terbit SH	2025-12-17T04:08:34Z	ID35410037535661225	DISNAKERKUKM KOTA MADIUN	Garam, rempah, sup, saus, salad, serta produk protein	Sertifikat-DID2025066804.pdf	2026-08-13 23:45:40	2026-08-13 23:45:40
40			SH2025-1-1336817	HERUWATI	Haruna Pudio	10/12/2025	Terbit SH	2025-12-24T22:32:04Z	ID35410038616221225	DISNAKERKUKM KOTA MADIUN	Penyediaan makanan dan minuman dengan pengolahan	Sertifikat-DID2025066765.pdf	2026-08-13 23:45:40	2026-08-13 23:45:40
41			SH2026-1-1702212	SEPTI TRISNASARI	TALK & BREW	14/02/2026	Terbit SH	2026-02-22T22:09:27Z	ID35410043606280226	DISNAKERKUKM KOTA MADIUN	Penyediaan makanan dan minuman dengan pengolahan	Sertifikat-DID2025066773.pdf	2026-08-13 23:45:40	2026-08-13 23:45:40
42			SH2026-1-1768382	SEPTI TRISNASARI	RAHAYU	22/02/2026	Terbit SH	2026-03-06T10:08:01Z	ID35110046605260326	DISNAKERKUKM KOTA MADIUN	Garam, rempah, sup, saus, salad, serta produk protein		2026-08-13 23:45:40	2026-08-13 23:45:40
45	3573010000064360	9120000024533	SH2026-00123	BARIAH SUCIATI	Sambel Pecel HM Khas Madiun + Logo	13/09/2026	Terbit	13/09/2026	ID35110080632430926	DisnakerKUKM Kota Madiun	Bumbu & Rempah	https://drive.google.com/drive/folders/1snQTFbudYzb_oRK-n2-3_UHLLHcATXYI?usp=drive_link	2026-11-22 20:26:59	2026-11-22 20:26:59
\.


--
-- Data for Name: database_hki_mereks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.database_hki_mereks (id, nik, nib, nomor_transaksi, merek, kelas, nomor_permohonan, link_tanda_daftar, tipe_permohonan, status_permohonan_merek, link_sertifikat_merek, created_at, updated_at) FROM stdin;
3	3574012304850001	9120001234567	IPT2025136011	ABRA CULINARY + Logo	30	DID2025066752	https://drive.google.com/file/d/12J2O4QOQjlIaLFK8lT0zz_JAEWCXkruk/view	Merek Dagang	(TM) Didaftar	https://drive.google.com/file/d/12J2O4QOQjlIaLFK8lT0zz_JAEWCXkruk/view	2026-08-13 15:40:24	2026-08-14 01:38:49
4			IPT2025137823	AMILAS + Logo	25	DID2025066781	AMILAS	Merek Dagang	(TM) Didaftar	Sertifikat-DID2025066781.pdf	2026-08-13 15:40:24	2026-08-13 15:40:24
5			IPT2025136151	Arlian Craft + Logo	35	JID2025066755	Arlian Craft	Merek Jasa	(TM) Didaftar	Sertifikat-JID2025066755.pdf	2026-08-13 15:40:24	2026-08-13 15:40:24
6			IPT2025137861	AVETURI + Logo	43	JID2025066788	AVETURI	Merek Jasa	(TM) Didaftar	Sertifikat-JID2025066788.pdf	2026-08-13 15:40:24	2026-08-13 15:40:24
7			IPT2025139011	Bakso Sinar Jaya Madiun + Logo	29	DID2025066799	Bakso Sinar Jaya Madiun	Merek Dagang	(TM) Ditolak		2026-08-13 15:40:24	2026-08-13 15:40:24
8			IPT2025135888	Batik Habsari + Logo	24	DID2025066751	Batik Habsari	Merek Dagang	(TM) Didaftar	Sertifikat-DID2025066751.pdf	2026-08-13 15:40:24	2026-08-13 15:40:24
9			IPT2025137839	Berry Sambel Pecel Madiun + Logo	30	DID2025066787	Berry Sambel Pecel Madiun	Merek Dagang	(TM) Didaftar	Sertifikat-DID2025066787.pdf	2026-08-13 15:40:24	2026-08-13 15:40:24
10			IPT2025136186	BI + Gambar/Logo	30	DID2025066756	BUNDA IS	Merek Dagang	(TM) Didaftar	Sertifikat-DID2025066756.pdf	2026-08-13 15:40:24	2026-08-13 15:40:24
11			IPT2025137819	CAKRAWALA SNACK & CATERING + Logo	43	JID2025066776	CAKRAWALA SNACK & CATERING	Merek Jasa	(TM) Didaftar	Sertifikat-JID2025066776.pdf	2026-08-13 15:40:24	2026-08-13 15:40:24
12			IPT2025138479	CIA FOODIES + Logo	30	DID2025066794	CIA FOODIES	Merek Dagang	(TM) Didaftar	Sertifikat-DID2025066794.pdf	2026-08-13 15:40:24	2026-08-13 15:40:24
13			IPT2025136218	CIRENG MBAK DIYAH + Logo	29	DID2025066762	CIRENG MBAK DIYAH	Merek Dagang	(TM) Didaftar	Sertifikat-DID2025066762.pdf	2026-08-13 15:40:24	2026-08-13 15:40:24
14			IPT2025138995	Cobain Aja + Logo	30	DID2025066802	Cobain Aja	Merek Dagang	(TM) Didaftar	Sertifikat-DID2025066802.pdf	2026-08-13 15:40:24	2026-08-13 15:40:24
15			IPT2025139063	CRUMBELLE & CO. + Logo	30	DID2025066809	CRUMBELLE & CO	Merek Dagang	(TM) Pemeriksa Substantif 1 (DISTDOC)		2026-08-13 15:40:24	2026-08-13 15:40:24
16			IPT2025138441	Depot Mie Njonja Madiun + Logo	43	JID2025066797	Depot Mie Njonja Madiun	Merek Jasa	(TM) Didaftar	Sertifikat-JID2025066797.pdf	2026-08-13 15:40:24	2026-08-13 15:40:24
17	\N	\N	IPT2025139079	Djit Reihan + Logo	30	DID2025066811	D_jit Reihan	Merek Dagang	(TM) Didaftar	Sertifikat-DID2025066811.pdf	2026-08-13 15:40:24	2026-08-14 01:29:02
19	3574012304850001	9120001234567	\N	ABRA CAFE + Logo	43	DID2025099999	https://drive.google.com/file/d/12J2O4QOQjlIaLFK8lT0zz_JAEWCXkruk/view	Merek Dagang	(TM) Didaftar	https://drive.google.com/file/d/12J2O4QOQjlIaLFK8lT0zz_JAEWCXkruk/view	2026-08-14 01:18:31	2026-08-14 01:38:31
20	3573010000064360	9120000024533	IPT2024255222	Sambel Pecel HM Khas Madiun + Logo	30	DID2024132127	https://drive.google.com/drive/folders/16UlQimoZd1eYTb7pxzfBuOmZwx0l2ydg?usp=drive_link	Merek Dagang	(TM) Didaftar	https://drive.google.com/file/d/1dRkVrpzSYvsvspCb1Bdj3pkUAP0l-mGI/view?usp=drive_link	2026-11-22 19:55:29	2026-11-22 19:55:29
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: form_app_responses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.form_app_responses (id, template_id, nama_ikm, answers, total_score, max_score, created_at, updated_at) FROM stdin;
2	2	Lilik Widiawati	{"q1":"Sangat Setuju","q2":"Sangat Setuju","q3":"Sangat Setuju","q4":"Sangat Setuju","q5":"Setuju","q6":"Sangat Setuju","q7":"Sangat Setuju","q8":"Sangat Setuju","q9":"Sangat Setuju","q10":"Sangat Setuju","q11":"Sangat Baik","q12":"Sangat Baik","q13":"Sangat Baik","q14":"Sangat Baik","q15":"Sangat Baik","q16":"Sangat Baik","q17":"Sangat Baik","q18":"Sangat Memuaskan","q19":"Sangat Memuaskan","q20":"Sangat Memuaskan","q21":"Sangat Memuaskan","q22":"Sangat Memuaskan","q23":"Sangat Memuaskan","q24":"Sangat Memuaskan","q25":"Sangat Memuaskan"}	99	100	2026-09-16 06:40:38	2026-09-16 06:40:38
3	2	Sri Murniati	{"q1":"Sangat Setuju","q2":"Sangat Setuju","q3":"Sangat Setuju","q4":"Sangat Setuju","q5":"Setuju","q6":"Setuju","q7":"Sangat Setuju","q8":"Sangat Setuju","q9":"Sangat Setuju","q10":"Sangat Setuju","q11":"Sangat Baik","q12":"Sangat Baik","q13":"Sangat Baik","q14":"Sangat Baik","q15":"Sangat Baik","q16":"Sangat Baik","q17":"Sangat Baik","q18":"Memuaskan","q19":"Memuaskan","q20":"Sangat Memuaskan","q21":"Sangat Memuaskan","q22":"Memuaskan","q23":"Sangat Memuaskan","q24":"Sangat Memuaskan","q25":"Sangat Memuaskan"}	95	100	2026-09-16 06:41:36	2026-09-16 06:41:36
4	2	Endang srirahayu	{"q1":"Sangat Setuju","q2":"Sangat Setuju","q3":"Sangat Setuju","q4":"Sangat Setuju","q5":"Sangat Setuju","q6":"Sangat Setuju","q7":"Sangat Setuju","q8":"Sangat Setuju","q9":"Sangat Setuju","q10":"Sangat Setuju","q11":"Sangat Baik","q12":"Sangat Baik","q13":"Sangat Baik","q14":"Sangat Baik","q15":"Sangat Baik","q16":"Sangat Baik","q17":"Sangat Baik","q18":"Sangat Memuaskan","q19":"Sangat Memuaskan","q20":"Sangat Memuaskan","q21":"Sangat Memuaskan","q22":"Sangat Memuaskan","q23":"Sangat Memuaskan","q24":"Sangat Memuaskan","q25":"Sangat Memuaskan"}	100	100	2026-09-16 06:41:51	2026-09-16 06:41:51
5	2	Dina aryati	{"q1":"Sangat Setuju","q2":"Sangat Setuju","q3":"Sangat Setuju","q4":"Sangat Setuju","q5":"Sangat Setuju","q6":"Sangat Setuju","q7":"Sangat Setuju","q8":"Sangat Setuju","q9":"Sangat Setuju","q10":"Sangat Setuju","q11":"Sangat Baik","q12":"Sangat Baik","q13":"Sangat Baik","q14":"Sangat Baik","q15":"Sangat Baik","q16":"Sangat Baik","q17":"Sangat Baik","q18":"Sangat Memuaskan","q19":"Sangat Memuaskan","q20":"Sangat Memuaskan","q21":"Sangat Memuaskan","q22":"Sangat Memuaskan","q23":"Sangat Memuaskan","q24":"Sangat Memuaskan","q25":"Sangat Memuaskan"}	100	100	2026-09-16 06:42:01	2026-09-16 06:42:01
6	2	Yuyun yuniati	{"q1":"Setuju","q2":"Setuju","q3":"Setuju","q4":"Setuju","q5":"Setuju","q6":"Setuju","q7":"Setuju","q8":"Setuju","q9":"Setuju","q10":"Setuju","q11":"Baik","q12":"Baik","q13":"Baik","q14":"Baik","q15":"Baik","q16":"Baik","q17":"Baik","q18":"Memuaskan","q19":"Memuaskan","q20":"Memuaskan","q21":"Memuaskan","q22":"Memuaskan","q23":"Memuaskan","q24":"Memuaskan","q25":"Memuaskan"}	75	100	2026-09-16 06:42:16	2026-09-16 06:42:16
7	2	Wiken Rahmawati Nasrikah	{"q1":"Sangat Setuju","q2":"Setuju","q3":"Sangat Setuju","q4":"Setuju","q5":"Sangat Setuju","q6":"Sangat Setuju","q7":"Setuju","q8":"Setuju","q9":"Sangat Setuju","q10":"Sangat Setuju","q11":"Sangat Baik","q12":"Sangat Baik","q13":"Sangat Baik","q14":"Sangat Baik","q15":"Sangat Baik","q16":"Sangat Baik","q17":"Sangat Baik","q18":"Memuaskan","q19":"Memuaskan","q20":"Memuaskan","q21":"Memuaskan","q22":"Memuaskan","q23":"Sangat Memuaskan","q24":"Sangat Memuaskan","q25":"Memuaskan"}	90	100	2026-09-16 06:42:38	2026-09-16 06:42:38
8	2	Eny Mujayanah	{"q1":"Sangat Setuju","q2":"Sangat Setuju","q3":"Sangat Setuju","q4":"Sangat Setuju","q5":"Sangat Setuju","q6":"Sangat Setuju","q7":"Sangat Setuju","q8":"Sangat Setuju","q9":"Sangat Setuju","q10":"Sangat Setuju","q11":"Sangat Baik","q12":"Sangat Baik","q13":"Sangat Baik","q14":"Sangat Baik","q15":"Sangat Baik","q16":"Sangat Baik","q17":"Sangat Baik","q18":"Sangat Memuaskan","q19":"Sangat Memuaskan","q20":"Sangat Memuaskan","q21":"Sangat Memuaskan","q22":"Sangat Memuaskan","q23":"Sangat Memuaskan","q24":"Sangat Memuaskan","q25":"Sangat Memuaskan"}	100	100	2026-09-16 06:42:38	2026-09-16 06:42:38
9	2	Wijiati	{"q1":"Sangat Setuju","q2":"Setuju","q3":"Sangat Setuju","q4":"Setuju","q5":"Sangat Setuju","q6":"Sangat Setuju","q7":"Setuju","q8":"Setuju","q9":"Setuju","q10":"Setuju","q11":"Sangat Baik","q12":"Sangat Baik","q13":"Sangat Baik","q14":"Sangat Baik","q15":"Sangat Baik","q16":"Sangat Baik","q17":"Sangat Baik","q18":"Memuaskan","q19":"Memuaskan","q20":"Sangat Memuaskan","q21":"Sangat Memuaskan","q22":"Sangat Memuaskan","q23":"Sangat Memuaskan","q24":"Memuaskan","q25":"Sangat Memuaskan"}	91	100	2026-09-16 06:43:08	2026-09-16 06:43:08
10	2	Veronika Dwi Sulistiyani	{"q1":"Setuju","q2":"Setuju","q3":"Setuju","q4":"Setuju","q5":"Setuju","q6":"Setuju","q7":"Setuju","q8":"Setuju","q9":"Setuju","q10":"Setuju","q11":"Baik","q12":"Baik","q13":"Baik","q14":"Baik","q15":"Baik","q16":"Baik","q17":"Baik","q18":"Memuaskan","q19":"Memuaskan","q20":"Memuaskan","q21":"Memuaskan","q22":"Memuaskan","q23":"Sangat Memuaskan","q24":"Memuaskan","q25":"Sangat Memuaskan"}	77	100	2026-09-16 06:43:59	2026-09-16 06:43:59
11	2	Sutamah	{"q1":"Setuju","q2":"Setuju","q3":"Sangat Setuju","q4":"Setuju","q5":"Setuju","q6":"Setuju","q7":"Setuju","q8":"Setuju","q9":"Setuju","q10":"Setuju","q11":"Baik","q12":"Baik","q13":"Baik","q14":"Baik","q15":"Baik","q16":"Baik","q17":"Baik","q18":"Memuaskan","q19":"Cukup","q20":"Cukup","q21":"Memuaskan","q22":"Memuaskan","q23":"Sangat Memuaskan","q24":"Memuaskan","q25":"Sangat Memuaskan"}	76	100	2026-09-16 06:44:39	2026-09-16 06:44:39
12	2	Wiwik Rumiyani	{"q1":"Sangat Setuju","q2":"Setuju","q3":"Setuju","q4":"Setuju","q5":"Setuju","q6":"Setuju","q7":"Setuju","q8":"Setuju","q9":"Setuju","q10":"Setuju","q11":"Sangat Baik","q12":"Sangat Baik","q13":"Sangat Baik","q14":"Sangat Baik","q15":"Sangat Baik","q16":"Sangat Baik","q17":"Sangat Baik","q18":"Sangat Memuaskan","q19":"Sangat Memuaskan","q20":"Sangat Memuaskan","q21":"Sangat Memuaskan","q22":"Memuaskan","q23":"Sangat Memuaskan","q24":"Memuaskan","q25":"Sangat Memuaskan"}	89	100	2026-09-16 06:44:41	2026-09-16 06:44:41
13	2	SHINTA WIJAYANTI CANDRA WARDHANI	{"q1":"Sangat Setuju","q2":"Sangat Setuju","q3":"Sangat Setuju","q4":"Sangat Setuju","q5":"Sangat Setuju","q6":"Sangat Setuju","q7":"Sangat Setuju","q8":"Sangat Setuju","q9":"Sangat Setuju","q10":"Sangat Setuju","q11":"Sangat Baik","q12":"Sangat Baik","q13":"Sangat Baik","q14":"Sangat Baik","q15":"Sangat Baik","q16":"Sangat Baik","q17":"Sangat Baik","q18":"Sangat Memuaskan","q19":"Sangat Memuaskan","q20":"Sangat Memuaskan","q21":"Sangat Memuaskan","q22":"Sangat Memuaskan","q23":"Sangat Memuaskan","q24":"Sangat Memuaskan","q25":"Sangat Memuaskan"}	100	100	2026-09-16 06:46:09	2026-09-16 06:46:09
14	2	Wiwik Mariyati	{"q1":"Sangat Setuju","q2":"Sangat Setuju","q3":"Sangat Setuju","q4":"Sangat Setuju","q5":"Setuju","q6":"Setuju","q7":"Setuju","q8":"Sangat Setuju","q9":"Sangat Setuju","q10":"Setuju","q11":"Sangat Baik","q12":"Sangat Baik","q13":"Sangat Baik","q14":"Sangat Baik","q15":"Baik","q16":"Sangat Baik","q17":"Sangat Baik","q18":"Memuaskan","q19":"Cukup","q20":"Memuaskan","q21":"Sangat Memuaskan","q22":"Memuaskan","q23":"Sangat Memuaskan","q24":"Sangat Memuaskan","q25":"Sangat Memuaskan"}	90	100	2026-09-16 06:51:39	2026-09-16 06:51:39
15	2	Wiwin supriani	{"q1":"Setuju","q2":"Sangat Setuju","q3":"Setuju","q4":"Sangat Setuju","q5":"Setuju","q6":"Setuju","q7":"Setuju","q8":"Setuju","q9":"Setuju","q10":"Setuju","q11":"Sangat Baik","q12":"Baik","q13":"Sangat Baik","q14":"Sangat Baik","q15":"Baik","q16":"Baik","q17":"Baik","q18":"Sangat Memuaskan","q19":"Memuaskan","q20":"Memuaskan","q21":"Memuaskan","q22":"Memuaskan","q23":"Memuaskan","q24":"Memuaskan","q25":"Memuaskan"}	81	100	2026-09-16 06:53:52	2026-09-16 06:53:52
16	2	Subiarsih	{"q1":"Sangat Setuju","q2":"Setuju","q3":"Sangat Setuju","q4":"Setuju","q5":"Setuju","q6":"Setuju","q7":"Sangat Setuju","q8":"Sangat Setuju","q9":"Setuju","q10":"Sangat Setuju","q11":"Sangat Baik","q12":"Baik","q13":"Baik","q14":"Sangat Baik","q15":"Baik","q16":"Baik","q17":"Sangat Baik","q18":"Sangat Memuaskan","q19":"Sangat Memuaskan","q20":"Sangat Memuaskan","q21":"Sangat Memuaskan","q22":"Sangat Memuaskan","q23":"Memuaskan","q24":"Memuaskan","q25":"Sangat Memuaskan"}	89	100	2026-09-16 06:55:10	2026-09-16 06:55:10
17	2	Ratna Sugiarti SP	{"q1":"Setuju","q2":"Setuju","q3":"Setuju","q4":"Setuju","q5":"Cukup","q6":"Cukup","q7":"Setuju","q8":"Setuju","q9":"Setuju","q10":"Setuju","q11":"Baik","q12":"Sangat Baik","q13":"Baik","q14":"Sangat Baik","q15":"Sangat Baik","q16":"Baik","q17":"Sangat Baik","q18":"Sangat Memuaskan","q19":"Sangat Memuaskan","q20":"Sangat Memuaskan","q21":"Sangat Memuaskan","q22":"Sangat Memuaskan","q23":"Memuaskan","q24":"Memuaskan","q25":"Sangat Memuaskan"}	83	100	2026-09-16 06:56:16	2026-09-16 06:56:16
18	2	Siti rowiyah	{"q1":"Sangat Setuju","q2":"Sangat Setuju","q3":"Sangat Setuju","q4":"Sangat Setuju","q5":"Sangat Setuju","q6":"Sangat Setuju","q7":"Sangat Setuju","q8":"Sangat Setuju","q9":"Sangat Setuju","q10":"Sangat Setuju","q11":"Sangat Baik","q12":"Sangat Baik","q13":"Sangat Baik","q14":"Sangat Baik","q15":"Sangat Baik","q16":"Sangat Baik","q17":"Sangat Baik","q18":"Sangat Memuaskan","q19":"Sangat Memuaskan","q20":"Sangat Memuaskan","q21":"Sangat Memuaskan","q22":"Sangat Memuaskan","q23":"Sangat Memuaskan","q24":"Sangat Memuaskan","q25":"Sangat Memuaskan"}	100	100	2026-09-16 07:05:08	2026-09-16 07:05:08
19	2	Novilia Ratnawati	{"q1":"Sangat Setuju","q2":"Sangat Setuju","q3":"Sangat Setuju","q4":"Sangat Setuju","q5":"Sangat Setuju","q6":"Sangat Setuju","q7":"Sangat Setuju","q8":"Sangat Setuju","q9":"Sangat Setuju","q10":"Sangat Setuju","q11":"Sangat Baik","q12":"Sangat Baik","q13":"Sangat Baik","q14":"Sangat Baik","q15":"Sangat Baik","q16":"Sangat Baik","q17":"Sangat Baik","q18":"Memuaskan","q19":"Memuaskan","q20":"Memuaskan","q21":"Memuaskan","q22":"Memuaskan","q23":"Sangat Memuaskan","q24":"Sangat Memuaskan","q25":"Sangat Memuaskan"}	95	100	2026-09-16 07:16:06	2026-09-16 07:16:06
20	2	Nada Fairuz Izdihar	{"q1":"Setuju","q2":"Setuju","q3":"Setuju","q4":"Setuju","q5":"Setuju","q6":"Setuju","q7":"Setuju","q8":"Setuju","q9":"Setuju","q10":"Setuju","q11":"Baik","q12":"Baik","q13":"Baik","q14":"Baik","q15":"Baik","q16":"Baik","q17":"Baik","q18":"Memuaskan","q19":"Memuaskan","q20":"Memuaskan","q21":"Memuaskan","q22":"Memuaskan","q23":"Memuaskan","q24":"Memuaskan","q25":"Cukup"}	74	100	2026-09-16 07:56:23	2026-09-16 07:56:23
21	2	Sri wahyuni muji astuti	{"q1":"Sangat Setuju","q2":"Sangat Setuju","q3":"Sangat Setuju","q4":"Sangat Setuju","q5":"Sangat Setuju","q6":"Setuju","q7":"Sangat Setuju","q8":"Sangat Setuju","q9":"Sangat Setuju","q10":"Sangat Setuju","q11":"Sangat Baik","q12":"Sangat Baik","q13":"Sangat Baik","q14":"Sangat Baik","q15":"Sangat Baik","q16":"Sangat Baik","q17":"Sangat Baik","q18":"Sangat Memuaskan","q19":"Sangat Memuaskan","q20":"Sangat Memuaskan","q21":"Sangat Memuaskan","q22":"Sangat Memuaskan","q23":"Sangat Memuaskan","q24":"Sangat Memuaskan","q25":"Sangat Memuaskan"}	99	100	2026-09-16 08:24:24	2026-09-16 08:24:24
22	2	Slamet	{"q1":"Sangat Setuju","q2":"Sangat Setuju","q3":"Sangat Setuju","q4":"Sangat Setuju","q5":"Sangat Setuju","q6":"Sangat Setuju","q7":"Sangat Setuju","q8":"Sangat Setuju","q9":"Sangat Setuju","q10":"Sangat Setuju","q11":"Sangat Baik","q12":"Sangat Baik","q13":"Sangat Baik","q14":"Sangat Baik","q15":"Sangat Baik","q16":"Sangat Baik","q17":"Sangat Baik","q18":"Sangat Memuaskan","q19":"Memuaskan","q20":"Sangat Memuaskan","q21":"Memuaskan","q22":"Memuaskan","q23":"Sangat Memuaskan","q24":"Sangat Memuaskan","q25":"Sangat Memuaskan"}	97	100	2026-09-16 08:36:35	2026-09-16 08:36:35
23	2	Septy Kusumawardani	{"q1":"Sangat Setuju","q2":"Sangat Setuju","q3":"Sangat Setuju","q4":"Sangat Setuju","q5":"Setuju","q6":"Setuju","q7":"Sangat Setuju","q8":"Sangat Setuju","q9":"Sangat Setuju","q10":"Sangat Setuju","q11":"Sangat Baik","q12":"Sangat Baik","q13":"Sangat Baik","q14":"Sangat Baik","q15":"Sangat Baik","q16":"Sangat Baik","q17":"Sangat Baik","q18":"Sangat Memuaskan","q19":"Sangat Memuaskan","q20":"Sangat Memuaskan","q21":"Sangat Memuaskan","q22":"Sangat Memuaskan","q23":"Sangat Memuaskan","q24":"Sangat Memuaskan","q25":"Sangat Memuaskan"}	98	100	2026-09-16 08:37:23	2026-09-16 08:37:23
24	2	Sundari	{"q1":"Setuju","q2":"Setuju","q3":"Setuju","q4":"Setuju","q5":"Setuju","q6":"Setuju","q7":"Setuju","q8":"Setuju","q9":"Setuju","q10":"Setuju","q11":"Baik","q12":"Baik","q13":"Baik","q14":"Baik","q15":"Baik","q16":"Baik","q17":"Baik","q18":"Memuaskan","q19":"Memuaskan","q20":"Memuaskan","q21":"Memuaskan","q22":"Memuaskan","q23":"Memuaskan","q24":"Memuaskan","q25":"Memuaskan"}	75	100	2026-09-16 08:47:59	2026-09-16 08:47:59
25	2	Kak seto	{"q1":"Setuju","q2":"Setuju","q3":"Setuju","q4":"Setuju","q5":"Setuju","q6":"Setuju","q7":"Setuju","q8":"Setuju","q9":"Setuju","q10":"Setuju","q11":"Baik","q12":"Baik","q13":"Baik","q14":"Baik","q15":"Baik","q16":"Baik","q17":"Baik","q18":"Memuaskan","q19":"Cukup","q20":"Memuaskan","q21":"Memuaskan","q22":"Cukup","q23":"Memuaskan","q24":"Memuaskan","q25":"Memuaskan"}	73	100	2026-09-16 09:14:43	2026-09-16 09:14:43
26	2	Helda Tri Habsari	{"q1":"Sangat Setuju","q2":"Sangat Setuju","q3":"Sangat Setuju","q4":"Sangat Setuju","q5":"Setuju","q6":"Setuju","q7":"Setuju","q8":"Setuju","q9":"Sangat Setuju","q10":"Sangat Setuju","q11":"Sangat Baik","q12":"Sangat Baik","q13":"Sangat Baik","q14":"Sangat Baik","q15":"Sangat Baik","q16":"Sangat Baik","q17":"Sangat Baik","q18":"Sangat Memuaskan","q19":"Sangat Memuaskan","q20":"Sangat Memuaskan","q21":"Sangat Memuaskan","q22":"Sangat Memuaskan","q23":"Sangat Memuaskan","q24":"Memuaskan","q25":"Sangat Memuaskan"}	95	100	2026-09-16 09:44:33	2026-09-16 09:44:33
27	2	AGUS WIJANARKO	{"q1":"Sangat Setuju","q2":"Sangat Setuju","q3":"Sangat Setuju","q4":"Sangat Setuju","q5":"Setuju","q6":"Sangat Setuju","q7":"Sangat Setuju","q8":"Setuju","q9":"Setuju","q10":"Setuju","q11":"Sangat Baik","q12":"Sangat Baik","q13":"Sangat Baik","q14":"Sangat Baik","q15":"Sangat Baik","q16":"Sangat Baik","q17":"Sangat Baik","q18":"Sangat Memuaskan","q19":"Memuaskan","q20":"Memuaskan","q21":"Memuaskan","q22":"Memuaskan","q23":"Sangat Memuaskan","q24":"Memuaskan","q25":"Sangat Memuaskan"}	91	100	2026-09-16 10:06:47	2026-09-16 10:06:47
28	2	Any Harijanti	{"q1":"Sangat Setuju","q2":"Setuju","q3":"Sangat Setuju","q4":"Setuju","q5":"Setuju","q6":"Setuju","q7":"Setuju","q8":"Sangat Setuju","q9":"Setuju","q10":"Sangat Setuju","q11":"Sangat Baik","q12":"Baik","q13":"Sangat Baik","q14":"Sangat Baik","q15":"Sangat Baik","q16":"Baik","q17":"Sangat Baik","q18":"Memuaskan","q19":"Cukup","q20":"Sangat Memuaskan","q21":"Memuaskan","q22":"Memuaskan","q23":"Memuaskan","q24":"Memuaskan","q25":"Memuaskan"}	84	100	2026-09-16 15:20:51	2026-09-16 15:20:51
29	3	ARDHIANA SEPTIANINGRUM	{"q1":"Sangat Setuju","q2":"Sangat Setuju","q3":"Sangat Setuju","q4":"Sangat Setuju","q5":"Sangat Setuju","q6":"Sangat Setuju","q7":"Sangat Setuju","q8":"Sangat Setuju","q9":"Sangat Setuju","q10":"Sangat Setuju","q11":"Sangat Baik","q12":"Sangat Baik","q13":"Sangat Baik","q14":"Sangat Baik","q15":"Sangat Baik","q16":"Sangat Baik","q17":"Sangat Baik","q18":"Memuaskan","q19":"Memuaskan","q20":"Sangat Memuaskan","q21":"Sangat Memuaskan","q22":"Sangat Memuaskan","q23":"Sangat Memuaskan","q24":"Sangat Memuaskan","q25":"Sangat Memuaskan"}	98	100	2026-09-17 03:20:06	2026-09-17 03:20:06
30	3	Yohanes Devin Alvianto	{"q1":"Sangat Setuju","q2":"Sangat Setuju","q3":"Sangat Setuju","q4":"Sangat Setuju","q5":"Sangat Setuju","q6":"Sangat Setuju","q7":"Sangat Setuju","q8":"Setuju","q9":"Sangat Setuju","q10":"Sangat Setuju","q11":"Sangat Baik","q12":"Sangat Baik","q13":"Sangat Baik","q14":"Sangat Baik","q15":"Sangat Baik","q16":"Sangat Baik","q17":"Sangat Baik","q18":"Sangat Memuaskan","q19":"Sangat Memuaskan","q20":"Sangat Memuaskan","q21":"Sangat Memuaskan","q22":"Sangat Memuaskan","q23":"Sangat Memuaskan","q24":"Sangat Memuaskan","q25":"Sangat Memuaskan"}	99	100	2026-09-17 03:20:56	2026-09-17 03:20:56
31	3	Cicilia Ineke Lesmana	{"q1":"Setuju","q2":"Setuju","q3":"Setuju","q4":"Setuju","q5":"Setuju","q6":"Sangat Setuju","q7":"Setuju","q8":"Setuju","q9":"Setuju","q10":"Setuju","q11":"Sangat Baik","q12":"Baik","q13":"Baik","q14":"Sangat Baik","q15":"Cukup","q16":"Baik","q17":"Sangat Baik","q18":"Memuaskan","q19":"Cukup","q20":"Cukup","q21":"Memuaskan","q22":"Memuaskan","q23":"Memuaskan","q24":"Memuaskan","q25":"Memuaskan"}	76	100	2026-09-17 03:22:24	2026-09-17 03:22:24
32	3	Irfan Fadhillah	{"q1":"Sangat Setuju","q2":"Sangat Setuju","q3":"Sangat Setuju","q4":"Sangat Setuju","q5":"Setuju","q6":"Sangat Setuju","q7":"Sangat Setuju","q8":"Sangat Setuju","q9":"Sangat Setuju","q10":"Sangat Setuju","q11":"Sangat Baik","q12":"Sangat Baik","q13":"Sangat Baik","q14":"Sangat Baik","q15":"Sangat Baik","q16":"Sangat Baik","q17":"Sangat Baik","q18":"Memuaskan","q19":"Memuaskan","q20":"Sangat Memuaskan","q21":"Sangat Memuaskan","q22":"Memuaskan","q23":"Sangat Memuaskan","q24":"Sangat Memuaskan","q25":"Memuaskan"}	95	100	2026-09-17 03:22:45	2026-09-17 03:22:45
33	3	Ari  Puji Astuti	{"q1":"Setuju","q2":"Setuju","q3":"Setuju","q4":"Setuju","q5":"Setuju","q6":"Setuju","q7":"Setuju","q8":"Setuju","q9":"Setuju","q10":"Setuju","q11":"Baik","q12":"Baik","q13":"Baik","q14":"Baik","q15":"Baik","q16":"Baik","q17":"Baik","q18":"Memuaskan","q19":"Memuaskan","q20":"Memuaskan","q21":"Memuaskan","q22":"Memuaskan","q23":"Memuaskan","q24":"Memuaskan","q25":"Memuaskan"}	75	100	2026-09-17 03:22:54	2026-09-17 03:22:54
34	3	Ratnawati al hasan	{"q1":"Sangat Setuju","q2":"Sangat Setuju","q3":"Sangat Setuju","q4":"Sangat Setuju","q5":"Sangat Setuju","q6":"Sangat Setuju","q7":"Sangat Setuju","q8":"Sangat Setuju","q9":"Sangat Setuju","q10":"Sangat Setuju","q11":"Sangat Baik","q12":"Sangat Baik","q13":"Sangat Baik","q14":"Sangat Baik","q15":"Sangat Baik","q16":"Sangat Baik","q17":"Sangat Baik","q18":"Sangat Memuaskan","q19":"Sangat Memuaskan","q20":"Sangat Memuaskan","q21":"Sangat Memuaskan","q22":"Sangat Memuaskan","q23":"Sangat Memuaskan","q24":"Sangat Memuaskan","q25":"Sangat Memuaskan"}	100	100	2026-09-17 03:23:24	2026-09-17 03:23:24
35	3	Endang bagiyawanti	{"q1":"Sangat Setuju","q2":"Sangat Setuju","q3":"Sangat Setuju","q4":"Sangat Setuju","q5":"Sangat Setuju","q6":"Sangat Setuju","q7":"Sangat Setuju","q8":"Sangat Setuju","q9":"Sangat Setuju","q10":"Sangat Setuju","q11":"Sangat Baik","q12":"Sangat Baik","q13":"Sangat Baik","q14":"Sangat Baik","q15":"Sangat Baik","q16":"Sangat Baik","q17":"Sangat Baik","q18":"Sangat Memuaskan","q19":"Sangat Memuaskan","q20":"Sangat Memuaskan","q21":"Sangat Memuaskan","q22":"Sangat Memuaskan","q23":"Sangat Memuaskan","q24":"Sangat Memuaskan","q25":"Sangat Memuaskan"}	100	100	2026-09-17 03:23:32	2026-09-17 03:23:32
36	3	Anik susiowati	{"q1":"Sangat Setuju","q2":"Sangat Setuju","q3":"Sangat Setuju","q4":"Setuju","q5":"Setuju","q6":"Setuju","q7":"Setuju","q8":"Setuju","q9":"Setuju","q10":"Setuju","q11":"Baik","q12":"Baik","q13":"Baik","q14":"Baik","q15":"Baik","q16":"Baik","q17":"Baik","q18":"Memuaskan","q19":"Memuaskan","q20":"Cukup","q21":"Sangat Memuaskan","q22":"Memuaskan","q23":"Memuaskan","q24":"Memuaskan","q25":"Sangat Memuaskan"}	79	100	2026-09-17 03:25:02	2026-09-17 03:25:02
37	3	Asmy nuraidha sari	{"q1":"Sangat Setuju","q2":"Sangat Setuju","q3":"Setuju","q4":"Sangat Setuju","q5":"Setuju","q6":"Sangat Setuju","q7":"Sangat Setuju","q8":"Sangat Setuju","q9":"Setuju","q10":"Sangat Setuju","q11":"Sangat Baik","q12":"Baik","q13":"Sangat Baik","q14":"Sangat Baik","q15":"Sangat Baik","q16":"Sangat Baik","q17":"Sangat Baik","q18":"Sangat Memuaskan","q19":"Sangat Memuaskan","q20":"Sangat Memuaskan","q21":"Sangat Memuaskan","q22":"Sangat Memuaskan","q23":"Sangat Memuaskan","q24":"Sangat Memuaskan","q25":"Sangat Memuaskan"}	96	100	2026-09-17 03:25:09	2026-09-17 03:25:09
38	3	Citra Putri Eritika	{"q1":"Setuju","q2":"Cukup","q3":"Cukup","q4":"Setuju","q5":"Sangat Setuju","q6":"Cukup","q7":"Setuju","q8":"Cukup","q9":"Setuju","q10":"Setuju","q11":"Sangat Baik","q12":"Sangat Baik","q13":"Baik","q14":"Cukup","q15":"Sangat Baik","q16":"Sangat Baik","q17":"Baik","q18":"Memuaskan","q19":"Memuaskan","q20":"Memuaskan","q21":"Memuaskan","q22":"Memuaskan","q23":"Memuaskan","q24":"Memuaskan","q25":"Memuaskan"}	75	100	2026-09-17 03:25:21	2026-09-17 03:25:21
39	3	Arni Rohayati	{"q1":"Sangat Setuju","q2":"Sangat Setuju","q3":"Sangat Setuju","q4":"Sangat Setuju","q5":"Setuju","q6":"Sangat Setuju","q7":"Sangat Setuju","q8":"Sangat Setuju","q9":"Setuju","q10":"Sangat Setuju","q11":"Baik","q12":"Baik","q13":"Sangat Baik","q14":"Sangat Baik","q15":"Baik","q16":"Baik","q17":"Sangat Baik","q18":"Sangat Memuaskan","q19":"Sangat Memuaskan","q20":"Sangat Memuaskan","q21":"Sangat Memuaskan","q22":"Sangat Memuaskan","q23":"Sangat Memuaskan","q24":"Memuaskan","q25":"Sangat Memuaskan"}	93	100	2026-09-17 03:27:06	2026-09-17 03:27:06
40	3	Bunga melati	{"q1":"Sangat Setuju","q2":"Setuju","q3":"Sangat Setuju","q4":"Setuju","q5":"Setuju","q6":"Sangat Setuju","q7":"Setuju","q8":"Setuju","q9":"Setuju","q10":"Setuju","q11":"Baik","q12":"Baik","q13":"Baik","q14":"Baik","q15":"Sangat Baik","q16":"Baik","q17":"Baik","q18":"Memuaskan","q19":"Memuaskan","q20":"Memuaskan","q21":"Sangat Memuaskan","q22":"Memuaskan","q23":"Memuaskan","q24":"Sangat Memuaskan","q25":"Sangat Memuaskan"}	82	100	2026-09-17 03:27:31	2026-09-17 03:27:31
41	3	Hari Fadjar Tri Kusumawardani	{"q1":"Sangat Setuju","q2":"Sangat Setuju","q3":"Sangat Setuju","q4":"Sangat Setuju","q5":"Sangat Setuju","q6":"Sangat Setuju","q7":"Sangat Setuju","q8":"Sangat Setuju","q9":"Sangat Setuju","q10":"Sangat Setuju","q11":"Sangat Baik","q12":"Sangat Baik","q13":"Sangat Baik","q14":"Sangat Baik","q15":"Sangat Baik","q16":"Sangat Baik","q17":"Sangat Baik","q18":"Sangat Memuaskan","q19":"Sangat Memuaskan","q20":"Sangat Memuaskan","q21":"Sangat Memuaskan","q22":"Sangat Memuaskan","q23":"Sangat Memuaskan","q24":"Sangat Memuaskan","q25":"Sangat Memuaskan"}	100	100	2026-09-17 03:31:20	2026-09-17 03:31:20
42	3	Hendra budiantono	{"q1":"Setuju","q2":"Setuju","q3":"Setuju","q4":"Sangat Setuju","q5":"Sangat Setuju","q6":"Sangat Setuju","q7":"Sangat Setuju","q8":"Sangat Setuju","q9":"Setuju","q10":"Sangat Setuju","q11":"Sangat Baik","q12":"Sangat Baik","q13":"Sangat Baik","q14":"Sangat Baik","q15":"Sangat Baik","q16":"Sangat Baik","q17":"Sangat Baik","q18":"Sangat Memuaskan","q19":"Sangat Memuaskan","q20":"Sangat Memuaskan","q21":"Sangat Memuaskan","q22":"Sangat Memuaskan","q23":"Sangat Memuaskan","q24":"Memuaskan","q25":"Sangat Memuaskan"}	95	100	2026-09-17 03:32:37	2026-09-17 03:32:37
43	3	Puji hastuti	{"q1":"Sangat Setuju","q2":"Sangat Setuju","q3":"Sangat Setuju","q4":"Sangat Setuju","q5":"Sangat Setuju","q6":"Sangat Setuju","q7":"Sangat Setuju","q8":"Sangat Setuju","q9":"Sangat Setuju","q10":"Sangat Setuju","q11":"Sangat Baik","q12":"Sangat Baik","q13":"Sangat Baik","q14":"Sangat Baik","q15":"Sangat Baik","q16":"Sangat Baik","q17":"Sangat Baik","q18":"Sangat Memuaskan","q19":"Sangat Memuaskan","q20":"Sangat Memuaskan","q21":"Sangat Memuaskan","q22":"Sangat Memuaskan","q23":"Sangat Memuaskan","q24":"Sangat Memuaskan","q25":"Sangat Memuaskan"}	100	100	2026-09-17 03:33:11	2026-09-17 03:33:11
44	3	Swanto	{"q1":"Setuju","q2":"Setuju","q3":"Sangat Setuju","q4":"Setuju","q5":"Sangat Setuju","q6":"Setuju","q7":"Cukup","q8":"Cukup","q9":"Cukup","q10":"Sangat Setuju","q11":"Baik","q12":"Cukup","q13":"Baik","q14":"Cukup","q15":"Cukup","q16":"Baik","q17":"Baik","q18":"Kurang Memuaskan","q19":"Cukup","q20":"Cukup","q21":"Cukup","q22":"Cukup","q23":"Memuaskan","q24":"Cukup","q25":"Cukup"}	64	100	2026-09-17 08:46:27	2026-09-17 08:46:27
\.


--
-- Data for Name: form_app_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.form_app_templates (id, title, penyelenggara, lokasi, tanggal, slug, structure, is_active, created_at, updated_at, tanggal_selesai, peserta_list) FROM stdin;
2	KUESIONER EVALUASI PELATIHAN PENINGKATAN DAYA SAING MOTIF BATIK KHAS KOTA MADIUN - 14 S.D 16 SEPTEMBER 2026	Dinas Tenaga Kerja, Koperasi Usaha Kecil dan Menengah Kota Madiun	Ruang Pertemuan Lantai II, Gedung Dekranasda Kota Madiun	2026-09-16	kuesioner-evaluasi-pelatihan-peningkatan-daya-saing-motif-batik-khas-kota-madiun-14-sd-16-september-2026-qofVhG	{"sections":[{"title":"Bagian A: Kualitas dan Relevansi Materi","subtitle":"Penilaian terhadap kualitas dan relevansi materi pelatihan","type":"agree","questions":[{"id":"q1","text":"Materi pelatihan mudah dipahami dan dicerna dengan baik."},{"id":"q2","text":"Materi sangat relevan dengan kondisi dan tantangan IKM Batik saat ini."},{"id":"q3","text":"Materi memberikan wawasan baru untuk inovasi produk batik khas Kota Madiun."},{"id":"q4","text":"Materi tentang efisiensi proses produksi dapat langsung diaplikasikan dengan mudah"},{"id":"q5","text":"Strategi pemasaran digital (termasuk pembuatan konten media sosial/video) aplikatif untuk usaha saya."},{"id":"q6","text":"Materi mengenai branding, penamaan, dan legalitas merek dijelaskan dengan sangat jelas."},{"id":"q7","text":"Materi didukung dengan contoh-contoh kasus nyata (best practice) yang sesuai."},{"id":"q8","text":"Modul, handout, atau bahan ajar digital yang diberikan sangat informatif."},{"id":"q9","text":"Proporsi antara teori dasar dan aktivitas praktik sangat seimbang."},{"id":"q10","text":"Materi pelatihan selalu mengacu pada kebaruan informasi dan tren pasar terkini."}],"options":[{"val":"Sangat Setuju","label":"Sangat Setuju","score":4},{"val":"Setuju","label":"Setuju","score":3},{"val":"Cukup","label":"Cukup","score":2},{"val":"Kurang Setuju","label":"Kurang Setuju","score":1}]},{"title":"Bagian B: Kinerja Fasilitator / Narasumber","subtitle":"Penilaian terhadap kualitas kinerja narasumber selama pelatihan","type":"performance","questions":[{"id":"q11","text":"Tingkat penguasaan fasilitator terhadap materi kewirausahaan dan daya saing."},{"id":"q12","text":"Sistematika dan keruntutan fasilitator dalam menyampaikan materi."},{"id":"q13","text":"Kemampuan fasilitator dalam mendorong pelaku IKM untuk berinteraksi dan berbagi pengalaman."},{"id":"q14","text":"Kemampuan fasilitator dalam memberikan solusi praktis dan tepat sasaran saat sesi tanya jawab."},{"id":"q15","text":"Kedisiplinan fasilitator terhadap waktu (mulai dan selesai tepat waktu)."},{"id":"q16","text":"Pembawaan fasilitator dalam menjaga antusiasme dan energi peserta selama pelatihan."},{"id":"q17","text":"Kejelasan fasilitator saat memandu sesi simulasi atau praktik."}],"options":[{"val":"Sangat Baik","label":"Sangat Baik","score":4},{"val":"Baik","label":"Baik","score":3},{"val":"Cukup","label":"Cukup","score":2},{"val":"Kurang","label":"Kurang","score":1}]},{"title":"Bagian C: Penyelenggaraan dan Fasilitas Pelatihan","subtitle":"Tingkat kepuasan mengenai fasilitas dan layanan panitia","type":"facility","questions":[{"id":"q18","text":"Kenyamanan ruangan (aula/tempat pelatihan) dan suasana belajar selama acara."},{"id":"q19","text":"Kualitas sarana pendukung audio visual (layar presentasi, mikrofon, dan tata suara)."},{"id":"q20","text":"Kualitas dan ketepatan waktu penyajian konsumsi (makan, minum, atau coffee break)."},{"id":"q21","text":"Keramahan, kesigapan, dan pelayanan dari panitia/penyelenggara selama kegiatan."},{"id":"q22","text":"Kecepatan dan efisiensi proses administrasi (registrasi, presensi, pembagian sertifikat)."}],"options":[{"val":"Sangat Memuaskan","label":"Sangat Memuaskan","score":4},{"val":"Memuaskan","label":"Memuaskan","score":3},{"val":"Cukup","label":"Cukup","score":2},{"val":"Kurang Memuaskan","label":"Kurang Memuaskan","score":1}]},{"title":"Bagian D: Dampak Keseluruhan dan Rencana Tindak Lanjut","subtitle":"Penilaian dampak pelatihan terhadap perkembangan skala usaha","type":"impact","questions":[{"id":"q23","text":"Pelatihan ini meningkatkan motivasi dan kepercayaan diri saya untuk mengembangkan skala usaha."},{"id":"q24","text":"Saya akan merekomendasikan pelatihan semacam ini kepada rekan pelaku IKM lainnya."},{"id":"q25","text":"Tingkat kepuasan Anda secara keseluruhan terhadap pelaksanaan kegiatan pelatihan ini."}],"options":[{"val":"Sangat Memuaskan","label":"Sangat Memuaskan / Sangat Setuju","score":4},{"val":"Memuaskan","label":"Memuaskan / Setuju","score":3},{"val":"Cukup","label":"Cukup","score":2},{"val":"Kurang","label":"Kurang Memuaskan / Kurang Setuju","score":1}]}]}	t	2026-09-16 05:20:07	2026-09-16 05:20:07	\N	\N
3	Pelatihan Peningkatan Daya Saing Produk Halal II dan III	Dinas Tenaga Kerja, Koperasi Usaha Kecil dan Menengah Kota Madiun	Warung Latte - Jl. Cokroaminoto No.88, Pandean, Kec. Taman, Kota Madiun, Jawa Timur 63133	2026-09-17	pelatihan-peningkatan-daya-saing-produk-halal-ii-dan-iii-WAlmiJ	{"sections":[{"title":"Bagian A: Kualitas dan Relevansi Materi","subtitle":"Penilaian terhadap kualitas dan relevansi materi pelatihan","type":"agree","questions":[{"id":"q1","text":"Materi pelatihan mudah dipahami dan dicerna dengan baik."},{"id":"q2","text":"Materi sangat relevan dengan kondisi dan tantangan IKM makanan dan minuman saat ini."},{"id":"q3","text":"Materi memberikan wawasan baru untuk inovasi produk makanan dan minuman halal khas Kota Madiun"},{"id":"q4","text":"Materi tentang standar proses produksi Halal (termasuk rincian penanganan semua bahan-bahan di proses produksi) dapat langsung diaplikasikan dengan mudah."},{"id":"q5","text":"Strategi pemasaran digital untuk produk halal (termasuk pembuatan konten media sosial/video) aplikatif untuk usaha saya."},{"id":"q6","text":"Materi mengenai branding, pengemasan, dan legalitas usaha (terutama alur Sertifikasi Halal) dijelaskan dengan sangat jelas."},{"id":"q7","text":"Materi didukung dengan contoh-contoh kasus nyata (best practice) dari IKM makanan/minuman yang telah sukses tersertifikasi."},{"id":"q8","text":"Bahan ajar digital (seperti panduan Sistem Jaminan Produk Halal) yang diberikan sangat informatif."},{"id":"q9","text":"Proporsi antara teori dasar dan aktivitas praktik (seperti simulasi pendaftaran/kurasi bahan) sangat seimbang."},{"id":"q10","text":"Materi pelatihan selalu mengacu pada regulasi sertifikasi Halal terbaru dan tren pasar kuliner terkini."}],"options":[{"val":"Sangat Setuju","label":"Sangat Setuju","score":4},{"val":"Setuju","label":"Setuju","score":3},{"val":"Cukup","label":"Cukup","score":2},{"val":"Kurang Setuju","label":"Kurang Setuju","score":1}]},{"title":"Bagian B: Kinerja Fasilitator / Narasumber","subtitle":"Penilaian terhadap kualitas kinerja narasumber selama pelatihan","type":"performance","questions":[{"id":"q11","text":"Tingkat penguasaan fasilitator terhadap materi kewirausahaan dan standar jaminan mutu Halal."},{"id":"q12","text":"Sistematika dan keruntutan fasilitator dalam menyampaikan materi."},{"id":"q13","text":"Kemampuan fasilitator dalam mendorong pelaku IKM untuk berinteraksi dan berbagi pengalaman terkait kendala produksi."},{"id":"q14","text":"Kemampuan fasilitator dalam memberikan solusi praktis dan tepat sasaran saat sesi tanya jawab (misalnya terkait titik kritis bahan baku yang meragukan)."},{"id":"q15","text":"Kedisiplinan fasilitator terhadap waktu (mulai dan selesai tepat waktu)."},{"id":"q16","text":"Pembawaan fasilitator dalam menjaga antusiasme dan energi peserta selama pelatihan."},{"id":"q17","text":"Kejelasan fasilitator saat memandu sesi simulasi atau praktik (misal: pengisian form pengajuan Halal)."}],"options":[{"val":"Sangat Baik","label":"Sangat Baik","score":4},{"val":"Baik","label":"Baik","score":3},{"val":"Cukup","label":"Cukup","score":2},{"val":"Kurang","label":"Kurang","score":1}]},{"title":"Bagian C: Penyelenggaraan dan Fasilitas Pelatihan","subtitle":"Tingkat kepuasan mengenai fasilitas dan layanan panitia","type":"facility","questions":[{"id":"q18","text":"Kenyamanan ruangan (aula/tempat pelatihan) dan suasana belajar selama acara."},{"id":"q19","text":"Kualitas sarana pendukung audio visual (layar presentasi, mikrofon, dan tata suara)."},{"id":"q20","text":"Kualitas dan ketepatan waktu penyajian konsumsi (makan, minum, atau coffee break)."},{"id":"q21","text":"Keramahan, kesigapan, dan pelayanan dari panitia/penyelenggara selama kegiatan."},{"id":"q22","text":"Kecepatan dan efisiensi proses administrasi (registrasi, presensi, pembagian sertifikat)."}],"options":[{"val":"Sangat Memuaskan","label":"Sangat Memuaskan","score":4},{"val":"Memuaskan","label":"Memuaskan","score":3},{"val":"Cukup","label":"Cukup","score":2},{"val":"Kurang Memuaskan","label":"Kurang Memuaskan","score":1}]},{"title":"Bagian D: Dampak Keseluruhan dan Rencana Tindak Lanjut","subtitle":"Penilaian dampak pelatihan terhadap perkembangan skala usaha","type":"impact","questions":[{"id":"q23","text":"Pelatihan ini meningkatkan motivasi dan kepercayaan diri saya untuk segera mengurus sertifikasi Halal dan mengembangkan skala usaha."},{"id":"q24","text":"Saya akan merekomendasikan pelatihan semacam ini kepada rekan pelaku IKM makanan dan minuman lainnya."},{"id":"q25","text":"Tingkat kepuasan Anda secara keseluruhan terhadap pelaksanaan kegiatan pelatihan ini."}],"options":[{"val":"Sangat Memuaskan","label":"Sangat Memuaskan / Sangat Setuju","score":4},{"val":"Memuaskan","label":"Memuaskan / Setuju","score":3},{"val":"Cukup","label":"Cukup","score":2},{"val":"Kurang","label":"Kurang Memuaskan / Kurang Setuju","score":1}]}]}	t	2026-09-16 15:32:34	2026-09-16 15:32:34	\N	\N
\.


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: kategori_konsultasis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.kategori_konsultasis (id, nama_kategori, deskripsi, is_active, created_at, updated_at) FROM stdin;
1	Pendampingan Manajemen Usaha	Konsultasi mengenai tata kelola usaha, manajemen kas, dan legalitas	t	2026-10-20 19:18:00	2026-10-20 19:18:00
2	Strategi Pemasaran Digital	Konsultasi seputar promosi media sosial, TikTok/FB Ads, marketplace, dan branding	t	2026-10-20 19:18:00	2026-10-20 19:18:00
3	Keluhan / Aspirasi Industri	Penyampaian keluhan operasional, perizinan industri, dan fasilitasi dinas	t	2026-10-20 19:18:00	2026-10-20 19:18:00
4	Konsultasi SIINas	\N	t	2026-07-29 16:06:35	2026-07-29 16:06:35
\.


--
-- Data for Name: kbli; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.kbli (id, kode, judul, created_at, updated_at, versi) FROM stdin;
1	01111	PERTANIAN JAGUNG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
2	01112	PERTANIAN SEREALIA SELAIN PADI DAN JAGUNG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
3	01113	PERTANIAN KEDELAI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
4	01114	PERTANIAN KACANG TANAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
5	01115	PERTANIAN KACANG HIJAU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
6	01116	PERTANIAN ANEKA KACANG SELAIN KEDELAI, KACANG TANAH,	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
7	01117	PERTANIAN BIJI - BIJIAN PENGHASIL MINYAK MAKAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
8	01118	PERTANIAN BIJI - BIJIAN PENGHASIL MINYAK SELAIN MINYAK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
9	01121	PERTANIAN PADI HIBRIDA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
10	01122	PERTANIAN PADI INBRIDA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
11	01131	PERTANIAN SAYURAN DAUN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
12	01132	PERTANIAN BUAH SEMUSIM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
13	01133	PERTANIAN SAYURAN BUAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
14	01134	PERTANIAN SAYURAN UMBI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
15	01135	PERTANIAN UBI KAYU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
16	01136	PERTANIAN JAMUR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
17	01137	PERTANIAN BIT GULA DAN TANAMAN PEMANIS SELAIN TEBU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
18	01138	PERTANIAN CABAI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
19	01139	PERTANIAN UMBI LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
20	01140	PERTANIAN TEBU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
21	01150	PERTANIAN TEMBAKAU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
22	01160	PERTANIAN TANAMAN BERSERAT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
23	01191	PERTANIAN TANAMAN PAKAN TERNAK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
24	01192	PEMBENIHAN TANAMAN PAKAN TERNAK DAN PEMBENIHAN BIT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
25	01193	PERTANIAN TANAMAN BUNGA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
26	01194	PERTANIAN PEMBENIHAN TANAMAN BUNGA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
27	01199	PERTANIAN TANAMAN SEMUSIM LAINNYA YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
28	01210	PERTANIAN BUAH ANGGUR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
29	01220	PERTANIAN BUAH - BUAHAN TROPIS DAN SUBTROPIS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
30	01230	PERTANIAN BUAH JERUK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
31	01240	PERTANIAN BUAH APEL DAN BUAH BATU (POME AND STONE	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
32	01251	PERTANIAN BUAH BERI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
33	01252	PERTANIAN BUAH BIJI KACANG - KACANGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
34	01253	PERTANIAN SAYURAN TAHUNAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
35	01259	PERTANIAN BUAH SEMAK LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
36	01261	PERTANIAN KELAPA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
37	01262	PERTANIAN KELAPA SAWIT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
38	01269	PERTANIAN BUAH OLEAGIN LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
39	01271	PERTANIAN KOPI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
40	01272	PERTANIAN TANAMAN TEH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
41	01273	PERTANIAN KAKAO	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
42	01279	PERTANIAN TANAMAN UNTUK BAHAN MINUMAN LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
43	01281	PERTANIAN LADA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
44	01282	PERTANIAN CENGKIH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
45	01283	PERTANIAN PALA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
46	01284	PERTANIAN TANAMAN AROMATIK/PENYEGAR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
47	01285	PERTANIAN TANAMAN OBAT RIMPANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
48	01286	PERTANIAN TANAMAN OBAT NONRIMPANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
49	01287	PERTANIAN TANAMAN NARKOTIKA DAN TANAMAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
50	01289	PERTANIAN TANAMAN REMPAH - REMPAH DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
51	01291	PERTANIAN POHON KARET DAN TANAMAN PENGHASIL GETAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
52	01299	PERTANIAN TANAMAN TAHUNAN LAINNYA YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
53	01301	PERTANIAN TANAMAN HIAS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
54	01302	PENANGKARAN TUMBUHAN LIAR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
55	01309	PEMBIAKAN TANAMAN LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
56	01411	BUDI DAYA DAN PEMBIBITAN SAPI POTONG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
57	01412	BUDI DAYA DAN PEMBIBITAN SAPI PERAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
58	01413	BUDI DAYA DAN PEMBIBITAN KERBAU POTONG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
59	01414	BUDI DAYA DAN PEMBIBITAN KERBAU PERAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
60	01420	PETERNAKAN KUDA DAN SEJENISNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
61	01430	PETERNAKAN UNTA DAN SEJENISNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
62	01441	BUDI DAYA DAN PEMBIBITAN DOMBA POTONG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
63	01442	BUDI DAYA DAN PEMBIBITAN KAMBING POTONG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
64	01443	BUDI DAYA DAN PEMBIBITAN KAMBING PERAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
65	01444	BUDI DAYA DAN PEMBIBITAN DOMBA PERAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
66	01445	PRODUKSI BULU DOMBA MENTAH/RAW WOOL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
67	01450	PETERNAKAN BABI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
68	01461	BUDI DAYA AYAM RAS PEDAGING	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
69	01462	BUDI DAYA AYAM RAS PETELUR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
70	01463	PEMBIBITAN AYAM LOKAL DAN PERSILANGANNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
71	01464	BUDI DAYA AYAM LOKAL DAN PERSILANGANNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
72	01465	BUDI DAYA DAN PEMBIBITAN ITIK DAN BEBEK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
73	01466	BUDI DAYA DAN PEMBIBITAN BURUNG PUYUH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
74	01467	BUDI DAYA DAN PEMBIBITAN BURUNG MERPATI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
75	01468	PEMBIBITAN AYAM RAS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
76	01469	BUDI DAYA DAN PEMBIBITAN UNGGAS LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
77	01491	BUDI DAYA DAN PEMBIBITAN BURUNG UNTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
78	01492	BUDI DAYA DAN PEMBIBITAN ULAT SUTRA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
79	01493	BUDI DAYA DAN PEMBIBITAN LEBAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
80	01494	BUDI DAYA DAN PEMBIBITAN RUSA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
81	01495	BUDI DAYA DAN PEMBIBITAN KELINCI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
82	01496	BUDI DAYA DAN PEMBIBITAN CACING	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
83	01497	BUDI DAYA DAN PEMBIBITAN BURUNG WALET	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
84	01498	PENANGKARAN SATWA LIAR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
85	01499	BUDI DAYA DAN PEMBIBITAN HEWAN LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
86	01611	JASA PENGOLAHAN LAHAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
87	01612	JASA PEMUPUKAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
88	01613	JASA PEMANENAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
89	01614	JASA PENYEMPROTAN DAN PENYERBUKAN MELALUI UDARA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
90	01615	JASA PENGENDALIAN ORGANISME PENGGANGGU TUMBUHAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
91	01616	JASA PENANAMAN BENIH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
92	01619	JASA PENUNJANG PERTANIAN LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
93	01621	JASA PERKAWINAN TERNAK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
94	01622	JASA PENETASAN TELUR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
95	01629	JASA PENUNJANG PETERNAKAN LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
96	01630	JASA PASCAPANEN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
97	01640	PEMILIHAN BENIH TANAMAN UNTUK PEMBIAKAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
98	01700	PERBURUAN, PENANGKAPAN, DAN KEGIATAN JASA TERKAIT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
99	02101	PENGELOLAAN HUTAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
100	02102	PEMANFAATAN KAYU HUTAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
101	02103	PEMBENIHAN TANAMAN KEHUTANAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
102	02201	PEMANENAN KAYU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
103	02202	PEMUNGUTAN KAYU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
104	02300	PEMUNGUTAN HASIL HUTAN BUKAN KAYU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
105	02401	JASA LINGKUNGAN HUTAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
106	02402	JASA PENGGUNAAN KAWASAN KEHUTANAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
107	02409	JASA PENUNJANG KEHUTANAN LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
108	03110	PENANGKAPAN IKAN DAN BIOTA AIR LAINNYA DI LAUT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
109	03120	PENANGKAPAN IKAN DAN BIOTA AIR LAINNYA DI PERAIRAN AIR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
110	03211	PEMBUDIDAYAAN IKAN BERSIRIP (SELAIN IKAN HIAS) DAN BIOTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
111	03212	PEMBUDIDAYAAN IKAN HIAS AIR LAUT YANG TIDAK DILINDUNGI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
112	03213	PEMBUDIDAYAAN TUMBUHAN AIR LAUT YANG TIDAK DILINDUNGI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
113	03214	PENGEMBANGBIAKAN IKAN DAN BIOTA AIR LAUT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
114	03221	PEMBUDIDAYAAN IKAN BERSIRIP (SELAIN IKAN HIAS) DAN BIOTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
115	03222	PEMBUDIDAYAAN IKAN HIAS AIR TAWAR YANG TIDAK DILINDUNGI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
116	03223	PEMBUDIDAYAAN TUMBUHAN AIR TAWAR YANG TIDAK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
117	03224	PENGEMBANGBIAKAN BIOTA AIR TAWAR YANG DILINDUNGI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
118	03231	PEMBUDIDAYAAN IKAN BERSIRIP (SELAIN IKAN HIAS) DAN BIOTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
119	03232	PEMBUDIDAYAAN IKAN HIAS AIR PAYAU YANG TIDAK DILINDUNGI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
120	03233	PEMBUDIDAYAAN TUMBUHAN AIR PAYAU YANG TIDAK DILINDUNGI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
121	03234	PENGEMBANGBIAKAN BIOTA AIR PAYAU YANG DILINDUNGI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
122	03300	JASA PENUNJANG KEGIATAN PENANGKAPAN DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
123	05101	PERTAMBANGAN BATU BARA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
124	05102	BENEFISIASI ATAU PENINGKATAN KUALITAS BATU BARA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
125	05200	PERTAMBANGAN LIGNIT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
126	06100	PERTAMBANGAN MINYAK BUMI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
127	06201	PERTAMBANGAN GAS ALAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
128	06202	PENGUSAHAAN TENAGA PANAS BUMI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
129	07101	PERTAMBANGAN PASIR BESI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
130	07102	PERTAMBANGAN BIJIH BESI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
131	07210	PERTAMBANGAN BIJIH URANIUM DAN TORIUM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
132	07221	PERTAMBANGAN EMAS DAN PERAK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
133	07229	PERTAMBANGAN BIJIH LOGAM MULIA LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
134	07291	PERTAMBANGAN BIJIH TIMAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
135	07292	PERTAMBANGAN BIJIH TIMAH HITAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
136	07293	PERTAMBANGAN BIJIH BAUKSIT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
137	07294	PERTAMBANGAN BIJIH TEMBAGA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
138	07295	PERTAMBANGAN BIJIH NIKEL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
139	07296	PERTAMBANGAN BIJIH MANGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
140	07299	PERTAMBANGAN BAHAN GALIAN LAINNYA YANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
141	08101	PENGGALIAN BATU HIAS DAN BATU BANGUNAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
142	08102	PENGGALIAN BATU KAPUR/GAMPING	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
143	08103	PENGGALIAN KERIKIL/SIRTU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
144	08104	PENGGALIAN PASIR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
145	08105	PENGGALIAN TANAH DAN TANAH LIAT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
146	08106	PENGGALIAN GIPS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
147	08107	PENGGALIAN TRAS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
148	08108	PENGGALIAN BATU APUNG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
149	08109	PENGGALIAN BATU, PASIR, DAN TANAH LIAT LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
150	08911	PERTAMBANGAN BELERANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
151	08912	PERTAMBANGAN FOSFAT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
152	08913	PERTAMBANGAN NITRAT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
153	08914	PERTAMBANGAN YODIUM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
154	08915	PERTAMBANGAN POTASH (KALIUM KARBONAT)	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
155	08919	PERTAMBANGAN MINERAL, BAHAN KIMIA, DAN BAHAN PUPUK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
156	08920	EKSTRAKSI TANAH GAMBUT (PEAT)	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
157	08930	EKSTRAKSI GARAM Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
158	08991	PERTAMBANGAN BATU MULIA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
159	08992	PENGGALIAN FELDSPAR DAN KALSIT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
160	08993	PERTAMBANGAN ASPAL ALAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
161	08994	PENGGALIAN ASBES	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
162	08995	PENGGALIAN KUARSA/PASIR KUARSA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
163	08996	PERTAMBANGAN BIJIH LOGAM TANAH JARANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
164	08999	PERTAMBANGAN DAN PENGGALIAN LAINNYA YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
165	09100	AKTIVITAS PENUNJANG PERTAMBANGAN MINYAK BUMI DAN GAS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
166	09900	AKTIVITAS PENUNJANG PERTAMBANGAN DAN PENGGALIAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
167	10111	KEGIATAN RUMAH POTONG HEWAN RUMINANSIA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
168	10112	KEGIATAN RUMAH POTONG BABI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
169	10113	KEGIATAN RUMAH POTONG UNGGAS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
170	10119	KEGIATAN RUMAH POTONG HEWAN LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
171	10120	PENGOLAHAN DAN PENGAWETAN DAGING DAN PRODUK DAGING	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
172	10211	PENGOLAHAN DAN PENGAWETAN IKAN DENGAN PENGGARAMAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
173	10212	PENGOLAHAN DAN PENGAWETAN IKAN DENGAN PENGASAPAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
174	10213	PENGOLAHAN DAN PENGAWETAN IKAN DENGAN PEMBEKUAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
175	10214	PENGOLAHAN DAN PENGAWETAN IKAN DENGAN PEMINDANGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
176	10215	PENGOLAHAN DAN PENGAWETAN IKAN DENGAN FERMENTASI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
177	10216	PENGOLAHAN DAN PENGAWETAN IKAN DENGAN PELUMATAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
178	10217	PENGOLAHAN DAN PENGAWETAN IKAN DENGAN PENGALENGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
179	10218	PENGOLAHAN DAN PENGAWETAN IKAN MENJADI PRODUK OLAHAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
180	10219	PENGOLAHAN DAN PENGAWETAN IKAN DENGAN METODE LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
181	10291	PENGOLAHAN DAN PENGAWETAN BIOTA AIR LAINNYA DENGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
182	10292	PENGOLAHAN DAN PENGAWETAN BIOTA AIR LAINNYA DENGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
183	10293	PENGOLAHAN DAN PENGAWETAN BIOTA AIR LAINNYA DENGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
184	10294	PENGOLAHAN DAN PENGAWETAN BIOTA AIR LAINNYA DENGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
185	10295	PENGOLAHAN DAN PENGAWETAN BIOTA AIR LAINNYA DENGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
186	10296	PENGOLAHAN DAN PENGAWETAN BIOTA AIR LAINNYA DENGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
187	10297	PENGOLAHAN DAN PENGAWETAN BIOTA AIR LAINNYA DENGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
188	10298	PENGOLAHAN DAN PENGAWETAN RUMPUT LAUT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
189	10299	PENGOLAHAN DAN PENGAWETAN BIOTA AIR LAINNYA DENGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
190	10301	PENGASINAN BUAH - BUAHAN DAN SAYURAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
191	10302	PELUMATAN BUAH - BUAHAN DAN SAYURAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
192	10303	PENGERINGAN BUAH - BUAHAN DAN SAYURAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
193	10304	PEMBEKUAN BUAH - BUAHAN DAN SAYURAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
194	10305	PENGALENGAN BUAH - BUAHAN DAN SAYURAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
195	10306	PENGOLAHAN SARI BUAH - BUAHAN DAN SAYURAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
196	10307	PEMBUATAN TEMPE KEDELAI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
197	10308	PEMBUATAN TAHU KEDELAI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
198	10309	PENGOLAHAN DAN PENGAWETAN LAINNYA UNTUK BUAH - BUAHAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
199	10411	INDUSTRI MINYAK MENTAH DAN LEMAK NABATI BUKAN KELAPA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
200	10412	INDUSTRI MARGARIN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
201	10413	INDUSTRI MINYAK MENTAH DAN LEMAK DARI HEWAN SELAIN IKAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
202	10414	INDUSTRI MINYAK IKAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
203	10415	INDUSTRI MINYAK GORENG DAN MINYAK MAKAN BUKAN MINYAK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
204	10419	INDUSTRI MINYAK MENTAH DAN LEMAK NABATI DAN HEWANI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
205	10421	INDUSTRI KOPRA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
206	10422	INDUSTRI MINYAK MENTAH KELAPA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
207	10423	INDUSTRI MINYAK GORENG KELAPA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
208	10431	INDUSTRI MINYAK MENTAH KELAPA SAWIT (CRUDE PALM OIL)	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
209	10432	INDUSTRI MINYAK MENTAH INTI KELAPA SAWIT (CRUDE PALM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
210	10433	INDUSTRI PEMISAHAN/FRAKSINASI MINYAK MENTAH KELAPA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
211	10434	INDUSTRI PEMURNIAN MINYAK MENTAH KELAPA SAWIT DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
212	10435	INDUSTRI PEMISAHAN/FRAKSINASI MINYAK MURNI KELAPA SAWIT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
213	10436	INDUSTRI PEMISAHAN/FRAKSINASI MINYAK MURNI INTI KELAPA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
214	10437	INDUSTRI MINYAK GORENG KELAPA SAWIT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
215	10501	INDUSTRI SUSU SEGAR DAN KRIM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
216	10502	INDUSTRI SUSU BUBUK DAN SUSU KENTAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
217	10503	INDUSTRI ES KRIM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
218	10504	INDUSTRI ES YANG DAPAT DIMAKAN DAN ES PENCUCI MULUT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
219	10509	INDUSTRI PRODUK SUSU LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
220	10611	INDUSTRI PRODUK GILINGAN GANDUM (SELAIN TEPUNG TERIGU)	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
221	10612	INDUSTRI PRODUK GILINGAN ANEKA KACANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
222	10613	INDUSTRI PRODUK GILINGAN ANEKA UMBI, TANAMAN RIMPANG,	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
223	10614	INDUSTRI TEPUNG CAMPURAN DAN ADONAN TEPUNG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
224	10615	INDUSTRI MAKANAN SEREAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
225	10616	INDUSTRI TEPUNG TERIGU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
226	10621	s.d. 10623, seperti pati kentang, pati bengkuang, pati	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
227	10622	INDUSTRI BERBAGAI MACAM PATI PALEM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
228	10623	INDUSTRI GLUKOSA DAN SEJENISNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
229	10629	INDUSTRI PATI DAN PRODUK PATI LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
230	10631	INDUSTRI PENGGILINGAN PADI DAN PENYOSOHAN BERAS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
231	10632	INDUSTRI PEMIPILAN JAGUNG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
232	10633	INDUSTRI TEPUNG BERAS DAN TEPUNG JAGUNG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
233	10634	INDUSTRI PATI BERAS DAN JAGUNG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
234	10635	INDUSTRI PEMANIS DARI BERAS DAN JAGUNG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
235	10636	INDUSTRI MINYAK DARI BERAS DAN JAGUNG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
236	10710	INDUSTRI PRODUK BAKERI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
237	10721	INDUSTRI GULA PASIR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
238	10722	INDUSTRI GULA MERAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
239	10723	INDUSTRI SIROP	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
240	10729	INDUSTRI GULA LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
241	10731	INDUSTRI PENGOLAHAN KAKAO	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
242	10732	INDUSTRI COKELAT DAN KEMBANG GULA DARI COKELAT Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
243	10733	INDUSTRI MANISAN BUAH - BUAHAN DAN SAYURAN KERING	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
244	10739	INDUSTRI KEMBANG GULA LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
245	10740	INDUSTRI MAKARONI, MI, COUSCOUS, DAN PRODUK SEJENISNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
246	10750	INDUSTRI MAKANAN DAN MASAKAN OLAHAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
247	10761	PENGOLAHAN KOPI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
248	10762	PENGOLAHAN TEH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
249	10771	INDUSTRI KECAP	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
250	10772	INDUSTRI GARAM KONSUMSI BERYODIUM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
251	10773	INDUSTRI GARAM INDUSTRI ANEKA PANGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
252	10779	INDUSTRI BUMBU MASAKAN LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
253	10791	INDUSTRI MAKANAN BAYI DAN MAKANAN KHUSUS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
254	10792	INDUSTRI KUE BASAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
255	10793	INDUSTRI PRODUK MAKANAN DARI KELAPA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
256	10794	INDUSTRI KERUPUK, KERIPIK, PEYEK, DAN SEJENISNYA Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
257	10795	INDUSTRI SARI NABATI DAN KRIMER NABATI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
258	10796	INDUSTRI DODOL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
259	10797	INDUSTRI INFUSI HERBAL/HERB INFUSION	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
260	10798	INDUSTRI BAHAN MAKANAN DARI RUMPUT LAUT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
261	10799	INDUSTRI PRODUK MAKANAN LAINNYA YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
262	10801	INDUSTRI RANSUM PAKAN HEWAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
263	10802	INDUSTRI KONSENTRAT PAKAN HEWAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
264	11010	INDUSTRI PENYULINGAN, PEMURNIAN, DAN PENCAMPURAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
265	11020	INDUSTRI MINUMAN BERALKOHOL HASIL FERMENTASI ANGGUR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
266	11030	INDUSTRI MINUMAN BERALKOHOL HASIL FERMENTASI MALT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
267	11040	INDUSTRI MALT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
268	11051	INDUSTRI AIR KEMASAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
269	11052	INDUSTRI AIR MINUM ISI ULANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
270	11053	INDUSTRI MINUMAN RINGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
271	11059	INDUSTRI MINUMAN LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
272	12001	INDUSTRI SIGARET KRETEK TANGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
273	12002	INDUSTRI SIGARET KRETEK MESIN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
274	12003	INDUSTRI ROKOK PUTIH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
275	12004	INDUSTRI PENGERINGAN DAN PENGOLAHAN TEMBAKAU Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
276	12005	INDUSTRI BUMBU ROKOK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
277	12009	INDUSTRI PRODUK TEMBAKAU LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
278	13111	PERSIAPAN SERAT TEKSTIL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
279	13112	PEMINTALAN BENANG SELAIN BENANG JAHIT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
280	13113	PEMINTALAN BENANG JAHIT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
281	13121	PERTENUNAN TEKSTIL DENGAN MESIN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
282	13122	PERTENUNAN TEKSTIL BUKAN DENGAN MESIN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
283	13131	PENYEMPURNAAN BENANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
284	13132	PENYEMPURNAAN BASAH KAIN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
285	13133	INDUSTRI KAIN BATIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
286	13139	PENYEMPURNAAN TEKSTIL LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
287	13911	INDUSTRI KAIN RAJUTAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
288	13912	INDUSTRI KAIN CROCHETED	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
289	13913	INDUSTRI BULU TIRUAN RAJUTAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
290	13921	INDUSTRI BARANG TEKSTIL UNTUK KEPERLUAN RUMAH TANGGA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
291	13922	INDUSTRI BARANG TEKSTIL DENGAN BAHAN PENGISI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
292	13923	INDUSTRI KARUNG GONI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
293	13924	INDUSTRI KARUNG SELAIN KARUNG GONI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
294	13929	INDUSTRI BARANG TEKSTIL BUKAN PAKAIAN JADI LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
295	13930	INDUSTRI KARPET DAN PERMADANI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
296	13941	INDUSTRI TALI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
297	13942	INDUSTRI BARANG DARI TALI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
298	13991	INDUSTRI KAIN NARROW	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
299	13992	INDUSTRI KAIN YANG DILAPISI DAN SEJENISNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
300	13993	INDUSTRI KAIN NIRTENUN/NONWOVEN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
301	13994	INDUSTRI KAIN BAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
302	13995	INDUSTRI KAPUK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
303	13996	INDUSTRI KAIN TULE, KAIN JARING, DAN KAIN BORDIR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
304	13999	INDUSTRI TEKSTIL LAINNYA YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
305	14111	INDUSTRI PAKAIAN JADI (KONFEKSI) DARI TEKSTIL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
306	14112	INDUSTRI PAKAIAN JADI (KONFEKSI) DARI KULIT DAN TIRUAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
307	14120	INDUSTRI PENJAHITAN DAN PEMBUATAN (BUKAN KONFEKSI)	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
308	14131	INDUSTRI PERLENGKAPAN PAKAIAN DARI TEKSTIL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
309	14132	INDUSTRI PERLENGKAPAN PAKAIAN DARI KULIT DAN TIRUAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
310	14200	INDUSTRI BARANG DARI KULIT BERBULU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
311	14301	INDUSTRI PAKAIAN JADI DAN PERLENGKAPANNYA DARI RAJUTAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
312	14302	INDUSTRI HOSIERY RAJUTAN DAN CROCHETED	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
313	15111	PENGAWETAN KULIT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
314	15112	PENYAMAKAN KULIT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
315	15113	PEWARNAAN KULIT BERBULU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
316	15114	INDUSTRI KULIT KOMPOSISI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
317	15121	INDUSTRI KOPER, TAS TANGAN, DAN SEJENISNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
318	15122	INDUSTRI PELANA, ALAT PENGEKANG/HARNESS, DAN BARANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
319	15129	INDUSTRI BARANG LAINNYA DARI KULIT DAN KULIT KOMPOSISI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
320	15201	INDUSTRI ALAS KAKI UNTUK KEPERLUAN SEHARI - HARI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
321	15202	INDUSTRI SEPATU OLAHRAGA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
322	15203	INDUSTRI SEPATU TEKNIK LAPANGAN/KEPERLUAN INDUSTRI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
323	15209	INDUSTRI ALAS KAKI LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
324	16101	PENGGERGAJIAN DAN PENGHALUSAN KAYU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
325	16102	PENGAWETAN KAYU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
326	16103	PENGAWETAN ROTAN, BAMBU, DAN SEJENISNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
327	16104	PENGOLAHAN ROTAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
328	16105	INDUSTRI PARTIKEL KAYU DAN SEJENISNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
329	16211	INDUSTRI KAYU LAPIS Kelompok ini mencakup:	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
330	16212	INDUSTRI VENIR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
331	16213	INDUSTRI KAYU LAMINASI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
332	16219	INDUSTRI PANEL KAYU LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
333	16221	INDUSTRI BARANG BANGUNAN DARI KAYU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
334	16222	INDUSTRI BANGUNAN PRAFABRIKASI DARI KAYU DAN SEJENISNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
335	16230	INDUSTRI WADAH DARI KAYU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
336	16291	INDUSTRI BARANG ANYAMAN DARI ROTAN DAN BAMBU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
337	16292	INDUSTRI BARANG ANYAMAN DARI TANAMAN SELAIN ROTAN DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
338	16293	INDUSTRI KERAJINAN UKIRAN DARI KAYU BUKAN FURNITUR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
339	16294	INDUSTRI ALAT DAPUR DAN ALAT MAKAN DARI KAYU, ROTAN, DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
340	16295	INDUSTRI KAYU BAKAR DAN PELET DARI KAYU DAN BIOMASSA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
341	16299	INDUSTRI BARANG LAINNYA DARI KAYU; INDUSTRI BARANG DARI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
342	17011	INDUSTRI BUBUR KERTAS (PULP)	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
343	17012	INDUSTRI KERTAS BUDAYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
344	17013	INDUSTRI KERTAS BERHARGA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
345	17014	INDUSTRI KERTAS KHUSUS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
346	17019	INDUSTRI KERTAS LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
347	17021	INDUSTRI KERTAS DAN PAPAN KERTAS BERGELOMBANG Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
348	17022	INDUSTRI KEMASAN DAN KOTAK DARI KERTAS DAN KARTON	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
349	17091	INDUSTRI KERTAS TISU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
350	17099	INDUSTRI BARANG DARI KERTAS DAN PAPAN KERTAS LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
351	18111	PENCETAKAN UMUM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
352	18112	PENCETAKAN KHUSUS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
353	18113	PENCETAKAN TIGA DIMENSI (3D)	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
354	18120	KEGIATAN JASA PENUNJANG PENCETAKAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
355	18201	REPRODUKSI MEDIA REKAMAN SUARA DAN PERANGKAT LUNAK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
356	18202	REPRODUKSI MEDIA REKAMAN FILM DAN VIDEO	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
357	19100	INDUSTRI PRODUK TANUR KOKAS Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
358	19201	INDUSTRI BAHAN BAKAR DARI PEMURNIAN DAN PENGILANGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
359	19202	INDUSTRI MINYAK PELUMAS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
360	19203	INDUSTRI PRODUK DARI BAHAN LIMBAH MINYAK PELUMAS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
361	19204	INDUSTRI MINYAK PELUMAS DASAR (BAHAN BAKU PELUMAS)	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
362	19205	INDUSTRI BRIKET	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
363	19206	INDUSTRI PRODUK DARI PENCAMPURAN HASIL KILANG MINYAK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
364	19209	INDUSTRI PRODUK LAINNYA DARI HASIL KILANG MINYAK BUMI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
365	20111	INDUSTRI ASAM, BASA, DAN GARAM ANORGANIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
366	20112	INDUSTRI GAS INDUSTRI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
367	20113	INDUSTRI KIMIA DASAR ZAT WARNA DAN PIGMEN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
368	20114	INDUSTRI KIMIA DASAR RADIOAKTIF	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
369	20115	INDUSTRI KIMIA DASAR ORGANIK DARI SUMBER DAYA ALAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
370	20116	INDUSTRI KIMIA DASAR DARI MINYAK BUMI, GAS ALAM, DAN BATU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
371	20119	INDUSTRI KIMIA DASAR ANORGANIK LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
372	20121	INDUSTRI SENYAWA NITROGEN; PUPUK NITROGEN, FOSFAT, DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
373	20122	INDUSTRI PUPUK HARA MAKRO PRIMER LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
374	20123	INDUSTRI PUPUK HARA MIKRO	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
375	20124	INDUSTRI PUPUK ORGANIK, PUPUK HAYATI, DAN MEDIA TANAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
376	20125	INDUSTRI BIOSTIMULAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
377	20131	INDUSTRI DAMAR BUATAN (RESIN SINTETIS) DAN BAHAN BAKU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
378	20132	INDUSTRI KARET BUATAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
379	20211	INDUSTRI BAHAN BAKU PEMBERANTAS HAMA (BAHAN AKTIF)	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
380	20212	INDUSTRI PEMBERANTAS HAMA (FORMULASI)	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
381	20213	INDUSTRI ZAT PENGATUR TUMBUH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
382	20221	INDUSTRI CAT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
383	20222	INDUSTRI PERNIS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
384	20223	INDUSTRI DEMPUL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
385	20229	INDUSTRI SEDIAAN PEWARNA DAN PELAPIS LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
386	20231	INDUSTRI BAHAN DAN PRODUK PEMBERSIH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
387	20232	INDUSTRI KOSMETIK UNTUK MANUSIA, CAIRAN LENSA KONTAK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
388	20233	INDUSTRI KOSMETIK UNTUK HEWAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
389	20234	INDUSTRI PEREKAT GIGI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
390	20235	INDUSTRI PARFUM SESUAI PESANAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
391	20291	INDUSTRI PEREKAT/LEM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
392	20292	INDUSTRI BAHAN PELEDAK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
393	20293	INDUSTRI TINTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
394	20294	INDUSTRI MINYAK ASIRI HULU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
395	20295	INDUSTRI KOREK API	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
396	20296	INDUSTRI MINYAK ASIRI RANTAI TENGAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
397	20297	INDUSTRI BIOFUEL CAIR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
398	20298	INDUSTRI CAIRAN ROKOK ELEKTRIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
399	20299	INDUSTRI BARANG KIMIA LAINNYA YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
400	20301	INDUSTRI SERAT FILAMEN DAN STRIP BUATAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
401	20302	INDUSTRI SERAT STAPEL BUATAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
402	21011	INDUSTRI BAHAN BAKU FARMASI UNTUK MANUSIA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
403	21012	INDUSTRI PRODUK FARMASI UNTUK MANUSIA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
404	21013	INDUSTRI PRODUK FARMASI UNTUK HEWAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
405	21014	INDUSTRI BAHAN BAKU FARMASI UNTUK HEWAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
406	21015	INDUSTRI ALAT DIAGNOSIS MEDIS, PERBAN, KASA, DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
407	21021	INDUSTRI BAHAN BAKU OBAT BAHAN ALAM UNTUK MANUSIA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
408	21022	INDUSTRI PRODUK OBAT BAHAN ALAM UNTUK MANUSIA Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
409	21023	INDUSTRI PRODUK OBAT BAHAN ALAM UNTUK HEWAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
410	21024	INDUSTRI BAHAN BAKU OBAT BAHAN ALAM UNTUK HEWAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
411	22111	INDUSTRI BAN LUAR DAN BAN DALAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
412	22112	INDUSTRI PEMBENTUKAN KEMBALI BAN DAN VULKANISASI BAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
413	22121	INDUSTRI KARET ASAP	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
414	22122	INDUSTRI KARET LEMBARAN DAN CREPE RUBBER	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
415	22123	INDUSTRI KARET REMAH (CRUMB RUBBER)	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
416	22129	INDUSTRI KARET SETENGAH JADI LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
417	22191	INDUSTRI BARANG DARI KARET UNTUK KEPERLUAN RUMAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
418	22192	INDUSTRI BARANG DARI KARET UNTUK KEPERLUAN INDUSTRI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
419	22193	INDUSTRI BARANG DARI KARET UNTUK KEPERLUAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
420	22194	INDUSTRI BARANG DARI KARET UNTUK KESEHATAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
421	22199	INDUSTRI BARANG LAINNYA DARI KARET YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
422	22201	INDUSTRI BARANG DARI PLASTIK UNTUK BANGUNAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
423	22202	INDUSTRI BARANG DARI PLASTIK DAN BIOPLASTIK UNTUK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
424	22203	INDUSTRI PIPA PLASTIK DAN PERLENGKAPANNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
425	22204	INDUSTRI PLASTIK LEMBARAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
426	22205	INDUSTRI PERLENGKAPAN DAN PERALATAN RUMAH TANGGA DARI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
427	22206	INDUSTRI BARANG DAN PERALATAN TEKNIK/INDUSTRI DARI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
428	22209	INDUSTRI BARANG LAINNYA DARI PLASTIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
429	23111	INDUSTRI KACA LEMBARAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
430	23112	INDUSTRI KACA PENGAMAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
431	23119	INDUSTRI KACA LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
432	23121	INDUSTRI PERLENGKAPAN DAN PERALATAN RUMAH TANGGA DARI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
433	23122	INDUSTRI PERALATAN LABORATORIUM DAN KESEHATAN DARI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
434	23129	INDUSTRI PRODUK LAINNYA DARI KACA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
435	23911	INDUSTRI BATA, MORTAR, SEMEN, DAN SEJENISNYA YANG TAHAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
436	23919	INDUSTRI PRODUK REFRAKTORI (TAHAN API) LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
437	23921	INDUSTRI BATU BATA DARI TANAH LIAT ATAU KERAMIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
438	23922	INDUSTRI GENTENG DARI TANAH LIAT ATAU KERAMIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
439	23929	INDUSTRI BAHAN BANGUNAN LAINNYA DARI TANAH LIAT ATAU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
440	23931	INDUSTRI PERLENGKAPAN RUMAH TANGGA DARI PORSELEN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
441	23932	INDUSTRI PERLENGKAPAN RUMAH TANGGA DARI TANAH LIAT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
442	23933	INDUSTRI ALAT LABORATORIUM DAN ALAT LISTRIK ATAU TEKNIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
443	23934	INDUSTRI PERALATAN SANITASI DARI PORSELEN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
444	23935	INDUSTRI PERALATAN SANITASI DARI TANAH LIAT ATAU KERAMIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
445	23939	INDUSTRI PRODUK BUKAN BAHAN BANGUNAN LAINNYA DARI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
446	23941	INDUSTRI SEMEN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
447	23942	INDUSTRI KAPUR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
448	23943	INDUSTRI GIPS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
449	23951	INDUSTRI BARANG DARI SEMEN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
450	23952	INDUSTRI BARANG DARI KAPUR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
451	23953	INDUSTRI BARANG DARI GIPS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
452	23954	INDUSTRI BARANG DARI ASBES	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
453	23955	INDUSTRI MORTAR, ACIAN, DAN BETON SIAP PAKAI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
454	23961	INDUSTRI BARANG DARI BATU MARMER	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
455	23962	INDUSTRI BARANG DARI BATU GRANIT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
456	23969	INDUSTRI BARANG DARI BATU LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
457	23991	INDUSTRI PRODUK ABRASIF	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
458	23992	INDUSTRI BATUAN ASPAL DAN BARANG DARI ASPAL ATAU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
459	23993	INDUSTRI PRODUK HASIL PEMURNIAN MINERAL NONLOGAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
460	23999	INDUSTRI PRODUK MINERAL NONLOGAM LAINNYA YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
461	24101	INDUSTRI BESI DAN BAJA DASAR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
462	24102	PENGGILINGAN BAJA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
463	24103	INDUSTRI PIPA DAN SAMBUNGAN PIPA DARI BESI DAN BAJA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
464	24201	INDUSTRI LOGAM DASAR MULIA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
465	24202	INDUSTRI LOGAM DASAR BUKAN BESI LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
466	24203	PENGGILINGAN LOGAM BUKAN BESI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
467	24204	EKSTRUSI LOGAM BUKAN BESI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
468	24205	INDUSTRI PIPA DAN SAMBUNGAN PIPA DARI LOGAM BUKAN BESI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
469	24206	INDUSTRI BAHAN BAKAR NUKLIR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
470	24310	PENGECORAN BESI DAN BAJA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
471	24320	PENGECORAN LOGAM BUKAN BESI DAN BAJA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
472	25111	INDUSTRI PRODUK LOGAM STRUKTURAL BUKAN ALUMINIUM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
473	25112	INDUSTRI PRODUK LOGAM STRUKTURAL ALUMINIUM UNTUK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
474	25113	INDUSTRI PRODUK LOGAM STRUKTURAL BAJA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
475	25119	INDUSTRI PRODUK LOGAM STRUKTURAL LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
476	25120	INDUSTRI TANGKI, TANDON AIR, DAN WADAH SEJENISNYA DARI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
477	25130	INDUSTRI GENERATOR UAP BUKAN KETEL PEMANAS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
478	25200	INDUSTRI SENJATA DAN AMUNISI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
479	25910	PENEMPAAN, PENGEPRESAN, PENCETAKAN, DAN PEMBENTUKAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
480	25920	PENGERJAAN DAN PELAPISAN LOGAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
481	25931	INDUSTRI PERKAKAS TANGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
482	25932	INDUSTRI ALAT POTONG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
483	25933	INDUSTRI ALAT MAKAN DARI LOGAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
484	25934	INDUSTRI PERALATAN UMUM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
485	25940	INDUSTRI EMBER, KALENG, DRUM DAN WADAH SEJENISNYA DARI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
486	25951	INDUSTRI BARANG DARI KAWAT LOGAM BUKAN KABEL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
487	25952	INDUSTRI PAKU, MUR, DAN BAUT LOGAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
488	25991	INDUSTRI BRANKAS, FILLING KANTOR, DAN SEJENISNYA Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
489	25992	INDUSTRI PERALATAN DAPUR DAN PERALATAN MEJA DARI LOGAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
490	25993	INDUSTRI PRODUK RUMAH TANGGA DARI LOGAM BUKAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
491	25994	INDUSTRI PROFIL LOGAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
492	25995	INDUSTRI LAMPU DARI LOGAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
493	25999	INDUSTRI PRODUK LOGAM LAINNYA YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
494	26110	INDUSTRI SEL SURYA, PANEL SURYA, DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
495	26191	INDUSTRI TABUNG ELEKTRON DAN KONEKTOR ELEKTRONIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
496	26199	INDUSTRI KOMPONEN DAN PAPAN ELEKTRONIK LAINNYA YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
497	26210	INDUSTRI KOMPUTER DAN PERAKITAN KOMPUTER	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
498	26220	INDUSTRI PERLENGKAPAN KOMPUTER	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
499	26310	INDUSTRI PERALATAN TELEPON DAN FAKSIMILI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
500	26320	INDUSTRI PERALATAN KOMUNIKASI TANPA KABEL (WIRELESS)	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
501	26391	INDUSTRI KARTU CERDAS (SMART CARD)	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
502	26399	INDUSTRI PERALATAN KOMUNIKASI LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
503	26410	INDUSTRI TELEVISI, MONITOR TELEVISI, DAN DISPLAI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
504	26420	INDUSTRI PERALATAN PEREKAM, PENERIMA, DAN PENGGANDA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
505	26490	INDUSTRI PERALATAN AUDIO DAN VIDEO ELEKTRONIK LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
506	26511	INDUSTRI ALAT UKUR DAN ALAT UJI MANUAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
507	26512	INDUSTRI ALAT UKUR DAN ALAT UJI ELEKTRIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
508	26513	INDUSTRI ALAT UKUR DAN ALAT UJI ELEKTRONIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
509	26519	INDUSTRI ALAT UKUR, ALAT UJI, DAN PERALATAN NAVIGASI DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
510	26520	INDUSTRI ALAT UKUR WAKTU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
511	26601	INDUSTRI PERALATAN IRADIASI, PERLENGKAPAN,	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
512	26602	INDUSTRI PERALATAN ELEKTROMEDIK DAN ELEKTROTERAPI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
513	26701	INDUSTRI PERALATAN FOTOGRAFI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
514	26702	INDUSTRI PERALATAN SINEMATOGRAFI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
515	26703	INDUSTRI LENSA BUKAN KACAMATA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
516	26709	INDUSTRI PERALATAN FOTOGRAFI DAN INSTRUMEN OPTIK BUKAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
517	26800	INDUSTRI MEDIA MAGNETIK DAN MEDIA OPTIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
518	27111	INDUSTRI MOTOR LISTRIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
519	27112	INDUSTRI GENERATOR PEMBANGKIT LISTRIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
520	27113	INDUSTRI PENGUBAH TEGANGAN/TRANSFORMATOR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
521	27120	INDUSTRI PERALATAN PENGONTROL DAN PENDISTRIBUSIAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
522	27201	INDUSTRI BATU BATERAI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
523	27202	INDUSTRI AKUMULATOR LISTRIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
524	27203	INDUSTRI BATERAI KENDARAAN LISTRIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
525	27310	INDUSTRI KABEL SERAT OPTIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
526	27320	INDUSTRI KABEL DAN KAWAT LISTRIK DAN ELEKTRONIK LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
527	27330	INDUSTRI PERLENGKAPAN KABEL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
528	27401	INDUSTRI BOLA LAMPU PIJAR, LAMPU SOROT, DAN LAMPU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
529	27402	INDUSTRI LAMPU GAS DAN DISCHARGE	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
530	27403	INDUSTRI PERALATAN PENERANGAN UNTUK KENDARAAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
531	27404	INDUSTRI LAMPU LED	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
532	27409	INDUSTRI PERALATAN PENERANGAN LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
533	27510	INDUSTRI PERALATAN LISTRIK RUMAH TANGGA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
534	27520	INDUSTRI PERALATAN ELEKTROTERMAL RUMAH TANGGA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
535	27530	INDUSTRI PERALATAN RUMAH TANGGA BUKAN LISTRIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
536	27900	INDUSTRI PERALATAN LISTRIK LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
537	28111	INDUSTRI MESIN UAP, TURBIN, DAN KINCIR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
538	28112	INDUSTRI MOTOR PEMBAKARAN DALAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
539	28113	INDUSTRI KOMPONEN DAN SUKU CADANG MESIN DAN TURBIN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
540	28120	INDUSTRI PERALATAN TENAGA ZAT CAIR DAN GAS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
541	28130	INDUSTRI POMPA LAINNYA, KOMPRESOR, KERAN, DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
542	28140	INDUSTRI BEARING, RODA GIGI, DAN ELEMEN PENGGERAK MESIN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
543	28151	INDUSTRI OVEN, PERAPIAN DAN TUNGKU PEMBAKAR SEJENIS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
544	28152	INDUSTRI OVEN, PERAPIAN DAN TUNGKU PEMBAKAR SEJENIS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
545	28160	INDUSTRI ALAT PENGANGKAT DAN PEMINDAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
546	28171	INDUSTRI MESIN KANTOR DAN AKUNTANSI MANUAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
547	28172	INDUSTRI MESIN KANTOR DAN AKUNTANSI ELEKTRIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
548	28173	INDUSTRI MESIN KANTOR DAN AKUNTANSI ELEKTRONIK Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
549	28179	INDUSTRI PERALATAN KANTOR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
550	28180	INDUSTRI PERKAKAS TANGAN YANG DIGERAKKAN TENAGA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
551	28191	INDUSTRI MESIN UNTUK PEMBUNGKUS, PEMBOTOLAN, DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
552	28192	INDUSTRI MESIN TIMBANGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
553	28193	INDUSTRI MESIN PENDINGIN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
554	28199	INDUSTRI MESIN UNTUK KEPERLUAN UMUM LAINNYA YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
555	28210	INDUSTRI MESIN PERTANIAN DAN KEHUTANAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
556	28220	INDUSTRI MESIN DAN PERKAKAS MESIN UNTUK PENGERJAAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
557	28230	INDUSTRI MESIN METALURGI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
558	28240	INDUSTRI MESIN PENAMBANGAN, PENGGALIAN DAN KONSTRUKSI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
559	28250	INDUSTRI MESIN PENGOLAHAN MAKANAN, MINUMAN DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
560	28261	INDUSTRI MESIN JAHIT, MESIN CUCI, DAN MESIN PENGERING	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
561	28262	INDUSTRI MESIN TEKSTIL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
562	28263	INDUSTRI MESIN PENYIAPAN DAN PEMBUATAN PRODUK KULIT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
563	28291	INDUSTRI MESIN PERCETAKAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
564	28292	INDUSTRI MESIN PABRIK KERTAS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
565	28299	INDUSTRI MESIN KEPERLUAN KHUSUS LAINNYA YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
566	29100	INDUSTRI KENDARAAN BERMOTOR RODA EMPAT ATAU LEBIH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
567	29200	INDUSTRI KAROSERI KENDARAAN BERMOTOR RODA EMPAT ATAU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
568	29300	INDUSTRI SUKU CADANG DAN AKSESORI KENDARAAN BERMOTOR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
569	30111	INDUSTRI KENDARAAN AIR DAN BAWAH AIR BERAWAK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
570	30112	INDUSTRI BANGUNAN LEPAS PANTAI DAN BANGUNAN TERAPUNG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
571	30113	INDUSTRI KENDARAAN AIR DAN BAWAH AIR TANPA AWAK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
572	30120	INDUSTRI KAPAL DAN PERAHU UNTUK TUJUAN WISATA ATAU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
573	30200	INDUSTRI LOKOMOTIF DAN GERBONG KERETA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
574	30301	INDUSTRI PESAWAT UDARA BERAWAK DAN MESIN TERKAIT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
575	30302	INDUSTRI PESAWAT UDARA TANPA AWAK DAN MESIN TERKAIT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
576	30303	INDUSTRI WAHANA ANTARIKSA DAN MESIN TERKAIT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
577	30400	INDUSTRI KENDARAAN TEMPUR MILITER	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
578	30911	INDUSTRI SEPEDA MOTOR RODA DUA DAN TIGA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
579	30912	INDUSTRI KOMPONEN DAN PERLENGKAPAN SEPEDA MOTOR RODA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
580	30921	INDUSTRI SEPEDA DAN KURSI RODA TERMASUK BECAK Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
581	30922	INDUSTRI PERLENGKAPAN SEPEDA DAN KURSI RODA TERMASUK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
582	30990	INDUSTRI ALAT ANGKUTAN LAINNYA YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
583	31011	INDUSTRI FURNITUR DARI KAYU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
584	31012	INDUSTRI FURNITUR DARI ROTAN DAN BAMBU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
585	31021	INDUSTRI FURNITUR DARI PLASTIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
586	31022	INDUSTRI FURNITUR DARI LOGAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
587	31029	INDUSTRI FURNITUR DARI BAHAN LAINNYA YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
588	32111	INDUSTRI PERMATA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
589	32112	INDUSTRI PERHIASAN DARI LOGAM MULIA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
590	32113	INDUSTRI BARANG BERHARGA DARI LOGAM MULIA BUKAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
591	32114	INDUSTRI PERHIASAN DARI MUTIARA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
592	32119	INDUSTRI BARANG BERHARGA LAINNYA DARI LOGAM MULIA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
593	32120	INDUSTRI PERHIASAN IMITASI DAN BARANG SEJENIS Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
594	32201	INDUSTRI ALAT MUSIK TRADISIONAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
595	32202	INDUSTRI ALAT MUSIK NONTRADISIONAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
596	32300	INDUSTRI PERALATAN DAN PERLENGKAPAN OLAHRAGA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
597	32401	INDUSTRI ALAT PERMAINAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
598	32402	INDUSTRI MAINAN TERMASUK DRONE REKREASI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
599	32501	INDUSTRI FURNITUR UNTUK OPERASI, PERAWATAN KEDOKTERAN,	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
600	32502	INDUSTRI PERALATAN KEDOKTERAN DAN KEDOKTERAN GIGI,	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
601	32503	INDUSTRI KACAMATA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
602	32509	INDUSTRI PERALATAN KEDOKTERAN DAN KEDOKTERAN GIGI,	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
603	32901	INDUSTRI ALAT TULIS DAN GAMBAR TERMASUK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
604	32902	INDUSTRI PITA MESIN TULIS ATAU GAMBAR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
605	32903	INDUSTRI KERAJINAN YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
606	32904	INDUSTRI PERALATAN UNTUK PELINDUNG KESELAMATAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
607	32905	INDUSTRI SERAT SABUT KELAPA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
608	32906	INDUSTRI RAMBUT, JANGGUT, DAN BULU MATA PALSU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
609	32907	INDUSTRI KANCING DAN RITSLETING	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
610	32908	INDUSTRI PEMANTIK API/LIGHTER	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
611	32909	INDUSTRI PRODUK LAINNYA YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
612	33111	REPARASI DAN PEMELIHARAAN PRODUK LOGAM STRUKTURAL,	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
613	33112	REPARASI DAN PEMELIHARAAN PRODUK SENJATA DAN AMUNISI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
614	33119	REPARASI DAN PEMELIHARAAN PRODUK LOGAM PABRIKASI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
615	33121	REPARASI DAN PEMELIHARAAN MESIN UNTUK KEPERLUAN UMUM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
616	33122	REPARASI DAN PEMELIHARAAN MESIN UNTUK KEPERLUAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
617	33131	REPARASI DAN PEMELIHARAAN ALAT UKUR, ALAT UJI, SERTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
618	33132	REPARASI DAN PEMELIHARAAN PERALATAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
619	33133	REPARASI DAN PEMELIHARAAN PERALATAN FOTOGRAFI DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
620	33141	REPARASI DAN PEMELIHARAAN MOTOR LISTRIK, GENERATOR,	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
621	33142	REPARASI DAN PEMELIHARAAN BATERAI DAN AKUMULATOR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
622	33149	REPARASI DAN PEMELIHARAAN PERALATAN LISTRIK LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
623	33151	REPARASI DAN PEMELIHARAAN KAPAL, PERAHU, DAN BANGUNAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
624	33152	REPARASI DAN PEMELIHARAAN LOKOMOTIF DAN GERBONG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
625	33153	REPARASI DAN PEMELIHARAAN PESAWAT UDARA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
626	33159	REPARASI DAN PEMELIHARAAN ALAT ANGKUTAN LAINNYA, BUKAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
627	33190	REPARASI DAN PEMELIHARAAN PERALATAN LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
628	33201	INSTALASI/PEMASANGAN DAN PERANGKAIAN/INTEGRASI MESIN,	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
629	33202	PEMBONGKARAN MESIN, PERALATAN, DAN SISTEM INDUSTRI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
630	33203	PEMASANGAN PERLENGKAPAN METEOROLOGI, KLIMATOLOGI,	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
631	35111	PEMBANGKITAN TENAGA LISTRIK DARI SUMBER ENERGI TIDAK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
632	35112	PEMBANGKITAN TENAGA LISTRIK DARI SUMBER ENERGI TIDAK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
633	35120	PEMBANGKITAN TENAGA LISTRIK DARI SUMBER ENERGI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
634	35131	AKTIVITAS PENYALURAN TENAGA LISTRIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
635	35132	AKTIVITAS PENYIMPANAN TENAGA LISTRIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
636	35133	PENGOPERASIAN FASILITAS ATAU STASIUN PENGISIAN DAYA (SPBKLU).	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
637	35140	PENYEDIAAN TENAGA LISTRIK DALAM SATU KESATUAN USAHA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
638	35151	PENGOPERASIAN INSTALASI PENYEDIAAN TENAGA LISTRIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
639	35152	PENGOPERASIAN INSTALASI PEMANFAATAN TENAGA LISTRIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
640	35159	AKTIVITAS PENUNJANG TENAGA LISTRIK LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
641	35201	PRODUKSI GAS ALAM DAN BUATAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
642	35202	DISTRIBUSI GAS ALAM DAN BUATAN MELALUI JARINGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
643	35301	PENGADAAN UAP/AIR PANAS DAN UDARA DINGIN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
644	35302	PRODUKSI ES	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
645	35401	AKTIVITAS BROKER DAN AGEN PENJUALAN TENAGA LISTRIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
646	35402	AKTIVITAS BROKER DAN AGEN PENJUALAN GAS ALAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
647	36001	PENGOLAHAN DAN PENYEDIAAN AIR MINUM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
648	36002	PENAMPUNGAN DAN PENYEDIAAN AIR BAKU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
649	36003	AKTIVITAS PENUNJANG PENYEDIAAN AIR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
650	37001	PENGUMPULAN AIR LIMBAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
651	37002	PENGOLAHAN DAN PEMBUANGAN AIR LIMBAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
652	38110	PENGUMPULAN LIMBAH ATAU SAMPAH TIDAK BERBAHAYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
653	38121	PENGUMPULAN LIMBAH BERBAHAYA SELAIN LIMBAH RADIOKATIF	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
654	38122	PENGUMPULAN LIMBAH RADIOAKTIF	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
655	38211	PENGOLAHAN SAMPAH TIDAK BERBAHAYA UNTUK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
656	38212	PRODUKSI KOMPOS SAMPAH ORGANIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
657	38219	PENGOLAHAN DAN PEMBUANGAN LIMBAH ATAU SAMPAH TIDAK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
658	38221	PENGOLAHAN DAN PEMBUANGAN LIMBAH ATAU SAMPAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
659	38222	PENGOLAHAN DAN PEMBUANGAN LIMBAH RADIOAKTIF	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
660	38301	PEMULIHAN MATERIAL BARANG LOGAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
661	38302	PEMULIHAN MATERIAL BARANG PLASTIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
662	38309	PEMULIHAN MATERIAL LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
663	39001	AKTIVITAS PENANGKAPAN KARBON	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
664	39002	AKTIVITAS PENYIMPANAN KARBON	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
665	39009	AKTIVITAS REMEDIASI DAN PENGELOLAAN LIMBAH ATAU SAMPAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
666	41011	KONSTRUKSI KONVENSIONAL GEDUNG HUNIAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
667	41012	KONSTRUKSI KONVENSIONAL GEDUNG PERKANTORAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
668	41013	KONSTRUKSI KONVENSIONAL GEDUNG INDUSTRI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
669	41014	KONSTRUKSI KONVENSIONAL GEDUNG PERBELANJAAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
670	41015	KONSTRUKSI KONVENSIONAL GEDUNG KESEHATAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
671	41016	KONSTRUKSI KONVENSIONAL GEDUNG PENDIDIKAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
672	41017	KONSTRUKSI KONVENSIONAL GEDUNG PENGINAPAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
673	41018	KONSTRUKSI KONVENSIONAL GEDUNG HIBURAN DAN OLAHRAGA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
674	41019	KONSTRUKSI KONVENSIONAL GEDUNG LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
675	41020	KONSTRUKSI PRAPABRIKASI BANGUNAN GEDUNG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
676	42101	KONSTRUKSI JALAN PADA PERMUKAAN TANAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
677	42102	KONSTRUKSI BANGUNAN SIPIL JEMBATAN, JALAN LAYANG, FLY	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
678	42103	KONSTRUKSI JALAN REL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
679	42104	KONSTRUKSI TEROWONGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
680	42201	KONSTRUKSI JARINGAN IRIGASI DAN DRAINASE	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
681	42202	KONSTRUKSI BANGUNAN SIPIL PENGOLAHAN AIR BERSIH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
682	42203	KONSTRUKSI BANGUNAN SIPIL SISTEM PENGOLAHAN LIMBAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
683	42204	KONSTRUKSI BANGUNAN SIPIL ELEKTRIKAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
684	42205	KONSTRUKSI BANGUNAN SIPIL TELEKOMUNIKASI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
685	42206	KONSTRUKSI SENTRAL TELEKOMUNIKASI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
686	42207	KONSTRUKSI PENGEBORAN/PENGGALIAN AIR TANAH Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
687	42209	KONSTRUKSI PROYEK UTILITAS LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
688	42911	KONSTRUKSI BANGUNAN PRASARANA SUMBER DAYA AIR Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
689	42912	KONSTRUKSI BANGUNAN PELABUHAN BUKAN PERIKANAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
690	42913	KONSTRUKSI BANGUNAN PELABUHAN PERIKANAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
691	42914	KONSTRUKSI RESERVOIR PEMBANGKIT LISTRIK TENAGA AIR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
692	42915	KONSTRUKSI BANGUNAN SIPIL PELINDUNG PANTAI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
693	42919	KONSTRUKSI BANGUNAN SIPIL PRASARANA PERAIRAN DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
694	42991	KONSTRUKSI BANGUNAN SIPIL MINYAK DAN GAS BUMI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
695	42992	KONSTRUKSI BANGUNAN SIPIL PERTAMBANGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
696	42993	KONSTRUKSI BANGUNAN SIPIL PANAS BUMI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
697	42994	KONSTRUKSI BANGUNAN SIPIL FASILITAS OLAHRAGA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
698	42995	KONSTRUKSI BANGUNAN SIPIL FASILITAS PENGOLAHAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
699	42996	KONSTRUKSI BANGUNAN SIPIL FASILITAS MILITER DAN BANDAR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
700	42997	KONSTRUKSI BANGUNAN SIPIL FASILITAS SUMBER RADIASI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
701	42998	KONSTRUKSI BANGUNAN SIPIL REAKTOR NUKLIR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
702	42999	KONSTRUKSI BANGUNAN SIPIL LAINNYA YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
703	43110	PEMBONGKARAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
704	43120	PENYIAPAN LAHAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
705	43211	PEMASANGAN JARINGAN LISTRIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
706	43212	PEMASANGAN JARINGAN TELEKOMUNIKASI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
707	43213	PEMASANGAN SISTEM ELEKTRONIKA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
708	43214	PEMASANGAN SISTEM NAVIGASI LAUT, SUNGAI, DAN UDARA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
709	43215	PEMASANGAN SISTEM PERSINYALAN DAN TELEKOMUNIKASI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
710	43216	PEMASANGAN PERLENGKAPAN JALAN BERBASIS LISTRIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
711	43221	PEMASANGAN SALURAN AIR (PLUMBING)	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
712	43222	PEMASANGAN SISTEM PEMANAS DAN GEOTERMAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
713	43223	PEMASANGAN JARINGAN PENYALURAN GAS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
714	43224	PEMASANGAN PENDINGIN DAN VENTILASI UDARA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
715	43291	PEMASANGAN PERLENGKAPAN MEKANIKAL BANGUNAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
716	43299	PEMASANGAN KONSTRUKSI LAINNYA YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
717	43301	PEMASANGAN KACA, PINTU, KUSEN, JENDELA, DAN SEJENISNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
718	43302	PENGERJAAN LANTAI, DINDING, DAN PLAFON	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
719	43303	PENGECATAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
720	43309	PENYELESAIAN KONSTRUKSI BANGUNAN LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
721	43400	JASA INTERMEDIASI KONSTRUKSI KHUSUS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
722	43901	PEMASANGAN DAN REKAYASA STRUKTUR BANGUNAN Kelompok ini	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
723	43902	PEMASANGAN PERANCAH (STEGER)	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
724	43903	PEMASANGAN RANGKA DAN ATAP/ROOF COVERING	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
725	43904	PEMASANGAN KERANGKA BAJA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
726	43905	PENYEWAAN ALAT KONSTRUKSI DENGAN OPERATOR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
727	43909	KONSTRUKSI KHUSUS LAINNYA YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
728	46100	PERDAGANGAN BESAR ATAS DASAR BALAS JASA (FEE) ATAU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
729	46201	PERDAGANGAN BESAR PADI DAN PALAWIJA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
730	46202	PERDAGANGAN BESAR BUAH YANG MENGANDUNG MINYAK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
731	46203	PERDAGANGAN BESAR BUNGA DAN TANAMAN HIAS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
732	46204	PERDAGANGAN BESAR TEMBAKAU RAJANGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
733	46205	PERDAGANGAN BESAR BINATANG HIDUP	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
734	46206	PERDAGANGAN BESAR IKAN DAN BIOTA AIR HIDUP LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
735	46207	PERDAGANGAN BESAR HASIL KEHUTANAN DAN PERBURUAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
736	46208	PERDAGANGAN BESAR KULIT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
737	46209	PERDAGANGAN BESAR HASIL PERTANIAN DAN HEWAN HIDUP	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
738	46311	PERDAGANGAN BESAR BERAS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
739	46312	PERDAGANGAN BESAR BUAH - BUAHAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
740	46313	PERDAGANGAN BESAR SAYURAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
741	46314	PERDAGANGAN BESAR KOPI, TEH, DAN KAKAO	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
742	46315	PERDAGANGAN BESAR MINYAK DAN LEMAK NABATI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
743	46319	PERDAGANGAN BESAR BAHAN MAKANAN DAN MINUMAN HASIL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
744	46321	PERDAGANGAN BESAR DAGING SAPI DAN DAGING SAPI OLAHAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
745	46322	PERDAGANGAN BESAR DAGING AYAM DAN DAGING AYAM OLAHAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
746	46323	PERDAGANGAN BESAR DAGING DAN DAGING OLAHAN LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
747	46324	PERDAGANGAN BESAR HASIL PERIKANAN DAN OLAHAN TERKAIT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
748	46325	PERDAGANGAN BESAR TELUR DAN HASIL OLAHAN TELUR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
749	46326	PERDAGANGAN BESAR SUSU DAN PRODUK SUSU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
750	46327	PERDAGANGAN BESAR MINYAK DAN LEMAK HEWANI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
751	46329	PERDAGANGAN BESAR BAHAN MAKANAN DAN MINUMAN HASIL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
752	46331	PERDAGANGAN BESAR GULA, COKELAT, DAN KEMBANG GULA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
753	46332	PERDAGANGAN BESAR PRODUK BAKERI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
754	46333	PERDAGANGAN BESAR MINUMAN BERALKOHOL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
755	46334	PERDAGANGAN BESAR MINUMAN NONALKOHOL BUKAN SUSU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
756	46335	PERDAGANGAN BESAR ROKOK DAN TEMBAKAU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
757	46339	PERDAGANGAN BESAR MAKANAN DAN MINUMAN LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
758	46411	PERDAGANGAN BESAR TEKSTIL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
759	46412	PERDAGANGAN BESAR PAKAIAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
760	46413	PERDAGANGAN BESAR ALAS KAKI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
761	46414	PERDAGANGAN BESAR BARANG JADI TEKSTIL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
762	46415	PERDAGANGAN BESAR PERLENGKAPAN JAHIT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
763	46420	PERDAGANGAN BESAR FURNITUR, KARPET, PERLENGKAPAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
764	46430	PERDAGANGAN BESAR ALAT FOTOGRAFI DAN BARANG OPTIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
765	46441	PERDAGANGAN BESAR SEDIAAN FARMASI UNTUK MANUSIA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
766	46442	PERDAGANGAN BESAR SEDIAAN FARMASI UNTUK HEWAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
767	46451	PERDAGANGAN BESAR ALAT TULIS DAN GAMBAR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
768	46452	PERDAGANGAN BESAR BARANG PERCETAKAN DAN PENERBITAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
769	46491	PERDAGANGAN BESAR PERALATAN MASAK, PERALATAN DAPUR,	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
770	46492	PERDAGANGAN BESAR PERALATAN DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
771	46493	PERDAGANGAN BESAR ALAT MUSIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
772	46494	PERDAGANGAN BESAR PERHIASAN DAN JAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
773	46495	PERDAGANGAN BESAR ALAT PERMAINAN DAN MAINAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
774	46496	PERDAGANGAN BESAR TAS, DOMPET, KOPER, RANSEL, DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
775	46499	PERDAGANGAN BESAR BERBAGAI BARANG DAN PERLENGKAPAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
776	46511	PERDAGANGAN BESAR KOMPUTER DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
777	46512	PERDAGANGAN BESAR PERANGKAT LUNAK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
778	46521	PERDAGANGAN BESAR SUKU CADANG ELEKTRONIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
779	46522	PERDAGANGAN BESAR DISKET, FLASH DRIVE, PITA AUDIO DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
780	46523	PERDAGANGAN BESAR PERALATAN TELEKOMUNIKASI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
781	46530	PERDAGANGAN BESAR MESIN, PERALATAN DAN PERLENGKAPAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
782	46591	PERDAGANGAN BESAR MESIN KANTOR DAN INDUSTRI, SUKU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
783	46592	PERDAGANGAN BESAR ALAT TRANSPORTASI LAUT, SUKU CADANG,	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
784	46593	PERDAGANGAN BESAR ALAT TRANSPORTASI DARAT (BUKAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
785	46594	PERDAGANGAN BESAR ALAT TRANSPORTASI UDARA, SUKU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
786	46599	PERDAGANGAN BESAR MESIN, PERALATAN, DAN PERLENGKAPAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
787	46611	PERDAGANGAN BESAR MOBIL BARU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
788	46612	PERDAGANGAN BESAR MOBIL BEKAS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
789	46620	PERDAGANGAN BESAR SUKU CADANG DAN AKSESORI MOBIL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
790	46631	PERDAGANGAN BESAR SEPEDA MOTOR BARU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
791	46632	PERDAGANGAN BESAR SEPEDA MOTOR BEKAS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
792	46633	PERDAGANGAN BESAR SUKU CADANG SEPEDA MOTOR DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
793	46710	PERDAGANGAN BESAR BAHAN BAKAR PADAT, CAIR, DAN GAS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
794	46721	PERDAGANGAN BESAR BIJIH DAN KONSENTRAT LOGAM Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
795	46722	PERDAGANGAN BESAR PRODUK LOGAM SETENGAH JADI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
796	46731	PERDAGANGAN BESAR BAHAN KONSTRUKSI DARI LOGAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
797	46732	PERDAGANGAN BESAR KACA LEMBARAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
798	46733	PERDAGANGAN BESAR BAHAN KONSTRUKSI DARI TANAH LIAT,	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
799	46734	PERDAGANGAN BESAR SEMEN, KAPUR, PASIR, DAN BATU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
800	46735	PERDAGANGAN BESAR BAHAN KONSTRUKSI DARI PORSELEN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
801	46736	PERDAGANGAN BESAR BAHAN KONSTRUKSI DARI KAYU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
802	46737	PERDAGANGAN BESAR CAT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
803	46738	PERDAGANGAN BESAR BERBAGAI MACAM MATERIAL BANGUNAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
804	46739	PERDAGANGAN BESAR BAHAN KONSTRUKSI, PERKAKAS,	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
805	46741	PERDAGANGAN BESAR MINERAL BUKAN LOGAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
806	46742	PERDAGANGAN BESAR MINERAL RADIOAKTIF	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
807	46743	PERDAGANGAN BESAR ZAT RADIOAKTIF DAN PEMBANGKIT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
808	46751	PERDAGANGAN BESAR BAHAN DAN BARANG KIMIA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
809	46752	PERDAGANGAN BESAR PUPUK DAN PRODUK AGROKIMIA Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
810	46753	PERDAGANGAN BESAR BAHAN BERBAHAYA (B2)	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
811	46791	PERDAGANGAN BESAR ALAT KESEHATAN DAN LABORATORIUM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
812	46792	PERDAGANGAN BESAR ALAT KESEHATAN UNTUK HEWAN Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
813	46793	PERDAGANGAN BESAR KARET DAN PLASTIK DALAM BENTUK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
814	46794	PERDAGANGAN BESAR KERTAS DAN KARTON	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
815	46795	PERDAGANGAN BESAR BARANG DARI KERTAS DAN KARTON	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
816	46796	PERDAGANGAN BESAR BARANG BEKAS DAN SKRAP	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
817	46799	PERDAGANGAN BESAR PRODUK LAINNYA YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
818	46901	PERDAGANGAN BESAR BERBAGAI MACAM BARANG DI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
819	46902	PERDAGANGAN BESAR BERBAGAI MACAM BARANG SELAIN DI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
820	47111	PERDAGANGAN ECERAN BERBAGAI MACAM BARANG YANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
821	47112	PERDAGANGAN ECERAN BERBAGAI MACAM BARANG YANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
822	47191	PERDAGANGAN ECERAN BERBAGAI MACAM BARANG YANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
823	47192	PERDAGANGAN ECERAN BERBAGAI MACAM BARANG YANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
824	47211	s.d. 47216, seperti lada, pala, kunyit, kencur, temulawak,	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
825	47212	PERDAGANGAN ECERAN BUAH - BUAHAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
826	47213	PERDAGANGAN ECERAN SAYURAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
827	47214	PERDAGANGAN ECERAN HASIL PETERNAKAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
828	47215	PERDAGANGAN ECERAN HASIL PERIKANAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
829	47216	PERDAGANGAN ECERAN HASIL KEHUTANAN DAN PERBURUAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
830	47219	PERDAGANGAN ECERAN HASIL PERTANIAN LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
831	47221	PERDAGANGAN ECERAN MINUMAN BERALKOHOL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
832	47222	PERDAGANGAN ECERAN MINUMAN TIDAK BERALKOHOL Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
833	47230	PERDAGANGAN ECERAN ROKOK DAN TEMBAKAU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
834	47241	PERDAGANGAN ECERAN BERAS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
835	47242	PERDAGANGAN ECERAN ROTI, KUE KERING, SERTA KUE BASAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
836	47243	PERDAGANGAN ECERAN KOPI, GULA PASIR, GULA MERAH, DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
837	47244	PERDAGANGAN ECERAN TAHU, TEMPE, TAUCO, DAN ONCOM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
838	47245	PERDAGANGAN ECERAN DAGING OLAHAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
839	47246	PERDAGANGAN ECERAN IKAN OLAHAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
840	47249	PERDAGANGAN ECERAN MAKANAN LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
841	47301	PERDAGANGAN ECERAN BAHAN BAKAR DI SARANA PENGISIAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
842	47302	PERDAGANGAN ECERAN BAHAN BAKAR SELAIN DI SARANA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
843	47303	PERDAGANGAN ECERAN MINYAK PELUMAS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
844	47401	PERDAGANGAN ECERAN KOMPUTER DAN PERLENGKAPANNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
845	47402	PERDAGANGAN ECERAN PERALATAN DAN PRODUK GIM VIDEO	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
846	47403	PERDAGANGAN ECERAN PERANGKAT LUNAK (SOFTWARE)	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
847	47404	PERDAGANGAN ECERAN TELEPON BESERTA AKSESORISNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
848	47405	PERDAGANGAN ECERAN MESIN DAN PERALATAN KANTOR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
849	47406	PERDAGANGAN ECERAN PERALATAN AUDIO DAN VIDEO	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
850	47511	PERDAGANGAN ECERAN TEKSTIL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
851	47512	PERDAGANGAN ECERAN PERLENGKAPAN RUMAH TANGGA DARI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
852	47513	PERDAGANGAN ECERAN PERLENGKAPAN JAHIT MENJAHIT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
853	47521	PERDAGANGAN ECERAN BAHAN DAN MATERIAL KONSTRUKSI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
854	47522	PERDAGANGAN ECERAN KACA LEMBARAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
855	47523	PERDAGANGAN ECERAN PERKAKAS DAN PERALATAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
856	47524	PERDAGANGAN ECERAN PERALATAN KESELAMATAN DAN GAWAT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
857	47525	PERDAGANGAN ECERAN CAT, PERNIS DAN LAKERI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
858	47526	PERDAGANGAN ECERAN BAHAN - BAHAN ENERGI TERBARUKAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
859	47530	PERDAGANGAN ECERAN KARPET, PERMADANI, SERTA PENUTUP	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
860	47591	PERDAGANGAN ECERAN FURNITUR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
861	47592	PERDAGANGAN ECERAN PERALATAN LISTRIK RUMAH TANGGA,	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
862	47593	PERDAGANGAN ECERAN BARANG PECAH BELAH; PERLENGKAPAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
863	47594	PERDAGANGAN ECERAN ALAT MUSIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
864	47599	PERDAGANGAN ECERAN PERALATAN DAN PERLENGKAPAN RUMAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
865	47611	PERDAGANGAN ECERAN ALAT TULIS MENULIS DAN GAMBAR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
866	47612	PERDAGANGAN ECERAN HASIL PENCETAKAN DAN PENERBITAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
867	47613	PERDAGANGAN ECERAN KERTAS, KERTAS KARTON, DAN BARANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
868	47620	PERDAGANGAN ECERAN PERALATAN DAN PERLENGKAPAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
869	47630	PERDAGANGAN ECERAN ALAT PERMAINAN DAN MAINAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
870	47690	PERDAGANGAN ECERAN KHUSUS BARANG KESENIAN DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
871	47711	PERDAGANGAN ECERAN PAKAIAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
872	47712	PERDAGANGAN ECERAN SEPATU, SANDAL, DAN ALAS KAKI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
873	47713	PERDAGANGAN ECERAN PERLENGKAPAN PAKAIAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
874	47714	PERDAGANGAN ECERAN TAS, DOMPET, KOPER, RANSEL, DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
875	47721	PERDAGANGAN ECERAN SEDIAAN FARMASI UNTUK MANUSIA DI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
876	47722	PERDAGANGAN ECERAN SEDIAAN FARMASI UNTUK MANUSIA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
877	47723	PERDAGANGAN ECERAN OBAT BAHAN ALAM UNTUK MANUSIA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
878	47724	PERDAGANGAN ECERAN KOSMETIK UNTUK MANUSIA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
879	47725	PERDAGANGAN ECERAN ALAT KESEHATAN UNTUK MANUSIA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
880	47726	PERDAGANGAN ECERAN OBAT FARMASI UNTUK HEWAN Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
881	47727	PERDAGANGAN ECERAN OBAT TRADISIONAL UNTUK HEWAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
882	47728	PERDAGANGAN ECERAN KOSMETIK UNTUK HEWAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
883	47729	PERDAGANGAN ECERAN BAHAN BAKU FARMASI DAN ALAT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
884	47731	PERDAGANGAN ECERAN ALAT FOTOGRAFI DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
885	47732	PERDAGANGAN ECERAN ALAT OPTIK DAN PERLENGKAPANNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
886	47733	PERDAGANGAN ECERAN KACAMATA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
887	47734	PERDAGANGAN ECERAN JAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
888	47735	PERDAGANGAN ECERAN BARANG PERHIASAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
889	47741	PERDAGANGAN ECERAN PERLENGKAPAN RUMAH TANGGA BEKAS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
890	47742	PERDAGANGAN ECERAN PAKAIAN, ALAS KAKI, DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
891	47743	PERDAGANGAN ECERAN BARANG PERLENGKAPAN PRIBADI BEKAS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
892	47744	PERDAGANGAN ECERAN BARANG LISTRIK DAN ELEKTRONIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
893	47745	PERDAGANGAN ECERAN BAHAN KONSTRUKSI DAN SANITER	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
894	47746	PERDAGANGAN ECERAN BARANG ANTIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
895	47749	PERDAGANGAN ECERAN BARANG BEKAS LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
896	47751	PERDAGANGAN ECERAN HEWAN KESAYANGAN (PET ANIMALS)	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
897	47752	PERDAGANGAN ECERAN HEWAN TERNAK DAN BIBIT HEWAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
898	47753	PERDAGANGAN ECERAN IKAN DAN BIOTA AIR HIDUP LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
899	47754	PERDAGANGAN ECERAN PAKAN TERNAK/UNGGAS/IKAN DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
900	47761	PERDAGANGAN ECERAN BUNGA POTONG/FLORIST	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
901	47762	PERDAGANGAN ECERAN TANAMAN DAN BIBIT TANAMAN SELAIN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
902	47763	PERDAGANGAN ECERAN PUPUK DAN PEMBERANTAS HAMA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
903	47764	PERDAGANGAN ECERAN PERLENGKAPAN DAN MEDIA TANAMAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
904	47765	PERDAGANGAN ECERAN TANAMAN DAN BIBIT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
905	47771	PERDAGANGAN ECERAN MINYAK TANAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
906	47772	PERDAGANGAN ECERAN GAS TABUNG LPG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
907	47773	PERDAGANGAN ECERAN BAHAN KIMIA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
908	47774	PERDAGANGAN ECERAN AROMATIK/PENYEGAR (MINYAK ASIRI)	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
909	47779	PERDAGANGAN ECERAN BAHAN KIMIA, AROMATIK/PENYEGAR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
910	47781	PERDAGANGAN ECERAN CENDERA MATA, KERAJINAN, DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
911	47782	PERDAGANGAN ECERAN LUKISAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
912	47791	PERDAGANGAN ECERAN BERBAGAI MACAM MESIN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
913	47792	PERDAGANGAN ECERAN ALAT TRANSPORTASI DARAT TIDAK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
914	47793	PERDAGANGAN ECERAN ALAT TRANSPORTASI AIR DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
915	47794	PERDAGANGAN ECERAN ALAT - ALAT PERTANIAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
916	47795	PERDAGANGAN ECERAN PERLENGKAPAN PENGENDARA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
917	47796	PERDAGANGAN ECERAN PEMBUNGKUS DARI PLASTIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
918	47799	PERDAGANGAN ECERAN BARANG BARU LAINNYA YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
919	47811	PERDAGANGAN ECERAN MOBIL BARU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
920	47812	PERDAGANGAN ECERAN MOBIL BEKAS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
921	47820	PERDAGANGAN ECERAN SUKU CADANG DAN AKSESORI MOBIL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
922	47831	PERDAGANGAN ECERAN SEPEDA MOTOR BARU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
923	47832	PERDAGANGAN ECERAN SEPEDA MOTOR BEKAS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
924	47833	PERDAGANGAN ECERAN SUKU CADANG SEPEDA MOTOR DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
925	47901	PLATFORM DIGITAL INTERMEDIASI PERDAGANGAN ECERAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
926	47909	JASA INTERMEDIASI PERDAGANGAN ECERAN LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
927	49111	ANGKUTAN KERETA WISATA ANTARKOTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
928	49119	TRANSPORTASI KERETA API ANTARKOTA LAINNYA UNTUK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
929	49120	TRANSPORTASI KERETA API UNTUK BARANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
930	49211	ANGKUTAN KERETA WISATA DALAM KOTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
931	49212	ANGKUTAN KERETA API PERKOTAAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
932	49213	ANGKUTAN PERKOTAAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
933	49214	ANGKUTAN PERDESAAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
934	49219	TRANSPORTASI DARAT DALAM KOTA LAINNYA UNTUK PENUMPANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
935	49221	ANGKUTAN ANTARKOTA ANTARPROVINSI (AKAP)	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
936	49222	ANGKUTAN ANTARKOTA DALAM PROVINSI (AKDP)	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
937	49223	ANGKUTAN LINTAS BATAS NEGARA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
938	49229	TRANSPORTASI ANTARKOTA LAINNYA UNTUK PENUMPANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
939	49231	ANGKUTAN BERMOTOR UNTUK BARANG UMUM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
940	49232	ANGKUTAN BERMOTOR UNTUK BARANG KHUSUS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
941	49233	ANGKUTAN TIDAK BERMOTOR UNTUK BARANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
942	49291	ANGKUTAN KERETA API LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
943	49292	ANGKUTAN PARIWISATA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
944	49293	ANGKUTAN TAKSI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
945	49294	ANGKUTAN KHUSUS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
946	49295	ANGKUTAN SEWA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
947	49296	ANGKUTAN OJEK MOTOR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
948	49297	ANGKUTAN TIDAK BERMOTOR UNTUK PENUMPANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
949	49299	TRANSPORTASI DARAT LAINNYA UNTUK PENUMPANG YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
950	49300	TRANSPORTASI MELALUI SALURAN PIPA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
951	50111	ANGKUTAN LAUT DALAM NEGERI LINER DAN TRAMPER UNTUK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
952	50112	ANGKUTAN LAUT DALAM NEGERI PERINTIS UNTUK PENUMPANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
953	50113	ANGKUTAN LAUT DALAM NEGERI UNTUK WISATA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
954	50114	ANGKUTAN LAUT LUAR NEGERI LINER DAN TRAMPER UNTUK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
955	50115	ANGKUTAN LAUT LUAR NEGERI UNTUK WISATA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
956	50121	ANGKUTAN LAUT DALAM NEGERI UNTUK BARANG UMUM Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
957	50122	ANGKUTAN LAUT DALAM NEGERI UNTUK BARANG KHUSUS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
958	50123	ANGKUTAN LAUT DALAM NEGERI PERINTIS UNTUK BARANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
959	50124	ANGKUTAN LAUT DALAM NEGERI PELAYARAN RAKYAT UNTUK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
960	50125	ANGKUTAN LAUT LUAR NEGERI UNTUK BARANG UMUM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
961	50126	ANGKUTAN LAUT LUAR NEGERI UNTUK BARANG KHUSUS Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
962	50127	ANGKUTAN LAUT LUAR NEGERI PELAYARAN RAKYAT UNTUK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
963	50131	ANGKUTAN PENYEBERANGAN UMUM ANTARPROVINSI UNTUK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
964	50132	ANGKUTAN PENYEBERANGAN UMUM ANTARKABUPATEN/KOTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
965	50133	ANGKUTAN PENYEBERANGAN UMUM DALAM KABUPATEN/KOTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
966	50134	ANGKUTAN PENYEBERANGAN PERINTIS ANTARPROVINSI UNTUK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
967	50135	ANGKUTAN PENYEBERANGAN PERINTIS ANTARKABUPATEN/KOTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
968	50139	TRANSPORTASI PESISIR LAINNYA UNTUK PENUMPANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
969	50141	ANGKUTAN PENYEBERANGAN UMUM ANTARPROVINSI UNTUK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
970	50142	ANGKUTAN PENYEBERANGAN UMUM ANTARKABUPATEN/KOTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
971	50143	ANGKUTAN PENYEBERANGAN UMUM DALAM KABUPATEN/KOTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
972	50144	ANGKUTAN PENYEBERANGAN PERINTIS ANTARPROVINSI UNTUK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
973	50145	ANGKUTAN PENYEBERANGAN PERINTIS ANTARKABUPATEN/KOTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
974	50149	TRANSPORTASI PESISIR LAINNYA UNTUK BARANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
975	50211	ANGKUTAN SUNGAI DAN DANAU LINER (TRAYEK TETAP DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
976	50212	ANGKUTAN SUNGAI DAN DANAU TRAMPER (TRAYEK TIDAK TETAP	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
977	50213	ANGKUTAN SUNGAI DAN DANAU UNTUK WISATA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
978	50221	ANGKUTAN SUNGAI DAN DANAU UNTUK BARANG UMUM Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
979	50222	ANGKUTAN SUNGAI DAN DANAU UNTUK BARANG KHUSUS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
980	50223	ANGKUTAN SUNGAI DAN DANAU UNTUK BARANG BERBAHAYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
981	51101	ANGKUTAN UDARA NIAGA BERJADWAL UNTUK PENUMPANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
982	51102	ANGKUTAN UDARA NIAGA TIDAK BERJADWAL UNTUK PENUMPANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
983	51103	TRANSPORTASI ANTARIKSA UNTUK PENUMPANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
984	51201	ANGKUTAN UDARA NIAGA BERJADWAL KHUSUS KARGO	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
985	51202	ANGKUTAN UDARA NIAGA TIDAK BERJADWAL KHUSUS KARGO	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
986	51203	TRANSPORTASI ANTARIKSA UNTUK BARANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
987	52101	PENGELOLA GUDANG SISTEM RESI GUDANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
988	52102	AKTIVITAS GUDANG DINGIN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
989	52103	AKTIVITAS GUDANG BERIKAT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
990	52104	PENYIMPANAN MINYAK DAN GAS BUMI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
991	52105	AKTIVITAS PENYIMPANAN BARANG BERBAHAYA DAN BERACUN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
992	52106	FASILITAS PENYIMPANAN SUMBER RADIASI PENGION	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
993	52107	PENYIMPANAN MINERAL IKUTAN RADIOAKTIF	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
994	52109	PERGUDANGAN DAN PENYIMPANAN LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
995	52211	AKTIVITAS TERMINAL DARAT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
996	52212	AKTIVITAS PENYELENGGARAAN PRASARANA PERKERETAAPIAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
997	52213	AKTIVITAS JALAN TOL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
998	52214	AKTIVITAS PERPARKIRAN DI BADAN JALAN (ON STREET PARKING)	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
999	52215	AKTIVITAS PERPARKIRAN DI LUAR BADAN JALAN (OFF STREET	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1000	52219	AKTIVITAS JASA TERKAIT TRANSPORTASI DARAT LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1001	52221	AKTIVITAS PELAYANAN KEPELABUHANAN LAUT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1002	52222	AKTIVITAS PELAYANAN KEPELABUHANAN SUNGAI DAN DANAU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1003	52223	AKTIVITAS PELAYANAN KEPELABUHANAN PENYEBERANGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1004	52224	AKTIVITAS PELABUHAN PERIKANAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1005	52225	AKTIVITAS PENGELOLAAN KAPAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1006	52226	AKTIVITAS AKTIVITAS PENYELAMATAN KAPAL DAN MUATANNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1007	52227	ANGKUTAN PERAIRAN PELABUHAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1008	52229	AKTIVITAS JASA TERKAIT TRANSPORTASI PERAIRAN LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1009	52231	AKTIVITAS KEBANDARUDARAAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1010	52232	JASA PELAYANAN NAVIGASI PENERBANGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1011	52233	PELAYANAN PENUMPANG, BAGASI, KARGO, POS, DAN TEKNIS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1012	52234	AKTIVITAS PEMERIKSAAN DAN PENGENDALIAN KEAMANAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1013	52239	AKTIVITAS JASA TERKAIT ANGKUTAN UDARA LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1014	52240	PENANGANAN KARGO (BONGKAR MUAT BARANG)	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1015	52291	ANGKUTAN MULTIMODA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1016	52292	AKTIVITAS TALLY MANDIRI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1017	52299	AKTIVITAS PENUNJANG ANGKUTAN LAINNYA YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1018	52311	JASA PENGURUSAN TRANSPORTASI (JPT)	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1019	52312	JASA KEAGENAN KAPAL/AGEN PERKAPALAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1020	52313	AKTIVITAS PERWAKILAN OPERASIONAL TRANSPORTASI UDARA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1021	52319	JASA INTERMEDIASI TRANSPORTASI LAINNYA UNTUK BARANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1022	52321	AGEN PENJUALAN TIKET TRANSPORTASI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1023	52322	AGEN PENGURUS PERSETUJUAN TERBANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1024	52323	AKTIVITAS PERWAKILAN OPERASIONAL TRANSPORTASI UDARA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1025	52329	JASA INTERMEDIASI TRANSPORTASI LAINNYA UNTUK PENUMPANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1026	53100	AKTIVITAS POS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1027	53200	AKTIVITAS KURIR Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1028	53301	AKTIVITAS JASA PORTAL INTERMEDIASI POS DAN KURIR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1029	53309	JASA INTERMEDIASI POS DAN KURIR LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1030	55101	AKTIVITAS HOTEL BINTANG LIMA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1031	55102	AKTIVITAS HOTEL BINTANG EMPAT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1032	55103	AKTIVITAS HOTEL BINTANG TIGA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1033	55104	AKTIVITAS HOTEL BINTANG DUA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1034	55105	AKTIVITAS HOTEL BINTANG SATU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1035	55106	AKTIVITAS HOTEL NONBINTANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1036	55201	AKTIVITAS RUMAH TINGGAL SEWA (HOMESTAY)	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1037	55202	AKTIVITAS HOSTEL REMAJA (YOUTH HOSTEL)	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1038	55203	AKTIVITAS VILA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1039	55204	AKTIVITAS APARTEMEN HOTEL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1040	55209	AKTIVITAS PENYEDIAAN AKOMODASI JANGKA PENDEK LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1041	55300	AKTIVITAS PENYEDIAAN BUMI PERKEMAHAN, PERSINGGAHAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1042	55400	AKTIVITAS JASA INTERMEDIASI AKOMODASI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1043	55901	AKTIVITAS JASA MANAJEMEN AKOMODASI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1044	55909	PENYEDIAAN AKOMODASI LAINNYA YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1045	56101	AKTIVITAS PENYEDIAAN MAKANAN DI BANGUNAN TETAP	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1046	56102	AKTIVITAS PENYEDIAAN MAKANAN DI BANGUNAN TIDAK TETAP	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1047	56210	AKTIVITAS JASA BOGA UNTUK ACARA TERTENTU (EVENT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1048	56290	AKTIVITAS PENYEDIAAN JASA BOGA LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1049	56301	AKTIVITAS BAR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1050	56302	AKTIVITAS KELAB MALAM ATAU DISKOTEK YANG UTAMANYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1051	56303	AKTIVITAS RUMAH MINUM/KAFE	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1052	56304	AKTIVITAS KEDAI MINUMAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1053	56305	AKTIVITAS RUMAH/KEDAI OBAT BAHAN ALAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1054	56306	AKTIVITAS PENYEDIAAN MINUMAN KELILING/TEMPAT TIDAK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1055	56400	AKTIVITAS JASA INTERMEDIASI PENYEDIAAN MAKANAN DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1056	58110	PENERBITAN BUKU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1057	58120	PENERBITAN SURAT KABAR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1058	58130	PENERBITAN JURNAL DAN TERBITAN BERKALA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1059	58190	AKTIVITAS PENERBITAN LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1060	58211	PENERBITAN PERANGKAT LUNAK VIDEO GIM DALAM JARINGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1061	58219	PENERBITAN PERANGKAT LUNAK VIDEO GIM LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1062	58290	PENERBITAN PERANGKAT LUNAK (SOFTWARE) LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1063	59111	AKTIVITAS PRODUKSI FILM, VIDEO, DAN PROGRAM TELEVISI OLEH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1064	59112	AKTIVITAS PRODUKSI FILM, VIDEO, DAN PROGRAM TELEVISI OLEH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1065	59121	AKTIVITAS PASCAPRODUKSI FILM, VIDEO, DAN PROGRAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1066	59122	AKTIVITAS PASCAPRODUKSI FILM, VIDEO, DAN PROGRAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1067	59131	AKTIVITAS DISTRIBUSI FILM, VIDEO, DAN PROGRAM TELEVISI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1068	59132	AKTIVITAS DISTRIBUSI FILM, VIDEO. DAN PROGRAM TELEVISI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1069	59140	AKTIVITAS PEMUTARAN FILM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1070	59201	AKTIVITAS PEREKAMAN SUARA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1071	59202	AKTIVITAS PENERBITAN MUSIK DAN BUKU MUSIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1072	60101	AKTIVITAS PENYIARAN RADIO ANALOG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1073	60102	AKTIVITAS PENYIARAN RADIO DIGITAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1074	60103	AKTIVITAS DISTRIBUSI DAN STREAMING AUDIO ATAS PERMINTAAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1075	60201	AKTIVITAS PENYIARAN DAN PEMROGRAMAN TELEVISI ANALOG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1076	60202	AKTIVITAS PEMROGRAMAN DAN PENYIARAN TELEVISI DIGITAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1077	60203	AKTIVITAS DISTRIBUSI DAN STREAMING VIDEO ATAS PERMINTAAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1078	60311	AKTIVITAS KANTOR BERITA OLEH PEMERINTAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1079	60312	AKTIVITAS KANTOR BERITA OLEH SWASTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1080	60390	AKTIVITAS SITUS JEJARING SOSIAL DAN DISTRIBUSI KONTEN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1081	61101	AKTIVITAS TELEKOMUNIKASI DENGAN KABEL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1082	61102	AKTIVITAS TELEKOMUNIKASI DENGAN NIRKABEL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1083	61103	AKTIVITAS TELEKOMUNIKASI DENGAN SATELIT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1084	61104	AKTIVITAS JASA AKSES INTERNET (INTERNET SERVICE PROVIDER)	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1085	61105	AKTIVITAS JASA SISTEM KOMUNIKASI DATA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1086	61106	AKTIVITIAS JASA TELEVISI PROTOKOL INTERNET (IPTV)	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1087	61107	AKTIVITAS JASA GERBANG AKSES INTERNET (NETWORK ACCESS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1088	61108	AKTIVITAS JASA TELEPONI DASAR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1089	61201	AKTIVITAS PENJUALAN KEMBALI JASA TELEKOMUNIKASI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1090	61209	AKTIVITAS PENJUALAN KEMBALI DAN JASA INTERMEDIASI UNTUK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1091	61901	AKTIVITAS JASA PANGGILAN PREMIUM (PREMIUM CALL)	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1092	61902	AKTIVITAS JASA KONTEN SMS PREMIUM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1093	61903	AKTIVITAS JASA INTERNET TELEPONI UNTUK KEPERLUAN PUBLIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1094	61904	AKTIVITAS JASA PANGGILAN TERKELOLA (CALLING CARD)	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1095	61905	AKTIVITAS JASA TELEKOMUNIKASI KHUSUS BERBASIS SATELIT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1096	61909	AKTIVITAS TELEKOMUNIKASI LAINNYA YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1097	62110	PENGEMBANGAN VIDEO GIM, PERANGKAT LUNAK VIDEO GIM, DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1098	62191	AKTIVITAS PENGEMBANGAN APLIKASI PERDAGANGAN MELALUI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1099	62192	AKTIVITAS PENGEMBANGAN APLIKASI DAN PRODUKSI KONTEN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1100	62193	AKTIVITAS PENGEMBANGAN APLIKASI BERBASIS TEKNOLOGI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1101	62194	AKTIVITAS PENGEMBANGAN KOMPONEN DASAR KECERDASAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1102	62199	AKTIVITAS PEMROGRAMAN KOMPUTER LAINNYA YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1103	62201	AKTIVITAS KONSULTANSI DAN MANAJEMEN KEAMANAN SIBER	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1104	62202	AKTIVITAS PENYEDIAAN DAN PENGELOLAAN IDENTITAS DIGITAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1105	62203	AKTIVITAS PENYEDIAAN SERTIFIKAT ELEKTRONIK DAN JASA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1106	62204	AKTIVITAS KONSULTANSI DAN PERANCANGAN INTERNET OF	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1107	62209	AKTIVITAS KONSULTANSI KOMPUTER DAN MANAJEMEN FASILITAS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1108	62900	AKTIVITAS JASA TEKNOLOGI INFORMASI DAN KOMPUTER LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1109	63101	AKTIVITAS PENGOLAHAN DATA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1110	63102	AKTIVITAS PENYEDIAAN INFRASTRUKTUR KOMPUTASI, HOSTING,	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1111	63900	AKTIVITAS JASA PORTAL PENCARIAN WEB DAN INFORMASI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1112	64110	AKTIVITAS BANK SENTRAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1113	64121	PERBANKAN UMUM KONVENSIONAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1114	64122	PERBANKAN UMUM SYARIAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1115	64123	PERBANKAN KONVENSIONAL LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1116	64124	PERBANKAN SYARIAH LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1117	64191	AKTIVITAS PEMBERIAN KREDIT OLEH KOPERASI KONVENSIONAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1118	64192	AKTIVITAS PEMBERIAN KREDIT OLEH KOPERASI SYARIAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1119	64193	PEMBIAYAAN MIKRO KONVENSIONAL NONPERBANKAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1120	64194	PEMBIAYAAN MIKRO SYARIAH NONPERBANKAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1121	64199	PERANTARA MONETER LAINNYA YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1122	64210	AKTIVITAS PERUSAHAAN INDUK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1123	64220	AKTIVITAS PEMBIAYAAN CONDUIT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1124	64310	AKTIVITAS DANA PASAR UANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1125	64320	AKTIVITAS DANA INVESTASI BUKAN PASAR UANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1126	64330	AKTIVITAS TRUST, WARISAN, DAN KEAGENAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1127	64910	AKTIVITAS SEWA GUNA USAHA FINANSIAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1128	64920	AKTIVITAS PEMBIAYAAN PERDAGANGAN INTERNASIONAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1129	64930	AKTIVITAS ANJAK PIUTANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1130	64940	AKTIVITAS SEKURITISASI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1131	64951	PEMBIAYAAN INFRASTRUKTUR KONVENSIONAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1132	64952	PEMBIAYAAN INFRASTRUKTUR SYARIAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1133	64953	AKTIVITAS GADAI KONVENSIONAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1134	64954	AKTIVITAS GADAI SYARIAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1135	64955	PENGELOLAAN TABUNGAN PERUMAHAN RAKYAT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1136	64959	AKTIVITAS PEMBERIAN KREDIT LAINNYA YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1137	64991	AKTIVITAS MODAL VENTURA KONVENSIONAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1138	64992	AKTIVITAS MODAL VENTURA SYARIAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1139	64993	AKTIVITAS COUNTERPARTY UNTUK KLIRING DAN SETELMEN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1140	64994	PERDAGANGAN DI PASAR KEUANGAN ATAS NAMA SENDIRI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1141	64995	PERDAGANGAN UNIT KARBON ATAS NAMA SENDIRI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1142	64996	AKTIVITAS PERBANKAN BULION KONVENSIONAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1143	64997	AKTIVITAS PERBANKAN BULION SYARIAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1144	64999	AKTIVITAS JASA KEUANGAN LAINNYA YTDL, BUKAN ASURANSI DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1145	65111	ASURANSI JIWA KONVENSIONAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1146	65112	ASURANSI JIWA SYARIAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1147	65121	ASURANSI UMUM KONVENSIONAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1148	65122	ASURANSI UMUM SYARIAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1149	65123	AKTIVITAS PENJAMINAN SIMPANAN DAN ASURANSI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1150	65131	PENJAMINAN KONVENSIONAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1151	65132	PENJAMINAN SYARIAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1152	65201	REASURANSI KONVENSIONAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1153	65202	REASURANSI SYARIAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1154	65203	PENJAMINAN ULANG KONVENSIONAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1155	65204	PENJAMINAN ULANG SYARIAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1156	65301	AKTIVITAS DANA PENSIUN PEMBERI KERJA KONVENSIONAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1157	65302	AKTIVITAS DANA PENSIUN PEMBERI KERJA SYARIAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1158	65303	AKTIVITAS DANA PENSIUN LEMBAGA KEUANGAN KONVENSIONAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1159	65304	AKTIVITAS DANA PENSIUN LEMBAGA KEUANGAN SYARIAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1160	66111	PENYELENGGARAAN SISTEM PERDAGANGAN EFEK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1161	66112	BURSA BERJANGKA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1162	66113	PENYELENGGARAAN BURSA ASET KEUANGAN DIGITAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1163	66114	PENYELENGGARAAN PERDAGANGAN KONTRAK DERIVATIF DI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1164	66115	PENYELENGGARAAN SARANA TRANSAKSI DI PASAR UANG DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1165	66116	AKTIVITAS PENGAWASAN JASA KEUANGAN SELAIN ASURANSI DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1166	66117	AKTIVITAS REGULATOR MANDIRI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1167	66119	ADMINISTRASI PASAR KEUANGAN, PASAR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1168	66121	KEPIALANGAN EFEK SELAIN UNIT KARBON	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1169	66122	KEPIALANGAN PERDAGANGAN KOMODITAS BERJANGKA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1170	66123	KEPIALANGAN ASET KEUANGAN DIGITAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1171	66124	KEPIALANGAN PASAR UANG DAN PASAR VALUTA ASING	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1172	66125	AKTIVITAS PENUKARAN VALUTA ASING (MONEY CHANGER)	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1173	66126	PENAWARAN EFEK MELALUI LAYANAN URUN DANA BERBASIS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1174	66127	KEPIALANGAN UNIT KARBON	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1175	66129	KEPIALANGAN EFEK DAN KONTRAK KOMODITAS LAINNYA Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1176	66131	KLIRING DAN SETELMEN TRANSAKSI DI PASAR KEUANGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1177	66132	AKTIVITAS PENYIMPANAN ASET KEUANGAN DAN KONTRAK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1178	66133	AKTIVITAS ADMINISTRASI KEPEMILIKAN EFEK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1179	66141	PENYEDIAAN JASA PEMBAYARAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1180	66142	PENYELENGGARAAN INFRASTRUKTUR SISTEM PEMBAYARAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1181	66143	PENYELENGGARAAN PENUNJANG SISTEM PEMBAYARAN Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1182	66144	AKTIVITAS JASA PENGOLAHAN UANG RUPIAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1183	66149	PENYELENGGARAAN TRANSAKSI KEUANGAN DAN PENGELOLAAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1184	66151	AKTIVITAS ADVISORI INVESTASI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1185	66152	AKTIVITAS ADVISORI PERDAGANGAN BERJANGKA KOMODITAS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1186	66153	AKTIVITAS ADVISORI SYARIAH PASAR MODAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1187	66159	AKTIVITAS ADVISORI PASAR KEUANGAN LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1188	66161	JASA INTERMEDIASI PINJAM MEMINJAM UANG BERBASIS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1189	66162	JASA INTERMEDIASI PINJAM MEMINJAM UANG BERBASIS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1190	66191	AKTIVITAS PENDANAAN UNTUK TRANSAKSI EFEK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1191	66192	PENITIPAN DAN PENGELOLAAN BERDASARKAN PERJANJIAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1192	66193	PEMERINGKATAN EFEK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1193	66194	PENILAIAN HARGA EFEK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1194	66195	PENYELENGGARAAN DANA PERLINDUNGAN PEMODAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1195	66196	PENJAMINAN EMISI EFEK (UNDERWRITER)	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1196	66197	AKTIVITAS PENDUKUNG DI PASAR UANG DAN PASAR VALUTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1197	66198	PEMERINGKATAN USAHA MIKRO, KECIL, MENENGAH, DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1198	66199	AKTIVITAS PENUNJANG JASA KEUANGAN LAINNYA YTDL, KECUALI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1199	66211	AKTIVITAS PENILAI RISIKO ASURANSI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1200	66212	AKTIVITAS PENILAI KERUGIAN ASURANSI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1201	66221	AKTIVITAS AGEN ASURANSI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1202	66222	AKTIVITAS PIALANG ASURANSI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1203	66223	AKTIVITAS PIALANG REASURANSI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1204	66224	AKTIVITAS AGEN PENJAMINAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1205	66225	AKTIVITAS BROKER PENJAMINAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1206	66226	AKTIVITAS BROKER PENJAMINAN ULANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1207	66291	AKTIVITAS ADVISORI AKTUARIA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1208	66292	AKTIVITAS PENGAWASAN JASA KEUANGAN ASURANSI DAN DANA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1209	66299	AKTIVITAS PENUNJANG LAINNYA UNTUK ASURANSI, PENJAMIAN,	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1210	66301	MANAJEMEN INVESTASI KONVENSIONAL DI PASAR KEUANGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1211	66302	MANAJEMEN INVESTASI SYARIAH DI PASAR KEUANGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1212	66303	MANAJEMEN INVESTASI DI PERDAGANGAN BERJANGKA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1213	66309	AKTIVITAS MANAJEMEN DANA LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1214	68111	AKTIVITAS PENGEMBANGAN BANGUNAN DAN LAHAN HUNIAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1215	68112	AKTIVITAS PENYEWAAN BANGUNAN DAN LAHAN HUNIAN MILIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1216	68121	PENGELOLAAN KAWASAN PARIWISATA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1217	68122	PENGELOLAAN KAWASAN INDUSTRI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1218	68123	PENGELOLAAN KAWASAN EKONOMI KHUSUS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1219	68124	PENYEWAAN TEMPAT PENYELENGGARAAN AKTIVITAS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1220	68125	PENGELOLAAN PUSAT PERBELANJAAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1221	68126	PENYEWAAN GUDANG DAN FASILITAS PENYIMPANAN MANDIRI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1222	68127	PENGELOLAAN GEDUNG PERKANTORAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1223	68129	AKTIVITAS REAL ESTAT (BANGUNAN DAN LAHAN) NONHUNIAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1224	68210	AKTIVITAS JASA INTERMEDIASI REAL ESTAT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1225	68291	JASA PENAKSIR REAL ESTAT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1226	68292	PENGELOLAAN REAL ESTAT HUNIAN ATAS DASAR BALAS JASA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1227	68299	AKTIVITAS REAL ESTAT ATAS DASAR BALAS JASA (FEE) ATAU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1228	69101	AKTIVITAS PENGACARA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1229	69102	AKTIVITAS KONSULTAN HUKUM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1230	69103	AKTIVITAS KONSULTAN KEKAYAAN INTELEKTUAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1231	69104	AKTIVITAS NOTARIS DAN PEJABAT PEMBUAT AKTA TANAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1232	69201	AKTIVITAS AKUNTANSI, PEMBUKUAN, DAN PEMERIKSA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1233	69202	AKTIVITAS KONSULTANSI PAJAK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1234	70100	AKTIVITAS KANTOR PUSAT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1235	70201	AKTIVITAS KONSULTANSI MANAJEMEN DAN BISNIS PARIWISATA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1236	70202	AKTIVITAS KONSULTANSI MANAJEMEN DAN BISNIS INDUSTRI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1237	70203	AKTIVITAS KONSULTANSI MANAJEMEN DAN BISNIS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1238	70209	AKTIVITAS KONSULTASI MANAJEMEN DAN BISNIS LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1239	71101	AKTIVITAS ARSITEKTURAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1240	71102	AKTIVITAS PERANCANGAN DAN KONSULTANSI TEKNIS PABRIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1241	71109	AKTIVITAS ENJINERING DAN KONSULTANSI TEKNIS TERKAIT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1242	71201	JASA SERTIFIKASI TEKNIS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1243	71202	JASA INSPEKSI TEKNIS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1244	71203	JASA VERIFIKASI DAN VALIDASI TEKNIS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1245	71204	JASA PENGUJIAN TEKNIS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1246	71209	PENGUJIAN DAN ANALISIS TEKNIS LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1247	72101	PENELITIAN DAN PENGEMBANGAN ILMU ALAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1248	72102	PENELITIAN DAN PENGEMBANGAN ENJINERING DAN TEKNOLOGI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1249	72103	PENELITIAN DAN PENGEMBANGAN ILMU KEDOKTERAN DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1250	72104	PENELITIAN DAN PENGEMBANGAN BIOTEKNOLOGI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1251	72105	PENELITIAN DAN PENGEMBANGAN ILMU PERTANIAN DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1252	72106	PENELITIAN DAN PENGEMBANGAN KETENAGANUKLIRAN Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1253	72109	PENELITIAN DAN PENGEMBANGAN EKSPERIMENTAL ILMU ALAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1254	72201	PENELITIAN DAN PENGEMBANGAN ILMU PENGETAHUAN SOSIAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1255	72202	PENELITIAN DAN PENGEMBANGAN HUMANIORA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1256	73100	AKTIVITAS PERIKLANAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1257	73201	PENELITIAN PASAR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1258	73202	JAJAK PENDAPAT OPINI PUBLIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1259	73300	AKTIVITAS KEHUMASAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1260	74111	AKTIVITAS DESAIN ALAT TRANSPORTASI DAN PERMESINAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1261	74112	AKTIVITAS DESAIN PERALATAN RUMAH TANGGA DAN FURNITUR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1262	74113	AKTIVITAS DESAIN TEKSTIL, MODE/FESYEN, DAN GARMEN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1263	74114	AKTIVITAS DESAIN INDUSTRI STRATEGIS DAN PERTAHANAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1264	74115	AKTIVITAS DESAIN ALAT KOMUNIKASI DAN ELEKTRONIKA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1265	74116	AKTIVITAS DESAIN PERALATAN OLAHRAGA DAN PERMAINAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1266	74117	AKTIVITAS DESAIN PRODUK KESEHATAN, KOSMETIK, DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1267	74118	AKTIVITAS DESAIN PENGEMASAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1268	74119	AKTIVITAS DESAIN INDUSTRI LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1269	74191	AKTIVITAS DESAIN INTERIOR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1270	74192	AKTIVITAS DESAIN GRAFIS/KOMUNIKASI VISUAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1271	74193	AKTIVITAS DESAIN KHUSUS FILM, VIDEO, PROGRAM TELEVISI,	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1272	74194	AKTIVITAS DESAIN KONTEN GIM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1273	74199	AKTIVITAS DESAIN KHUSUS LAINYA YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1274	74201	AKTIVITAS FOTOGRAFI UDARA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1275	74209	AKTIVITAS FOTOGRAFI LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1276	74300	AKTIVITAS PENERJEMAH ATAU INTERPRETER	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1277	74910	AKTIVITAS BROKER DAN LAYANAN PEMASARAN PATEN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1278	74991	JASA METEOROLOGI DAN PRAKIRAAN CUACA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1279	74999	SEMUA AKTIVITAS PROFESIONAL, ILMIAH DAN TEKNIS YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1280	75001	AKTIVITAS PERSONEL KESEHATAN HEWAN MANDIRI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1281	75002	AKTIVITAS PENGELOLAAN SARANA KESEHATAN HEWAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1282	75009	AKTIVITAS PENGELOLAAN KESEHATAN HEWAN LAINNYA Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1283	77100	PENYEWAAN DAN SEWA GUNA USAHA KENDARAAN BERMOTOR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1284	77210	PENYEWAAN DAN SEWA GUNA USAHA ALAT REKREASI DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1285	77291	PENYEWAAN PERALATAN DAN PERLENGKAPAN ACARA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1286	77292	PENYEWAAN ALAT MUSIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1287	77293	PENYEWAAN BARANG HASIL PENCETAKAN DAN PENERBITAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1288	77294	PENYEWAAN BUNGA DAN TANAMAN HIAS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1289	77299	PENYEWAAN BARANG PRIBADI DAN BARANG RUMAH TANGGA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1290	77311	PENYEWAAN DAN SEWA GUNA USAHA ALAT TRANSPORTASI DARAT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1291	77312	PENYEWAAN DAN SEWA GUNA USAHA ALAT TRANSPORTASI AIR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1292	77313	PENYEWAAN DAN SEWA GUNA USAHA ALAT TRANSPORTASI UDARA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1293	77391	PENYEWAAN DAN SEWA GUNA USAHA MESIN DAN PERALATAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1294	77392	PENYEWAAN DAN SEWA GUNA USAHA MESIN DAN ALAT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1295	77393	PENYEWAAN DAN SEWA GUNA USAHA MESIN DAN PERALATAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1296	77394	PENYEWAAN DAN SEWA GUNA USAHA MESIN DAN PERALATAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1297	77395	PENYEWAAN DAN SEWA GUNA MESIN DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1298	77396	PENYEWAAN DAN SEWA GUNA USAHA MESIN DAN PERALATAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1299	77397	PENYEWAAN DAN SEWA GUNA USAHA MESIN DAN PERALATAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1300	77399	PENYEWAAN DAN SEWA GUNA USAHA MESIN, PERALATAN, DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1301	77400	SEWA GUNA USAHA KEKAYAAN INTELEKTUAL DAN PRODUK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1302	77510	AKTIVITAS JASA INTERMEDIASI UNTUK PENYEWAAN DAN SEWA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1303	77520	AKTIVITAS JASA INTERMEDIASI UNTUK PENYEWAAN DAN SEWA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1304	78101	AKTIVITAS PENEMPATAN TENAGA KERJA UNTUK USAHA DI DALAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1305	78102	AKTIVITAS PENEMPATAN TENAGA KERJA LUAR NEGERI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1306	78103	AKTIVITAS PENEMPATAN TENAGA KERJA UNTUK RUMAH TANGGA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1307	78104	AKTIVITAS PENEMPATAN AWAK KAPAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1308	78105	AKTIVITAS PENYEDIAAN INFORMASI LOWONGAN KERJA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1309	78109	AKTIVITAS PENEMPATAN TENAGA KERJA LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1310	78200	AKTIVITAS PENYEDIAAN TENAGA KERJA SEMENTARA DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1311	79110	AKTIVITAS AGEN PERJALANAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1312	79121	AKTIVITAS BIRO PERJALANAN WISATA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1313	79122	AKTIVITAS BIRO PERJALANAN IBADAH UMRAH DAN HAJI KHUSUS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1314	79129	AKTIVITAS BIRO PERJALANAN LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1315	79901	JASA INFORMASI PARIWISATA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1316	79902	JASA INFORMASI DAYA TARIK WISATA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1317	79903	JASA PRAMUWISATA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1318	79909	AKTIVITAS TERKAIT PERJALANAN LAINNYA YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1319	80110	AKTIVITAS INVESTIGASI DAN KEAMANAN SWASTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1320	80190	AKTIVITAS KEAMANAN YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1321	81100	AKTIVITAS PENYEDIAAN GABUNGAN JASA PENUNJANG FASILITAS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1322	81210	AKTIVITAS KEBERSIHAN UMUM BANGUNAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1323	81290	AKTIVITAS KEBERSIHAN LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1324	81300	AKTIVITAS JASA LANSKAP Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1325	82100	AKTIVITAS ADMINISTRASI KANTOR DAN PENUNJANG KANTOR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1326	82200	AKTIVITAS PUSAT PANGGILAN (CALL CENTER) Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1327	82300	PENYELENGGARAAN KONVENSI DAN PAMERAN BISNIS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1328	82400	JASA INTERMEDIASI UNTUK AKTIVITAS PENUNJANG USAHA YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1329	82911	AKTIVITAS AGEN PENAGIHAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1330	82912	AKTIVITAS BIRO KREDIT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1331	82921	AKTIVITAS PENGEPAKAN BAHAN DAN PRODUK HASIL PERTANIAN,	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1332	82922	AKTIVITAS PENGEPAKAN BAHAN DAN PRODUK MAKANAN DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1333	82923	AKTIVITAS PENGEPAKAN TEKSTIL DAN PRODUK TEKSTIL Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1334	82924	AKTIVITAS PENGEPAKAN BAHAN DAN PRODUK KIMIA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1335	82925	AKTIVITAS PENGEPAKAN BAHAN DAN PRODUK FARMASI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1336	82929	AKTIVITAS PENGEPAKAN LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1337	82990	AKTIVITAS JASA PENUNJANG USAHA LAINNYA YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1338	84111	LEMBAGA LEGISLATIF	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1339	84112	PENYELENGGARAAN PEMERINTAHAN NEGARA DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1340	84113	LEMBAGA EKSEKUTIF KEUANGAN, PERPAJAKAN, DAN BEA CUKAI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1341	84114	LEMBAGA EKSEKUTIF PERENCANAAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1342	84115	LEMBAGA PEMERINTAH NONKEMENTERIAN DENGAN TUGAS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1343	84119	KEGIATAN ADMINISTRASI PEMERINTAHAN LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1344	84121	ADMINISTRASI PELAYANAN PEMERINTAH BIDANG PENDIDIKAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1345	84122	ADMINISTRASI PELAYANAN PEMERINTAH BIDANG KESEHATAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1346	84123	ADMINISTRASI PELAYANAN PEMERINTAH BIDANG PERUMAHAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1347	84124	ADMINISTRASI PELAYANAN PEMERINTAH BIDANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1348	84125	ADMINISTRASI PELAYANAN PEMERINTAH BIDANG KEAGAMAAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1349	84126	ADMINISTRASI PELAYANAN PEMERINTAH BIDANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1350	84129	ADMINISTRASI PELAYANAN PEMERINTAH BIDANG SOSIAL LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1351	84130	ADMINISTRASI PELAYANAN PEMERINTAH BIDANG LINGKUNGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1352	84141	KEGIATAN LEMBAGA PEMERINTAHAN BIDANG PERTANIAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1353	84142	KEGIATAN LEMBAGA PEMERINTAHAN BIDANG PERTAMBANGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1354	84143	KEGIATAN LEMBAGA PEMERINTAHAN BIDANG PERINDUSTRIAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1355	84144	KEGIATAN LEMBAGA PEMERINTAHAN BIDANG KOMUNIKASI DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1356	84145	KEGIATAN LEMBAGA PEMERINTAHAN BIDANG KONSTRUKSI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1357	84146	KEGIATAN LEMBAGA PEMERINTAHAN BIDANG PERDAGANGAN DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1358	84147	KEGIATAN LEMBAGA PEMERINTAHAN BIDANG PERHUBUNGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1359	84148	KEGIATAN LEMBAGA PEMERINTAHAN BIDANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1360	84149	KEGIATAN LEMBAGA PEMERINTAHAN UNTUK MENCIPTAKAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1361	84210	HUBUNGAN LUAR NEGERI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1362	84221	LEMBAGA PERTAHANAN DAN ANGKATAN BERSENJATA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1363	84222	ANGKATAN DARAT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1364	84223	ANGKATAN UDARA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1365	84224	ANGKATAN LAUT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1366	84231	KEPOLISIAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1367	84232	PERTAHANAN SIPIL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1368	84233	AKTIVITAS LEMBAGA PERADILAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1369	84234	KEGIATAN LEMBAGA PEMERINTAHAN BIDANG PENANGGULANGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1370	84300	AKTIVITAS JAMINAN SOSIAL WAJIB	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1371	85101	PENDIDIKAN TAMAN KANAK - KANAK UMUM PEMERINTAH Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1372	85102	PENDIDIKAN TAMAN KANAK - KANAK UMUM SWASTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1373	85103	PENDIDIKAN PRASEKOLAH KEAGAMAAN ISLAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1374	85104	PENDIDIKAN PRASEKOLAH KEAGAMAAN PROTESTAN, KATOLIK,	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1375	85201	PENDIDIKAN DASAR UMUM PEMERINTAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1376	85202	PENDIDIKAN DASAR UMUM SWASTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1377	85203	PENDIDIKAN DASAR KEAGAMAAN ISLAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1378	85204	PENDIDIKAN DASAR KEAGAMAAN PROTESTAN, KATOLIK, HINDU,	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1379	85311	PENDIDIKAN MENENGAH PERTAMA UMUM PEMERINTAH Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1380	85312	PENDIDIKAN MENENGAH PERTAMA UMUM SWASTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1381	85313	PENDIDIKAN MENENGAH PERTAMA KEAGAMAAN ISLAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1382	85314	PENDIDIKAN MENENGAH PERTAMA KEAGAMAAN PROTESTAN,	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1383	85315	PENDIDIKAN MENENGAH ATAS UMUM PEMERINTAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1384	85316	PENDIDIKAN MENENGAH ATAS UMUM SWASTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1385	85317	PENDIDIKAN MENENGAH ATAS KEAGAMAAN ISLAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1386	85318	PENDIDIKAN MENENGAH ATAS KEAGAMAAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1387	85321	PENDIDIKAN MENENGAH KEJURUAN UMUM PEMERINTAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1388	85322	PENDIDIKAN MENENGAH KEJURUAN UMUM SWASTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1389	85323	PENDIDIKAN MENENGAH KEJURUAN KEAGAMAAN ISLAM Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1390	85324	PENDIDIKAN MENENGAH KEJURUAN KEAGAMAAN PROTESTAN,	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1391	85330	PENDIDIKAN PASCAMENENGAH NONTERSIER	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1392	85401	PENDIDIKAN TINGGI UMUM PEMERINTAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1393	85402	PENDIDIKAN TINGGI UMUM SWASTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1394	85403	PENDIDIKAN TINGGI KEAGAMAAN PEMERINTAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1395	85404	PENDIDIKAN TINGGI KEAGAMAAN SWASTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1396	85510	PENDIDIKAN OLAHRAGA DAN REKREASI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1397	85520	PENDIDIKAN KEBUDAYAAN 8552 PENDIDIKAN KEBUDAYAAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1398	85530	KEGIATAN SEKOLAH MENGEMUDI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1399	85541	PENDIDIKAN PESANTREN LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1400	85542	PENDIDIKAN KEAGAMAAN ISLAM NONFORMAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1401	85549	PENDIDIKAN KEAGAMAAN LAINNYA YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1402	85550	PENDIDIKAN LAINNYA PEMERINTAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1403	85560	PELATIHAN KERJA PEMERINTAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1404	85571	PELATIHAN KERJA TEKNIK SWASTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1405	85572	PELATIHAN KERJA TEKNOLOGI INFORMASI DAN KOMUNIKASI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1406	85573	PELATIHAN KERJA INDUSTRI KREATIF SWASTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1407	85574	PELATIHAN KERJA PARIWISATA DAN PERHOTELAN SWASTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1408	85575	PELATIHAN KERJA BISNIS DAN MANAJEMEN SWASTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1409	85576	PELATIHAN KERJA PEKERJAAN DOMESTIK SWASTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1410	85577	PELATIHAN KERJA PERTANIAN DAN PERIKANAN SWASTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1411	85578	PENDIDIKAN DAN PELATIHAN PERSONEL PENERBANGAN Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1412	85579	PELATIHAN KERJA SWASTA LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1413	85581	PELATIHAN KERJA TEKNIK PERUSAHAAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1414	85582	PELATIHAN KERJA TEKNOLOGI INFORMASI DAN KOMUNIKASI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1415	85583	PELATIHAN KERJA INDUSTRI KREATIF PERUSAHAAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1416	85584	PELATIHAN KERJA PARIWISATA DAN PERHOTELAN PERUSAHAAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1417	85585	PELATIHAN KERJA BISNIS DAN MANAJEMEN PERUSAHAAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1418	85586	PELATIHAN KERJA PEKERJAAN DOMESTIK PERUSAHAAN Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1419	85587	PELATIHAN KERJA PERTANIAN DAN PERIKANAN PERUSAHAAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1420	85589	PELATIHAN KERJA PERUSAHAAN LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1421	85591	PENDIDIKAN MANAJEMEN DAN PERBANKAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1422	85592	PENDIDIKAN KOMPUTER (TEKNOLOGI INFORMASI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1423	85593	PENDIDIKAN BAHASA SWASTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1424	85594	PENDIDIKAN KESEHATAN SWASTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1425	85595	PENDIDIKAN BIMBINGAN BELAJAR DAN KONSELING SWASTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1426	85596	PENDIDIKAN TEKNIK SWASTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1427	85597	PENDIDIKAN KERAJINAN DAN INDUSTRI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1428	85599	PENDIDIKAN LAINNYA SWASTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1429	85610	JASA PERANTARA KURSUS DAN TUTOR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1430	85691	AKTIVITAS SERTIFIKASI PROFESI HASIL PENDIDIKAN DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1431	85692	AKTIVITAS SERTIFIKASI PROFESI HASIL PENDIDIKAN DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1432	85693	AKTIVITAS SERTIFIKASI PROFESI OLEH ASOSIASI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1433	85694	AKTIVITAS SERTIFIKASI PROFESI INDEPENDEN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1434	85699	KEGIATAN PENUNJANG PENDIDIKAN LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1435	86101	AKTIVITAS RUMAH SAKIT PEMERINTAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1436	86102	AKTIVITAS PUSKESMAS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1437	86103	AKTIVITAS RUMAH SAKIT SWASTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1438	86104	AKTIVITAS KLINIK PEMERINTAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1439	86105	AKTIVITAS KLINIK SWASTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1440	86109	AKTIVITAS RUMAH SAKIT LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1441	86201	AKTIVITAS PRAKTIK DOKTER	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1442	86202	AKTIVITAS PRAKTIK DOKTER SPESIALIS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1443	86203	AKTIVITAS PRAKTIK DOKTER GIGI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1444	86910	AKTIVITAS JASA INTERMEDIASI UNTUK KESEHATAN MEDIS,	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1445	86991	AKTIVITAS PELAYANAN KESEHATAN YANG DILAKUKAN OLEH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1446	86992	AKTIVITAS PELAYANAN KESEHATAN TRADISIONAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1447	86993	AKTIVITAS PELAYANAN PENUNJANG KESEHATAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1448	86994	AKTIVITAS ANGKUTAN KHUSUS PENGANGKUTAN ORANG SAKIT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1449	86995	AKTIVITAS RUMAH PIJAT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1450	87101	AKTIVITAS PERAWATAN DAN PEMULIHAN KESEHATAN BERBASIS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1451	87102	AKTIVITAS PERAWATAN DAN PEMULIHAN KESEHATAN BERBASIS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1452	87201	AKTIVITAS PERAWATANUNTUK ORANG YANG HIDUP DENGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1453	87202	AKTIVITAS PERAWATAN UNTUK ORANG YANG HIDUP DENGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1454	87301	AKTIVITAS PERAWATAN UNTUK LANJUT USIA ATAU PENYANDANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1455	87302	AKTIVITAS SOSIAL UNTUK LANJUT USIA ATAU PENYANDANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1456	87303	AKTIVITAS PENGELOLAAN AKOMODASI WARGA LANJUT USIA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1457	87910	JASA INTERMEDIASI UNTUK AKTIVITAS PERAWATAN BERBASIS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1458	87991	AKTIVITAS LEMBAGA KESEJAHTERAAN SOSIAL ANAK BERBASIS	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1459	87992	AKTIVITAS PERAWATANUNTUK ANAK YANG BERHADAPAN DENGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1460	87993	AKTIVITAS TUNASOSIAL BERBASIS RESIDENSIAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1461	88101	AKTIVITAS SOSIAL PEMERINTAH TANPA AKOMODASI UNTUK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1462	88102	AKTIVITAS SOSIAL LEMBAGA KESEJAHTERAAN SOSIAL TANPA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1463	88901	AKTIVITAS SOSIAL PEMERINTAH TANPA AKOMODASI LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1464	88902	AKTIVITAS SOSIAL LEMBAGA KESEJAHTERAAN SOSIAL TANPA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1465	88903	AKTIVITAS SOSIAL PENGUMPULAN DANA KEISLAMAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1466	88904	AKTIVITAS SOSIAL PENGUMPULAN DANA NONISLAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1467	88905	AKTIVITAS SOSIAL PENGUMPULAN DANA LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1468	88906	PENDIDIKAN KELOMPOK BERMAIN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1469	88907	PENDIDIKAN TAMAN PENITIPAN ANAK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1470	90111	AKTIVITAS PENCIPTAAN KARYA SASTRA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1471	90112	AKTIVITAS PENCIPTAAN KOMPOSISI MUSIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1472	90113	AKTIVITAS JURNALIS BERITA INDEPENDEN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1473	90120	AKTIVITAS PENCIPTAAN KARYA SENI RUPA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1474	90130	AKTIVITAS PENCIPTAAN KARYA SENI LAINNYA Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1475	90200	AKTIVITAS SENI PERTUNJUKAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1476	90310	AKTIVITAS OPERASIONAL TEMPAT DAN FASILITAS KESENIAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1477	90391	PENYELENGGARAAN KEGIATAN KESENIAN DAN KEBUDAYAAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1478	90399	AKTIVITAS PENUNJANG PENCIPTAAN KARYA SENI DAN SENI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1479	91111	AKTIVITAS PERPUSTAKAAN PEMERINTAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1480	91112	AKTIVITAS PERPUSTAKAAN SWASTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1481	91121	AKTIVITAS KEARSIPAN PEMERINTAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1482	91122	AKTIVITAS KEARSIPAN SWASTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1483	91211	MUSEUM YANG DIKELOLA PEMERINTAH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1484	91212	MUSEUM YANG DIKELOLA SWASTA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1485	91221	AKTIVITAS SITUS BERSEJARAH DAN MONUMEN YANG DIKELOLA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1486	91222	AKTIVITAS SITUS BERSEJARAH DAN MONUMEN YANG DIKELOLA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1487	91300	KONSERVASI, RESTORASI, DAN AKTIVITAS PENUNJANG LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1488	91410	AKTIVITAS TAMAN BOTANI DAN KEBUN BINATANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1489	91421	SUAKA MARGASATWA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1490	91422	TAMAN NASIONAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1491	91423	HUTAN LINDUNG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1492	91424	TAMAN WISATA ALAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1493	91425	TAMAN HUTAN RAYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1494	91426	TAMAN LAUT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1495	91429	AKTIVITAS CAGAR ALAM LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1496	92000	AKTIVITAS PERJUDIAN DAN PERTARUHAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1497	93111	FASILITAS STADION	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1498	93112	FASILITAS SIRKUIT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1499	93113	FASILITAS GELANGGANG/ARENA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1500	93114	FASILITAS LAPANGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1501	93115	FASILITAS OLAHRAGA BELADIRI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1502	93116	FASILITAS PUSAT KEBUGARAN/FITNESS CENTER	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1503	93119	PENGELOLAAN FASILITAS OLAHRAGA LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1504	93121	KLUB SEPAK BOLA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1505	93122	KLUB GOLF	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1506	93123	KLUB RENANG	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1507	93124	KLUB TENIS LAPANGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1508	93125	KLUB TINJU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1509	93126	KLUB BELA DIRI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1510	93127	KLUB KEBUGARAN/FITNESS DAN BINARAGA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1511	93128	KLUB BOLING	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1512	93129	KLUB OLAHRAGA LAINNYA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1513	93191	PENYELENGGARAAN KEGIATAN OLAHRAGA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1514	93192	AKTIVITAS JURI DAN WASIT PROFESIONAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1515	93193	AKTIVITAS PERBURUAN DI KAWASAN BURU	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1516	93194	BADAN REGULASI DAN LIGA OLAHRAGA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1517	93195	AKTIVITAS OLAHRAGA TRADISIONAL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1518	93196	PENGELOLAAN FASILITAS PEMANCINGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1519	93197	AKTIVITAS OLAHARAGAWAN/ATLET INDEPENDEN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1520	93199	AKTIVITAS LAINNYA YANG BERKAITAN DENGAN OLAHRAGA YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1521	93210	AKTIVITAS TAMAN BERTEMA DAN TAMAN HIBURAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1522	93291	AKTIVITAS LANTAI DANSA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1523	93292	PENGELOLAAN FASILITAS KARAOKE	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1524	93293	PENGELOLAAN ARENA PERMAINAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1525	93294	WISATA GUA, PEMANDIAN, DAN PETUALANGAN ALAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1526	93295	WISATA PANTAI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1527	93296	WISATA AGRO	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1528	93297	WISATA TIRTA Kelompok ini mencakup	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1529	93299	AKTIVITAS HIBURAN DAN REKREASI LAINNYA YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1530	94110	AKTIVITAS ORGANISASI BISNIS DAN PENGUSAHA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1531	94121	AKTIVITAS ORGANISASI ILMU PENGETAHUAN SOSIAL DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1532	94122	AKTIVITAS ORGANISASI ILMU PENGETAHUAN ALAM	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1533	94200	AKTIVITAS ORGANISASI BURUH	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1534	94910	AKTIVITAS ORGANISASI KEAGAMAAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1535	94920	AKTIVITAS ORGANISASI POLITIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1536	94990	AKTIVITAS ORGANISASI KEANGGOTAAN LAINNYA YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1537	95101	REPARASI DAN PEMELIHARAAN KOMPUTER DAN PERALATAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1538	95102	REPARASI DAN PEMELIHARAAN PERALATAN KOMUNIKASI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1539	95210	REPARASI DAN PEMELIHARAAN ALAT - ALAT ELEKTRONIK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1540	95220	REPARASI DAN PEMELIHARAAN PERALATAN RUMAH TANGGA DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1541	95230	REPARASI DAN PEMELIHARAAN ALAS KAKI DAN BARANG DARI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1542	95240	REPARASI DAN PEMELIHARAAN FURNITUR DAN PERLENGKAPAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1543	95291	AKTIVITAS VERMAK PAKAIAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1544	95299	REPARASI DAN PEMELIHARAAN BARANG KEPERLUAN PRIBADI DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1545	95311	REPARASI MOBIL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1546	95312	PENCUCIAN DAN SALON MOBIL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1547	95320	REPARASI DAN PERAWATAN SEPEDA MOTOR	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1548	95400	JASA INTERMEDIASI REPARASI DAN PERAWATAN KOMPUTER,	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1549	96100	AKTIVITAS PENCUCIAN DAN PEMBERSIHAN PRODUK TEKSTIL DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1550	96210	AKTIVITAS PENATAAN DAN PANGKAS RAMBUT Kelompok	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1551	96220	AKTIVITAS PERAWATAN KECANTIKAN DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1552	96230	AKTIVITAS SANTE PAR AQUA (SPA) HARIAN, SAUNA, DAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1553	96300	AKTIVITAS PEMAKAMAN DAN KEGIATAN TERKAIT	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1554	96400	AKTIVITAS JASA INTERMEDIASI UNTUK JASA PERORANGAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1555	96900	AKTIVITAS JASA PERORANGAN LAINNYA YTDL	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1556	97000	AKTIVITAS RUMAH TANGGA SEBAGAI PEMBERI KERJA BAGI	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1557	98100	AKTIVITAS PRODUKSI BARANG OLEH RUMAH TANGGA UNTUK	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1558	98200	AKTIVITAS PRODUKSI BERAGAM JASA OLEH RUMAH TANGGA	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1559	99000	AKTIVITAS BADAN INTERNASIONAL DAN BADAN	2026-07-24 15:41:25	2026-07-24 15:41:25	KBLI 2020
1561	10710	INDUSTRI PRODUK ROTI DAN KUE	2026-07-30 03:39:26	2026-07-30 03:39:26	KBLI 2025
1562	10793	INDUSTRI MAKANAN DARI KEDELAI DAN KACANG-KACANGAN (SAMBEL PECEL)	2026-07-30 03:39:26	2026-07-30 03:39:26	KBLI 2025
1563	10794	INDUSTRI KERUPIK, KERIPIK, PEYEK DAN SEJENISNYA	2026-07-30 03:39:26	2026-07-30 03:39:26	KBLI 2025
1564	10613	INDUSTRI TEPUNG DARI PORANG	2026-07-30 03:39:26	2026-07-30 03:39:26	KBLI 2025
1565	11051	PRODUKSI AIR MINUM DALAM KEMASAN (AMDK)	2026-07-30 03:39:26	2026-07-30 03:39:26	KBLI 2025
1566	13134	INDUSTRI BATIK TULIS DAN CAP TRADISIONAL	2026-07-30 03:39:26	2026-07-30 03:39:26	KBLI 2025
1567	14120	PENJAHITAN DAN PEMBUATAN PAKAIAN SESUAI PESANAN (KONVEKSI)	2026-07-30 03:39:26	2026-07-30 03:39:26	KBLI 2025
1568	25920	JASA INDUSTRI UNTUK BERBAGAI PENGERJAAN KHUSUS LOGAM DAN BARANG DARI LOGAM	2026-07-30 03:39:26	2026-07-30 03:39:26	KBLI 2025
1569	28193	INDUSTRI MESIN PENDINGIN & PERALATAN TEKNIK	2026-07-30 03:39:26	2026-07-30 03:39:26	KBLI 2025
1570	30200	INDUSTRI LOKOMOTIF DAN GERBONG KERETA SERTA SUKU CADANGNYA	2026-07-30 03:39:26	2026-07-30 03:39:26	KBLI 2025
1571	33141	REPARASI MOTOR LISTRIK, GENERATOR DAN TRANSFORMATOR	2026-07-30 03:39:26	2026-07-30 03:39:26	KBLI 2025
1572	62019	AKTIVITAS PEMROGRAMAN KOMPUTER & TEKNOLOGI INFORMASI	2026-07-30 03:39:26	2026-07-30 03:39:26	KBLI 2025
1573	62090	AKTIVITAS TEKNOLOGI INFORMASI DAN JASA KOMPUTER LAINNYA	2026-07-30 03:39:26	2026-07-30 03:39:26	KBLI 2025
1574	21022	INDUSTRI PRODUK OBAT TRADISIONAL DAN HERBAL UNTUK MANUSIA	2026-07-30 03:39:26	2026-07-30 03:39:26	KBLI 2025
1575	11090	INDUSTRI MINUMAN LAINNYA & JAMU BOTOLAN	2026-07-30 03:39:26	2026-07-30 03:39:26	KBLI 2025
1576	18111	PERCETAKAN UMUM DAN KEMASAN KERTAS	2026-07-30 03:39:26	2026-07-30 03:39:26	KBLI 2025
1577	16292	INDUSTRI KERAJINAN BARANG DARI KAYU, BAMBU, GONI DAN ANYAMAN	2026-07-30 03:39:26	2026-07-30 03:39:26	KBLI 2025
1578	10750	INDUSTRI MAKANAN DAN MASAKAN OLAHAN SIAP SAJI	2026-07-30 03:39:26	2026-07-30 03:39:26	KBLI 2025
1579	20292	INDUSTRI BAHAN PELEDAK DAN KEMBANG API	2026-07-30 03:39:26	2026-07-30 03:39:26	KBLI 2025
1580	14111	INDUSTRI PAKAIAN JADI (KONFEKSI) DARI TEKSTIL	2026-07-30 03:39:26	2026-07-30 03:39:26	KBLI 2025
\.


--
-- Data for Name: konsultasi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.konsultasi (id, nama_ikm, jenis_usaha, keluhan, created_at, updated_at, email, jawaban, status, nik, sumber) FROM stdin;
1	bagfas.ikmjuara@gmail.com	Kritik & Saran	Bagus	2026-07-24 02:02:01	2026-07-24 02:05:36	bagfas.ikmjuara@gmail.com	Baik Terima kasih	Sudah Dijawab	\N	Umum
2	CInta Sejati Makmur	Strategi Pemasaran Digital	Bagaimana cara agar pemasaran lebih optimal	2026-07-24 16:12:10	2026-07-24 16:27:45	bagfas.ikmjuara@gmail.com	sama sama ka	Sudah Dijawab	\N	Umum
3	Test IKM	Pendampingan Manajemen	Ini keluhan	2026-07-24 16:48:49	2026-07-24 16:52:45	test@example.com	ok	Sudah Dijawab	1234567890123456	IKM Juara
4	NASI KOTAK	Pendampingan Manajemen	Selamat pagi, saya ingin mendaftarkan usaha keripik tempe saya untuk mengikuti program pembinaan tahun ini. Bagaimana prosedur pendaftarannya?	2026-07-24 16:51:45	2026-07-24 16:56:30	lilikwahyuningsih105@gmail.com	"Selamat pagi, Bapak/Ibu. Untuk pendaftaran pelatihan, sekarang sudah terintegrasi secara digital. Bapak/Ibu bisa langsung mendaftar melalui portal web IKM JUARA. Cukup buat akun, lengkapi profil usaha termasuk melampirkan Nomor Induk Berusaha (NIB), lalu pilih menu 'Jadwal Pelatihan' untuk mendaftar di kelas yang tersedia.	Belum Dijawab	3573010000000105	IKM Juara
5	GUDEG, AYAM BAKAR	Pendampingan Manajemen	Selamat Pagi	2026-07-28 04:21:14	2026-07-28 04:59:14	harrykusumahendriyanto104@gmail.com	untuk itu diwajibkan membawa ktp dan etiket merek ke kantor	Selesai	3573010000000104	IKM Juara
6	Bengkel Las Jaya	Pendampingan Manajemen Usaha	Selamat malam, mohon informasi pendampingan sertifikasi halal	2026-07-29 16:00:56	2026-07-29 16:04:03	08123456789	iya	Sudah Dijawab	3573336890980650	IKM Juara
7	Konveksi Baju Ceria	Pendampingan Manajemen Usaha	Selamat malam	2026-07-29 16:02:59	2026-07-29 16:06:05	81234567894@ikmjuara.com	Jl. bolodewo no 8 ka	Selesai	3573275259659190	IKM Juara
8	buidaaditya@gmail.com	Kritik & Saran	test	2026-07-30 08:15:28	2026-07-30 08:15:44	buidaaditya@gmail.com	iya	Sudah Dijawab	\N	Umum
10	buidaaditya@gmail.com	Kritik & Saran	saya ingin tanya soal pengurusan merek? bagaimana ya?	2026-07-30 15:46:44	2026-07-30 16:00:56	buidaaditya@gmail.com	bisa datang ke kantor untuk lebih lanjut	Selesai	\N	Umum
11	yanuara16@gmail.com	Kritik & Saran	cara daftar pelatihan bagaimana?	2026-07-30 15:50:12	2026-07-30 16:01:02	yanuara16@gmail.com	\N	Selesai	\N	Umum
12	yanuara16@gmail.com	Kritik & Saran	bagaimana cara saya bisa ikut pelatihan	2026-07-30 15:54:35	2026-07-30 16:01:09	yanuara16@gmail.com	\N	Selesai	\N	Umum
13	buidaaditya@gmail.com	Kritik & Saran	dimana alamat disnakerkukm kota madiun?	2026-07-30 16:00:11	2026-07-30 16:01:20	buidaaditya@gmail.com	\N	Selesai	\N	Umum
\.


--
-- Data for Name: konsultasi_pesan; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.konsultasi_pesan (id, konsultasi_id, sender, pesan, created_at, updated_at) FROM stdin;
1	2	admin	baik bisa melalui website dna juga sosmed ya	2026-07-24 16:24:18	2026-07-24 16:24:18
2	2	user	sosmed apa saja ka yang mudah digunakan	2026-07-24 16:24:53	2026-07-24 16:24:53
3	2	admin	seperti halnya instagram, facebook, dan Tik tok sangat mudah digunakan	2026-07-24 16:25:58	2026-07-24 16:25:58
4	2	admin	dan perlu dipelajari terkait AI ya ka	2026-07-24 16:26:18	2026-07-24 16:26:18
5	2	user	baik ka. terima kasih sarannya	2026-07-24 16:26:54	2026-07-24 16:26:54
6	2	admin	sama sama ka	2026-07-24 16:27:45	2026-07-24 16:27:45
7	3	user	Ini balasan saya	2026-07-24 16:48:59	2026-07-24 16:48:59
8	4	admin	"Selamat pagi, Bapak/Ibu. Untuk pendaftaran pelatihan, sekarang sudah terintegrasi secara digital. Bapak/Ibu bisa langsung mendaftar melalui portal web IKM JUARA. Cukup buat akun, lengkapi profil usaha termasuk melampirkan Nomor Induk Berusaha (NIB), lalu pilih menu 'Jadwal Pelatihan' untuk mendaftar di kelas yang tersedia.	2026-07-24 16:52:22	2026-07-24 16:52:22
9	3	admin	ok	2026-07-24 16:52:45	2026-07-24 16:52:45
10	4	user	baik	2026-07-24 16:56:30	2026-07-24 16:56:30
11	5	admin	Selamat pagi juga	2026-07-28 04:26:52	2026-07-28 04:26:52
12	5	admin	ada yang bisa dibantu?	2026-07-28 04:30:49	2026-07-28 04:30:49
13	5	user	bagaimana cara untuk memperoleh surat rekomendasi merek ?	2026-07-28 04:31:27	2026-07-28 04:31:27
14	5	admin	untuk itu diwajibkan membawa ktp dan etiket merek ke kantor	2026-07-28 04:32:06	2026-07-28 04:32:06
15	5	admin	Sesi konsultasi ini telah diakhiri oleh Admin Dinas.	2026-07-28 04:59:14	2026-07-28 04:59:14
16	7	admin	Selamat malam juga	2026-07-29 16:03:45	2026-07-29 16:03:45
17	6	admin	iya	2026-07-29 16:04:03	2026-07-29 16:04:03
18	7	user	dimana letak disnakerkukm kota madiun	2026-07-29 16:05:02	2026-07-29 16:05:02
19	7	admin	Jl. bolodewo no 8 ka	2026-07-29 16:05:29	2026-07-29 16:05:29
20	7	admin	Sesi konsultasi ini telah diakhiri oleh Admin Dinas.	2026-07-29 16:06:05	2026-07-29 16:06:05
21	8	admin	iya	2026-07-30 08:15:44	2026-07-30 08:15:44
22	10	admin	bisa datang ke kantor untuk lebih lanjut	2026-07-30 16:00:50	2026-07-30 16:00:50
23	10	admin	Sesi konsultasi ini telah diakhiri oleh Admin Dinas.	2026-07-30 16:00:56	2026-07-30 16:00:56
24	11	admin	Sesi konsultasi ini telah diakhiri oleh Admin Dinas.	2026-07-30 16:01:02	2026-07-30 16:01:02
25	12	admin	Sesi konsultasi ini telah diakhiri oleh Admin Dinas.	2026-07-30 16:01:09	2026-07-30 16:01:09
26	13	admin	Sesi konsultasi ini telah diakhiri oleh Admin Dinas.	2026-07-30 16:01:20	2026-07-30 16:01:20
\.


--
-- Data for Name: kuesioner_evaluasi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.kuesioner_evaluasi (id, penyelenggara, lokasi, tanggal, nama_ikm, jawaban_bagian_a, jawaban_bagian_b, jawaban_bagian_c, jawaban_bagian_d, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: list_kegiatan; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.list_kegiatan (id, nama_kegiatan, sub_pelaksana, tgl_mulai, tgl_selesai, tempat_kegiatan, kuota_peserta, deskripsi_kegiatan, status, created_at, updated_at, is_active) FROM stdin;
1	Pelatihan Merek HKI	Peran Serta Masyarakat	\N	\N	Kantor Dinas Tenaga Kerja, KUKM	25	Pelatihan merek HKI meningkatkan pemahaman perlindungan hukum, branding, strategi bisnis, serta mendorong pelaku usaha mendaftarkan merek secara resmi dan berkelanjutan	aktif	\N	\N	f
2	Pelatihan Sistem Informasi Industri Nasional (SIINas)	Pengelolaan Data Industri	2026-03-30	2026-03-24	Kantor Dinas Tenaga Kerja, KUKM	20	Pelatihan SIINas meningkatkan kemampuan pelaporan industri, validasi data, kepatuhan regulasi, serta mendukung integrasi sistem informasi industri nasional secara efektif berkelanjutan	aktif	\N	\N	f
3	Pelatihan Digital Marketing untuk IKM	Sumber Daya Industri	\N	\N	Resto Ayam Goreng Pemuda	20	Meningkatkan kemampuan pemasaran online melalui media sosial, marketplace, dan strategi konten untuk memperluas jangkauan pasar.	aktif	\N	\N	f
4	Pelatihan Standarisasi Produk dan Sertifikasi Halal	Prasarana Industri	\N	\N	Resto Buli Buli Kota Madiun - Jl. Soetomo 68, Kartoharjo, Kota Madiun	5	Membekali pelaku usaha dengan pengetahuan standar produk dan proses pengajuan sertifikasi halal.	aktif	\N	\N	f
5	Pelatihan Produksi Efisien dan Manajemen Operasional	Peran Serta Masyarakat	\N	\N	Gedung Diklat - Jl. Duku No 9, Kejuron, Kota Madiun	15	Membantu pelaku usaha meningkatkan efisiensi produksi dan pengelolaan operasional untuk menekan biaya.	aktif	\N	\N	f
7	Pelatihan Halal Self Declare	Peran Serta Masyarakat	2026-08-10	2026-08-12	Ayostart Coworking Space	20	Untuk Pendaftaran Halal SelfDeclare bagi pelaku usaha roti	aktif	\N	\N	f
8	Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare	3.31.02.2.01.0005 - Koordinasi, Sinkronisasi, dan Pelaksanaan Pemberdayaan Industri dan Peran Serta Masyarakat	\N	\N	Ayostart Coworkingspace - Jl. Cokroaminoto No. 88, Kota Madiun	20	Program 2-in-1 ini mengintegrasikan pelatihan produk olahan dengan fasilitas sertifikasi halal secara gratis dan tanpa dipungut biaya. \n\nPeserta yang lolos seleksi akan dihubungi langsung oleh panitia serta diumumkan melalui media sosial resmi dinas.	aktif	\N	\N	f
9	Pelatihan Olahan Keripik - Fasilitasi Sertifikasi Halal Self Declare	3.31.02.2.01.0005 - Koordinasi, Sinkronisasi, dan Pelaksanaan Pemberdayaan Industri dan Peran Serta Masyaraka	\N	\N	Ayostart Coworkingspace - Jl. Cokroaminoto No. 88, Kota Madiun	20	Program 2-in-1 ini mengintegrasikan pelatihan produk olahan dengan fasilitas sertifikasi halal secara gratis dan tanpa dipungut biaya.\n\nPeserta yang lolos seleksi akan dihubungi langsung oleh panitia serta diumumkan melalui media sosial resmi dinas.	aktif	\N	\N	t
10	Pelatihan Olahan Makanan Beku - Fasilitasi Sertifikasi Halal Self Declare	3.31.02.2.01.0005 - Koordinasi, Sinkronisasi, dan Pelaksanaan Pemberdayaan Industri dan Peran Serta Masyarakat	\N	\N	Ayostart Coworkingspace - Jl. Cokroaminoto No. 88, Kota Madiun	20	Program 2-in-1 ini mengintegrasikan pelatihan produk olahan dengan fasilitas sertifikasi halal secara gratis dan tanpa dipungut biaya.\n\nPeserta yang lolos seleksi akan dihubungi langsung oleh panitia serta diumumkan melalui media sosial resmi dinas.	aktif	\N	\N	t
11	Pelatihan Olahan Sambal - Fasilitasi Sertifikasi Halal Self Declare	3.31.02.2.01.0005 - Koordinasi, Sinkronisasi, dan Pelaksanaan Pemberdayaan Industri dan Peran Serta Masyarakat	\N	\N	Ayostart Coworkingspace - Jl. Cokroaminoto No. 88, Kota Madiun	20	Program 2-in-1 ini mengintegrasikan pelatihan produk olahan dengan fasilitas sertifikasi halal secara gratis dan tanpa dipungut biaya.\n\nPeserta yang lolos seleksi akan dihubungi langsung oleh panitia serta diumumkan melalui media sosial resmi dinas.	aktif	\N	\N	t
12	Pelatihan Minuman Instan dan Sirup - Fasilitasi Sertifikasi Halal Self Declare	3.31.02.2.01.0005 - Koordinasi, Sinkronisasi, dan Pelaksanaan Pemberdayaan Industri dan Peran Serta Masyarakat	\N	\N	Ayostart Coworkingspace - Jl. Cokroaminoto No. 88, Kota Madiun	20	Program 2-in-1 ini mengintegrasikan pelatihan produk olahan dengan fasilitas sertifikasi halal secara gratis dan tanpa dipungut biaya.\n\nPeserta yang lolos seleksi akan dihubungi langsung oleh panitia serta diumumkan melalui media sosial resmi dinas.	aktif	\N	\N	t
13	Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut	3.31.02.2.01.0005 - Koordinasi, Sinkronisasi, dan Pelaksanaan Pemberdayaan Industri dan Peran Serta Masyarakat	\N	\N	Kantor Dinas Tenaga Kerja, KUKM - Jl. Bolodewo No. 8, Kartoharjo, Kota Madiun	15	Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut oleh DISNAKER KUKM Kota Madiun! Pelatihan ini dirancang khusus untuk Anda yang ingin mengembangkan kompetensi dan usaha kopi. Anda akan belajar strategi bisnis, teknik seduh profesional, latte art, hingga standarisasi kualitas kopi dengan praktik langsung bersama ahlinya.	aktif	\N	\N	f
14	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	3.31.02.2.01.0005 - Koordinasi, Sinkronisasi, dan Pelaksanaan Pemberdayaan Industri dan Peran Serta Masyarakat	\N	\N	Kantor Dinas Tenaga Kerja, KUKM - Jl. Bolodewo No. 8, Kartoharjo, Kota Madiun	30	Program dari DISNAKER KUKM Kota Madiun ini diselenggarakan khusus bagi para pengrajin batik di Kota Madiun. Melalui pelatihan ini, mari kita tingkatkan keterampilan, inovasi desain, dan daya saing produk batik lokal, sekaligus melestarikan warisan budaya bangsa.	aktif	\N	\N	f
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
4	2026_03_18_000000_create_publikasi_table	1
5	2026_03_18_000001_create_statistik_kecamatan_table	1
6	2026_03_19_051204_create_konsultasi_table	1
7	2026_03_20_014513_create_pelaku_usahas_table	1
8	2026_03_20_022949_update_pelaku_usaha_table	1
9	2026_03_20_040405_add_investasi_to_pelaku_usaha_table	1
10	2026_03_22_065232_add_indexes_to_pelaku_usaha	1
11	2026_03_22_093832_add_foto_ktp_to_pelaku_usaha	1
12	2026_03_22_103002_create_registrasi_pelatihans_table	1
13	2026_03_23_191715_create_list_kegiatan_table	1
14	2026_03_23_191835_add_soft_deletes_to_registrasi_pelatihan	1
15	2026_03_29_094648_add_status_to_list_kegiatan_table	1
16	2026_03_29_105034_add_active_status_to_publikasi_table	1
17	2026_03_30_215111_add_role_to_users_table	1
18	2026_03_30_215112_add_admin_columns_to_pelaku_usaha_table	1
19	2026_03_30_215113_add_site_stats_to_statistik_kecamatan_table	1
20	2026_03_30_215114_add_legalities_and_status_to_pelaku_usaha_table	1
21	2026_07_24_085746_add_reply_fields_to_konsultasi_table	1
22	2026_07_24_091816_add_visitor_and_social_fields_to_statistik_kecamatan	1
23	2026_07_24_092842_add_contact_fields_to_statistik_kecamatan	1
24	2026_07_24_120620_create_usulan_perubahan_table	1
25	2026_07_24_122027_add_missing_fields_to_usulan_perubahan_table	1
26	2026_07_24_220143_make_legacy_fields_nullable_in_pelaku_usaha_table	1
27	2026_07_24_221504_add_tipe_usulan_to_usulan_perubahan_table	1
28	2026_07_24_224035_create_kbli_table	1
29	2026_07_24_232001_create_konsultasi_pesan_table	1
30	2026_07_24_234241_add_nik_and_sumber_to_konsultasi_table	1
31	2026_07_27_215756_alter_role_column_in_users_table	1
32	2026_07_27_221404_create_peta_sebaran_table	1
33	2026_07_27_224602_upgrade_peta_sebaran_table_fields	1
34	2026_07_27_225408_add_tingkat_risiko_and_clean_kategori_in_peta_sebaran	1
35	2026_07_28_073851_normalize_kelurahan_names_in_peta_sebaran	1
36	2026_07_28_134000_add_kbli_investasi_tenaga_kerja_to_peta_sebaran	1
37	2026_07_29_183000_add_legalitas_fields_to_peta_sebaran	1
38	2026_07_29_184000_add_link_gdrive_to_peta_sebaran	1
39	2026_07_29_185000_add_individual_gdrive_links_to_peta_sebaran	1
40	2026_07_29_191000_add_tgl_berakhir_hki_to_peta_sebaran	1
41	2026_07_29_201000_add_is_legalitas_tracked_to_peta_sebaran	1
42	2026_07_29_204500_create_tna_digitals_table	1
43	2026_07_29_230000_create_kategori_konsultasis_table	1
44	2026_07_29_234500_create_tna_pertanyaans_table	1
45	2026_07_30_110000_create_siinas_industries_table	1
46	2026_07_30_120000_add_tkdn_fields_to_peta_sebaran_table	1
47	2026_07_30_120000_add_versi_to_kbli_table	1
48	2026_07_30_130000_drop_unique_kbli_kode	1
49	2026_07_30_213000_add_produk_and_foto_produk_to_registrasi_pelatihan_table	1
50	2026_07_30_233000_create_permohonan_hki_merek_table	1
51	2026_07_31_170000_add_latitude_longitude_to_usulan_perubahan_table	1
52	2026_07_31_180000_add_is_lolos_to_registrasi_pelatihan_table	1
53	2026_08_13_200000_add_database_hki_halal_fields_to_peta_sebaran	1
54	2026_08_13_210000_create_database_hki_mereks_table	1
55	2026_08_13_210001_create_database_halals_table	1
56	2026_08_24_201200_change_tanggal_lahir_to_date_in_registrasi_pelatihan_table	1
57	2026_08_24_215000_add_wa_fields_to_statistik_kecamatan	1
58	2026_09_15_220000_create_kuesioner_evaluasi_table	1
59	2026_09_15_230000_create_form_app_tables	1
60	2026_09_16_220000_add_date_range_and_participants_to_form_app_tables	1
61	2026_10_20_200000_add_uraian_and_link_gdrive_to_permohonan_hki_merek	2
62	2026_11_22_210500_add_kunjungan_tahun_lalu_to_statistik_kecamatan	3
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: pelaku_usaha; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pelaku_usaha (id, nib, nik, skala_usaha, jenis_perusahaan, nama_perusahaan, nama_proyek, nama_pemilik, alamat_usaha, kecamatan, kelurahan, kbli, uraian_kbli, tingkat_risiko, investasi, tenaga_kerja, no_telp, email, tgl_terbit, nama_usaha, pemilik, alamat, latitude, longitude, kategori, status, sertifikat_halal, bpom, cppob, sni, created_at, updated_at, foto_ktp) FROM stdin;
1	9120000000001	3573010000000001	Mikro	Perseorangan	Lapak UMKM Kartini	Lapak UMKM Kartini	Budi	Jl. Kartini 55, Madiun	Manguharjo	Madiun Lor	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	10000000	3	081234567001	budi1@gmail.com	2026-01-02	Lapak UMKM Kartini	Budi	Jl. Kartini 55, Madiun	\N	\N	Kuliner	Aktif	ID35110000000001	\N	CP3500001	\N	2026-03-31 03:00:33	\N	\N
4	9120000000004	3573010000000004	Mikro	Perseorangan	Kentang - Krezznya Madiun	Kentang - Krezznya Madiun	Yanuar	Jl. Oro Oro Ombo No 8, Kota Madiun, Jawa Timur, Jawa, 63117, Indonesia	Kartoharjo	Oro Oro Ombo	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	25000000	3	081234567004	yanuar4@gmail.com	2026-01-05	Kentang - Krezznya Madiun	Yanuar	Jl. Oro Oro Ombo No 8, Kota Madiun, Jawa Timur, Jawa, 63117, Indonesia	\N	\N	Kuliner	Aktif	ID35110000000004	\N	CP3500004	\N	2026-04-01 15:02:34	2026-07-23 06:40:57	\N
8	9120000000008	3573010000000008	Mikro	Perseorangan	RUJAK BUAH MARIYADI	RUJAK BUAH MARIYADI	Yanuar	Jl. Rimba Darma 87	Kartoharjo	Oro Oro Ombo	14111	Industri Pakaian Jadi Konveksi (Fashion)	Rendah	20000000	4	081234567008	yanuar8@gmail.com	2026-01-09	RUJAK BUAH MARIYADI	Yanuar	Jl. Rimba Darma 87	\N	\N	Fashion	Aktif	ID35110000000008	\N	\N	SNI-01-0008	2026-04-01 15:26:32	2026-07-23 06:40:43	\N
9	9120000000009	3573010000000009	Mikro	Perseorangan	Rido Aluna	Rido Aluna	AR LUNIA	Jl. Panglima Sudirman NO 66	Taman	Kejuron	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	25000000	2	081234567009	arlunia9@gmail.com	2026-01-10	Rido Aluna	AR LUNIA	Jl. Panglima Sudirman NO 66	\N	\N	Kuliner	Aktif	ID35110000000009	TR2600009	\N	\N	2026-04-02 14:05:06	\N	\N
10	9120000000010	3573010000000010	Mikro	Perseorangan	Pisang Coklat	Pisang Coklat	Agus Budiono	Kejuron, Kota Madiun, Jawa Timur, Jawa, 63139, Indonesia	Taman	Kejuron	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	5000000	3	081234567010	agusbudiono10@gmail.com	2026-01-11	Pisang Coklat	Agus Budiono	Kejuron, Kota Madiun, Jawa Timur, Jawa, 63139, Indonesia	\N	\N	Kuliner	Aktif	ID35110000000010	\N	CP3500010	\N	2026-04-03 02:46:42	\N	\N
12	9120000000012	3573010000000012	Mikro	Perseorangan	Rido Aluna	Rido Aluna	AR LUNIA	Jl. Panglima Sudirman NO 66	Taman	Kejuron	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	15000000	2	081234567012	arlunia12@gmail.com	2026-01-13	Rido Aluna	AR LUNIA	Jl. Panglima Sudirman NO 66	\N	\N	Kuliner	Aktif	\N	TR2600012	\N	\N	2026-04-03 03:57:42	\N	\N
13	9120000000013	3573010000000013	Mikro	Perseorangan	WAFFLE KERING	WAFFLE KERING	HARI FITRI	JL. COKROAMINOTO GG. RINGIN 8	Taman	KEJURON	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	20000000	3	081234567013	harifitri13@gmail.com	2026-01-14	WAFFLE KERING	HARI FITRI	JL. COKROAMINOTO GG. RINGIN 8	\N	\N	Kuliner	Aktif	ID35110000000013	\N	CP3500013	\N	2026-04-03 04:09:24	\N	\N
14	9120000000014	3573010000000014	Mikro	Perseorangan	ANEKA KUE BASAH | \nANEKA KUE KERING | \nCATERING | \nRISOL FROZEN	ANEKA KUE BASAH | \nANEKA KUE KERING | \nCATERING | \nRISOL FROZEN	SITI NURUL RAHAYUWATI	PERUM GRIYA KITA BLOK B-8	Manguharjo	WINONGO	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	25000000	4	081234567014	sitinurulrahayuwati14@gmail.com	2026-01-15	ANEKA KUE BASAH | \nANEKA KUE KERING | \nCATERING | \nRISOL FROZEN	SITI NURUL RAHAYUWATI	PERUM GRIYA KITA BLOK B-8	\N	\N	Kuliner	Aktif	ID35110000000014	\N	\N	SNI-01-0014	2026-04-03 04:09:24	\N	\N
15	9120000000015	3573010000000015	Mikro	Perseorangan	UNTIR-UNTIR | \nKUPING GAJAH | \nCUMI-CUMI  | \nSTIK KEJU | \nSTIK SELEDRI | \nKERING KENTANG	UNTIR-UNTIR | \nKUPING GAJAH | \nCUMI-CUMI  | \nSTIK KEJU | \nSTIK SELEDRI | \nKERING KENTANG	SUMARNI	JL. SRIGADING 12 A	Kartoharjo	ORO-ORO OMBO	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	5000000	2	081234567015	sumarni15@gmail.com	2026-01-16	UNTIR-UNTIR | \nKUPING GAJAH | \nCUMI-CUMI  | \nSTIK KEJU | \nSTIK SELEDRI | \nKERING KENTANG	SUMARNI	JL. SRIGADING 12 A	\N	\N	Kuliner	Aktif	ID35110000000015	TR2600015	\N	\N	2026-04-03 04:09:24	\N	\N
16	9120000000016	3573010000000016	Mikro	Perseorangan	KEBAB	KEBAB	ARRI WIDYA DAMAYANTI	JALAN ANEKA SARI NO 10 REJOMULYO MADIUN	Kartoharjo	REJOMULYO	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	10000000	3	081234567016	arriwidyadamayanti16@gmail.com	2026-01-17	KEBAB	ARRI WIDYA DAMAYANTI	JALAN ANEKA SARI NO 10 REJOMULYO MADIUN	\N	\N	Kuliner	Aktif	ID35110000000016	\N	CP3500016	\N	2026-04-03 04:09:24	\N	\N
17	9120000000017	3573010000000017	Mikro	Perseorangan	MAKARONI	MAKARONI	DIMAS SETIAWAN	JL PANGLIMA SUDIRMAN GG JAMBE 14	Taman	KEJURON	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	15000000	4	081234567017	dimassetiawan17@gmail.com	2026-01-18	MAKARONI	DIMAS SETIAWAN	JL PANGLIMA SUDIRMAN GG JAMBE 14	\N	\N	Kuliner	Aktif	ID35110000000017	\N	\N	SNI-01-0017	2026-04-03 04:09:24	\N	\N
18	9120000000018	3573010000000018	Mikro	Perseorangan	CAMILAN DAN MAKANAN	CAMILAN DAN MAKANAN	RETNO INDARTI	JL CATUR JAYA SIDOMULYO 1 NO.35	Kartoharjo	KANIGORO	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	20000000	2	081234567018	retnoindarti18@gmail.com	2026-01-19	CAMILAN DAN MAKANAN	RETNO INDARTI	JL CATUR JAYA SIDOMULYO 1 NO.35	\N	\N	Kuliner	Aktif	\N	TR2600018	\N	\N	2026-04-03 04:09:24	\N	\N
19	9120000000019	3573010000000019	Mikro	Perseorangan	SULAM BORDIR | \nSAMBEL PECEL	SULAM BORDIR | \nSAMBEL PECEL	ASTUTIK	JL. KIAGENG PEMANAHAN L.269/19 RT.029 RW.007 KEL. KANIGORO	Kartoharjo	KANIGORO	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	25000000	3	081234567019	astutik19@gmail.com	2026-01-20	SULAM BORDIR | \nSAMBEL PECEL	ASTUTIK	JL. KIAGENG PEMANAHAN L.269/19 RT.029 RW.007 KEL. KANIGORO	\N	\N	Kuliner	Aktif	ID35110000000019	\N	CP3500019	\N	2026-04-03 04:09:24	\N	\N
20	9120000000020	3573010000000020	Mikro	Perseorangan	SAMBEL PECEL	SAMBEL PECEL	RATNAWATI AL HASAN	JLN TAMAN ASRI NO 4 MADIUN	Taman	BANJAREJO	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	5000000	4	081234567020	ratnawatialhasan20@gmail.com	2026-01-21	SAMBEL PECEL	RATNAWATI AL HASAN	JLN TAMAN ASRI NO 4 MADIUN	\N	\N	Kuliner	Aktif	ID35110000000020	\N	\N	SNI-01-0020	2026-04-03 04:09:24	\N	\N
21	9120000000021	3573010000000021	Mikro	Perseorangan	MINUMAN JAMU | \nKOPI REMPAH	MINUMAN JAMU | \nKOPI REMPAH	SUMARNI	JL. SRI GADIS GG. MELATI NO. 8 F	Kartoharjo	KANIGORO	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	10000000	2	081234567021	sumarni21@gmail.com	2026-01-22	MINUMAN JAMU | \nKOPI REMPAH	SUMARNI	JL. SRI GADIS GG. MELATI NO. 8 F	\N	\N	Kuliner	Aktif	ID35110000000021	TR2600021	\N	\N	2026-04-03 04:09:24	\N	\N
22	9120000000022	3573010000000022	Mikro	Perseorangan	SAMBEL PECEL	SAMBEL PECEL	HERUWATI	JLN BOROBUDUR NO 4-G	Manguharjo	MADIUN LOR	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	15000000	3	081234567022	heruwati22@gmail.com	2026-01-23	SAMBEL PECEL	HERUWATI	JLN BOROBUDUR NO 4-G	\N	\N	Kuliner	Aktif	ID35110000000022	\N	CP3500022	\N	2026-04-03 04:09:24	\N	\N
23	9120000000023	3573010000000023	Mikro	Perseorangan	SAMBEL PECEL	SAMBEL PECEL	SULISTIYOWATI	JL. GULUN NO 5-B RT 48 RW 15	Taman	KEJURON	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	20000000	4	081234567023	sulistiyowati23@gmail.com	2026-01-24	SAMBEL PECEL	SULISTIYOWATI	JL. GULUN NO 5-B RT 48 RW 15	\N	\N	Kuliner	Aktif	ID35110000000023	\N	\N	SNI-01-0023	2026-04-03 04:09:24	\N	\N
24	9120000000024	3573010000000024	Mikro	Perseorangan	SAMBEL PECEL	SAMBEL PECEL	ULUL SUFIANA	JL ROKAN NO. 1 RT 48/ RW 15 TAMAN	Taman	TAMAN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	25000000	2	081234567024	ululsufiana24@gmail.com	2026-01-25	SAMBEL PECEL	ULUL SUFIANA	JL ROKAN NO. 1 RT 48/ RW 15 TAMAN	\N	\N	Kuliner	Aktif	\N	TR2600024	\N	\N	2026-04-03 04:09:24	\N	\N
25	9120000000025	3573010000000025	Mikro	Perseorangan	KEBAB	KEBAB	WAHYU WISMA PRIYANI	JL GEGONO MANIS G3/11 MANISREJO	Taman	MANISREJO	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	5000000	3	081234567025	wahyuwismapriyani25@gmail.com	2026-01-26	KEBAB	WAHYU WISMA PRIYANI	JL GEGONO MANIS G3/11 MANISREJO	\N	\N	Kuliner	Aktif	ID35110000000025	\N	CP3500025	\N	2026-04-03 04:09:24	\N	\N
26	9120000000026	3573010000000026	Mikro	Perseorangan	SAMBEL PECEL | \nKERING KENTANG	SAMBEL PECEL | \nKERING KENTANG	NOVITA DWI HARINI	JALAN WUNI NO.12, KEJURON,	Taman	KEJURON	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	10000000	4	081234567026	novitadwiharini26@gmail.com	2026-01-27	SAMBEL PECEL | \nKERING KENTANG	NOVITA DWI HARINI	JALAN WUNI NO.12, KEJURON,	\N	\N	Kuliner	Aktif	ID35110000000026	\N	\N	SNI-01-0026	2026-04-03 04:09:24	\N	\N
27	9120000000027	3573010000000027	Mikro	Perseorangan	SAMBEL PECEL	SAMBEL PECEL	CHAIRATUN LIES SETYORINI	H.O.S.COKROAMINOTO,GG: RINGIN NO 3 , MADIUN	Taman	KEJURON	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	15000000	2	081234567027	chairatunliessetyorini27@gmail.com	2026-01-28	SAMBEL PECEL	CHAIRATUN LIES SETYORINI	H.O.S.COKROAMINOTO,GG: RINGIN NO 3 , MADIUN	\N	\N	Kuliner	Aktif	ID35110000000027	TR2600027	\N	\N	2026-04-03 04:09:24	\N	\N
28	9120000000028	3573010000000028	Mikro	Perseorangan	BENGKEL LAS	BENGKEL LAS	RUSMANTO	JL.MIJIL SULASTRI,	Manguharjo	SOGATEN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	20000000	3	081234567028	rusmanto28@gmail.com	2026-01-29	BENGKEL LAS	RUSMANTO	JL.MIJIL SULASTRI,	\N	\N	Kuliner	Aktif	ID35110000000028	\N	CP3500028	\N	2026-04-03 04:09:24	\N	\N
29	9120000000029	3573010000000029	Mikro	Perseorangan	KERAJINAN SULAM	KERAJINAN SULAM	R.R.YOENI ASTOETI	JL. BANDA NO.18	Manguharjo	MADIUN LOR	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	25000000	4	081234567029	r.r.yoeniastoeti29@gmail.com	2026-01-30	KERAJINAN SULAM	R.R.YOENI ASTOETI	JL. BANDA NO.18	\N	\N	Kuliner	Aktif	ID35110000000029	\N	\N	SNI-01-0029	2026-04-03 04:09:24	\N	\N
30	9120000000030	3573010000000030	Mikro	Perseorangan	NASI BOX	NASI BOX	MARTATIK	Jl. Setinggil No. 19 RT. 30 RW. 01	Taman	DEMANGAN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	5000000	2	081234567030	martatik30@gmail.com	2026-01-31	NASI BOX	MARTATIK	Jl. Setinggil No. 19 RT. 30 RW. 01	\N	\N	Kuliner	Aktif	\N	TR2600030	\N	\N	2026-04-03 04:09:24	\N	\N
31	9120000000031	3573010000000031	Mikro	Perseorangan	BRONDONG, JIPANG	BRONDONG, JIPANG	TUTIK RAHAYU	JL MANGGA XIII/3-B	Taman	KEJURON	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	10000000	3	081234567031	tutikrahayu31@gmail.com	2026-02-01	BRONDONG, JIPANG	TUTIK RAHAYU	JL MANGGA XIII/3-B	\N	\N	Kuliner	Aktif	ID35110000000031	\N	CP3500031	\N	2026-04-03 04:09:24	\N	\N
32	9120000000032	3573010000000032	Mikro	Perseorangan	PENTOL CORAH	PENTOL CORAH	APRILIA	JALAN DELIMA NO9 BLK MADIUN	Taman	KEJURON	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	15000000	4	081234567032	aprilia32@gmail.com	2026-02-02	PENTOL CORAH	APRILIA	JALAN DELIMA NO9 BLK MADIUN	\N	\N	Kuliner	Aktif	ID35110000000032	\N	\N	SNI-01-0032	2026-04-03 04:09:24	\N	\N
33	9120000000033	3573010000000033	Mikro	Perseorangan	NUGGET AYAM	NUGGET AYAM	BARIAH SUCIATI	Jl. Taman Raya, No. 3, RT 027, TW 007, Kelurahan Banjareho, Kecamatan Taman, Kota Madiun, Jawa Timur 63137	Taman	BANJAREJO	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	20000000	2	081234567033	bariahsuciati33@gmail.com	2026-02-03	NUGGET AYAM	BARIAH SUCIATI	Jl. Taman Raya, No. 3, RT 027, TW 007, Kelurahan Banjareho, Kecamatan Taman, Kota Madiun, Jawa Timur 63137	\N	\N	Kuliner	Aktif	ID35110000000033	TR2600033	\N	\N	2026-04-03 04:09:24	\N	\N
34	9120000000034	3573010000000034	Mikro	Perseorangan	BENGKEL MOTOR	BENGKEL MOTOR	PUDJI HARTONO	JALAN KAPTEN TENDEAN NO.50, BANJAREJO	Taman	BANJAREJO	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	25000000	3	081234567034	pudjihartono34@gmail.com	2026-02-04	BENGKEL MOTOR	PUDJI HARTONO	JALAN KAPTEN TENDEAN NO.50, BANJAREJO	\N	\N	Kuliner	Aktif	ID35110000000034	\N	CP3500034	\N	2026-04-03 04:09:24	\N	\N
35	9120000000035	3573010000000035	Mikro	Perseorangan	AKSESORIS	AKSESORIS	HESTY IRAWATI	JL. TAWANG BHAKTI NO. 24 A RT. 021 RW. 006	Kartoharjo	TAWANGREJO	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	5000000	4	081234567035	hestyirawati35@gmail.com	2026-02-05	AKSESORIS	HESTY IRAWATI	JL. TAWANG BHAKTI NO. 24 A RT. 021 RW. 006	\N	\N	Kuliner	Aktif	ID35110000000035	\N	\N	SNI-01-0035	2026-04-03 04:09:24	\N	\N
36	9120000000036	3573010000000036	Mikro	Perseorangan	SAMBEL	SAMBEL	ENGGAR LESTARI RAHAYU	"JL. TAWANGBARU RT 09, RW 02, KEL TAWANGREJO, KEC KARTOHARJO"	Kartoharjo	TAWANGREJO	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	10000000	2	081234567036	enggarlestarirahayu36@gmail.com	2026-02-06	SAMBEL	ENGGAR LESTARI RAHAYU	"JL. TAWANGBARU RT 09, RW 02, KEL TAWANGREJO, KEC KARTOHARJO"	\N	\N	Kuliner	Aktif	\N	TR2600036	\N	\N	2026-04-03 04:09:24	\N	\N
37	9120000000037	3573010000000037	Mikro	Perseorangan	ROTI BAKERY	ROTI BAKERY	ENGGAR LESTARI RAHAYU	JL. TAWANGBARU RT 09, RW 02, KEL TAWANGREJO, KEC KARTOHARJO	Kartoharjo	TAWANGREJO	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	15000000	3	081234567037	enggarlestarirahayu37@gmail.com	2026-02-07	ROTI BAKERY	ENGGAR LESTARI RAHAYU	JL. TAWANGBARU RT 09, RW 02, KEL TAWANGREJO, KEC KARTOHARJO	\N	\N	Kuliner	Aktif	ID35110000000037	\N	CP3500037	\N	2026-04-03 04:09:24	\N	\N
38	9120000000038	3573010000000038	Mikro	Perseorangan	NASI BOX	NASI BOX	MULYANI	JALAN SERAYU BARAT NO 52B, DESA/KELURAHAN PANDEAN, KEC. TAMAN	Taman	PANDEAN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	20000000	4	081234567038	mulyani38@gmail.com	2026-02-08	NASI BOX	MULYANI	JALAN SERAYU BARAT NO 52B, DESA/KELURAHAN PANDEAN, KEC. TAMAN	\N	\N	Kuliner	Aktif	ID35110000000038	\N	\N	SNI-01-0038	2026-04-03 04:09:24	\N	\N
39	9120000000039	3573010000000039	Mikro	Perseorangan	SAMBEL PECEL	SAMBEL PECEL	SUTIKNYO	JL TIRTO MANIS 1 NO 13 MADIUN, DESA/KELURAHAN MANISREJO, KEC. TAMAN	Taman	MANISREJO	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	25000000	2	081234567039	sutiknyo39@gmail.com	2026-02-09	SAMBEL PECEL	SUTIKNYO	JL TIRTO MANIS 1 NO 13 MADIUN, DESA/KELURAHAN MANISREJO, KEC. TAMAN	\N	\N	Kuliner	Aktif	ID35110000000039	TR2600039	\N	\N	2026-04-03 04:09:24	\N	\N
40	9120000000040	3573010000000040	Mikro	Perseorangan	SUSU SARI KEDELAI	SUSU SARI KEDELAI	FADLITSANIYA ABSHAR NURRAMADAN	JL.NGEBONG RT10/RW03, BANJAREJO, TAMAN, MADIUN, DESA/KELURAHAN BANJAREJO, KEC. TAMAN	Taman	BANJAREJO	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	5000000	3	081234567040	fadlitsaniyaabsharnurramadan40@gmail.com	2026-02-10	SUSU SARI KEDELAI	FADLITSANIYA ABSHAR NURRAMADAN	JL.NGEBONG RT10/RW03, BANJAREJO, TAMAN, MADIUN, DESA/KELURAHAN BANJAREJO, KEC. TAMAN	\N	\N	Kuliner	Aktif	ID35110000000040	\N	CP3500040	\N	2026-04-03 04:09:24	\N	\N
41	9120000000041	3573010000000041	Mikro	Perseorangan	KERIPIK DAN KEBAB	KERIPIK DAN KEBAB	HUDA UMAR ALKAFF	JL.PARIANOM B4 NO.33, DESA/KELURAHAN SOGATEN, KEC. MANGUHARJO, KOTA MADIUN,	Manguharjo	SOGATEN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	10000000	4	081234567041	hudaumaralkaff41@gmail.com	2026-02-11	KERIPIK DAN KEBAB	HUDA UMAR ALKAFF	JL.PARIANOM B4 NO.33, DESA/KELURAHAN SOGATEN, KEC. MANGUHARJO, KOTA MADIUN,	\N	\N	Kuliner	Aktif	ID35110000000041	\N	\N	SNI-01-0041	2026-04-03 04:09:24	\N	\N
42	9120000000042	3573010000000042	Mikro	Perseorangan	KUE TRADISIONAL	KUE TRADISIONAL	BETTY ARININGSIH	PERUM GRAND RESPATI A.27, DESA/KELURAHAN JOSENAN, KEC. TAMAN, KOTA MADIUN	Taman	JOSENAN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	15000000	2	081234567042	bettyariningsih42@gmail.com	2026-02-12	KUE TRADISIONAL	BETTY ARININGSIH	PERUM GRAND RESPATI A.27, DESA/KELURAHAN JOSENAN, KEC. TAMAN, KOTA MADIUN	\N	\N	Kuliner	Aktif	\N	TR2600042	\N	\N	2026-04-03 04:09:24	\N	\N
43	9120000000043	3573010000000043	Mikro	Perseorangan	SAMBEL, ABON	SAMBEL, ABON	SRI SUHARTINI	JL. PRAJURITAN GG. TANGKIS I/6, DESA/KELURAHAN MADIUN LOR, KEC. MANGUHARJO, KOTA MADIUN	Manguharjo	MADIUN LOR	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	20000000	3	081234567043	srisuhartini43@gmail.com	2026-02-13	SAMBEL, ABON	SRI SUHARTINI	JL. PRAJURITAN GG. TANGKIS I/6, DESA/KELURAHAN MADIUN LOR, KEC. MANGUHARJO, KOTA MADIUN	\N	\N	Kuliner	Aktif	ID35110000000043	\N	CP3500043	\N	2026-04-03 04:09:24	\N	\N
44	9120000000044	3573010000000044	Mikro	Perseorangan	WADER CRISPY	WADER CRISPY	SUMINAH	JALAN KAMPAR 46, DESA/KELURAHAN TAMAN, KEC. TAMAN,	Taman	TAMAN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	25000000	4	081234567044	suminah44@gmail.com	2026-02-14	WADER CRISPY	SUMINAH	JALAN KAMPAR 46, DESA/KELURAHAN TAMAN, KEC. TAMAN,	\N	\N	Kuliner	Aktif	ID35110000000044	\N	\N	SNI-01-0044	2026-04-03 04:09:24	\N	\N
45	9120000000045	3573010000000045	Mikro	Perseorangan	GORDEN, KELAMBU	GORDEN, KELAMBU	IIS NINGTYAS	JL. URIP SUMOHARJO NO. 04, DESA/KELURAHAN MANGUHARJO, KEC. MANGUHARJO	Manguharjo	MANGUHARJO	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	5000000	2	081234567045	iisningtyas45@gmail.com	2026-02-15	GORDEN, KELAMBU	IIS NINGTYAS	JL. URIP SUMOHARJO NO. 04, DESA/KELURAHAN MANGUHARJO, KEC. MANGUHARJO	\N	\N	Kuliner	Aktif	ID35110000000045	TR2600045	\N	\N	2026-04-03 04:09:24	\N	\N
46	9120000000046	3573010000000046	Mikro	Perseorangan	SAMBEL PECEL	SAMBEL PECEL	AMIRUDIN	JL. MURIA NO. 21/11, RT.002, RW.001, DESA/KELURAHAN PANGONGANGAN, KEC. MANGUHARJO	Manguharjo	PANGONGANGAN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	10000000	3	081234567046	amirudin46@gmail.com	2026-02-16	SAMBEL PECEL	AMIRUDIN	JL. MURIA NO. 21/11, RT.002, RW.001, DESA/KELURAHAN PANGONGANGAN, KEC. MANGUHARJO	\N	\N	Kuliner	Aktif	ID35110000000046	\N	\N	\N	2026-04-03 04:09:24	\N	\N
47	9120000000047	3573010000000047	Mikro	Perseorangan	KERIPIK DAN SAMBAL PECEL	KERIPIK DAN SAMBAL PECEL	HARI TRI RAHAYU	PERUM WIDODO KENCONO INDAH 1 BLOK C-6 RT 56 RW 18, DESA/KELURAHAN PANDEAN, KEC. TAMAN	Taman	PANDEAN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	15000000	4	081234567047	haritrirahayu47@gmail.com	2026-02-17	KERIPIK DAN SAMBAL PECEL	HARI TRI RAHAYU	PERUM WIDODO KENCONO INDAH 1 BLOK C-6 RT 56 RW 18, DESA/KELURAHAN PANDEAN, KEC. TAMAN	\N	\N	Kuliner	Aktif	ID35110000000047	\N	\N	\N	2026-04-03 04:09:24	\N	\N
48	9120000000048	3573010000000048	Mikro	Perseorangan	BENGKEL LAS	BENGKEL LAS	MURDOKO	JL. SALAK NO. 32, DESA/KELURAHAN MOJOREJO, KEC. TAMAN	Taman	MOJOREJO	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	20000000	2	081234567048	murdoko48@gmail.com	2026-02-18	BENGKEL LAS	MURDOKO	JL. SALAK NO. 32, DESA/KELURAHAN MOJOREJO, KEC. TAMAN	\N	\N	Kuliner	Aktif	\N	\N	\N	\N	2026-04-03 04:09:24	\N	\N
49	9120000000049	3573010000000049	Mikro	Perseorangan	SAMBEL PECEL	SAMBEL PECEL	SUTINI	PERUM GRIYA SALAK BLOK B-51 RT 048 RW 016. PANDEAN. TAMAN	Taman	PANDEAN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	25000000	3	081234567049	sutini49@gmail.com	2026-02-19	SAMBEL PECEL	SUTINI	PERUM GRIYA SALAK BLOK B-51 RT 048 RW 016. PANDEAN. TAMAN	\N	\N	Kuliner	Aktif	ID35110000000049	\N	\N	\N	2026-04-03 04:09:24	\N	\N
50	9120000000050	3573010000000050	Mikro	Perseorangan	BAJU BORDIR	BAJU BORDIR	HENY MOERDANINGSIH	JL. DWI JAYA 3 NO. 9 MADIUN, DESA/KELURAHAN KLEGEN, KEC. KARTOHARJO, KOTA MADIUN	Kartoharjo	KLEGEN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	5000000	4	081234567050	henymoerdaningsih50@gmail.com	2026-02-20	BAJU BORDIR	HENY MOERDANINGSIH	JL. DWI JAYA 3 NO. 9 MADIUN, DESA/KELURAHAN KLEGEN, KEC. KARTOHARJO, KOTA MADIUN	\N	\N	Kuliner	Aktif	ID35110000000050	\N	\N	\N	2026-04-03 04:09:24	\N	\N
51	9120000000051	3573010000000051	Mikro	Perseorangan	KUE	KUE	DWI WAHYUNINGSIH	JL. MANDIRI PERUM RED TULIP BLOK A NO. 4, DESA/KELURAHAN DEMANGAN, KEC. TAMAN	Taman	DEMANGAN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	10000000	2	081234567051	dwiwahyuningsih51@gmail.com	2026-02-21	KUE	DWI WAHYUNINGSIH	JL. MANDIRI PERUM RED TULIP BLOK A NO. 4, DESA/KELURAHAN DEMANGAN, KEC. TAMAN	\N	\N	Kuliner	Aktif	ID35110000000051	\N	\N	\N	2026-04-03 04:09:24	\N	\N
52	9120000000052	3573010000000052	Mikro	Perseorangan	DAGING ASAP, SOSIS, BAKSO, DAGING BERBUMBU	DAGING ASAP, SOSIS, BAKSO, DAGING BERBUMBU	DARMAWAN MULYADI	Jl. Salak III No. 8, Taman, Kec. Taman, Kota Madiun, Jawa Timur 63131	Taman	TAMAN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	15000000	3	081234567052	darmawanmulyadi52@gmail.com	2026-02-22	DAGING ASAP, SOSIS, BAKSO, DAGING BERBUMBU	DARMAWAN MULYADI	Jl. Salak III No. 8, Taman, Kec. Taman, Kota Madiun, Jawa Timur 63131	\N	\N	Kuliner	Aktif	ID35110000000052	\N	\N	\N	2026-04-03 04:09:24	\N	\N
53	9120000000053	3573010000000053	Mikro	Perseorangan	OLAHAN SAMBEL	OLAHAN SAMBEL	BAGUS SURYA NUGRAHA	JALAN PUSPA INDAH BLOK Y2 PERUM KARTOHARJO INDAH, DESA/KELURAHAN KELUN, KEC. KARTOHARJO, KOTA MADIUN	Kartoharjo	KELUN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	20000000	4	081234567053	bagussuryanugraha53@gmail.com	2026-02-23	OLAHAN SAMBEL	BAGUS SURYA NUGRAHA	JALAN PUSPA INDAH BLOK Y2 PERUM KARTOHARJO INDAH, DESA/KELURAHAN KELUN, KEC. KARTOHARJO, KOTA MADIUN	\N	\N	Kuliner	Aktif	ID35110000000053	\N	\N	\N	2026-04-03 04:09:24	\N	\N
54	9120000000054	3573010000000054	Mikro	Perseorangan	AYAM UNGKEP FROZEN	AYAM UNGKEP FROZEN	NUR KHIKMAH	JL. SERAYU INDAH B-8 NO.32, DESA/KELURAHAN PANDEAN, KEC. TAMAN	Taman	PANDEAN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	25000000	2	081234567054	nurkhikmah54@gmail.com	2026-02-24	AYAM UNGKEP FROZEN	NUR KHIKMAH	JL. SERAYU INDAH B-8 NO.32, DESA/KELURAHAN PANDEAN, KEC. TAMAN	\N	\N	Kuliner	Aktif	\N	\N	\N	\N	2026-04-03 04:09:24	\N	\N
55	9120000000055	3573010000000055	Mikro	Perseorangan	OLAHAN FROZEN	OLAHAN FROZEN	IMAM SUGIRI	JL TILAMUPIH 24 , DESA/KELURAHAN JOSENAN, KEC. TAMAN, KOTA MADIUN	Taman	JOSENAN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	5000000	3	081234567055	imamsugiri55@gmail.com	2026-02-25	OLAHAN FROZEN	IMAM SUGIRI	JL TILAMUPIH 24 , DESA/KELURAHAN JOSENAN, KEC. TAMAN, KOTA MADIUN	\N	\N	Kuliner	Aktif	ID35110000000055	\N	\N	\N	2026-04-03 04:09:24	\N	\N
56	9120000000056	3573010000000056	Mikro	Perseorangan	GITAR	GITAR	WAHYU WIJOYONO	JL. FLORES NO. 48, DESA/KELURAHAN KARTOHARJO, KEC. KARTOHARJO,	Kartoharjo	KARTOHARJO	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	10000000	4	081234567056	wahyuwijoyono56@gmail.com	2026-02-26	GITAR	WAHYU WIJOYONO	JL. FLORES NO. 48, DESA/KELURAHAN KARTOHARJO, KEC. KARTOHARJO,	\N	\N	Kuliner	Aktif	ID35110000000056	\N	\N	\N	2026-04-03 04:09:24	\N	\N
57	9120000000057	3573010000000057	Mikro	Perseorangan	SEPATU TEKNIK	SEPATU TEKNIK	MUHAMMAD YUSUF	JL. MARGA BAKTI NO 9, DESA/KELURAHAN MOJOREJO, KEC. TAMAN	Taman	MOJOREJO	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	15000000	2	081234567057	muhammadyusuf57@gmail.com	2026-02-27	SEPATU TEKNIK	MUHAMMAD YUSUF	JL. MARGA BAKTI NO 9, DESA/KELURAHAN MOJOREJO, KEC. TAMAN	\N	\N	Kuliner	Aktif	ID35110000000057	\N	\N	\N	2026-04-03 04:09:24	\N	\N
58	9120000000058	3573010000000058	Mikro	Perseorangan	DIMSUM	DIMSUM	AMIRUL MA`RUF	JALAN SUKOYONO PERUM ADDA PURIARTHA D-12A, DESA/KELURAHAN JOSENAN, KEC. TAMAN	Taman	JOSENAN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	20000000	3	081234567058	amirulma`ruf58@gmail.com	2026-02-28	DIMSUM	AMIRUL MA`RUF	JALAN SUKOYONO PERUM ADDA PURIARTHA D-12A, DESA/KELURAHAN JOSENAN, KEC. TAMAN	\N	\N	Kuliner	Aktif	ID35110000000058	\N	\N	\N	2026-04-03 04:09:24	\N	\N
59	9120000000059	3573010000000059	Mikro	Perseorangan	UNGKEP JEROAN	UNGKEP JEROAN	ERFANA HENDRAWATI	JL. AIRLANGGA II NO.8 RT 07 RW 02 WINONGO, MANGUHARJO, MADIUN	Manguharjo	WINONGO	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	25000000	4	081234567059	erfanahendrawati59@gmail.com	2026-03-01	UNGKEP JEROAN	ERFANA HENDRAWATI	JL. AIRLANGGA II NO.8 RT 07 RW 02 WINONGO, MANGUHARJO, MADIUN	\N	\N	Kuliner	Aktif	ID35110000000059	\N	\N	\N	2026-04-03 04:09:24	\N	\N
60	9120000000060	3573010000000060	Mikro	Perseorangan	SAMBEL PECEL	SAMBEL PECEL	LELLY MIRYANTI	TAMAN ASRI I/A-15 BANJAREJO TAMAN MADIUN, DESA/KELURAHAN BANJAREJO, KEC. TAMAN	Taman	BANJAREJO	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	5000000	2	081234567060	lellymiryanti60@gmail.com	2026-03-02	SAMBEL PECEL	LELLY MIRYANTI	TAMAN ASRI I/A-15 BANJAREJO TAMAN MADIUN, DESA/KELURAHAN BANJAREJO, KEC. TAMAN	\N	\N	Kuliner	Aktif	\N	\N	\N	\N	2026-04-03 04:09:24	\N	\N
61	9120000000061	3573010000000061	Mikro	Perseorangan	TAHU WALIK	TAHU WALIK	SITI ROSYIDAH	JL. TEMUGIRING NO. 22 BLK , DESA/KELURAHAN NGEGONG, KEC. MANGUHARJO	Manguharjo	NGEGONG	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	10000000	3	081234567061	sitirosyidah61@gmail.com	2026-03-03	TAHU WALIK	SITI ROSYIDAH	JL. TEMUGIRING NO. 22 BLK , DESA/KELURAHAN NGEGONG, KEC. MANGUHARJO	\N	\N	Kuliner	Aktif	ID35110000000061	\N	\N	\N	2026-04-03 04:09:24	\N	\N
62	9120000000062	3573010000000062	Mikro	Perseorangan	SAMBAL KACANG	SAMBAL KACANG	INDAH RATNAWATI	JL. DADALI NO.11 RT.16 RW.005 , DESA/KELURAHAN NAMBANGAN KIDUL, KEC. MANGUHARJO	Manguharjo	NAMBANGAN KIDUL	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	15000000	4	081234567062	indahratnawati62@gmail.com	2026-03-04	SAMBAL KACANG	INDAH RATNAWATI	JL. DADALI NO.11 RT.16 RW.005 , DESA/KELURAHAN NAMBANGAN KIDUL, KEC. MANGUHARJO	\N	\N	Kuliner	Aktif	ID35110000000062	\N	\N	\N	2026-04-03 04:09:24	\N	\N
63	9120000000063	3573010000000063	Mikro	Perseorangan	OLAHAN JAMUR TIRAM	OLAHAN JAMUR TIRAM	VILGA VICHARIO	JL.MANYAR NO 32, DESA/KELURAHAN NAMBANGAN LOR, KEC. MANGUHARJO	Manguharjo	NAMBANGAN LOR	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	20000000	2	081234567063	vilgavichario63@gmail.com	2026-03-05	OLAHAN JAMUR TIRAM	VILGA VICHARIO	JL.MANYAR NO 32, DESA/KELURAHAN NAMBANGAN LOR, KEC. MANGUHARJO	\N	\N	Kuliner	Aktif	ID35110000000063	\N	\N	\N	2026-04-03 04:09:24	\N	\N
64	9120000000064	3573010000000064	Mikro	Perseorangan	JAMU SERAI	JAMU SERAI	DYAH RATNA WULANDARI	JL. PANORAMA RAYA NO. 12B, DESA/KELURAHAN PANDEAN, KEC. TAMAN	Taman	PANDEAN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	25000000	3	081234567064	dyahratnawulandari64@gmail.com	2026-03-06	JAMU SERAI	DYAH RATNA WULANDARI	JL. PANORAMA RAYA NO. 12B, DESA/KELURAHAN PANDEAN, KEC. TAMAN	\N	\N	Kuliner	Aktif	ID35110000000064	\N	\N	\N	2026-04-03 04:09:24	\N	\N
65	9120000000065	3573010000000065	Mikro	Perseorangan	OMELET	OMELET	NELLY NOVI DAMAYANTI	JL SERAYU BARAT GG V NO 49, DESA/KELURAHAN PANDEAN, KEC. TAMAN	Taman	PANDEAN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	5000000	4	081234567065	nellynovidamayanti65@gmail.com	2026-03-07	OMELET	NELLY NOVI DAMAYANTI	JL SERAYU BARAT GG V NO 49, DESA/KELURAHAN PANDEAN, KEC. TAMAN	\N	\N	Kuliner	Aktif	ID35110000000065	\N	\N	\N	2026-04-03 04:09:24	\N	\N
66	9120000000066	3573010000000066	Mikro	Perseorangan	MAKANAN OLAHAN	MAKANAN OLAHAN	IRAWATI	JL.JENGGOLO MANIK 12, DESA/KELURAHAN KELUN, KEC. KARTOHARJO	Kartoharjo	KELUN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	10000000	2	081234567066	irawati66@gmail.com	2026-03-08	MAKANAN OLAHAN	IRAWATI	JL.JENGGOLO MANIK 12, DESA/KELURAHAN KELUN, KEC. KARTOHARJO	\N	\N	Kuliner	Aktif	\N	\N	\N	\N	2026-04-03 04:09:24	\N	\N
67	9120000000067	3573010000000067	Mikro	Perseorangan	TELOR ASIN	TELOR ASIN	HARTATI	JL WIRARAJA NO 3, DESA/KELURAHAN WINONGO, KEC. MANGUHARJO, KOTA MADIUN	Manguharjo	WINONGO	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	15000000	3	081234567067	hartati67@gmail.com	2026-03-09	TELOR ASIN	HARTATI	JL WIRARAJA NO 3, DESA/KELURAHAN WINONGO, KEC. MANGUHARJO, KOTA MADIUN	\N	\N	Kuliner	Aktif	ID35110000000067	\N	\N	\N	2026-04-03 04:09:24	\N	\N
68	9120000000068	3573010000000068	Mikro	Perseorangan	MAKANAN OLAHAN	MAKANAN OLAHAN	IKE VISQHIE MARSHA HAYU	JL. ELANG II NO 6, DESA/KELURAHAN NAMBANGAN KIDUL, KEC. MANGUHARJO, KOTA MADIUN	Manguharjo	NAMBANGAN LOR	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	20000000	4	081234567068	ikevisqhiemarshahayu68@gmail.com	2026-03-10	MAKANAN OLAHAN	IKE VISQHIE MARSHA HAYU	JL. ELANG II NO 6, DESA/KELURAHAN NAMBANGAN KIDUL, KEC. MANGUHARJO, KOTA MADIUN	\N	\N	Kuliner	Aktif	ID35110000000068	\N	\N	\N	2026-04-03 04:09:24	\N	\N
69	9120000000069	3573010000000069	Mikro	Perseorangan	TEMPE MENDOAN	TEMPE MENDOAN	SRI WAHYUNI	JL.NANGKA NO 6, DESA/KELURAHAN TAMAN, KEC. TAMAN, KOTA MADIUN	Taman	TAMAN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	25000000	2	081234567069	sriwahyuni69@gmail.com	2026-03-11	TEMPE MENDOAN	SRI WAHYUNI	JL.NANGKA NO 6, DESA/KELURAHAN TAMAN, KEC. TAMAN, KOTA MADIUN	\N	\N	Kuliner	Aktif	ID35110000000069	\N	\N	\N	2026-04-03 04:09:24	\N	\N
70	9120000000070	3573010000000070	Mikro	Perseorangan	KEBAB	KEBAB	ANNY DWI POERWAHJOENINGTYAS	JL. IMAM BONJOL GG. JATI TRUBUS NO. 7 , DESA/KELURAHAN KLEGEN, KEC. KARTOHARJO	Kartoharjo	KLEGEN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	5000000	3	081234567070	annydwipoerwahjoeningtyas70@gmail.com	2026-03-12	KEBAB	ANNY DWI POERWAHJOENINGTYAS	JL. IMAM BONJOL GG. JATI TRUBUS NO. 7 , DESA/KELURAHAN KLEGEN, KEC. KARTOHARJO	\N	\N	Kuliner	Aktif	ID35110000000070	\N	\N	\N	2026-04-03 04:09:24	\N	\N
71	9120000000071	3573010000000071	Mikro	Perseorangan	KAIN BATIK	KAIN BATIK	VERONIKA DWI SULISTIYANI	JL. CANDI BOKO NO. 09 KEL. PATIHAN, KEC. MANGUHARJO, KOTA MADIUN	Manguharjo	PATIHAN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	10000000	4	081234567071	veronikadwisulistiyani71@gmail.com	2026-03-13	KAIN BATIK	VERONIKA DWI SULISTIYANI	JL. CANDI BOKO NO. 09 KEL. PATIHAN, KEC. MANGUHARJO, KOTA MADIUN	\N	\N	Kuliner	Aktif	ID35110000000071	\N	\N	\N	2026-04-03 04:09:24	\N	\N
72	9120000000072	3573010000000072	Mikro	Perseorangan	BAJU	BAJU	PT BERDIKARI BERKAT SEMESTA	JALAN MERAK PERUM PURI PERMATA HIJAU BLOK A NOMOR 27, DESA/KELURAHAN NAMBANGAN KIDUL, KEC. MANGUHARJO	Manguharjo	NAMBANGAN KIDUL	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	15000000	2	081234567072	ptberdikariberkatsemesta72@gmail.com	2026-03-14	BAJU	PT BERDIKARI BERKAT SEMESTA	JALAN MERAK PERUM PURI PERMATA HIJAU BLOK A NOMOR 27, DESA/KELURAHAN NAMBANGAN KIDUL, KEC. MANGUHARJO	\N	\N	Kuliner	Aktif	\N	\N	\N	\N	2026-04-03 04:09:24	\N	\N
73	9120000000073	3573010000000073	Mikro	Perseorangan	REPARASI	REPARASI	CV ADIWARNA KARSA EMPAT TUJUH	JL. PILANG DARMA NO.11, DESA/KELURAHAN PILANGBANGO, KEC. KARTOHARJO	Kartoharjo	PILANGBANGO	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	20000000	3	081234567073	cvadiwarnakarsaempattujuh73@gmail.com	2026-03-15	REPARASI	CV ADIWARNA KARSA EMPAT TUJUH	JL. PILANG DARMA NO.11, DESA/KELURAHAN PILANGBANGO, KEC. KARTOHARJO	\N	\N	Kuliner	Aktif	ID35110000000073	\N	\N	\N	2026-04-03 04:09:24	\N	\N
74	9120000000074	3573010000000074	Mikro	Perseorangan	BENGKEL MOBIL	BENGKEL MOBIL	DONNY KURNIAWAN NOTOWIDJOJO	JL. SOEKARNO HATTA 66, DESA/KELURAHAN DEMANGAN, KEC. TAMAN	Taman	DEMANGAN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	25000000	4	081234567074	donnykurniawannotowidjojo74@gmail.com	2026-03-16	BENGKEL MOBIL	DONNY KURNIAWAN NOTOWIDJOJO	JL. SOEKARNO HATTA 66, DESA/KELURAHAN DEMANGAN, KEC. TAMAN	\N	\N	Kuliner	Aktif	ID35110000000074	\N	\N	\N	2026-04-03 04:09:24	\N	\N
75	9120000000075	3573010000000075	Mikro	Perseorangan	BENGKEL MOBIL	BENGKEL MOBIL	CV. SUKSES KARYA LANGGENG	JL. SOEKARNO HATTA NO. 66, DESA/KELURAHAN DEMANGAN, KEC. TAMAN	Taman	DEMANGAN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	5000000	2	081234567075	cv.sukseskaryalanggeng75@gmail.com	2026-03-17	BENGKEL MOBIL	CV. SUKSES KARYA LANGGENG	JL. SOEKARNO HATTA NO. 66, DESA/KELURAHAN DEMANGAN, KEC. TAMAN	\N	\N	Kuliner	Aktif	ID35110000000075	\N	\N	\N	2026-04-03 04:09:24	\N	\N
76	9120000000076	3573010000000076	Mikro	Perseorangan	BENGKEL MOTOR	BENGKEL MOTOR	PT. CAKRA USAHA NUSANTARA	JL. AHMAD YANI 57, DESA/KELURAHAN PANGONGANGAN, KEC. MANGUHARJO	Manguharjo	PANGONGANGAN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	10000000	3	081234567076	pt.cakrausahanusantara76@gmail.com	2026-03-18	BENGKEL MOTOR	PT. CAKRA USAHA NUSANTARA	JL. AHMAD YANI 57, DESA/KELURAHAN PANGONGANGAN, KEC. MANGUHARJO	\N	\N	Kuliner	Aktif	ID35110000000076	\N	\N	\N	2026-04-03 04:09:24	\N	\N
77	9120000000077	3573010000000077	Mikro	Perseorangan	BENGKEL MOTOR	BENGKEL MOTOR	PT. SAHABAT MANDIRI MOTOR	JL.H.AGUS SALIM 133/145, DESA/KELURAHAN PANDEAN, KEC. TAMAN	Taman	PANDEAN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	15000000	4	081234567077	pt.sahabatmandirimotor77@gmail.com	2026-03-19	BENGKEL MOTOR	PT. SAHABAT MANDIRI MOTOR	JL.H.AGUS SALIM 133/145, DESA/KELURAHAN PANDEAN, KEC. TAMAN	\N	\N	Kuliner	Aktif	ID35110000000077	\N	\N	\N	2026-04-03 04:09:24	\N	\N
78	9120000000078	3573010000000078	Mikro	Perseorangan	BENGKEL MOBIL	BENGKEL MOBIL	PT SUN MEGA MOTOR	JALAN MAYJEND SUNGKONO NO. 140, DESA/KELURAHAN NAMBANGAN KIDUL, KEC. MANGUHARJO	Manguharjo	NAMBANGAN KIDUL	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	20000000	2	081234567078	ptsunmegamotor78@gmail.com	2026-03-20	BENGKEL MOBIL	PT SUN MEGA MOTOR	JALAN MAYJEND SUNGKONO NO. 140, DESA/KELURAHAN NAMBANGAN KIDUL, KEC. MANGUHARJO	\N	\N	Kuliner	Aktif	\N	\N	\N	\N	2026-04-03 04:09:24	\N	\N
79	9120000000079	3573010000000079	Mikro	Perseorangan	AKSESORIS	AKSESORIS	TJATUR AMBARWATI	JL. THAMRIN GG MELATI,KLEGEN, KARTOHARJO KOTA MADIUN	Kartoharjo	KLEGEN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	25000000	3	081234567079	tjaturambarwati79@gmail.com	2026-03-21	AKSESORIS	TJATUR AMBARWATI	JL. THAMRIN GG MELATI,KLEGEN, KARTOHARJO KOTA MADIUN	\N	\N	Kuliner	Aktif	ID35110000000079	\N	\N	\N	2026-04-03 04:09:24	\N	\N
80	9120000000080	3573010000000080	Mikro	Perseorangan	ANEKA JAJANAN	ANEKA JAJANAN	MARTINI SARI UNDARTI	JL. TAWANG BHAKTI 15B RT21/RW06 KELURAHAN TAWANGREJO KECAMATAN KARTOHARJO	Kartoharjo	TAWANGREJO	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	5000000	4	081234567080	martinisariundarti80@gmail.com	2026-03-22	ANEKA JAJANAN	MARTINI SARI UNDARTI	JL. TAWANG BHAKTI 15B RT21/RW06 KELURAHAN TAWANGREJO KECAMATAN KARTOHARJO	\N	\N	Kuliner	Aktif	ID35110000000080	\N	\N	\N	2026-04-03 04:09:24	\N	\N
81	9120000000081	3573010000000081	Mikro	Perseorangan	SAMBAL BABY CUMI	SAMBAL BABY CUMI	SURYA NUR INSANA	JL. KOLONEL MARHADI GG. KENARI NO 22, DESA/KELURAHAN NAMBANGAN LOR, KEC. MANGUHARJO, KOTA MADIUN	Manguharjo	NAMBANGAN LOR	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	10000000	2	081234567081	suryanurinsana81@gmail.com	2026-03-23	SAMBAL BABY CUMI	SURYA NUR INSANA	JL. KOLONEL MARHADI GG. KENARI NO 22, DESA/KELURAHAN NAMBANGAN LOR, KEC. MANGUHARJO, KOTA MADIUN	\N	\N	Kuliner	Aktif	ID35110000000081	\N	\N	\N	2026-04-03 04:09:24	\N	\N
82	9120000000082	3573010000000082	Mikro	Perseorangan	EMAS DAN PERAK	EMAS DAN PERAK	SUGIANTO	JL. MERAK SELATAN 22A RT 07/03, DESA/KELURAHAN NAMBANGAN KIDUL, KEC. MANGUHARJO	Manguharjo	NAMBANGAN KIDUL	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	15000000	3	081234567082	sugianto82@gmail.com	2026-03-24	EMAS DAN PERAK	SUGIANTO	JL. MERAK SELATAN 22A RT 07/03, DESA/KELURAHAN NAMBANGAN KIDUL, KEC. MANGUHARJO	\N	\N	Kuliner	Aktif	ID35110000000082	\N	\N	\N	2026-04-03 04:09:24	\N	\N
83	9120000000083	3573010000000083	Mikro	Perseorangan	BENGKEL MOTOR	BENGKEL MOTOR	HERU ISDARTO	JL. ASAHAN NO.36 D, DESA/KELURAHAN TAMAN, KEC. TAMAN	Taman	TAMAN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	20000000	4	081234567083	heruisdarto83@gmail.com	2026-03-25	BENGKEL MOTOR	HERU ISDARTO	JL. ASAHAN NO.36 D, DESA/KELURAHAN TAMAN, KEC. TAMAN	\N	\N	Kuliner	Aktif	ID35110000000083	\N	\N	\N	2026-04-03 04:09:24	\N	\N
84	9120000000084	3573010000000084	Mikro	Perseorangan	PLASTIK KEMASAN	PLASTIK KEMASAN	CV KARYA MANUNGGAL JAYA	JL. KALIMOSODO 46, DESA/KELURAHAN JOSENAN, KEC. TAMAN, KOTA MADIUN	Taman	JOSENAN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	25000000	2	081234567084	cvkaryamanunggaljaya84@gmail.com	2026-03-26	PLASTIK KEMASAN	CV KARYA MANUNGGAL JAYA	JL. KALIMOSODO 46, DESA/KELURAHAN JOSENAN, KEC. TAMAN, KOTA MADIUN	\N	\N	Kuliner	Aktif	\N	\N	\N	\N	2026-04-03 04:09:24	\N	\N
85	9120000000085	3573010000000085	Mikro	Perseorangan	BENGKEL MOBIL	BENGKEL MOBIL	PT. ASTRA INTERNATIONAL	JALAN RINGROAD BARAT, BLOK DUKUH, DESA/KELURAHAN MANGUHARJO, KEC. MANGUHARJO	Manguharjo	MANGUHARJO	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	5000000	3	081234567085	pt.astrainternational85@gmail.com	2026-03-27	BENGKEL MOBIL	PT. ASTRA INTERNATIONAL	JALAN RINGROAD BARAT, BLOK DUKUH, DESA/KELURAHAN MANGUHARJO, KEC. MANGUHARJO	\N	\N	Kuliner	Aktif	ID35110000000085	\N	\N	\N	2026-04-03 04:09:24	\N	\N
86	9120000000086	3573010000000086	Mikro	Perseorangan	ANEKA JAJANAN	ANEKA JAJANAN	MUJIWARDANI FEBRIHEKSARINI	JL KY JALAK NO 3 RT 25 RW 08 , DESA/KELURAHAN JOSENAN, KEC. TAMAN	Taman	JOSENAN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	10000000	4	081234567086	mujiwardanifebriheksarini86@gmail.com	2026-03-28	ANEKA JAJANAN	MUJIWARDANI FEBRIHEKSARINI	JL KY JALAK NO 3 RT 25 RW 08 , DESA/KELURAHAN JOSENAN, KEC. TAMAN	\N	\N	Kuliner	Aktif	ID35110000000086	\N	\N	\N	2026-04-03 04:09:24	\N	\N
87	9120000000087	3573010000000087	Mikro	Perseorangan	BEBEK UNGKEP FROZEN	BEBEK UNGKEP FROZEN	WAHYU FITRI NURCAHYONO	Jl. Makam Tentara No. 82, Taman, Kec. Taman, Kota Madiun, Jawa Timur 63131	Taman	TAMAN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	15000000	2	081234567087	wahyufitrinurcahyono87@gmail.com	2026-03-29	BEBEK UNGKEP FROZEN	WAHYU FITRI NURCAHYONO	Jl. Makam Tentara No. 82, Taman, Kec. Taman, Kota Madiun, Jawa Timur 63131	\N	\N	Kuliner	Aktif	ID35110000000087	\N	\N	\N	2026-04-03 04:09:24	\N	\N
88	9120000000088	3573010000000088	Mikro	Perseorangan	BAKSO, PEMPEK	BAKSO, PEMPEK	KOMARIA LESTARI	JL. GEDONG NO. 35, DESA/KELURAHAN BANJAREJO, KEC. TAMAN	Taman	BANJAREJO	10120	PENGOLAHAN DAN PENGAWETAN DAGING DAN PRODUK DAGING	Rendah	20000000	3	081234567088	komarialestari88@gmail.com	2026-03-30	BAKSO, PEMPEK	KOMARIA LESTARI	JL. GEDONG NO. 35, DESA/KELURAHAN BANJAREJO, KEC. TAMAN	\N	\N	Kuliner	Aktif	ID35110000000088	\N	\N	\N	2026-04-03 04:09:24	2026-07-30 15:19:47	\N
89	9120000000089	3573010000000089	Mikro	Perseorangan	BENGKEL MOTOR	BENGKEL MOTOR	CV MAJU SUKSES PERKASA	JL. URIP SUMOHARJO NO. 33, DESA/KELURAHAN MANGUHARJO, KEC. MANGUHARJO	Manguharjo	MANGUHARJO	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	25000000	4	081234567089	cvmajusuksesperkasa89@gmail.com	2026-03-31	BENGKEL MOTOR	CV MAJU SUKSES PERKASA	JL. URIP SUMOHARJO NO. 33, DESA/KELURAHAN MANGUHARJO, KEC. MANGUHARJO	\N	\N	Kuliner	Aktif	ID35110000000089	\N	\N	\N	2026-04-03 04:09:24	\N	\N
90	9120000000090	3573010000000090	Mikro	Perseorangan	MAKARONI DAN POTATO GORENG	MAKARONI DAN POTATO GORENG	DARSINI	JL.KAMPAR GG II NO 30E , DESA/KELURAHAN TAMAN, KEC. TAMAN, KOTA MADIUN	Taman	TAMAN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	5000000	2	081234567090	darsini90@gmail.com	2026-01-01	MAKARONI DAN POTATO GORENG	DARSINI	JL.KAMPAR GG II NO 30E , DESA/KELURAHAN TAMAN, KEC. TAMAN, KOTA MADIUN	\N	\N	Kuliner	Aktif	\N	\N	\N	\N	2026-04-03 04:09:24	\N	\N
91	9120000000091	3573010000000091	Mikro	Perseorangan	SERUNDENG AYAM	SERUNDENG AYAM	MARTANTI	JL LAMBANG SARI III B-5 NO 32, PERUM SOGATEN, RT27/RW09 MADIUN, DESA/KELURAHAN SOGATEN, KEC. MANGUHARJO	Manguharjo	SOGATEN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	10000000	3	081234567091	martanti91@gmail.com	2026-01-02	SERUNDENG AYAM	MARTANTI	JL LAMBANG SARI III B-5 NO 32, PERUM SOGATEN, RT27/RW09 MADIUN, DESA/KELURAHAN SOGATEN, KEC. MANGUHARJO	\N	\N	Kuliner	Aktif	ID35110000000091	\N	\N	\N	2026-04-03 04:09:24	\N	\N
92	9120000000092	3573010000000092	Mikro	Perseorangan	DENDENG NABATI JANTUNG PISANG	DENDENG NABATI JANTUNG PISANG	RIMA LOESTANTI	JL. TRENGGULI NO.11A, DESA/KELURAHAN ORO-ORO OMBO, KEC. KARTOHARJO	Kartoharjo	ORO-ORO OMBO	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	15000000	4	081234567092	rimaloestanti92@gmail.com	2026-01-03	DENDENG NABATI JANTUNG PISANG	RIMA LOESTANTI	JL. TRENGGULI NO.11A, DESA/KELURAHAN ORO-ORO OMBO, KEC. KARTOHARJO	\N	\N	Kuliner	Aktif	ID35110000000092	\N	\N	\N	2026-04-03 04:09:24	\N	\N
93	9120000000093	3573010000000093	Mikro	Perseorangan	BENGKEL MOBIL	BENGKEL MOBIL	SAPTIYA CANDRA PRATAMA	JL. USADA SARI NO. 3, DESA/KELURAHAN REJOMULYO, KEC. KARTOHARJO	Kartoharjo	REJOMULYO	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	20000000	2	081234567093	saptiyacandrapratama93@gmail.com	2026-01-04	BENGKEL MOBIL	SAPTIYA CANDRA PRATAMA	JL. USADA SARI NO. 3, DESA/KELURAHAN REJOMULYO, KEC. KARTOHARJO	\N	\N	Kuliner	Aktif	ID35110000000093	\N	\N	\N	2026-04-03 04:09:24	\N	\N
94	9120000000094	3573010000000094	Mikro	Perseorangan	TAHU WALIK	TAHU WALIK	TIVIK SRI NUGRAHENI	JL. GLATIK NO.253, DESA/KELURAHAN NAMBANGAN KIDUL, KEC. MANGUHARJO	Manguharjo	NAMBANGAN KIDUL	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	25000000	3	081234567094	tiviksrinugraheni94@gmail.com	2026-01-05	TAHU WALIK	TIVIK SRI NUGRAHENI	JL. GLATIK NO.253, DESA/KELURAHAN NAMBANGAN KIDUL, KEC. MANGUHARJO	\N	\N	Kuliner	Aktif	ID35110000000094	\N	\N	\N	2026-04-03 04:09:24	\N	\N
95	9120000000095	3573010000000095	Mikro	Perseorangan	OLAHAN KREMESAN AYAM	OLAHAN KREMESAN AYAM	SITI HAFSIYAH	JL. KARTIKA MANIS NO. 20, DESA/KELURAHAN MANISREJO, KEC. TAMAN	Taman	MANISREJO	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	5000000	4	081234567095	sitihafsiyah95@gmail.com	2026-01-06	OLAHAN KREMESAN AYAM	SITI HAFSIYAH	JL. KARTIKA MANIS NO. 20, DESA/KELURAHAN MANISREJO, KEC. TAMAN	\N	\N	Kuliner	Aktif	ID35110000000095	\N	\N	\N	2026-04-03 04:09:24	\N	\N
96	9120000000096	3573010000000096	Mikro	Perseorangan	SPOORING	SPOORING	JOHAN WIJAYA	JL. TRUNOJOYO 117, DESA/KELURAHAN PANDEAN, KEC. TAMAN, KOTA MADIUN	Taman	PANDEAN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	10000000	2	081234567096	johanwijaya96@gmail.com	2026-01-07	SPOORING	JOHAN WIJAYA	JL. TRUNOJOYO 117, DESA/KELURAHAN PANDEAN, KEC. TAMAN, KOTA MADIUN	\N	\N	Kuliner	Aktif	\N	\N	\N	\N	2026-04-03 04:09:24	\N	\N
97	9120000000097	3573010000000097	Mikro	Perseorangan	MAKANAN OLAHAN	MAKANAN OLAHAN	NURUL KHAMIDIYAH	PERUM BUMI MAS, DESA/KELURAHAN MANISREJO, KEC. TAMAN, KOTA MADIUN	Taman	MANISREJO	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	15000000	3	081234567097	nurulkhamidiyah97@gmail.com	2026-01-08	MAKANAN OLAHAN	NURUL KHAMIDIYAH	PERUM BUMI MAS, DESA/KELURAHAN MANISREJO, KEC. TAMAN, KOTA MADIUN	\N	\N	Kuliner	Aktif	ID35110000000097	\N	\N	\N	2026-04-03 04:09:24	\N	\N
98	9120000000098	3573010000000098	Mikro	Perseorangan	JASA CAT MOTOR MOBIL	JASA CAT MOTOR MOBIL	NURUL KHAMIDIYAH	JALAN MARGOBAWERO, DESA/KELURAHAN MOJOREJO, KEC. TAMAN, KOTA MADIUN	Taman	MOJOREJO	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	20000000	4	081234567098	nurulkhamidiyah98@gmail.com	2026-01-09	JASA CAT MOTOR MOBIL	NURUL KHAMIDIYAH	JALAN MARGOBAWERO, DESA/KELURAHAN MOJOREJO, KEC. TAMAN, KOTA MADIUN	\N	\N	Kuliner	Aktif	ID35110000000098	\N	\N	\N	2026-04-03 04:09:24	\N	\N
99	9120000000099	3573010000000099	Mikro	Perseorangan	MAKARONI GORENG	MAKARONI GORENG	IRNA WAHYUNINGSIH	JL. CILIWUNG GANG 4 NO.7, DESA/KELURAHAN TAMAN, KEC. TAMAN, KOTA MADIUN	Taman	TAMAN	10794	INDUSTRI KERUPIK, KERIPIK, PEYEK DAN SEJENISNYA	Rendah	25000000	2	081234567099	irnawahyuningsih99@gmail.com	2026-01-10	MAKARONI GORENG	IRNA WAHYUNINGSIH	JL. CILIWUNG GANG 4 NO.7, DESA/KELURAHAN TAMAN, KEC. TAMAN, KOTA MADIUN	\N	\N	Kuliner	Aktif	ID35110000000099	\N	\N	\N	2026-04-03 04:09:24	2026-07-30 15:19:25	\N
100	9120000000100	3573010000000100	Mikro	Perseorangan	MEMASANG BAN	MEMASANG BAN	KRISTIAN EDI WALUYO WIBISONO	JL. SLAMET RIYADI NO. 25, DESA/KELURAHAN KLEGEN, KEC. KARTOHARJO, KOTA MADIUN	Kartoharjo	KLEGEN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	5000000	3	081234567100	kristianediwaluyowibisono100@gmail.com	2026-01-11	MEMASANG BAN	KRISTIAN EDI WALUYO WIBISONO	JL. SLAMET RIYADI NO. 25, DESA/KELURAHAN KLEGEN, KEC. KARTOHARJO, KOTA MADIUN	\N	\N	Kuliner	Aktif	ID35110000000100	\N	\N	\N	2026-04-03 04:09:24	\N	\N
101	9120000000101	3573010000000101	Mikro	Perseorangan	NASI BOX	NASI BOX	ULFA NURDIANA	JL. SIAK 33 B RT. 33 RW. 11, DESA/KELURAHAN PANDEAN, KEC. TAMAN	Taman	PANDEAN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	10000000	4	081234567101	ulfanurdiana101@gmail.com	2026-01-12	NASI BOX	ULFA NURDIANA	JL. SIAK 33 B RT. 33 RW. 11, DESA/KELURAHAN PANDEAN, KEC. TAMAN	\N	\N	Kuliner	Aktif	ID35110000000101	\N	\N	\N	2026-04-03 04:09:24	\N	\N
102	9120000000102	3573010000000102	Mikro	Perseorangan	NASI BOX	NASI BOX	MARSINI	PERUM SERAYU INDAH BLOK B-07, RT. 045, RW.015, DESA/KELURAHAN PANDEAN, KEC. TAMAN	Taman	PANDEAN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	15000000	2	081234567102	marsini102@gmail.com	2026-01-13	NASI BOX	MARSINI	PERUM SERAYU INDAH BLOK B-07, RT. 045, RW.015, DESA/KELURAHAN PANDEAN, KEC. TAMAN	\N	\N	Kuliner	Aktif	\N	\N	\N	\N	2026-04-03 04:09:24	\N	\N
103	9120000000103	3573010000000103	Mikro	Perseorangan	NASI AYAM LAOS	NASI AYAM LAOS	SRI WAHYUNI	JL. INDRAGIRI NO 32, DESA/KELURAHAN PANDEAN, KEC. TAMAN	Taman	PANDEAN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	20000000	3	081234567103	sriwahyuni103@gmail.com	2026-01-14	NASI AYAM LAOS	SRI WAHYUNI	JL. INDRAGIRI NO 32, DESA/KELURAHAN PANDEAN, KEC. TAMAN	\N	\N	Kuliner	Aktif	ID35110000000103	\N	\N	\N	2026-04-03 04:09:24	\N	\N
104	9120000000104	3573010000000104	Mikro	Perseorangan	GUDEG, AYAM BAKAR	GUDEG, AYAM BAKAR	HARRY KUSUMA HENDRIYANTO	JL. SERAYU TIMUR V NO 4, DESA/KELURAHAN PANDEAN, KEC. TAMAN	Taman	PANDEAN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	25000000	4	081234567104	harrykusumahendriyanto104@gmail.com	2026-01-15	GUDEG, AYAM BAKAR	HARRY KUSUMA HENDRIYANTO	JL. SERAYU TIMUR V NO 4, DESA/KELURAHAN PANDEAN, KEC. TAMAN	\N	\N	Kuliner	Aktif	ID35110000000104	\N	\N	\N	2026-04-03 04:09:24	\N	\N
105	9120000000105	3573010000000105	Mikro	Perseorangan	NASI KOTAK	NASI KOTAK	LILIK WAHYUNINGSIH	JL. TUNTANG NO. 19 RT. 41 RW. 14, DESA/KELURAHAN PANDEAN, KEC. TAMAN	Taman	PANDEAN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	5000000	2	081234567105	lilikwahyuningsih105@gmail.com	2026-01-16	NASI KOTAK	LILIK WAHYUNINGSIH	JL. TUNTANG NO. 19 RT. 41 RW. 14, DESA/KELURAHAN PANDEAN, KEC. TAMAN	\N	\N	Kuliner	Aktif	ID35110000000105	\N	\N	\N	2026-04-03 04:09:24	\N	\N
106	9120000000106	3573010000000106	Mikro	Perseorangan	SERUNDENG	SERUNDENG	EVA MAYA LAKSMINA DEWI	JL. SOEKARNO HATTA 39 , DESA/KELURAHAN DEMANGAN, KEC. TAMAN	Taman	DEMANGAN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	10000000	3	081234567106	evamayalaksminadewi106@gmail.com	2026-01-17	SERUNDENG	EVA MAYA LAKSMINA DEWI	JL. SOEKARNO HATTA 39 , DESA/KELURAHAN DEMANGAN, KEC. TAMAN	\N	\N	Kuliner	Aktif	ID35110000000106	\N	\N	\N	2026-04-03 04:09:24	\N	\N
107	9120000000107	3573010000000107	Mikro	Perseorangan	REPARASI MOTOR	REPARASI MOTOR	NOVEN DE GOLFO	JL. ANGGORO MANIS NO 4, DESA/KELURAHAN MANISREJO, KEC. TAMAN	Taman	MANISREJO	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	15000000	4	081234567107	novendegolfo107@gmail.com	2026-01-18	REPARASI MOTOR	NOVEN DE GOLFO	JL. ANGGORO MANIS NO 4, DESA/KELURAHAN MANISREJO, KEC. TAMAN	\N	\N	Kuliner	Aktif	ID35110000000107	\N	\N	\N	2026-04-03 04:09:24	\N	\N
108	9120000000108	3573010000000108	Mikro	Perseorangan	SAMBEL PECEL	SAMBEL PECEL	UMI SULISTIANY	JL. GEGONO MANIS 4A, DESA/KELURAHAN MANISREJO, KEC. TAMAN	Taman	MANISREJO	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	20000000	2	081234567108	umisulistiany108@gmail.com	2026-01-19	SAMBEL PECEL	UMI SULISTIANY	JL. GEGONO MANIS 4A, DESA/KELURAHAN MANISREJO, KEC. TAMAN	\N	\N	Kuliner	Aktif	\N	\N	\N	\N	2026-04-03 04:09:24	\N	\N
109	9120000000109	3573010000000109	Kecil	Perseorangan	KAIN	KAIN	ELLYSA SANTOSO	JL. P. SUDIRMAN 265 MADIUNDESA/KELURAHAN PANDEAN, KEC. TAMAN, KOTA MADIUN	Taman	TAMAN	56101	Penyediaan Makanan dan Minuman (Kuliner)	Rendah	26000005	15	081234567109	ellysasantoso01@gmail.com	2026-01-20	KAIN	ELLYSA SANTOSO	JL. P. SUDIRMAN 265 MADIUNDESA/KELURAHAN PANDEAN, KEC. TAMAN, KOTA MADIUN	\N	\N	Kuliner	Aktif	ID35110000000109	BPOM02	\N	\N	2026-04-03 04:09:24	2026-07-24 14:20:28	\N
111	9120000000667	3573010000000667	Mikro	Makanan Minuman	CInta Sejati Makmur	CInta Sejati Makmur	Bu Cinta	Jl. Selalu Sayang 55	Taman	Kartoharjo	11090	Industri Minuman Dengan Pengolahan	Mikro	100000000	88	085655488220	bagfas.ikmjuara@gmail.com	2026-07-15	CInta Sejati Makmur	Bu Cinta	Jl. Selalu Sayang 55	\N	\N	\N	Aktif	ID7723724149294920	u2372747	724274727	ID727742	2026-07-24 15:08:24	\N	\N
113	5309033439831	3573407473554860	Kecil	Ninin Lia Herlina	Ninin Lia Herlina	Mebel Kayu	Joko Anwar	JL Purwosari NO. 55	Taman	Kejuron	10799	INDUSTRI PRODUK MAKANAN LAINNYA YTDL	Menengah Rendah	225000000	2	089516488224	nininliaherlina@gmail.com	\N	Kerajinan Kayu Jati	Joko Anwar	Jl. Cokroaminoto	\N	\N	\N	Aktif	\N	\N	\N	\N	2026-07-29 10:36:25	2026-07-30 15:08:59	\N
114	9999999999999	3577019999999999	Mikro	Pangan	Test Verifikasi Perusahaan	\N	Test Verifikasi Pemilik	Jl. Test No 17	Taman	Pandean	\N	\N	\N	0	1	085712345678	\N	\N	Test Verifikasi Perusahaan	Test Verifikasi Pemilik	Jl. Test No 17	\N	\N	\N	Aktif	\N	\N	\N	\N	2026-07-31 07:55:18	\N	\N
115	5089747908747	3573336890980650	Kecil	Metal dan Mesin	Bengkel Las Jaya Madiun	Pagar dan Teralis	Hendra Gunawan	Jl. Thamrin No. 45	Kartoharjo	Klegen	10795	INDUSTRI SARI NABATI DAN KRIMER NABATI	Menengah Tinggi	3300067800	10	081234567897	-	\N	Bengkel Las Jaya Madiun	Hendra Gunawan	Jl. Thamrin No. 45	\N	\N	\N	Aktif	\N	\N	\N	\N	2026-07-31 08:55:35	\N	\N
116	5089747908746	3528838888888883	Mikro	Pangan	Nilahi	Roti Basah	Nilainahitadil	Perum Panorama Wilis 84	Taman	Pandean	10792	INDUSTRI KUE BASAH	Rendah	20000000000	2	0856365357375	-	\N	Nilahi	Nilainahitadil	Perum Panorama Wilis 84	\N	\N	\N	Aktif	\N	\N	\N	\N	2026-07-31 09:00:52	\N	\N
117	1111222233334	3577111122223333	Kecil	Sandang	IKM Sepatu Keren Madiun	Sepatu Kulit Asli	Samsul Arifin	Jl. Pahlawan No. 12	Kartoharjo	Kanigoro	15201	Industri Sepatu Olahraga	Rendah	500000000	5	081234567800	-	\N	IKM Sepatu Keren Madiun	Samsul Arifin	Jl. Pahlawan No. 12	\N	\N	\N	Aktif	\N	\N	\N	\N	2026-07-31 09:07:27	\N	\N
118	9999888877776	3577999988887777	Mikro	Pangan	IKM Sambal Pecel Asli	Sambal Pecel Madiun	Siti Rohmah	Jl. Salak No. 8	Taman	Manisrejo	10799	Industri Produk Makanan Lainnya	Rendah	15000000	2	081234567811	-	\N	IKM Sambal Pecel Asli	Siti Rohmah	Jl. Salak No. 8	\N	\N	\N	Aktif	\N	\N	\N	\N	2026-07-31 09:07:28	\N	\N
\.


--
-- Data for Name: pelaku_usahas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pelaku_usahas (id, nib, nik, skala_usaha, jenis_perusahaan, nama_perusahaan, nama_proyek, nama_pemilik, alamat_usaha, kecamatan, kelurahan, kbli, uraian_kbli, tingkat_risiko, investasi, tenaga_kerja, no_telp, email, tgl_terbit, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: permohonan_hki_merek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.permohonan_hki_merek (id, nama_lengkap, nik, nib, nama_merek, kelas_merek, alamat_ktp, alamat_usaha, no_hp, file_ktp, file_nib, file_etiket_merek, file_surat_pernyataan, status, catatan_admin, created_at, updated_at, uraian_barang_jasa, link_gdrive_rekom) FROM stdin;
2	Yanuar Priambodo	3577020102650003	1306250070146	Mbok DE	Kelas 29 (Makanan Olahan Daging/Buah/Sayur)	Jl. Gulun No 5-B	Jl. Gulun No 5-B	085655480223	/uploads/hki_merek/1785429223_ktp_6a6b7ce791e2a.png	/uploads/hki_merek/1785429223_nib_6a6b7ce792942.png	/uploads/hki_merek/1785429223_etiket_6a6b7ce792ebe.jpeg	/uploads/hki_merek/1785429223_surat_6a6b7ce793249.jpeg	Disetujui	\N	2026-07-30 16:33:43	2026-07-30 16:51:20	\N	https://drive.google.com/file/d/1wGe1dlYHBxDHs9lLmjYc5PBN8uT_LDiU/view?usp=drive_link
6	SRI WULANDARI	3577020605680055	2504250023077	Sintara	30	Jl. Salak No. 84, Kel. Taman, Kec. Taman	Jl. Salak No. 84, Kel. Taman, Kec. Taman	082143131616	/uploads/hki_merek/1785455927_ktp_6a6be537053d3.jpeg	/uploads/hki_merek/1785455927_nib_6a6be53705dba.pdf	/uploads/hki_merek/1785455927_etiket_6a6be5370668f.png	/uploads/hki_merek/1785455927_surat_6a6be53706f7d.pdf	Disetujui	\N	2026-07-30 23:58:47	2026-10-20 21:39:00	Sambal Pecel	https://ikmjuara.my.id/dukungan/siinas
3	Siti Aminah Testing	3577025501920005	9120000888999	Kue Madiun Juara	Kelas 30 (Kopi, Teh, Bumbu, Roti, Sambal, Kue)	Jl. Pandean No. 8, Madiun	Jl. Pandean No. 8, Madiun	085712345678	\N	\N	\N	\N	Pending	\N	2026-07-30 16:47:16	2026-11-22 20:44:07	\N	https://drive.google.com/file/d/1wGe1dlYHBxDHs9lLmjYc5PBN8uT_LDiU/view?usp=drive_link
\.


--
-- Data for Name: peta_sebaran; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.peta_sebaran (id, nama_usaha, pemilik, nib, nik, no_hp, produk, alamat_jalan, alamat_no, kelurahan, kecamatan, kota_madiun, kategori, skala_usaha, latitude, longitude, created_at, updated_at, tingkat_risiko, kbli, uraian_kbli, investasi, tenaga_kerja, status_halal, no_halal, status_bpom_cppob, no_bpom_cppob, status_sni, no_sni, status_hki_merek, no_hki_merek, nama_merek, tgl_terbit_legalitas, link_gdrive_legalitas, link_gdrive_nib, link_gdrive_halal, link_gdrive_bpom_cppob, link_gdrive_sni, link_gdrive_hki_merek, tgl_berakhir_hki, is_legalitas_tracked, status_tkdn, no_sertifikat_tkdn, persentase_tkdn, link_gdrive_tkdn, nomor_transaksi_hki, kelas_merek, link_tanda_daftar_hki, tipe_permohonan_hki, no_daftar_halal, tgl_daftar_halal, tgl_sertifikat_halal, nama_fasilitator_halal) FROM stdin;
1	Lapak UMKM Kartini	Budi	9120000000001	3573010000000001	081234567001	Lapak UMKM Kartini	Jl. Kartini 55, Madiun	-	Madiun Lor	Manguharjo	Kota Madiun	Pangan	Mikro	-7.62180000	111.52340000	2026-07-27 15:14:21	2026-07-30 04:57:38	Rendah	10799	Industri Produk Makanan Lainnya	310000000.00	7	Ada	ID35110000408721	Ada	MD 4607325281	Ada	SNI 01-7843-2025	Ada	\N	Lapak UMKM Kartini	2026-07-30	\N	\N	\N	\N	\N	\N	2026-09-14	t	Ada	TKDN/IK/2025/00101	32.50%	https://drive.google.com/file/d/1cc9e77b5f2830411/view	\N	\N	\N	\N	\N	\N	\N	\N
2	Kentang - Krezznya Madiun	Yanuar	9120000000004	3573010000000004	081234567004	Kentang - Krezznya Madiun	Jl. Oro Oro Ombo No 8, Kota Madiun, Jawa Timur, Jawa, 63117, Indonesia	-	Oro-Oro Ombo	Kartoharjo	Kota Madiun	Pangan	Mikro	-7.62670600	111.52871670	2026-07-27 15:14:21	2026-07-27 15:14:21	Rendah	10799	Industri Produk Makanan Lainnya	125000000.00	15	Belum	\N	Belum	\N	Belum	\N	Ada	IPT2025262311	Kentang - Krezznya Madiun	2026-07-07	\N	\N	\N	\N	\N	\N	2031-07-29	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	RUJAK BUAH MARIYADI	Yanuar	9120000000008	3573010000000242	081234567008	RUJAK BUAH MARIYADI	Jl. Rimba Darma 87	-	Oro-Oro Ombo	Kartoharjo	Kota Madiun	Sandang	Mikro	-7.62735590	111.52725480	2026-07-27 15:14:21	2026-07-29 13:13:13	Rendah	14111	Industri Pakaian Jadi (Konveksi) Dari Tekstil	135000000.00	14	Belum	\N	Belum	\N	Belum	\N	Belum	\N	\N	2026-03-14	\N	\N	\N	\N	\N	\N	\N	f	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	Rido Aluna	AR LUNIA	9120000000009	3573010000000009	081234567009	Rido Aluna	Jl. Panglima Sudirman NO 66	-	Kejuron	Taman	Kota Madiun	Pangan	Mikro	-7.63095400	111.52190400	2026-07-27 15:14:21	2026-07-30 05:18:25	Rendah	10710	Industri Produk Roti Dan Kue	330000000.00	11	Belum	\N	Belum	\N	Belum	\N	Belum	\N	\N	2025-10-11	\N	\N	\N	\N	\N	\N	\N	f	Ada	TKDN/IK/2025/00104	55.10%	https://drive.google.com/file/d/1b8966e68b23ad722/view	\N	\N	\N	\N	\N	\N	\N	\N
5	Pisang Coklat	Agus Budiono	9120000000010	3573010000000010	081234567010	Pisang Coklat	Kejuron, Kota Madiun, Jawa Timur, Jawa, 63139, Indonesia	-	Kejuron	Taman	Kota Madiun	Pangan	Mikro	-7.63841500	111.52573070	2026-07-27 15:14:21	2026-07-27 15:14:21	Rendah	10794	Industri Kerupuk, Keripik, Peyek Dan Sejenisnya	115000000.00	3	Ada	ID35110000971797	Proses	\N	Belum	\N	Ada	IPT2025140818	Pisang Coklat	2025-10-22	\N	\N	\N	\N	\N	\N	2026-09-26	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	Rido Aluna	AR LUNIA	9120000000009	3573010000000009	081234567009	Rido Aluna	Jl. Panglima Sudirman NO 66	-	Kejuron	Taman	Kota Madiun	Pangan	Mikro	-7.63418989	111.52665234	2026-07-27 15:14:21	2026-07-30 04:57:38	Rendah	10794	Industri Kerupuk, Keripik, Peyek Dan Sejenisnya	230000000.00	15	Proses	\N	Belum	\N	Belum	\N	Belum	\N	\N	2026-03-07	\N	\N	\N	\N	\N	\N	\N	t	Proses	\N	38.90%	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	WAFFLE KERING	HARI FITRI	9120000000013	3573010000000013	081234567013	WAFFLE KERING	JL. COKROAMINOTO GG. RINGIN 8	-	Kejuron	Taman	Kota Madiun	Pangan	Mikro	-7.63485660	111.51953990	2026-07-27 15:14:21	2026-07-30 04:57:38	Rendah	11090	Industri Minuman Ringan Lainnya	275000000.00	12	Ada	ID35110000564001	Ada	MD 9724869506	Ada	SNI 01-3859-2025	Belum	\N	\N	2026-04-15	\N	\N	\N	\N	\N	\N	\N	t	Ada	TKDN/IK/2025/00107	45.00%	https://drive.google.com/file/d/1a07d14d0c2ec22aa/view	\N	\N	\N	\N	\N	\N	\N	\N
8	ANEKA KUE BASAH | \nANEKA KUE KERING | \nCATERING | \nRISOL FROZEN	SITI NURUL RAHAYUWATI	9120000000014	3573010000000014	081234567014	ANEKA KUE BASAH | \nANEKA KUE KERING | \nCATERING | \nRISOL FROZEN	PERUM GRIYA KITA BLOK B-8	-	Winongo	Manguharjo	Kota Madiun	Pangan	Mikro	-7.61916870	111.50548550	2026-07-27 15:14:21	2026-07-30 08:11:35	Rendah	10794	Industri Kerupuk, Keripik, Peyek Dan Sejenisnya	60000000.00	2	Belum	\N	Belum	\N	Belum	\N	Belum	\N	\N	2026-06-01	\N	\N	\N	\N	\N	\N	\N	f	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	UNTIR-UNTIR | \nKUPING GAJAH | \nCUMI-CUMI  | \nSTIK KEJU | \nSTIK SELEDRI | \nKERING KENTANG	SUMARNI	9120000000015	3573010000000015	081234567015	UNTIR-UNTIR | \nKUPING GAJAH | \nCUMI-CUMI  | \nSTIK KEJU | \nSTIK SELEDRI | \nKERING KENTANG	JL. SRIGADING 12 A	-	Oro-Oro Ombo	Kartoharjo	Kota Madiun	Pangan	Mikro	-7.62149690	111.53127870	2026-07-27 15:14:21	2026-07-27 15:14:21	Rendah	10794	Industri Kerupuk, Keripik, Peyek Dan Sejenisnya	220000000.00	2	Ada	ID35110000201769	Proses	\N	Belum	\N	Belum	\N	\N	2025-11-06	\N	\N	\N	\N	\N	\N	\N	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	KEBAB	ARRI WIDYA DAMAYANTI	9120000000016	3573010000000016	081234567016	KEBAB	JALAN ANEKA SARI NO 10 REJOMULYO MADIUN	-	Rejomulyo	Kartoharjo	Kota Madiun	Pangan	Mikro	-7.61865830	111.53667330	2026-07-27 15:14:21	2026-07-30 04:57:38	Rendah	10794	Industri Kerupuk, Keripik, Peyek Dan Sejenisnya	325000000.00	14	Belum	\N	Ada	MD 9457250886	Belum	\N	Belum	\N	\N	2025-11-24	\N	\N	\N	\N	\N	\N	\N	t	Ada	TKDN/IK/2025/00110	67.15%	https://drive.google.com/file/d/144de5bd8f29131b3/view	\N	\N	\N	\N	\N	\N	\N	\N
11	MAKARONI	DIMAS SETIAWAN	9120000000017	3573010000000017	081234567017	MAKARONI	JL PANGLIMA SUDIRMAN GG JAMBE 14	-	Kejuron	Taman	Kota Madiun	Pangan	Mikro	-7.63170770	111.52396600	2026-07-27 15:14:21	2026-07-30 04:57:38	Rendah	10710	Industri Produk Roti Dan Kue	90000000.00	13	Ada	ID35110000905598	Belum	\N	Belum	\N	Ada	IPT2025515675	MAKARONI	2026-04-04	\N	\N	\N	\N	\N	\N	2034-07-29	t	Proses	\N	32.50%	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	CAMILAN DAN MAKANAN	RETNO INDARTI	9120000000018	3573010000000018	081234567018	CAMILAN DAN MAKANAN	JL CATUR JAYA SIDOMULYO 1 NO.35	-	Kanigoro	Kartoharjo	Kota Madiun	Pangan	Mikro	-7.63087440	111.54151180	2026-07-27 15:14:21	2026-07-27 15:14:21	Rendah	10799	Industri Produk Makanan Lainnya	65000000.00	4	Belum	\N	Belum	\N	Belum	\N	Belum	\N	\N	2026-03-05	\N	\N	\N	\N	\N	\N	\N	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13	SULAM BORDIR | \nSAMBEL PECEL	ASTUTIK	9120000000019	3573010000000019	081234567019	SULAM BORDIR | \nSAMBEL PECEL	JL. KIAGENG PEMANAHAN L.269/19 RT.029 RW.007 KEL. KANIGORO	-	Kanigoro	Kartoharjo	Kota Madiun	Pangan	Mikro	-7.62704000	111.54698820	2026-07-27 15:14:21	2026-07-30 04:57:38	Rendah	11090	Industri Minuman Ringan Lainnya	110000000.00	2	Ada	ID35110000193423	Ada	MD 2060207317	Ada	SNI 01-6211-2025	Belum	\N	\N	2026-05-09	\N	\N	\N	\N	\N	\N	\N	t	Ada	TKDN/IK/2025/00113	48.75%	https://drive.google.com/file/d/1bdbfa0ed63601653/view	\N	\N	\N	\N	\N	\N	\N	\N
14	SAMBEL PECEL	RATNAWATI AL HASAN	9120000000020	3573010000000020	081234567020	SAMBEL PECEL	JLN TAMAN ASRI NO 4 MADIUN	-	Banjarejo	Taman	Kota Madiun	Pangan	Mikro	-7.65178660	111.52746880	2026-07-27 15:14:21	2026-07-27 15:14:21	Rendah	11090	Industri Minuman Ringan Lainnya	265000000.00	14	Belum	\N	Belum	\N	Belum	\N	Ada	IPT2025356596	SAMBEL PECEL	2026-03-23	\N	\N	\N	\N	\N	\N	2031-07-29	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15	MINUMAN JAMU | \nKOPI REMPAH	SUMARNI	9120000000021	3573010000000021	081234567021	MINUMAN JAMU | \nKOPI REMPAH	JL. SRI GADIS GG. MELATI NO. 8 F	-	Kanigoro	Kartoharjo	Kota Madiun	Pangan	Mikro	-7.63302660	111.54596870	2026-07-27 15:14:21	2026-07-27 15:14:21	Rendah	10710	Industri Produk Roti Dan Kue	260000000.00	7	Ada	ID35110000875592	Belum	\N	Belum	\N	Proses	\N	MINUMAN JAMU | \nKOPI REMPAH	2026-05-05	\N	\N	\N	\N	\N	\N	2026-07-01	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16	SAMBEL PECEL	HERUWATI	9120000000020	3573010000000020	081234567020	SAMBEL PECEL	JLN BOROBUDUR NO 4-G	-	Madiun Lor	Taman	Kota Madiun	Pangan	Mikro	-7.61219970	111.52660040	2026-07-27 15:14:21	2026-07-30 04:57:38	Rendah	11090	Industri Minuman Ringan Lainnya	75000000.00	15	Proses	\N	Ada	MD 7437723294	Belum	\N	Belum	\N	\N	2026-01-22	\N	\N	\N	\N	\N	\N	\N	t	Ada	TKDN/IK/2025/00116	38.90%	https://drive.google.com/file/d/1305dab55a37a7348/view	\N	\N	\N	\N	\N	\N	\N	\N
17	SAMBEL PECEL	SULISTIYOWATI	9120000000020	3573010000000020	081234567020	SAMBEL PECEL	JL. GULUN NO 5-B RT 48 RW 15	-	Kejuron	Taman	Kota Madiun	Pangan	Mikro	-7.63347000	111.52599180	2026-07-27 15:14:21	2026-07-27 15:14:21	Rendah	10794	Industri Kerupuk, Keripik, Peyek Dan Sejenisnya	240000000.00	7	Ada	ID35110000444567	Proses	\N	Belum	\N	Ada	IPT2025878327	SAMBEL PECEL	2025-11-21	\N	\N	\N	\N	\N	\N	2026-08-11	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18	SAMBEL PECEL	ULUL SUFIANA	9120000000020	3573010000000020	081234567020	SAMBEL PECEL	JL ROKAN NO. 1 RT 48/ RW 15 TAMAN	-	Taman	Taman	Kota Madiun	Pangan	Mikro	-7.64578840	111.52219310	2026-07-27 15:14:21	2026-07-27 15:14:21	Rendah	10794	Industri Kerupuk, Keripik, Peyek Dan Sejenisnya	65000000.00	5	Belum	\N	Belum	\N	Belum	\N	Belum	\N	\N	2026-03-26	\N	\N	\N	\N	\N	\N	\N	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19	KEBAB	WAHYU WISMA PRIYANI	9120000000016	3573010000000016	081234567016	KEBAB	JL GEGONO MANIS G3/11 MANISREJO	-	Manisrejo	Kartoharjo	Kota Madiun	Pangan	Mikro	-7.64046300	111.54173450	2026-07-27 15:14:21	2026-07-30 04:57:38	Rendah	10710	Industri Produk Roti Dan Kue	165000000.00	8	Ada	ID35110000892131	Ada	MD 5300764784	Ada	SNI 01-1419-2025	Belum	\N	\N	2026-02-03	\N	\N	\N	\N	\N	\N	\N	t	Ada	TKDN/IK/2025/00119	29.80%	https://drive.google.com/file/d/1285d068911fdc4bb/view	\N	\N	\N	\N	\N	\N	\N	\N
20	SAMBEL PECEL | \nKERING KENTANG	NOVITA DWI HARINI	9120000000026	3573010000000026	081234567026	SAMBEL PECEL | \nKERING KENTANG	JALAN WUNI NO.12, KEJURON,	-	Kejuron	Taman	Kota Madiun	Pangan	Mikro	-7.63286220	111.52380410	2026-07-27 15:14:21	2026-07-27 15:14:21	Rendah	11090	Industri Minuman Ringan Lainnya	125000000.00	6	Belum	\N	Belum	\N	Belum	\N	Ada	IPT2025694389	SAMBEL PECEL | \nKERING KENTANG	2026-05-01	\N	\N	\N	\N	\N	\N	2030-07-29	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21	SAMBEL PECEL	CHAIRATUN LIES SETYORINI	9120000000020	3573010000000020	081234567020	SAMBEL PECEL	H.O.S.COKROAMINOTO,GG: RINGIN NO 3 , MADIUN	-	Kejuron	Taman	Kota Madiun	Pangan	Mikro	-7.63681470	111.52098690	2026-07-27 15:14:21	2026-07-30 04:57:38	Rendah	10792	Industri Bumbu Masak Dan Penyedap Masakan	80000000.00	8	Ada	ID35110000567087	Proses	\N	Belum	\N	Belum	\N	\N	2026-03-12	\N	\N	\N	\N	\N	\N	\N	t	Proses	\N	32.50%	\N	\N	\N	\N	\N	\N	\N	\N	\N
22	BENGKEL LAS	RUSMANTO	9120000000028	3573010000000028	081234567028	BENGKEL LAS	JL.MIJIL SULASTRI,	-	Sogaten	Manguharjo	Kota Madiun	Pangan	Mikro	-7.60924870	111.52367010	2026-07-27 15:14:21	2026-07-30 04:57:38	Rendah	10792	Industri Bumbu Masak Dan Penyedap Masakan	290000000.00	13	Belum	\N	Ada	MD 3226386722	Belum	\N	Proses	\N	BENGKEL LAS	2025-12-16	\N	\N	\N	\N	\N	\N	2026-07-19	t	Ada	TKDN/IK/2025/00122	41.20%	https://drive.google.com/file/d/122b0b057ad5d3adf/view	\N	\N	\N	\N	\N	\N	\N	\N
23	KERAJINAN SULAM	R.R.YOENI ASTOETI	9120000000029	3573010000000029	081234567029	KERAJINAN SULAM	JL. BANDA NO.18	-	Madiun Lor	Manguharjo	Kota Madiun	Pangan	Mikro	-7.62184430	111.52717390	2026-07-27 15:14:21	2026-07-27 15:14:21	Rendah	10799	Industri Produk Makanan Lainnya	100000000.00	12	Ada	ID35110000350058	Belum	\N	Belum	\N	Ada	IPT2025410988	KERAJINAN SULAM	2026-06-16	\N	\N	\N	\N	\N	\N	2030-07-29	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
24	NASI BOX	MARTATIK	9120000000030	3573010000000030	081234567030	NASI BOX	Jl. Setinggil No. 19 RT. 30 RW. 01	-	Demangan	Taman	Kota Madiun	Pangan	Mikro	-7.65933520	111.51552970	2026-07-27 15:14:21	2026-07-27 15:14:21	Rendah	10799	Industri Produk Makanan Lainnya	150000000.00	8	Belum	\N	Belum	\N	Belum	\N	Belum	\N	\N	2026-01-16	\N	\N	\N	\N	\N	\N	\N	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
25	BRONDONG, JIPANG	TUTIK RAHAYU	9120000000031	3573010000000031	081234567031	BRONDONG, JIPANG	JL MANGGA XIII/3-B	-	Kejuron	Taman	Kota Madiun	Pangan	Mikro	-7.63354170	111.52143030	2026-07-27 15:14:21	2026-07-30 04:57:38	Rendah	10710	Industri Produk Roti Dan Kue	55000000.00	6	Ada	ID35110000718438	Ada	MD 4095916147	Ada	SNI 01-8633-2025	Belum	\N	\N	2025-11-25	\N	\N	\N	\N	\N	\N	\N	t	Ada	TKDN/IK/2025/00125	62.40%	https://drive.google.com/file/d/1516b9027d41ac325/view	\N	\N	\N	\N	\N	\N	\N	\N
26	PENTOL CORAH	APRILIA	9120000000032	3573010000000032	081234567032	PENTOL CORAH	JALAN DELIMA NO9 BLK MADIUN	-	Kejuron	Taman	Kota Madiun	Pangan	Mikro	-7.63294370	111.52087400	2026-07-27 15:14:21	2026-07-30 04:57:38	Rendah	10794	Industri Kerupuk, Keripik, Peyek Dan Sejenisnya	290000000.00	6	Proses	\N	Belum	\N	Belum	\N	Ada	IPT2025835084	PENTOL CORAH	2026-05-30	\N	\N	\N	\N	\N	\N	2033-07-29	t	Proses	\N	38.90%	\N	\N	\N	\N	\N	\N	\N	\N	\N
27	NUGGET AYAM	BARIAH SUCIATI	9120000000033	3573010000000033	081234567033	NUGGET AYAM	Jl. Taman Raya, No. 3, RT 027, TW 007, Kelurahan Banjareho, Kecamatan Taman, Kota Madiun, Jawa Timur 63137	-	Banjarejo	Taman	Kota Madiun	Pangan	Mikro	-7.65641960	111.53260680	2026-07-27 15:14:21	2026-07-27 15:14:21	Rendah	10792	Industri Bumbu Masak Dan Penyedap Masakan	160000000.00	10	Ada	ID35110000677091	Belum	\N	Belum	\N	Belum	\N	\N	2025-11-29	\N	\N	\N	\N	\N	\N	\N	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
28	BENGKEL MOTOR	PUDJI HARTONO	9120000000034	3573010000000034	081234567034	BENGKEL MOTOR	JALAN KAPTEN TENDEAN NO.50, BANJAREJO	-	Banjarejo	Taman	Kota Madiun	Pangan	Mikro	-7.66067890	111.53165700	2026-07-27 15:14:21	2026-07-30 04:57:38	Rendah	10792	Industri Bumbu Masak Dan Penyedap Masakan	90000000.00	10	Belum	\N	Ada	MD 2869242044	Belum	\N	Belum	\N	\N	2026-07-09	\N	\N	\N	\N	\N	\N	\N	t	Ada	TKDN/IK/2025/00128	52.30%	https://drive.google.com/file/d/199fa93786901d77f/view	\N	\N	\N	\N	\N	\N	\N	\N
29	AKSESORIS	HESTY IRAWATI	9120000000035	3573010000000035	081234567035	AKSESORIS	JL. TAWANG BHAKTI NO. 24 A RT. 021 RW. 006	-	Tawangrejo	Kartoharjo	Kota Madiun	Pangan	Mikro	-7.60686230	111.53715920	2026-07-27 15:14:21	2026-07-27 15:14:21	Rendah	10794	Industri Kerupuk, Keripik, Peyek Dan Sejenisnya	185000000.00	13	Ada	ID35110000885248	Proses	\N	Belum	\N	Ada	IPT2025514070	AKSESORIS	2025-11-10	\N	\N	\N	\N	\N	\N	2026-08-08	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
30	SAMBEL	ENGGAR LESTARI RAHAYU	9120000000036	3573010000000036	081234567036	SAMBEL	"JL. TAWANGBARU RT 09, RW 02, KEL TAWANGREJO, KEC KARTOHARJO"	-	Tawangrejo	Kartoharjo	Kota Madiun	Pangan	Mikro	-7.63337180	111.52644020	2026-07-27 15:14:21	2026-07-27 15:14:21	Rendah	11090	Industri Minuman Ringan Lainnya	315000000.00	2	Belum	\N	Belum	\N	Belum	\N	Belum	\N	\N	2026-01-05	\N	\N	\N	\N	\N	\N	\N	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
31	ROTI BAKERY	ENGGAR LESTARI RAHAYU	9120000000037	3573010000000037	081234567037	ROTI BAKERY	JL. TAWANGBARU RT 09, RW 02, KEL TAWANGREJO, KEC KARTOHARJO	-	Tawangrejo	Kartoharjo	Kota Madiun	Pangan	Mikro	-7.60076460	111.54512950	2026-07-27 15:14:21	2026-07-30 04:57:38	Rendah	10792	Industri Bumbu Masak Dan Penyedap Masakan	165000000.00	12	Ada	ID35110000732701	Ada	MD 5012675706	Ada	SNI 01-7193-2025	Belum	\N	\N	2026-07-05	\N	\N	\N	\N	\N	\N	\N	t	Ada	TKDN/IK/2025/00131	32.50%	https://drive.google.com/file/d/10a2354d036c87bec/view	\N	\N	\N	\N	\N	\N	\N	\N
32	NASI BOX	MULYANI	9120000000030	3573010000000030	081234567030	NASI BOX	JALAN SERAYU BARAT NO 52B, DESA/KELURAHAN PANDEAN, KEC. TAMAN	-	Pandean	Taman	Kota Madiun	Pangan	Mikro	-7.64589660	111.52003560	2026-07-27 15:14:21	2026-07-27 15:14:21	Rendah	10792	Industri Bumbu Masak Dan Penyedap Masakan	90000000.00	3	Belum	\N	Belum	\N	Belum	\N	Ada	IPT2025757919	NASI BOX	2026-03-01	\N	\N	\N	\N	\N	\N	2034-07-29	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
33	SAMBEL PECEL	SUTIKNYO	9120000000020	3573010000000020	081234567020	SAMBEL PECEL	JL TIRTO MANIS 1 NO 13 MADIUN, DESA/KELURAHAN MANISREJO, KEC. TAMAN	-	Manisrejo	Taman	Kota Madiun	Pangan	Mikro	-7.63781220	111.54490390	2026-07-27 15:14:21	2026-07-27 15:14:21	Rendah	11090	Industri Minuman Ringan Lainnya	135000000.00	2	Ada	ID35110000805609	Proses	\N	Belum	\N	Belum	\N	\N	2026-05-23	\N	\N	\N	\N	\N	\N	\N	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
34	SUSU SARI KEDELAI	FADLITSANIYA ABSHAR NURRAMADAN	9120000000040	3573010000000040	081234567040	SUSU SARI KEDELAI	JL.NGEBONG RT10/RW03, BANJAREJO, TAMAN, MADIUN, DESA/KELURAHAN BANJAREJO, KEC. TAMAN	-	Banjarejo	Taman	Kota Madiun	Pangan	Mikro	-7.65456770	111.52997380	2026-07-27 15:14:21	2026-07-30 04:57:38	Rendah	10794	Industri Kerupuk, Keripik, Peyek Dan Sejenisnya	25000000.00	15	Belum	\N	Ada	MD 6639266282	Belum	\N	Belum	\N	\N	2026-01-23	\N	\N	\N	\N	\N	\N	\N	t	Ada	TKDN/IK/2025/00134	55.10%	https://drive.google.com/file/d/17878cb0f1a5d14a4/view	\N	\N	\N	\N	\N	\N	\N	\N
35	KERIPIK DAN KEBAB	HUDA UMAR ALKAFF	9120000000041	3573010000000041	081234567041	KERIPIK DAN KEBAB	JL.PARIANOM B4 NO.33, DESA/KELURAHAN SOGATEN, KEC. MANGUHARJO, KOTA MADIUN,	-	Sogaten	Manguharjo	Kota Madiun	Pangan	Mikro	-7.60904130	111.52095490	2026-07-27 15:14:21	2026-07-27 15:14:21	Rendah	10794	Industri Kerupuk, Keripik, Peyek Dan Sejenisnya	340000000.00	2	Ada	ID35110000943309	Belum	\N	Belum	\N	Ada	IPT2025995170	KERIPIK DAN KEBAB	2026-02-12	\N	\N	\N	\N	\N	\N	2032-07-29	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
36	KUE TRADISIONAL	BETTY ARININGSIH	9120000000042	3573010000000042	081234567042	KUE TRADISIONAL	PERUM GRAND RESPATI A.27, DESA/KELURAHAN JOSENAN, KEC. TAMAN, KOTA MADIUN	-	Josenan	Taman	Kota Madiun	Pangan	Mikro	-7.65126590	111.51519700	2026-07-27 15:14:21	2026-07-30 04:57:38	Rendah	10794	Industri Kerupuk, Keripik, Peyek Dan Sejenisnya	235000000.00	5	Proses	\N	Belum	\N	Belum	\N	Proses	\N	KUE TRADISIONAL	2025-10-09	\N	\N	\N	\N	\N	\N	2026-07-20	t	Proses	\N	38.90%	\N	\N	\N	\N	\N	\N	\N	\N	\N
37	SAMBEL, ABON	SRI SUHARTINI	9120000000043	3573010000000043	081234567043	SAMBEL, ABON	JL. PRAJURITAN GG. TANGKIS I/6, DESA/KELURAHAN MADIUN LOR, KEC. MANGUHARJO, KOTA MADIUN	-	Madiun Lor	Manguharjo	Kota Madiun	Pangan	Mikro	-7.61808080	111.52124750	2026-07-27 15:14:21	2026-07-30 04:57:38	Rendah	11090	Industri Minuman Ringan Lainnya	345000000.00	14	Ada	ID35110000716912	Ada	MD 9085851490	Ada	SNI 01-2006-2025	Belum	\N	\N	2025-11-04	\N	\N	\N	\N	\N	\N	\N	t	Ada	TKDN/IK/2025/00137	45.00%	https://drive.google.com/file/d/196e60623cecc6466/view	\N	\N	\N	\N	\N	\N	\N	\N
38	WADER CRISPY	SUMINAH	9120000000044	3573010000000044	081234567044	WADER CRISPY	JALAN KAMPAR 46, DESA/KELURAHAN TAMAN, KEC. TAMAN,	-	Taman	Taman	Kota Madiun	Pangan	Mikro	-7.64281240	111.52248060	2026-07-27 15:14:21	2026-07-27 15:14:21	Rendah	10799	Industri Produk Makanan Lainnya	105000000.00	5	Belum	\N	Belum	\N	Belum	\N	Ada	IPT2025683473	WADER CRISPY	2026-01-12	\N	\N	\N	\N	\N	\N	2032-07-29	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
39	GORDEN, KELAMBU	IIS NINGTYAS	9120000000045	3573010000000045	081234567045	GORDEN, KELAMBU	JL. URIP SUMOHARJO NO. 04, DESA/KELURAHAN MANGUHARJO, KEC. MANGUHARJO	-	Manguharjo	Manguharjo	Kota Madiun	Pangan	Mikro	-7.62909320	111.51172960	2026-07-27 15:14:21	2026-07-27 15:14:21	Rendah	11090	Industri Minuman Ringan Lainnya	80000000.00	10	Ada	ID35110000734506	Belum	\N	Belum	\N	Belum	\N	\N	2026-07-13	\N	\N	\N	\N	\N	\N	\N	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
40	SAMBEL PECEL	AMIRUDIN	9120000000020	3573010000000020	081234567020	SAMBEL PECEL	JL. MURIA NO. 21/11, RT.002, RW.001, DESA/KELURAHAN PANGONGANGAN, KEC. MANGUHARJO	-	Pangongangan	Taman	Kota Madiun	Pangan	Mikro	-7.62897910	111.51530180	2026-07-27 15:14:21	2026-07-30 04:57:38	Rendah	10710	Industri Produk Roti Dan Kue	30000000.00	3	Belum	\N	Ada	MD 4332524898	Belum	\N	Belum	\N	\N	2026-03-18	\N	\N	\N	\N	\N	\N	\N	t	Ada	TKDN/IK/2025/00140	67.15%	https://drive.google.com/file/d/121b53a913ea5b19e/view	\N	\N	\N	\N	\N	\N	\N	\N
41	KERIPIK DAN SAMBAL PECEL	HARI TRI RAHAYU	9120000000047	3573010000000047	081234567047	KERIPIK DAN SAMBAL PECEL	PERUM WIDODO KENCONO INDAH 1 BLOK C-6 RT 56 RW 18, DESA/KELURAHAN PANDEAN, KEC. TAMAN	-	Pandean	Taman	Kota Madiun	Pangan	Mikro	-7.65004750	111.53251450	2026-07-27 15:14:21	2026-07-30 04:57:38	Rendah	10710	Industri Produk Roti Dan Kue	345000000.00	7	Ada	ID35110000353870	Proses	\N	Belum	\N	Ada	IPT2025374061	KERIPIK DAN SAMBAL PECEL	2025-10-30	\N	\N	\N	\N	\N	\N	2026-10-02	t	Proses	\N	32.50%	\N	\N	\N	\N	\N	\N	\N	\N	\N
42	BENGKEL LAS	MURDOKO	9120000000028	3573010000000028	081234567028	BENGKEL LAS	JL. SALAK NO. 32, DESA/KELURAHAN MOJOREJO, KEC. TAMAN	-	Mojorejo	Manguharjo	Kota Madiun	Pangan	Mikro	-7.64310320	111.53161050	2026-07-27 15:14:21	2026-07-27 15:14:21	Rendah	10792	Industri Bumbu Masak Dan Penyedap Masakan	345000000.00	13	Belum	\N	Belum	\N	Belum	\N	Belum	\N	\N	2026-05-05	\N	\N	\N	\N	\N	\N	\N	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
43	SAMBEL PECEL	SUTINI	9120000000020	3573010000000020	081234567020	SAMBEL PECEL	PERUM GRIYA SALAK BLOK B-51 RT 048 RW 016. PANDEAN. TAMAN	-	Pandean	Taman	Kota Madiun	Pangan	Mikro	-7.64426360	111.53023280	2026-07-27 15:14:21	2026-07-30 04:57:38	Rendah	10710	Industri Produk Roti Dan Kue	280000000.00	13	Ada	ID35110000454425	Ada	MD 6960975915	Ada	SNI 01-4169-2025	Proses	\N	SAMBEL PECEL	2025-10-06	\N	\N	\N	\N	\N	\N	2026-07-18	t	Ada	TKDN/IK/2025/00143	48.75%	https://drive.google.com/file/d/1573e08b3b64ec740/view	\N	\N	\N	\N	\N	\N	\N	\N
44	BAJU BORDIR	HENY MOERDANINGSIH	9120000000050	3573010000000050	081234567050	BAJU BORDIR	JL. DWI JAYA 3 NO. 9 MADIUN, DESA/KELURAHAN KLEGEN, KEC. KARTOHARJO, KOTA MADIUN	-	Klegen	Kartoharjo	Kota Madiun	Pangan	Mikro	-7.62859900	111.53984400	2026-07-27 15:14:21	2026-07-27 15:14:21	Rendah	10799	Industri Produk Makanan Lainnya	120000000.00	13	Belum	\N	Belum	\N	Belum	\N	Ada	IPT2025199560	BAJU BORDIR	2026-04-16	\N	\N	\N	\N	\N	\N	2028-07-29	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
45	KUE	DWI WAHYUNINGSIH	9120000000051	3573010000000051	081234567051	KUE	JL. MANDIRI PERUM RED TULIP BLOK A NO. 4, DESA/KELURAHAN DEMANGAN, KEC. TAMAN	-	Demangan	Taman	Kota Madiun	Pangan	Mikro	-7.65739580	111.52841580	2026-07-27 15:14:21	2026-07-27 15:14:21	Rendah	10710	Industri Produk Roti Dan Kue	170000000.00	4	Ada	ID35110000850073	Proses	\N	Belum	\N	Belum	\N	\N	2026-05-12	\N	\N	\N	\N	\N	\N	\N	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
46	DAGING ASAP, SOSIS, BAKSO, DAGING BERBUMBU	DARMAWAN MULYADI	9120000000052	3573010000000052	081234567052	DAGING ASAP, SOSIS, BAKSO, DAGING BERBUMBU	Jl. Salak III No. 8, Taman, Kec. Taman, Kota Madiun, Jawa Timur 63131	-	Taman	Taman	Kota Madiun	Pangan	Mikro	-7.64325580	111.52802850	2026-07-27 15:14:21	2026-07-30 04:57:38	Rendah	10794	Industri Kerupuk, Keripik, Peyek Dan Sejenisnya	195000000.00	4	Proses	\N	Ada	MD 6007604366	Belum	\N	Belum	\N	\N	2026-06-19	\N	\N	\N	\N	\N	\N	\N	t	Ada	TKDN/IK/2025/00146	38.90%	https://drive.google.com/file/d/1fe8cc59e89b4e7d3/view	\N	\N	\N	\N	\N	\N	\N	\N
47	OLAHAN SAMBEL	BAGUS SURYA NUGRAHA	9120000000053	3573010000000053	081234567053	OLAHAN SAMBEL	JALAN PUSPA INDAH BLOK Y2 PERUM KARTOHARJO INDAH, DESA/KELURAHAN KELUN, KEC. KARTOHARJO, KOTA MADIUN	-	Kelun	Kartoharjo	Kota Madiun	Pangan	Mikro	-7.60115200	111.55459620	2026-07-27 15:14:21	2026-07-27 15:14:21	Rendah	11090	Industri Minuman Ringan Lainnya	45000000.00	14	Ada	ID35110000235283	Belum	\N	Belum	\N	Ada	IPT2025336903	OLAHAN SAMBEL	2026-05-09	\N	\N	\N	\N	\N	\N	2034-07-29	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
48	AYAM UNGKEP FROZEN	NUR KHIKMAH	9120000000054	3573010000000054	081234567054	AYAM UNGKEP FROZEN	JL. SERAYU INDAH B-8 NO.32, DESA/KELURAHAN PANDEAN, KEC. TAMAN	-	Pandean	Taman	Kota Madiun	Pangan	Mikro	-7.64948170	111.52785200	2026-07-27 15:14:21	2026-07-27 15:14:21	Rendah	10794	Industri Kerupuk, Keripik, Peyek Dan Sejenisnya	115000000.00	14	Belum	\N	Belum	\N	Belum	\N	Belum	\N	\N	2026-05-23	\N	\N	\N	\N	\N	\N	\N	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
49	OLAHAN FROZEN	IMAM SUGIRI	9120000000055	3573010000000055	081234567055	OLAHAN FROZEN	JL TILAMUPIH 24 , DESA/KELURAHAN JOSENAN, KEC. TAMAN, KOTA MADIUN	-	Josenan	Taman	Kota Madiun	Pangan	Mikro	-7.65283750	111.51543840	2026-07-27 15:14:21	2026-07-30 04:57:38	Rendah	10799	Industri Produk Makanan Lainnya	90000000.00	9	Ada	ID35110000313352	Ada	MD 9125716264	Ada	SNI 01-5709-2025	Belum	\N	\N	2026-05-15	\N	\N	\N	\N	\N	\N	\N	t	Ada	TKDN/IK/2025/00149	29.80%	https://drive.google.com/file/d/1a207ab7393a1a74e/view	\N	\N	\N	\N	\N	\N	\N	\N
50	GITAR	WAHYU WIJOYONO	9120000000056	3573010000000056	081234567056	GITAR	JL. FLORES NO. 48, DESA/KELURAHAN KARTOHARJO, KEC. KARTOHARJO,	-	Kartoharjo	Kartoharjo	Kota Madiun	Pangan	Mikro	-7.62962480	111.52557820	2026-07-27 15:14:21	2026-07-27 15:14:21	Rendah	11090	Industri Minuman Ringan Lainnya	95000000.00	2	Belum	\N	Belum	\N	Belum	\N	Ada	IPT2025208717	GITAR	2025-12-25	\N	\N	\N	\N	\N	\N	2026-07-10	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
51	SEPATU TEKNIK	MUHAMMAD YUSUF	9120000000057	3573010000000057	081234567057	SEPATU TEKNIK	JL. MARGA BAKTI NO 9, DESA/KELURAHAN MOJOREJO, KEC. TAMAN	-	Mojorejo	Taman	Kota Madiun	Pangan	Mikro	-7.64088170	111.53057480	2026-07-27 15:14:21	2026-07-30 04:57:38	Rendah	10710	Industri Produk Roti Dan Kue	165000000.00	12	Ada	ID35110000581333	Belum	\N	Belum	\N	Belum	\N	\N	2026-05-25	\N	\N	\N	\N	\N	\N	\N	t	Proses	\N	32.50%	\N	\N	\N	\N	\N	\N	\N	\N	\N
52	DIMSUM	AMIRUL MA`RUF	9120000000058	3573010000000058	081234567058	DIMSUM	JALAN SUKOYONO PERUM ADDA PURIARTHA D-12A, DESA/KELURAHAN JOSENAN, KEC. TAMAN	-	Josenan	Taman	Kota Madiun	Pangan	Mikro	-7.65516640	111.51756770	2026-07-27 15:14:21	2026-07-30 04:57:38	Rendah	10799	Industri Produk Makanan Lainnya	80000000.00	7	Belum	\N	Ada	MD 3908914166	Belum	\N	Belum	\N	\N	2026-01-18	\N	\N	\N	\N	\N	\N	\N	t	Ada	TKDN/IK/2025/00152	41.20%	https://drive.google.com/file/d/10a31a44b426c850a/view	\N	\N	\N	\N	\N	\N	\N	\N
53	UNGKEP JEROAN	ERFANA HENDRAWATI	9120000000059	3573010000000059	081234567059	UNGKEP JEROAN	JL. AIRLANGGA II NO.8 RT 07 RW 02 WINONGO, MANGUHARJO, MADIUN	-	Winongo	Manguharjo	Kota Madiun	Pangan	Mikro	-7.61923680	111.51360320	2026-07-27 15:14:21	2026-07-27 15:14:21	Rendah	10710	Industri Produk Roti Dan Kue	75000000.00	8	Ada	ID35110000114112	Proses	\N	Belum	\N	Ada	IPT2025396816	UNGKEP JEROAN	2026-01-18	\N	\N	\N	\N	\N	\N	2026-09-26	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
54	SAMBEL PECEL	LELLY MIRYANTI	9120000000020	3573010000000020	081234567020	SAMBEL PECEL	TAMAN ASRI I/A-15 BANJAREJO TAMAN MADIUN, DESA/KELURAHAN BANJAREJO, KEC. TAMAN	-	Banjarejo	Taman	Kota Madiun	Pangan	Mikro	-7.65191900	111.52795380	2026-07-27 15:14:21	2026-07-27 15:14:21	Rendah	10792	Industri Bumbu Masak Dan Penyedap Masakan	225000000.00	7	Belum	\N	Belum	\N	Belum	\N	Belum	\N	\N	2025-12-18	\N	\N	\N	\N	\N	\N	\N	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
55	TAHU WALIK	SITI ROSYIDAH	9120000000061	3573010000000061	081234567061	TAHU WALIK	JL. TEMUGIRING NO. 22 BLK , DESA/KELURAHAN NGEGONG, KEC. MANGUHARJO	-	Ngegong	Manguharjo	Kota Madiun	Pangan	Mikro	-7.60691620	111.51899340	2026-07-27 15:14:21	2026-07-30 04:57:38	Rendah	11090	Industri Minuman Ringan Lainnya	345000000.00	15	Ada	ID35110000791087	Ada	MD 8575406435	Ada	SNI 01-4777-2025	Belum	\N	\N	2026-04-22	\N	\N	\N	\N	\N	\N	\N	t	Ada	TKDN/IK/2025/00155	62.40%	https://drive.google.com/file/d/19770a64ff459ef94/view	\N	\N	\N	\N	\N	\N	\N	\N
56	SAMBAL KACANG	INDAH RATNAWATI	9120000000062	3573010000000062	081234567062	SAMBAL KACANG	JL. DADALI NO.11 RT.16 RW.005 , DESA/KELURAHAN NAMBANGAN KIDUL, KEC. MANGUHARJO	-	Nambangan Kidul	Manguharjo	Kota Madiun	Pangan	Mikro	-7.64556670	111.51723080	2026-07-27 15:14:21	2026-07-30 04:57:38	Rendah	10799	Industri Produk Makanan Lainnya	230000000.00	5	Proses	\N	Belum	\N	Belum	\N	Ada	IPT2025364319	SAMBAL KACANG	2026-06-08	\N	\N	\N	\N	\N	\N	2028-07-29	t	Proses	\N	38.90%	\N	\N	\N	\N	\N	\N	\N	\N	\N
57	OLAHAN JAMUR TIRAM	VILGA VICHARIO	9120000000063	3573010000000063	081234567063	OLAHAN JAMUR TIRAM	JL.MANYAR NO 32, DESA/KELURAHAN NAMBANGAN LOR, KEC. MANGUHARJO	55	Nambangan Lor	Manguharjo	Kota Madiun	Pangan	Mikro	-7.63560360	111.51349150	2026-07-27 15:14:21	2026-07-27 15:58:38	Rendah	10710	Industri Produk Roti Dan Kue	210000000.00	2	Ada	ID35110000336510	Proses	\N	Belum	\N	Proses	\N	OLAHAN JAMUR TIRAM	2026-06-19	\N	\N	\N	\N	\N	\N	2026-10-14	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
58	JAMU SERAI	DYAH RATNA WULANDARI	9120000000064	3573010000000064	081234567064	JAMU SERAI	JL. PANORAMA RAYA NO. 12B, DESA/KELURAHAN PANDEAN, KEC. TAMAN	-	Pandean	Taman	Kota Madiun	Pangan	Mikro	-7.64543810	111.53371340	2026-07-27 15:14:21	2026-07-30 04:57:38	Rendah	11090	Industri Minuman Ringan Lainnya	350000000.00	7	Belum	\N	Ada	MD 3376278958	Belum	\N	Belum	\N	\N	2026-05-03	\N	\N	\N	\N	\N	\N	\N	t	Ada	TKDN/IK/2025/00158	52.30%	https://drive.google.com/file/d/1235c8de050594196/view	\N	\N	\N	\N	\N	\N	\N	\N
59	OMELET	NELLY NOVI DAMAYANTI	9120000000065	3573010000000065	081234567065	OMELET	JL SERAYU BARAT GG V NO 49, DESA/KELURAHAN PANDEAN, KEC. TAMAN	-	Pandean	Taman	Kota Madiun	Pangan	Mikro	-7.64588290	111.51935540	2026-07-27 15:14:21	2026-07-27 15:14:21	Rendah	11090	Industri Minuman Ringan Lainnya	110000000.00	12	Ada	ID35110000214297	Belum	\N	Belum	\N	Ada	IPT2025809535	OMELET	2025-10-15	\N	\N	\N	\N	\N	\N	2034-07-29	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
60	MAKANAN OLAHAN	IRAWATI	9120000000066	3573010000000066	081234567066	MAKANAN OLAHAN	JL.JENGGOLO MANIK 12, DESA/KELURAHAN KELUN, KEC. KARTOHARJO	-	Kelun	Kartoharjo	Kota Madiun	Pangan	Mikro	-7.60307810	111.54773120	2026-07-27 15:14:21	2026-07-27 15:14:21	Rendah	10710	Industri Produk Roti Dan Kue	325000000.00	11	Belum	\N	Belum	\N	Belum	\N	Belum	\N	\N	2026-07-09	\N	\N	\N	\N	\N	\N	\N	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
61	TELOR ASIN	HARTATI	9120000000067	3573010000000067	081234567067	TELOR ASIN	JL WIRARAJA NO 3, DESA/KELURAHAN WINONGO, KEC. MANGUHARJO, KOTA MADIUN	-	Winongo	Manguharjo	Kota Madiun	Pangan	Mikro	-7.62197630	111.51520220	2026-07-27 15:14:21	2026-07-30 04:57:38	Rendah	10794	Industri Kerupuk, Keripik, Peyek Dan Sejenisnya	260000000.00	9	Ada	ID35110000112741	Ada	MD 2764166323	Ada	SNI 01-9145-2025	Belum	\N	\N	2026-05-19	\N	\N	\N	\N	\N	\N	\N	t	Ada	TKDN/IK/2025/00161	32.50%	https://drive.google.com/file/d/19b0631b7dfb3f92c/view	\N	\N	\N	\N	\N	\N	\N	\N
62	MAKANAN OLAHAN	IKE VISQHIE MARSHA HAYU	9120000000066	3573010000000066	081234567066	MAKANAN OLAHAN	JL. ELANG II NO 6, DESA/KELURAHAN NAMBANGAN KIDUL, KEC. MANGUHARJO, KOTA MADIUN	-	Nambangan Lor	Kartoharjo	Kota Madiun	Pangan	Mikro	-7.64860730	111.51527820	2026-07-27 15:14:21	2026-07-27 15:14:21	Rendah	10792	Industri Bumbu Masak Dan Penyedap Masakan	240000000.00	3	Belum	\N	Belum	\N	Belum	\N	Ada	IPT2025343859	MAKANAN OLAHAN	2026-06-22	\N	\N	\N	\N	\N	\N	2030-07-29	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
63	TEMPE MENDOAN	SRI WAHYUNI	9120000000069	3573010000000069	081234567069	TEMPE MENDOAN	JL.NANGKA NO 6, DESA/KELURAHAN TAMAN, KEC. TAMAN, KOTA MADIUN	-	Taman	Taman	Kota Madiun	Pangan	Mikro	-7.64024130	111.52345660	2026-07-27 15:14:21	2026-07-27 15:14:21	Rendah	10799	Industri Produk Makanan Lainnya	285000000.00	2	Ada	ID35110000480390	Belum	\N	Belum	\N	Belum	\N	\N	2025-10-09	\N	\N	\N	\N	\N	\N	\N	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
64	KEBAB	ANNY DWI POERWAHJOENINGTYAS	9120000000016	3573010000000016	081234567016	KEBAB	JL. IMAM BONJOL GG. JATI TRUBUS NO. 7 , DESA/KELURAHAN KLEGEN, KEC. KARTOHARJO	-	Klegen	Kartoharjo	Kota Madiun	Pangan	Mikro	-7.62610280	111.54042550	2026-07-27 15:14:21	2026-07-30 04:57:38	Rendah	10710	Industri Produk Roti Dan Kue	40000000.00	11	Belum	\N	Ada	MD 9902367095	Belum	\N	Proses	\N	KEBAB	2025-12-12	\N	\N	\N	\N	\N	\N	2026-07-18	t	Ada	TKDN/IK/2025/00164	55.10%	https://drive.google.com/file/d/1d1f09250f3c05ee1/view	\N	\N	\N	\N	\N	\N	\N	\N
65	KAIN BATIK	VERONIKA DWI SULISTIYANI	9120000000071	3573010000000071	081234567071	KAIN BATIK	JL. CANDI BOKO NO. 09 KEL. PATIHAN, KEC. MANGUHARJO, KOTA MADIUN	-	Patihan	Manguharjo	Kota Madiun	Pangan	Mikro	-7.60702850	111.52911050	2026-07-27 15:14:21	2026-07-27 15:14:21	Rendah	10792	Industri Bumbu Masak Dan Penyedap Masakan	115000000.00	3	Ada	ID35110000531973	Proses	\N	Belum	\N	Ada	IPT2025526078	KAIN BATIK	2025-10-14	\N	\N	\N	\N	\N	\N	2026-08-19	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
67	REPARASI	CV ADIWARNA KARSA EMPAT TUJUH	9120000000073	3573010000000073	081234567073	REPARASI	JL. PILANG DARMA NO.11, DESA/KELURAHAN PILANGBANGO, KEC. KARTOHARJO	-	Pilangbango	Kartoharjo	Kota Madiun	Pangan	Mikro	-7.62017390	111.54579400	2026-07-27 15:14:21	2026-07-30 04:57:38	Rendah	10792	Industri Bumbu Masak Dan Penyedap Masakan	285000000.00	2	Proses	\N	Belum	\N	Belum	\N	Belum	\N	\N	2026-02-26	\N	\N	\N	\N	\N	\N	\N	t	Proses	\N	38.90%	\N	\N	\N	\N	\N	\N	\N	\N	\N
68	BENGKEL MOBIL	DONNY KURNIAWAN NOTOWIDJOJO	9120000000074	3573010000000074	081234567074	BENGKEL MOBIL	JL. SOEKARNO HATTA 66, DESA/KELURAHAN DEMANGAN, KEC. TAMAN	50	Demangan	Taman	Kota Madiun	Sandang	Mikro	-7.65871119	111.52735412	2026-07-27 15:14:21	2026-07-30 04:57:38	Rendah	14120	Industri Pakaian Jadi Menurut Pesanan	330000000.00	5	Ada	ID35110000673628	Ada	MD 4820572330	Ada	SNI 01-8031-2025	Belum	\N	\N	2025-10-27	\N	\N	\N	\N	\N	\N	\N	t	Ada	TKDN/IK/2025/00167	45.00%	https://drive.google.com/file/d/14ab40d9081156574/view	\N	\N	\N	\N	\N	\N	\N	\N
69	Warung Makan Bu Susi	Susi Susanti	2961251404189	3573590573056990	81234567891	Makanan dan Minuman	Jl. Diponegoro	20	Madiun Lor	Manguharjo	Kota Madiun	Kimia dan Furnitur	Mikro	-76250	1115220	2026-07-28 00:31:24	2026-07-30 05:11:57	Rendah	11090	Industri Minuman Ringan Lainnya	310000000.00	7	Belum	\N	Belum	\N	Belum	\N	Belum	\N	\N	2026-07-29	\N	\N	\N	\N	\N	\N	\N	f	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
70	Kerajinan Kayu Jati	Joko Anwar	5309033439831	3573407473554860	81234567892	Mebel Kayu	Jl. Cokroaminoto	45	Kejuron	Taman	Kota Madiun	Pangan	Kecil	-76310	1115300	2026-07-28 00:31:24	2026-07-29 12:09:01	Menengah Rendah	10799	INDUSTRI PRODUK MAKANAN LAINNYA YTDL	225000000.00	2	Ada	ID35110000570365	Proses	\N	Belum	\N	Ada	\N	Kerajinan Kayu Jati	2026-07-29	\N	\N	\N	\N	\N	\N	2026-08-27	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
71	Kopi Nusantara	Ahmad Dahlan	3453385008862	3573933251567390	81234567893	Bubuk Kopi	Jl. Yos Sudarso	12	Madiun Lor	Manguharjo	Kota Madiun	Kerajinan (Kriya)	Mikro	-76245	1115235	2026-07-28 00:31:24	2026-07-30 04:57:38	Rendah	10794	Industri Kerupuk, Keripik, Peyek Dan Sejenisnya	185000000.00	8	Belum	\N	Ada	MD 2090545555	Belum	\N	Belum	\N	\N	2025-12-10	\N	\N	\N	\N	\N	\N	\N	t	Ada	TKDN/IK/2025/00170	67.15%	https://drive.google.com/file/d/19ab5976d1396a315/view	\N	\N	\N	\N	\N	\N	\N	\N
72	Konveksi Baju Ceria	Siti Aminah	2802754416809	3573275259659190	81234567894	Pakaian Jadi	Jl. Dr. Sutomo	8	Kartoharjo	Kartoharjo	Kota Madiun	Pangan	Kecil	-76285	1115280	2026-07-28 00:31:24	2026-07-30 04:57:38	Menengah Rendah	10710	Industri Produk Roti Dan Kue	265000000.00	11	Ada	ID35110000525654	Belum	\N	Belum	\N	Ada	IPT2025152303	Konveksi Baju Ceria	2026-07-29	\N	\N	\N	\N	\N	\N	2026-09-22	t	Proses	\N	32.50%	\N	\N	\N	\N	\N	\N	\N	\N	\N
77	Test Verifikasi Perusahaan	Test Verifikasi Pemilik	9999999999999	3577019999999999	085712345678	-	Jl. Test No 17	\N	Pandean	Taman	Kota Madiun	Pangan	Mikro	-7.6320	111.5250	2026-07-31 07:56:31	2026-07-31 09:07:03	Rendah	-	-	0.00	1	Belum	-	Belum	-	Belum	-	Belum	-	-	\N	\N	\N	\N	\N	\N	\N	\N	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
78	Bengkel Las Jaya Madiun	Hendra Gunawan	5089747908747	3573336890980650	081234567897	Pagar dan Teralis	Jl. Thamrin No. 45	\N	Klegen	Kartoharjo	Kota Madiun	Metal dan Mesin	Kecil	-7.6250	111.5320	2026-07-31 08:55:35	2026-07-31 09:07:03	Menengah Tinggi	10795	INDUSTRI SARI NABATI DAN KRIMER NABATI	3300067800.00	10	Belum	-	Belum	-	Belum	-	Belum	-	-	\N	\N	\N	\N	\N	\N	\N	\N	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
79	Nilahi	Nilainahitadil	5089747908746	3528838888888883	0856365357375	Roti Basah	Perum Panorama Wilis 84	-	Pandean	Taman	Kota Madiun	Pangan	Mikro	-7.647627	111.532947	2026-07-31 09:00:52	2026-07-31 09:22:51	Rendah	10792	INDUSTRI KUE BASAH	20000000.00	2	Belum	-	Belum	-	Belum	-	Belum	-	-	\N	\N	\N	\N	\N	\N	\N	\N	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
82	BENGKEL MOTOR SEKOK	PUDJI HARTONO	9120000023565	3573010000006560	081234567034	BENGKEL MOTOR	JALAN KAPTEN TENDEAN NO.50, BANJAREJO	-	Banjarejo	Taman	Kota Madiun	Pangan	Mikro	-7.6606789	111.531657	2026-08-12 15:00:02	2026-08-12 15:00:02	Rendah	10792	Industri Bumbu Masak Dan Penyedap Masakan	90000000.00	10	Belum	\N	Belum	\N	Belum	\N	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
84	ABRA CULINERY	SRI RAWATI	9120001234567	3574012304850001	088585235235	\N	Kota Madiun	\N	Kejuron	Taman	Kota Madiun	Makanan & Minuman	\N	-7.6298	111.5239	2026-08-13 23:50:21	2026-08-14 01:47:30	\N	\N	\N	0.00	1	Ada	ID35410038792090126	Belum	\N	Belum	\N	Ada	DID2025099999	ABRA CAFE + Logo	2026-08-14	\N	\N	https://drive.google.com/file/d/12J2O4QOQjlIaLFK8lT0zz_JAEWCXkruk/view	\N	\N	https://drive.google.com/file/d/12J2O4QOQjlIaLFK8lT0zz_JAEWCXkruk/view	\N	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
83	Sambal Pecel HM	BARIAH SUCIATI	9120000024533	3573010000064360	081234567033	NUGGET AYAM	Jl. Taman Raya, No. 3, RT 027, TW 007, Kelurahan Banjareho, Kecamatan Taman, Kota Madiun, Jawa Timur 63137	-	Banjarejo	Taman	Kota Madiun	Pangan	Mikro	-7.6564196	111.5326068	2026-08-12 15:00:02	2026-11-22 20:29:07	Rendah	10792	Industri Bumbu Masak Dan Penyedap Masakan	160000000.00	10	Ada	ID35110080632430926	Belum	\N	Belum	\N	Ada	DID2024132127	Sambel Pecel HM Khas Madiun + Logo	2026-11-22	\N	\N	https://drive.google.com/drive/folders/1snQTFbudYzb_oRK-n2-3_UHLLHcATXYI?usp=drive_link	\N	\N	https://drive.google.com/file/d/1dRkVrpzSYvsvspCb1Bdj3pkUAP0l-mGI/view?usp=drive_link	2034-12-14	t	Belum	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: publikasi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.publikasi (id, judul, gambar, tanggal, waktu, deskripsi, status, created_at, updated_at, is_active) FROM stdin;
2	2 Cara Cek Keaslian Sertifikat Halal	/uploads/publikasi/1785513817_6a6cc759c1fc0.jpeg	2026-07-12	-	Halo Sobat IKM Juara! 👋 Udah pada tau belum gimana cara mastiin keaslian Sertifikat Halal? 🤔 Tenang, caranya gampang banget kok. Yuk, swipe ke kiri buat tau 2 langkah praktisnya! 👉✨\n\n#IKMJuara #SertifikatHalal #UMKMMadiun #KotaMadiun #InfoHalal	Informasi	2026-03-25 17:42:47	2026-07-31 16:03:37	t
3	📢 GRATIS UNDUH! E-Book Program Pemberdayaan IKM HIJAU 2026 🌿	/uploads/publikasi/1785512319_6a6cc17fed5b6.jpeg	2026-07-21	-	Dapatkan panduan lengkap untuk menerapkan aktivitas hijau pada usaha Anda bersama Kementerian Perindustrian. Mulai dari konsep, tahapan, hingga praktik langsung, semuanya ada di sini!\n\n📲 Download e-book sekarang:\nScan QR atau akses 👉 taplink.cc/ikmhijauofc\n\n#IKMHijau #KemenperinRI #EbookGratis #BisnisBerkelanjutan	Informasi	2026-03-25 17:43:42	2026-07-31 15:38:39	t
4	Waktunya upgrade mesin dan peralatan usahamu!	/uploads/publikasi/1785511949_6a6cc00d17999.jpeg	2026-06-30	-	Kabar gembira untuk para pelaku industri! 📣 Program Restrukturisasi Mesin dan/atau Peralatan dari Kementerian Perindustrian HADIR KEMBALI.\n\nYuk, manfaatkan program ini untuk tingkatkan produktivitas usahamu. Catat tanggalnya:\n🗓️ 20 April 2026 s.d. 20 Agustus 2026\n💻 Ajukan permohonan melalui: siinas.kemenperin.go.id (pastikan sudah masuk ke akun SIINAS perusahaanmu, ya!)\n\nJangan sampai terlewat! ⚙️🚀\n#KemenperinRI #RestrukturisasiMesin #SIINAS #InfoIndustri #IKMNaikKelas	Informasi	2026-03-26 12:02:55	2026-07-31 15:40:10	t
5	Bikin kemasan produkmu makin menarik dan bernilai jual tinggi!	/uploads/publikasi/1785512597_6a6cc29511604.jpeg	2026-08-06	09.30 Selesai	Ikuti Webinar "Kemasan Cerdas untuk Industri Kecil" GRATIS dari Kemenperin bersama ahlinya. Terbuka untuk umum + dapat E-Sertifikat! 🎓\n\n🗓️ 7 Agustus 2026 | 09.30 WIB\nDaftar segera di: bit.ly/webinarKDMK_7agustus atau scan QR di gambar ya!\n\n#UMKMIndonesia #WebinarUMKM #KemasanProduk #Kemenperin #IKMJuara	Selesai	2026-03-26 12:42:37	2026-07-31 15:43:17	t
6	1. Cara Cek Keaslian Sertifikat Halal	/uploads/publikasi/1785513937_6a6cc7d159dcd.jpeg	2026-07-12	-	Sobat IKM, sudah tahu belum kalau cek Sertifikat Halal itu semudah memotret? 📸\n\nNggak perlu repot, tinggal buka kamera HP atau aplikasi pembaca QR Code kamu, lalu arahkan ke sertifikat. Praktis, kan? Yuk, cobain sekarang dan pastikan sertifikat produkmu terdata dengan benar! ✅\n\n#HalalIndonesia #IKMMaju #KotaMadiun #UMKMNaikKelas #IKMJuara	Informasi	2026-03-29 06:46:08	2026-07-31 16:05:37	t
7	Tingkatkan daya saing produk lokal Anda dengan Sertifikat Halal!	/uploads/publikasi/1785513676_6a6cc6ccd7016.jpeg	2026-08-10	08.00 Selesai	Disnaker KUKM Kota Madiun 2026 memfasilitasi Sertifikasi Halal Self Declare secara GRATIS khusus bagi pelaku industri kecil makanan. Legalitas kuat, usaha maju, masyarakat sejahtera!\n\nKuota sangat terbatas. Segera amankan slot pendaftaran Anda sekarang juga. 📝✅\n\n#KotaMadiun #DisnakerKUKMKotaMadiun #SertifikatHalal #UMKMNaikKelas #Madiun	Belum Dimulai	2026-03-29 06:46:54	2026-07-31 16:01:16	t
8	2. Cara Cek Keaslian Sertifikat Halal	/uploads/publikasi/1785514036_6a6cc83439f56.jpeg	2026-07-12	-	Lebih suka cek dokumen lewat PC atau Laptop? Tenang, verifikasi Sertifikat Halal juga bisa dilakukan via website Komdigi! 🌐💯\n\nCukup siapkan file format PDF dan unggah ke situs resminya untuk melihat detail tanda tangan elektroniknya. Praktis banget, kan? Ada yang sudah pernah coba cara kedua ini? Tulis pengalamanmu di kolom komentar ya! 👇\n\n#HalalIndonesia #IKMMaju #KotaMadiun #UMKMNaikKelas #IKMJuara	Informasi	2026-07-31 16:07:16	2026-07-31 16:07:16	t
\.


--
-- Data for Name: registrasi_pelatihan; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.registrasi_pelatihan (id, nama_kegiatan, nama_lengkap, nik, nib, email, whatsapp, jenis_kelamin, tanggal_lahir, foto_ktp, foto_produk, nama_usaha, produk_diproduksi, alamat_usaha, kelurahan, kecamatan, kota, jenis_usaha, tahun_mulai, skala_usaha, omzet_bulanan, stabilitas_omzet, tantangan_usaha, media_penjualan, cakupan_pemasaran, karyawan_tetap, karyawan_tidak_tetap, sistem_usaha, level_digital, pernah_pelatihan, harapan_pelatihan, target_6_bulan, is_lolos, created_at, updated_at, deleted_at) FROM stdin;
2	Pelatihan Merek HKI	ERLIN KURNIAWATI	8401972635094817	2211240019219	putri.melati@example.com	082345678901	Perempuan	1999-06-08	https://i.ibb.co/dswkxSn1/6edb5a68ff64.jpg	\N	Sambel Pecel Mbak Erlin	\N	Perum Dumai Indah Jln. Dwi Jaya IV/145	Klegen	Kartoharjo	Madiun	Kuliner	2010	Mikro	1250000	Ya	["SDM kurang"]	["Offline (toko)","WhatsApp"]	\N	1	0	Sendiri	Belum	Belum	Mampu menerapkan ilmu pelatihan dalam operasional usaha sehari-hari.	Memperluas pemasaran melalui platform digital dan media sosial.	f	2026-03-23 14:12:53	2026-07-31 10:29:11	2026-07-31 11:27:18
3	Pelatihan Merek HKI	Enita Yuliana	3577036806030003	2222222222222	yulianaenita425@gmail.com	08656666668	Perempuan	2026-03-02	https://i.ibb.co/HTw8r7Mg/16d430f98588.jpg	\N	Kentang - Krezznya Madiun	\N	Jl. Pandan 67 Gang Kelinci	Taman	Kartoharjo	Madiun	Kuliner	2020	Mikro	1000000	Ya	["Modal terbatas"]	["Instagram"]	\N	1	0	Sendiri	Belum	Pernah	Dicoba	Dicoba	f	2026-03-24 16:18:02	2026-07-31 10:29:42	2026-07-31 11:28:01
5	Pelatihan Merek HKI	Darmayadi	2222222222222222	2222222222222	yulianaenita425@gmail.com	081234567890	Laki-laki	2026-03-03	https://i.ibb.co/Fq8Xg6nn/8849a8ba30f9.jpg	\N	crepes - Unagi	\N	Jl. Testing	Taman	Kartoharjo	Madiun	Kuliner	2020	Mikro	600000	Ya	["Modal terbatas"]	["Offline (toko)"]	\N	1	0	Sendiri	Belum	Belum	Testing 2	Testing 2	f	2026-03-24 17:42:50	2026-07-31 10:29:53	2026-07-31 11:28:07
6	Pelatihan Merek HKI	Enita Yuliana	5928301746502938	0101250009948	yulianaenita425@gmail.com	081234567890	Perempuan	2026-03-18	https://i.ibb.co/KjjvmCHQ/1159e2a8192d.jpg	\N	crepes - Unagi	\N	Jl. Narata 971	Taman	Kartoharjo	Madiun	Kuliner	2020	Mikro	600000	Ya	["Penjualan sepi"]	["Offline (toko)"]	\N	1	0	Sendiri	Belum	Belum	Test	test	t	2026-03-26 14:58:32	2026-07-31 10:31:00	2026-07-31 11:27:47
7	Pelatihan Produksi Efisien dan Manajemen Operasional	Yayan Mega	4214155555555555	1555254555555	jajalaeyayan@gmail.com	014277571221	Perempuan	2009-02-11	https://i.ibb.co/Q3f8vR6f/4181e666d018.jpg	\N	Jus Teras Segar	\N	Jl. Teratai Indah	Taman	Taman	Madiun	Fashion	2021	Mikro	5000000	Ya	["Penjualan sepi"]	["Offline (toko)"]	\N	2	0	Sendiri	Sudah tapi belum maksimal	Belum	bagus	tes	t	2026-07-24 17:03:18	2026-07-24 17:03:18	2026-07-31 11:28:13
8	Pelatihan Digital Marketing IKM 2026	Budi Sambel Madiun	3515000523154598	0123708661870	budi_sambel@gmail.com	081234567890	Laki-laki	1992-05-15	https://i.ibb.co/k2Z9W4f1/bd0d97873620.jpg	["https:\\/\\/i.ibb.co\\/k2Z9W4f1\\/bd0d97873620.jpg"]	UD Sambel Pecel Madiun Juara	Sambel Pecel Kemasan & Keripik Tempe	Jl. Pahlawan No. 45 Madiun	Pandean	Taman	Madiun	Kuliner	2021	Mikro	15000000	Ya	[]	[]	\N	0	0	Mandiri	Menengah	\N	-	Ekspor Sambel Pecel ke Surabaya & Malang	t	2026-07-30 14:31:10	2026-07-30 14:31:10	2026-07-31 11:27:41
11	Pelatihan Standarisasi Produk dan Sertifikasi Halal	Yanuar Priambodo	3577020102650003	Belum (Bersedia)	sriwulanwijayantiuung@gmail.com	082143131616	Perempuan	2026-07-08	https://i.ibb.co/9HzBbcyb/dcb27b9d391b.jpg	["https:\\/\\/i.ibb.co\\/h1WTthzm\\/98f32ec0e986.jpg"]	Nikmat Gurih	Keripik Tempe	Jl. Taman Asri VIII/100	Sukosari	Kartoharjo	Madiun	Kuliner	2025	Mikro	870000	Ya	["Penjualan sepi"]	["Offline (toko)"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	2	0	Mandiri	Sudah tapi belum maksimal	Belum	Makin melesat omzetnya	ingin menambah tenaga kerja	f	2026-07-31 01:46:14	2026-07-31 11:50:53	2026-07-31 11:28:19
12	Pelatihan Standarisasi Produk dan Sertifikasi Halal	SRI WULANDARI	3577034903690001	1306250070146	sriwulanwijayantiuung@gmail.com	082143131616	Perempuan	2026-07-06	https://i.ibb.co/9HzBbcyb/dcb27b9d391b.jpg	["https:\\/\\/i.ibb.co\\/LzdQp8Sn\\/b658d77027b9.jpg"]	Gurihnya	Telur Asin	Jl. Pesanggrahan III No 8 Madiun	Kartoharjo	Kartoharjo	Madiun	Kuliner	2024	Mikro	650000	Ya	["Produksi terbatas"]	["Offline (toko)"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	0	Mandiri	Sudah aktif	Pernah	Ingin Berjualan di marketplace	ingin meluaskan lokasi produksi	t	2026-07-31 01:50:16	2026-07-31 01:50:16	2026-08-01 06:17:55
14	Pelatihan Produksi Efisien dan Manajemen Operasional	SRI WULANDARI	3577034903690001	1306250070146	peserta@ikmjuara.my.id	082143131616	Laki-laki	1990-01-01	-	\N	Gurihnya	Telur Asin	Jl. Pesanggrahan III No 8 Madiun	Kartoharjo	Kartoharjo	Madiun	Pangan	2026	Mikro	< 10 Juta	Stabil	\N	\N	\N	0	0	Perseorangan	Menengah	\N	\N	Meningkatkan omzet dan legalitas	t	2026-07-31 09:47:16	2026-07-31 09:47:16	2026-07-31 11:27:33
17	Pelatihan Produksi Efisien dan Manajemen Operasional	Enita Yuliana	5928301746502938	0101250009948	peserta@ikmjuara.my.id	081234567890	Laki-laki	1990-01-01	-	\N	crepes - Unagi	-	Jl. Narata 971	Taman	Kartoharjo	Madiun	Pangan	2026	Mikro	< 10 Juta	Stabil	\N	\N	\N	0	0	Perseorangan	Menengah	\N	\N	Meningkatkan omzet dan legalitas	f	2026-07-31 10:31:19	2026-07-31 10:31:52	2026-07-31 11:27:28
18	Pelatihan Sistem Informasi Industri Nasional (SIINas)	Enita Yuliana	5928301746502938	0101250009948	peserta@ikmjuara.my.id	081234567890	Laki-laki	1990-01-01	-	\N	crepes - Unagi	-	Jl. Narata 971	Taman	Kartoharjo	Madiun	Pangan	2026	Mikro	< 10 Juta	Stabil	\N	\N	\N	0	0	Perseorangan	Menengah	\N	\N	Meningkatkan omzet dan legalitas	t	2026-07-31 10:39:11	2026-07-31 10:39:11	2026-07-31 11:27:23
20	Pelatihan Standarisasi Produk dan Sertifikasi Halal	UUNG SRIWULAN WIJAYANTI	3577020102650003	2504250023077	sriwulanwijayantiuung@gmail.com	087715996212	Perempuan	1989-05-16	https://i.ibb.co/RkpMpcRt/c8366b8b2361.jpg	["https:\\/\\/i.ibb.co\\/PZByd4XK\\/9d28e77d5970.jpg"]	Sri Rejeki	Tempe Kripik	JL Cokrobasonto Gang III No. 11	Demangan	Taman	Madiun	Kuliner	2021	Mikro	900000	Ya	["Modal terbatas"]	["Offline (toko)","WhatsApp"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	0	Mandiri	Sudah tapi belum maksimal	Belum	Semakin sukses dengan mempelajari pelatihan dari disnaker	Bisa menambah pegawai dan volume produksi	f	2026-07-31 11:42:55	2026-07-31 11:52:39	2026-08-01 06:18:02
22	Pelatihan Merek HKI	Nur Aini	3577020605680055	1708210010001	nuraini66@yopmail.com	082662472742	Perempuan	2026-07-16	https://i.ibb.co/KcJnRys0/6bcf7138561f.jpg	["https:\\/\\/i.ibb.co\\/SwNfS0W4\\/cbbcb9b521d2.jpg"]	Jamu Larasati	Jamu Botolan	Jl. Salak No. 84 Gang Tengah 5	Taman	Taman	Madiun	Kuliner	2006	Mikro	1500000	Ya	["Marketing kurang efektif"]	["Offline (toko)","WhatsApp","Instagram"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	3	0	Mandiri	Sudah tapi belum maksimal	Belum	Ingin menemukan cara agar penjualan meningkat	Bisa memiliki dapur pengolahan mandiri	t	2026-07-31 11:58:39	2026-07-31 12:13:22	2026-08-01 06:18:08
23	Pelatihan Produksi Efisien dan Manajemen Operasional	Nur Aini	3577020605680055	1708210010001	nuraini66@yopmail.com	082662472742	Perempuan	2026-07-09	https://i.ibb.co/PsbyfXWY/c7c73fe499b7.jpg	["https:\\/\\/i.ibb.co\\/SwNfS0W4\\/cbbcb9b521d2.jpg"]	Jamu Larasati	Jamu Serbuk	Jl. MJ Sungkono No 25B RT 35 RW 11	Taman	Taman	Madiun	Kuliner	2020	Mikro	1200000	Ya	["Marketing kurang efektif"]	["Instagram"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	2	0	Mandiri	Sudah tapi belum maksimal	Belum	DIcoba dulu	Siap Maju Mendunia	f	2026-07-31 12:06:02	2026-07-31 12:18:26	2026-08-01 06:18:20
24	Pelatihan Digital Marketing untuk IKM	Yanuar Priambodo	3520111601980002	1313141414143	yanuara16@gmail.com	085655480223	Laki-laki	1998-01-16	https://i.ibb.co/vC6L9mVh/bddc240ddbca.jpg	["https:\\/\\/i.ibb.co\\/DgtTwhzB\\/eca15e9a903f.jpg"]	Yans Crapes	Crapes	Perum Panorama Wilis F8	Pandean	Taman	Madiun	Kuliner	2025	Mikro	950000	Ya	["Modal terbatas"]	["Offline (toko)"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	0	Mandiri	Sudah tapi belum maksimal	Belum	Ingin menambah wawasan soal digital marketing	Omset meningkat	f	2026-07-31 14:56:34	2026-07-31 14:56:34	2026-08-01 06:18:28
25	Pelatihan Olahan Makanan Beku - Fasilitasi Sertifikasi Halal Self Declare	Test	3577034903690353	2555555555222	test03@yopmail.com	027222222224	Laki-laki	2026-07-30	https://i.ibb.co/cSkMT0vS/67d6d2a2f540.jpg	["https:\\/\\/i.ibb.co\\/wh11ZXLV\\/50e742e73ddc.jpg"]	Jamu TEtes	JAmu	Jl. Oro oro ombo 66	Oro-Oro Ombo	Kartoharjo	Madiun	Kuliner	2020	Mikro	500000	Ya	["Penjualan sepi"]	["Offline (toko)"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	0	Mandiri	Sudah tapi belum maksimal	Belum	Test	Test	f	2026-08-01 01:49:58	2026-08-01 01:49:58	2026-08-01 04:30:27
26	Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare	Drwi, Sulistyani, SH	3577036809770004	1403230114883	dewisulistyanisuwoto@gmail.com	081359137030	Perempuan	1977-09-28	https://i.ibb.co/Y4wG2z8r/c642823ba83f.jpg	["https:\\/\\/i.ibb.co\\/tMV9yJW8\\/c17c8f54a194.jpg","https:\\/\\/i.ibb.co\\/1tKm8HM9\\/4001defcec55.jpg"]	Wingko Besek	Wingko	Jl. Kemiri No. , RT. 39, RW. 12	Kejuron	Taman	Madiun	Kuliner	2025	Mikro	2000000	Ya	["Marketing kurang efektif","Modal terbatas"]	["Offline (toko)","WhatsApp","Instagram"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)","Regional (Antar Provinsi\\/Nasional)"]	2	1	Mandiri	Sudah tapi belum maksimal	Belum	Ingin penjualan makin luas. Dan meningkatkan pendapatan	Omset makin naik dari sebelumnya. Dan pemasaran makin luas	f	2026-08-01 04:56:25	2026-08-01 04:56:25	\N
27	Pelatihan Olahan Keripik - Fasilitasi Sertifikasi Halal Self Declare	Erna dyah ayu Susilowaty	3577036909810004	0810230036742	ernadyah69@gmail.com	081234703975	Perempuan	1981-09-29	https://i.ibb.co/TB9wsnKC/e426f7def389.jpg	["https:\\/\\/i.ibb.co\\/m5gtnQy9\\/34daf00d945d.jpg"]	Mahkota	Krupuk lempeng	Jl.jambu kembar  no.8	Pandean	Taman	Madiun	Kuliner	2008	Mikro	2000000	Ya	["Modal terbatas"]	["Offline (toko)","WhatsApp"]	["Regional (Antar Provinsi\\/Nasional)"]	3	0	Mandiri	Belum	Belum	Harapan saya setelah mendapatkan pelatihan usaha sy bisa mencakup keseluruhan  dan bisa mendapatkan modal dari pemerintah.	Menambah omzet sampai 3 x lipat	f	2026-08-01 09:38:52	2026-08-01 09:38:52	\N
28	Pelatihan Olahan Makanan Beku - Fasilitasi Sertifikasi Halal Self Declare	Nurharjanti	3577016207700004	1703220011993	nungnurharjanti@gmail.com	081252487123	Perempuan	1970-07-22	https://i.ibb.co/PZXsgN49/9130ab5f5449.jpg	["https:\\/\\/i.ibb.co\\/zTV4YcNN\\/3812a39d6964.jpg"]	Delatu	Bakso, Sosis solo,  Singkong	Jl. Halmahera no. 72 Madiun	Kartoharjo	Kartoharjo	Madiun	Kuliner	2022	Mikro	500000	Musiman	["Penjualan sepi","Marketing kurang efektif","Modal terbatas","Produksi terbatas"]	["WhatsApp"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	0	0	Mandiri	Sudah tapi belum maksimal	Pernah	Produksi meningkat, bisa promosi di media sosial biar jangkauan pemasarannya lebih luas	Omset meningkat, penjualan meningkat	t	2026-08-01 11:59:18	2026-08-12 14:26:13	\N
29	Pelatihan Olahan Makanan Beku - Fasilitasi Sertifikasi Halal Self Declare	HERIYANTO	3577020407760002	Belum (Bersedia)	putriramadini806@gmail.com	081335251661	Laki-laki	1976-07-04	https://i.ibb.co/dqQ7mkg/96e3cc46238b.jpg	["https:\\/\\/i.ibb.co\\/0RCFWMpb\\/c69be425965b.jpg","https:\\/\\/i.ibb.co\\/hxmRr1gs\\/6e1e05d25258.jpg","https:\\/\\/i.ibb.co\\/39FmL1cY\\/797555753c03.jpg"]	PENGGILINGAN DAGING / SEMOGA SUKSES	BAKSO	9G9C+4GM, Jl. Mangga Gg. III, RT.4 RW1, Kejuron, Kec. Taman, Kota Madiun, Jawa Timur 63132	Taman	Taman	Madiun	Kuliner	2024	Kecil	7000000	Ya	["SDM kurang"]	["Offline (toko)"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	2	0	Mandiri	Belum	Belum	usahanya lebih berkembang dan maju	omset naik	f	2026-08-01 12:48:22	2026-08-01 12:48:22	\N
30	Pelatihan Olahan Sambal - Fasilitasi Sertifikasi Halal Self Declare	Asmy nuraidha sari	3502175310910004	1008220006354	asmynuraidha91@gmail.com	081217133602	Perempuan	1991-10-13	https://i.ibb.co/h1TrvxC7/bc2255dd8a55.jpg	["https:\\/\\/i.ibb.co\\/Wp43fy4z\\/688415dbc237.jpg","https:\\/\\/i.ibb.co\\/4RYZq6r4\\/6e06a4511426.jpg","https:\\/\\/i.ibb.co\\/Z1GdnWzN\\/20872603a5a3.jpg"]	Warung mbk sari	Makanan siap saji	Jl perintis kemerdekaan \nDepan xiomy	Manguharjo	Manguharjo	Madiun	Kuliner	2020	Mikro	4000000	Ya	["Modal terbatas","Produksi terbatas"]	["Offline (toko)","WhatsApp"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	0	0	Mandiri	Sudah tapi belum maksimal	Belum	Semoga bisa menambah wawasan dan lancar usahanya	Bismillah buka cabang 🤲🤲	f	2026-08-01 17:48:20	2026-08-01 17:48:20	\N
31	Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare	NURI KUSTANTI	3173055404820017	1412220066754	pukiskentangyongemadiun@gmail.com	085785244982	Perempuan	1982-04-14	https://i.ibb.co/C3sLs8Wk/659ebce66a9b.jpg	["https:\\/\\/i.ibb.co\\/fzgMdxmq\\/7d50d4fa947a.jpg","https:\\/\\/i.ibb.co\\/dwwwhT22\\/c857b3cb968b.jpg","https:\\/\\/i.ibb.co\\/9kk4HGQs\\/e591e71b01b1.jpg"]	PUKIS KENTANG YONGE	PUKIS KENTANG	JL.COKROAMINOTO GG.TANJUNG II NO.151B MADIUN	Kejuron	Taman	Madiun	Kuliner	2025	Mikro	3000000	Ya	["Marketing kurang efektif","Produksi terbatas"]	["WhatsApp","Instagram"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	0	0	Mandiri	Sudah aktif	Belum	Setelah mengikuti pelatihan ini ,maka customer akan lebih percaya bahwa produk kita aman untuk dikonsumsi dan pastinya dengan mengikuti pelatihan ini usaha pukis kentang ini bisa menjadi pilihan oleh-oleh kota madiun selain sambel pecel dan bluder	punya outlet karena sekarang masih rumahan	f	2026-08-02 08:50:43	2026-08-02 08:50:43	\N
32	Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare	Hendra budiantono	3578201607860001	0912210011857	bqbbakery@gmail.com	081241594635	Laki-laki	1986-07-16	https://i.ibb.co/tpbHWbDh/7c4cd0014a5b.jpg	["https:\\/\\/i.ibb.co\\/tMXgY5NC\\/5c4c29f69422.jpg","https:\\/\\/i.ibb.co\\/jv9WdmPs\\/d0fdde8437ca.jpg","https:\\/\\/i.ibb.co\\/7xy0npb8\\/8981e31b0aa5.jpg"]	Tahu judes	Gorengan,dawet dan es sari kacang hijau	Jl. Taman Praja No.24, Mojorejo, Kec. Taman, Kota Madiun, Jawa Timur 63139	Mojorejo	Taman	Madiun	Kuliner	2025	Mikro	8000000	Ya	["Modal terbatas"]	["Offline (toko)","WhatsApp","Instagram"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	0	2	Mandiri	Sudah aktif	Pernah	Ingin memperluas usaha dan menambah ilmu berdagang	Omzet naik terus	f	2026-08-02 11:10:46	2026-08-02 11:10:46	\N
33	Pelatihan Olahan Sambal - Fasilitasi Sertifikasi Halal Self Declare	Atik pundhi asmorowati	3577034904800003	1257000602731	poen.dhi@gmail.com	082264704751	Perempuan	1980-04-09	https://i.ibb.co/cMYb40S/ee3998822f30.jpg	\N	Dorodasih	Sambel pecel	JL. Dorodasih manis no.4	Manisrejo	Taman	Madiun	Kuliner	2015	Mikro	1500000	Ya	["Penjualan sepi"]	["Offline (toko)"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	0	Mandiri	Belum	Belum	Ada peningkatan penjualan dan bantuan usaha modal	Bisa menaikkan omzet penjualan secara signifikan	f	2026-08-03 03:13:14	2026-08-03 03:13:14	\N
34	Pelatihan Minuman Instan dan Sirup - Fasilitasi Sertifikasi Halal Self Declare	Emmy Emmanuelle T	3577026811830004	8120015172814	emmyemma2811@gmail.com	08175086898	Perempuan	1983-11-28	https://i.ibb.co/twfhg2SD/565106b2ef8f.jpg	["https:\\/\\/i.ibb.co\\/9mzcCjtQ\\/71cf8a6d2d20.jpg","https:\\/\\/i.ibb.co\\/s9MwYyPj\\/1ff6f2380a56.jpg"]	Dumboo juice and kitchen	Fresh juice	Jl. Jambu no. 11 Madiun	Kejuron	Taman	Madiun	Kuliner	2016	Mikro	1500000	Tidak	["Penjualan sepi","Marketing kurang efektif","Modal terbatas","SDM kurang"]	["Offline (toko)","WhatsApp","Instagram"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	0	1	Mandiri	Sudah tapi belum maksimal	Belum	Harapan saya setelah ikut pelatihan. Skill saya meningkat dan penjualan laris manis	Omset meningkat 2-3x lipat	f	2026-08-03 04:58:14	2026-08-03 04:58:14	\N
35	Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare	Cicilia Ineke Lesmana	3577034402800004	0406240019973	cicilia.ineke@gmail.com	08113033236	Perempuan	1980-02-04	https://i.ibb.co/rKKqkyDp/cb68838701f1.jpg	["https:\\/\\/i.ibb.co\\/B958zfZ\\/3fc0184f0c6e.jpg","https:\\/\\/i.ibb.co\\/xqbmkdrX\\/16298beb2901.jpg","https:\\/\\/i.ibb.co\\/xKs1Jx7w\\/024395955f15.jpg"]	Kuweh Nyonya	Roti, cake, kue kering , pastri	Jl. Cokroaminoto no.82	Pandean	Taman	Madiun	Kuliner	2026	Mikro	40000000	Tidak	["Lainnya"]	["Offline (toko)"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	5	0	Mandiri	Sudah tapi belum maksimal	Belum	Memperluas jaringan	Omzet naik 2x lipat	f	2026-08-03 08:08:56	2026-08-03 08:08:56	\N
36	Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare	Yohanes Devin Alvianto	3577031704940001	1309220036973	devinyohanes@gmail.com	085157881728	Laki-laki	1994-04-17	https://i.ibb.co/WN5CGjqF/a7a3278b176e.jpg	["https:\\/\\/i.ibb.co\\/zVdvs4J1\\/0c355d4daf5b.jpg"]	tjap Vivin, Pisang Goreng & Bakpao	Pisang goreng dan bakpao	jl Kapuas no 22 sebelah ici koffie, Madiun, Jawa Timur, Indonesia	Taman	Taman	Madiun	Kuliner	2024	Mikro	3000000	Tidak	["Marketing kurang efektif","Modal terbatas","SDM kurang"]	["Offline (toko)","WhatsApp","Instagram"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	1	Mandiri	Sudah tapi belum maksimal	Belum	Memperluas jaringan usaha, mengerti teknik pemasaran, mengerti teknik penjualan dengan baik serta pengelolaan SDM dengan baik	menambah omset, dan membuka cabang di karisidenan madiun.	f	2026-08-04 01:22:41	2026-08-04 01:22:41	\N
37	Pelatihan Olahan Keripik - Fasilitasi Sertifikasi Halal Self Declare	Setio Wardhaningrum	3577036912800002	Belum (Bersedia)	ayumbelva10@gmail.com	082132731580	Perempuan	1980-12-29	https://ikmjuara.my.id/uploads/ktp/1785917460_6a72f014a60db.jpg	["https:\\/\\/ikmjuara.my.id\\/uploads\\/foto_produk\\/1785917490_6a72f032a9133.jpg"]	Makaroni Jio	Makaroni Pedas, Makaroni Keju, Mie Kremes	Jl. Tumpak Manis No. 40	Manisrejo	Taman	Madiun	Kuliner	2025	Mikro	2000000	Musiman	["Penjualan sepi","Marketing kurang efektif"]	["WhatsApp"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	0	0	Mandiri	Belum	Belum	Dapat memperluas penjualan sehingga banyak pesanan yang masuk dan omset meningkat	Ada tambahan menu dan kenaikan omset	f	2026-08-05 08:11:30	2026-08-05 08:11:30	\N
38	Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare	Rahayu	3508055404730005	2901220010416	echosnack@gmail.com	081338381932	Perempuan	1973-04-14	https://i.ibb.co/r2D6Ny4K/433190786472.jpg	["https:\\/\\/i.ibb.co\\/qYNnHtwm\\/05b1f78c901d.jpg","https:\\/\\/i.ibb.co\\/gMSZXKG0\\/b221034fd597.jpg","https:\\/\\/i.ibb.co\\/4w116pFH\\/2ae82260ed30.jpg"]	Rhy cookies & snack	Onde onde mletek, bolu, kebab,takoyaki, nastar ,bronies	Jln Gajah mada no 10	Manguharjo	Manguharjo	Madiun	Kuliner	2023	Mikro	3000000	Musiman	["Penjualan sepi","Marketing kurang efektif","Modal terbatas","Produksi terbatas","Lainnya"]	["Offline (toko)","WhatsApp"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	2	Mandiri	Belum	Pernah	Ingin jualan lewat medsos	Usaha bs maju , omset bertambah	f	2026-08-05 12:07:47	2026-08-05 12:07:47	\N
39	Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare	EMI SUJIANA	3577036709720003	Belum (Bersedia)	emisujiana72@gmail.com	0895367167213	Perempuan	1972-09-27	https://i.ibb.co/RTX58Y7c/5aa2b63d7432.jpg	["https:\\/\\/i.ibb.co\\/1t8GMbVC\\/17de6f6928ca.jpg","https:\\/\\/i.ibb.co\\/fBvj94q\\/890405618924.jpg","https:\\/\\/i.ibb.co\\/3YVG68r8\\/435a1b31bc24.jpg"]	"Raafi cake"	Kue basah	Jl.Mulya Bakti No.26 Kota Madiun	Mojorejo	Taman	Madiun	Kuliner	2023	Mikro	2500000	Tidak	["Penjualan sepi"]	["Offline (toko)"]	[]	0	0	Mandiri	Belum	Belum	Ingin memperluas jaringan reseler	Omset bisa bertambah naik	f	2026-08-05 15:27:43	2026-08-05 15:27:43	\N
40	Pelatihan Minuman Instan dan Sirup - Fasilitasi Sertifikasi Halal Self Declare	Anik Susiowati	3577025803830001	0610230028831	susiowatianik739@gmail.com	081375770687	Perempuan	1983-03-18	https://i.ibb.co/XZ2D2hc2/379f5309ade7.jpg	["https:\\/\\/i.ibb.co\\/svX80ktR\\/a4195d87daae.jpg"]	A2 (Aneka Aes)	Es jeruk es blewah es melon aneka jus	Jln Raden Wijaya no 07 RT 21 RW 05 kec manguharjo Kel manguharjo Kota Madiun	Manguharjo	Manguharjo	Madiun	Kuliner	2022	Kecil	1000000	Ya	["Lainnya"]	["Offline (toko)"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	0	Mandiri	Belum	Belum	Bisa belajar berbagai macam minuman	Omset meningkat	f	2026-08-06 02:28:26	2026-08-06 02:28:26	\N
41	Pelatihan Olahan Keripik - Fasilitasi Sertifikasi Halal Self Declare	Titik Rahayuni	3577014507730002	0708260080732	sudamanto8@gmail.com	081399009370	Perempuan	1973-07-05	https://i.ibb.co/dwVT4Tsz/481f4f3dc2de.jpg	["https:\\/\\/i.ibb.co\\/gZjhthVS\\/12ba3023eb4e.jpg"]	Keripik Tempe "Berkah Rasa"	Keripik Tempe	Jl. Sido Mukti No. 8 Kelun Kota Madiun	Kelun	Kartoharjo	Madiun	Kuliner	2024	Mikro	4000000	Ya	["Modal terbatas"]	["Offline (toko)"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	0	1	Mandiri	Belum	Belum	Mengembangkan produksi	Omzet meningkat	f	2026-08-07 10:11:23	2026-08-07 10:11:23	\N
42	Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare	Heri Eli Nuriyani	3577015111720002	1301220001475	elinuriyani9@gmail.com	085852241949	Perempuan	1972-11-11	https://i.ibb.co/Pk4186j/ba99c3018a55.jpg	["https:\\/\\/i.ibb.co\\/7tZT6PYp\\/35b211d0b071.jpg","https:\\/\\/i.ibb.co\\/93w9tNvx\\/a9ac6748151d.jpg","https:\\/\\/i.ibb.co\\/bgj3vkY6\\/25bccb998e6e.jpg"]	PAWOEN D'eli	Minuman ekstrak, cair, kue, cemilan	Jalan Sri Rejeki No. 55, RT 02/RW. 01, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun	Sukosari	Kartoharjo	Madiun	Kuliner	2014	Mikro	1000000	Ya	["Modal terbatas"]	["Offline (toko)","WhatsApp","Instagram"]	[]	0	0	Mandiri	Sudah tapi belum maksimal	Belum	Ingin Produk terjual dengan maksimal lewat IG, Tiktok	Punya karyawan dan hasil meningkat	f	2026-08-09 12:06:44	2026-08-09 12:06:44	\N
43	Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare	JEA MAHATSA	3577022411020004	Belum (Bersedia)	jeamahatsa372@gmail.com	085334795813	Laki-laki	2002-11-24	https://i.ibb.co/d42JDfd1/7c9d422d6fe9.jpg	["https:\\/\\/i.ibb.co\\/5WFpbXGk\\/88e78eaff808.jpg"]	STIK BAWANG JEJE	STIK BAWANG	Jl. Kasatrian No. 86 RT 16 RW 05	Patihan	Manguharjo	Madiun	Kuliner	2026	Mikro	800000	Ya	["Lainnya"]	["Offline (toko)"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	0	Mandiri	Belum	Belum	Mendapatkan fasilitasi sertifikasi halal dan teknik marketing	Menambah pasar di toko retail	f	2026-08-12 03:49:25	2026-08-12 03:49:25	\N
44	Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare	Krisisna Ermilaning Tari	3577015405820002	0607260027626	ermilacrisna@gmail.com	081216308073	Perempuan	1982-05-14	https://i.ibb.co/TMzrpgWt/19af39dd22b1.jpg	["https:\\/\\/i.ibb.co\\/C36Z5g4Y\\/d0ad758fb661.jpg","https:\\/\\/i.ibb.co\\/CpZw4qqW\\/cd090a45ef86.jpg","https:\\/\\/i.ibb.co\\/gLJ2f5vT\\/6a1e41c1f3c6.jpg"]	Kinarasa	kue balok	Jl. Trengguli No. 75 Kel. Oro Oro Ombo	Oro-Oro Ombo	Kartoharjo	Madiun	Kuliner	2022	Mikro	8000000	Tidak	["Lainnya"]	["Offline (toko)"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)","Regional (Antar Provinsi\\/Nasional)"]	2	2	Mandiri	Sudah tapi belum maksimal	Belum	Penjualan lebih banyak dan usaha semakin dikenal dan berkembang	Usaha semakin berkembang dan lebih di kenal banyak orang	f	2026-08-12 04:12:27	2026-08-12 04:12:27	\N
45	Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut	ANA ARUM SARI	3577025909840001	Belum (Bersedia)	anaarumsari.aas@gmail.com	082140677179	Perempuan	1984-09-19	https://i.ibb.co/4R5tGQxb/689d2c4de656.jpg	["https:\\/\\/i.ibb.co\\/ZpfnyVhn\\/61813330a8ef.jpg","https:\\/\\/i.ibb.co\\/rKMVN2mG\\/03c564294080.jpg","https:\\/\\/i.ibb.co\\/vxZxH7d8\\/8054c29c83aa.jpg"]	DEAR COFFEE	Minuman kopi susu kekinian dan basic kopi	JL. GAMBIR SAWIT NO. 43 RT. 13 RW. 5	Sogaten	Manguharjo	Madiun	Kuliner	2026	Mikro	1500000	Tidak	["Penjualan sepi","Marketing kurang efektif"]	["Offline (toko)","Instagram"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	0	0	Mandiri	Sudah tapi belum maksimal	Belum	Sertifikasi dan ijin usaha yang dapat meyakinkan pelanggan dan lebih meningkatkan omzet sehingga dapat membuka lowongan kerja	Omzet naik 2x lipat dan punya karyawan	f	2026-08-13 01:50:48	2026-08-13 01:50:48	\N
46	Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut	ari kadarmaji	3577030502710003	Belum (Bersedia)	akadarmaji@gmail.com	085645740671	Laki-laki	1971-02-05	https://i.ibb.co/hFCDpV8y/f67cc6108ada.jpg	["https:\\/\\/i.ibb.co\\/9kRy2mYn\\/273fc98e1372.jpg","https:\\/\\/i.ibb.co\\/JWNQCwvY\\/48915cc62f6c.jpg"]	Happy Mood	Dimsum	Jl. Slamet Riadi 26 Kota Madiun	Klegen	Kartoharjo	Madiun	Kuliner	2022	Mikro	0	Tidak	["Penjualan sepi"]	["Offline (toko)","WhatsApp","Instagram"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)","Regional (Antar Provinsi\\/Nasional)"]	2	0	Mandiri	Sudah tapi belum maksimal	Belum	ingin jualan llaris di offline dan online	jualan laris dan berkembang	f	2026-08-13 03:30:20	2026-08-13 03:30:20	\N
47	Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut	Enggar Lestari Rahayu	3577037006820002	0209210002268	enggar_lestari@ymail.com	085732229652	Perempuan	1982-06-30	https://i.ibb.co/v6GHGbGf/b85519755349.jpg	["https:\\/\\/i.ibb.co\\/hxWYcFh0\\/2510f61fbef6.jpg","https:\\/\\/i.ibb.co\\/cf48Lj2\\/fcedeee21c4b.jpg","https:\\/\\/i.ibb.co\\/QBVT7s4\\/7c3e2b2aae8e.jpg"]	Sauchasweets Cakes n cookies	Aneka kue dan kukis	Jl. Tawang Baru, RT 09/RW 02	Tawangrejo	Kartoharjo	Madiun	Kuliner	2014	Mikro	500000	Musiman	["Penjualan sepi","Marketing kurang efektif","Modal terbatas","Produksi terbatas"]	["WhatsApp","Instagram"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	0	Mandiri	Sudah tapi belum maksimal	Pernah	Usaha bisa lebih berkembang dan omset menjadi meningkat	Memiliki sebuah mini bakery dan kedai kopi di teras depan garasi rumah	f	2026-08-13 06:06:57	2026-08-13 06:06:57	\N
48	Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut	HUSEIN ABDILLAH	3577032104020004	Belum (Bersedia)	huseinabdillah4@gmail.com	085748188404	Laki-laki	2002-04-21	https://i.ibb.co/TMFP0BDX/329684172238.jpg	["https:\\/\\/i.ibb.co\\/Rp53jjg5\\/ab8962eca1bf.jpg","https:\\/\\/i.ibb.co\\/Rpn1nb47\\/b80af83fb6cc.jpg","https:\\/\\/i.ibb.co\\/1YvrLdcr\\/2f9ec9b8fa75.jpg"]	Kedai Sempulur	Kopi	Jl. Pepaya No. 53-A Kota Madiun	Taman	Taman	Madiun	Kuliner	2026	Mikro	1100000	Ya	["Penjualan sepi","Modal terbatas"]	["Offline (toko)","Instagram"]	[]	0	1	Mandiri	Sudah tapi belum maksimal	Belum	Sharing pengalaman sesama pelaku usaha yang sama. Serta dapat mengimplementasikan materi yang diberikan.	Sustainable	f	2026-08-13 06:30:11	2026-08-13 06:30:11	\N
49	Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut	Mochamad Arif Budi witjaksono	3578082904770003	2909250041801	mochamad.arif.budi78@gmail.com	081358918818	Laki-laki	1977-04-29	https://i.ibb.co/fdChjpt0/d98fb83a258c.jpg	["https:\\/\\/i.ibb.co\\/4nZY4TFq\\/53e051d65c08.jpg","https:\\/\\/i.ibb.co\\/3yNg0ggf\\/2a22ccf3b8de.jpg","https:\\/\\/i.ibb.co\\/TxZTSrm1\\/9d8a49547389.jpg"]	Tumbas Coffee	Kopi susu	Prambanan 23	Madiun Lor	Manguharjo	Madiun	Kuliner	2025	Kecil	500000	Tidak	["Penjualan sepi","Modal terbatas"]	["Offline (toko)","WhatsApp","Instagram","Marketplace"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	0	0	Mandiri	Sudah tapi belum maksimal	Belum	Bisa menambah ilmu dalam pembuatan coffe dan menambah kawan	Target penjualan KLO bisa bertambah dari 3 cup perhari bisa mencapai >100 cup/hari.serta bisa menambah varian menu coffee	f	2026-08-13 06:39:42	2026-08-13 06:39:42	\N
50	Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut	Dyan Hira kuncahyowati	3204094809770003	1609210056042	hiradyan77@gmail.com	085735148242	Perempuan	1977-09-08	https://i.ibb.co/fzLNf7r6/dac164b3f370.jpg	["https:\\/\\/i.ibb.co\\/KzzscXfh\\/a98c44e5eb40.jpg","https:\\/\\/i.ibb.co\\/TDZC8n5W\\/1ea481e5269f.jpg","https:\\/\\/i.ibb.co\\/zhkmZQR7\\/e2d364fdb13a.jpg"]	UMIKO BAKERY MADIUN	Bolen, flossroll abon, aneka pastry n roti	Jl Ploso GG 1 no 52 Oro Oro Ombo Kartoharjo kota Madiun	Oro-Oro Ombo	Kartoharjo	Madiun	Kuliner	2017	Mikro	5000000	Ya	["Penjualan sepi","Marketing kurang efektif","Modal terbatas","SDM kurang"]	["WhatsApp","Instagram","Website"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	2	2	Mandiri	Sudah tapi belum maksimal	Belum	Bisa meningkatkan penjualan	Menambah omzet	f	2026-08-13 06:42:51	2026-08-13 06:42:51	\N
51	Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut	Mochamad Arif Budi witjaksono	3578082904770003	2909250041801	mochamad.arif.budi78@gmail.com	081358918818	Laki-laki	1977-04-29	https://i.ibb.co/tpz9mncf/1cd9b9a7183a.jpg	["https:\\/\\/i.ibb.co\\/LdYb2kGF\\/99df358c8d89.png","https:\\/\\/i.ibb.co\\/SDCmBtMp\\/1a37af9fc21a.jpg","https:\\/\\/i.ibb.co\\/ks7nGX4t\\/5a6b7ff5c52f.jpg"]	Tumbas Coffee	Kopi susu	Prambanan 23	Madiun Lor	Manguharjo	Madiun	Kuliner	2025	Kecil	500000	Tidak	["Penjualan sepi","Modal terbatas"]	["Offline (toko)","WhatsApp","Instagram","Marketplace"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	0	0	Mandiri	Sudah tapi belum maksimal	Belum	Bisa menambah ilmu dalam pembuatan coffee serta menambah menu varian dalam jualan dan menambah kawan	Bisa membeli mesin ekspresso serta bisa meningkatkan jumlah penjualan dalam sehari	f	2026-08-13 06:48:51	2026-08-13 06:48:51	\N
52	Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut	ANTON E PRASETYO	3577031104860001	Belum (Bersedia)	omanprasetyo626@gmail.com	083175610385	Laki-laki	1986-04-11	https://i.ibb.co/3mWvkw47/ef1123a0f816.jpg	\N	Oman Tea&Co	Minuman Kopi dan Teh	Jl. Joiranan no. 9B	Mojorejo	Taman	Madiun	Kuliner	2026	Mikro	300000	Tidak	["Modal terbatas"]	["Offline (toko)"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	0	0	Mandiri	Belum	Belum	Semoga bisa buka Coffee Shop di tempat strategis	Menambah income bulanan	f	2026-08-13 07:24:13	2026-08-13 07:24:13	\N
53	Pelatihan Olahan Keripik - Fasilitasi Sertifikasi Halal Self Declare	Chofifah Fitriana	2171105508849010	Belum (Bersedia)	chofifahfitriana373@gmail.com	081536307031	Perempuan	1984-08-15	https://i.ibb.co/LDbsP9Jw/4772fbc710ef.jpg	["https:\\/\\/i.ibb.co\\/nqHz0d5N\\/80f2dca3ec52.jpg","https:\\/\\/i.ibb.co\\/vCx3Njyj\\/642eb4723538.jpg","https:\\/\\/i.ibb.co\\/WvSmcyH7\\/ec32123818e7.jpg"]	Lempeng Huda	Lempeng	Jl.Merpati gang derkuku no 47b	Nambangan Lor	Manguharjo	Madiun	Kuliner	2018	Kecil	1200000	Ya	["Lainnya"]	["Offline (toko)"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	0	0	Mandiri	Belum	Belum	Penjualan lebih luas lagi n lebih rame	Omset naik n menambah reseller	f	2026-08-13 08:23:16	2026-08-13 08:23:16	\N
54	Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut	Anton Sulistyo Irawan, S.E.	3577032607800001	2807250116441	letterforanton@gmail.com	085104477977	Laki-laki	1980-07-26	https://i.ibb.co/ZRbnvwr9/70d379ef6818.jpg	["https:\\/\\/i.ibb.co\\/1YmrZDJG\\/9384ea1db975.jpg","https:\\/\\/i.ibb.co\\/MDXPMY1x\\/8c021c21ea51.jpg","https:\\/\\/i.ibb.co\\/2YFVVd9K\\/7c2929e24144.jpg"]	Kopi Seduhlur, by FoodLab	Kopi seduh dan telur. Rencananya menambah lini usaha di roastery dan produksi sirup.	Jl. Mastrip, Ruko Pasar Mojorejo No. 22	Mojorejo	Taman	Madiun	Kuliner	2026	Mikro	3500000	Ya	["Modal terbatas","SDM kurang","Lainnya"]	["Offline (toko)","WhatsApp","Instagram","Marketplace"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)","Regional (Antar Provinsi\\/Nasional)"]	1	1	Mandiri	Sudah tapi belum maksimal	Belum	Bisa membangun sistem dan training karyawan. Karena sedang bersiap ekspansi ke dalam maupun beberapa kota.	Menguasai sampai ke teknik roastery, menguasai jalur suppliet syrup dengan basis glucose, serta expansi brand keluar kota, dibantu teman2 distributor, dengan Madiun sebagai centernya, dan makanan nastel sebagai main signature nya.	f	2026-08-13 10:06:47	2026-08-13 10:06:47	\N
55	Pelatihan Minuman Instan dan Sirup - Fasilitasi Sertifikasi Halal Self Declare	Anton Sulistyo Irawan, S.E.	3577032607800001	2807250116441	letterforanton@gmail.com	085104477977	Laki-laki	1980-07-26	https://i.ibb.co/ZRbnvwr9/70d379ef6818.jpg	["https:\\/\\/i.ibb.co\\/SX2PX747\\/fabf47351af1.jpg","https:\\/\\/i.ibb.co\\/1YmrZDJG\\/9384ea1db975.jpg","https:\\/\\/i.ibb.co\\/BK50js9R\\/b522a32d8de5.jpg"]	Kopi Seduhlur, by FoodLab	Kopi seduh dan telur. Rencananya menambah lini usaha di roastery dan produksi sirup.	Jl. Mastrip, Ruko Pasar Mojorejo No. 22.	Mojorejo	Taman	Madiun	Kuliner	2026	Mikro	3500000	Ya	["Modal terbatas","SDM kurang","Lainnya"]	["Offline (toko)","WhatsApp","Instagram","Marketplace"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)","Regional (Antar Provinsi\\/Nasional)"]	1	1	Mandiri	Sudah tapi belum maksimal	Belum	Membuka jalur franchise brand dengan Madiun sebagai centernya, dan memproduksi sendiri sirup2 utk minuman.	Membuka roastery dan produksi sirup. Terutama sirup2 untuk base kopi.	f	2026-08-13 10:13:47	2026-08-13 10:13:47	\N
56	Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut	DENI SATRIA PUTRA	3577032712040001	Belum (Bersedia)	akui17534@gmail.com	081990923728	Laki-laki	2004-12-27	https://i.ibb.co/99zQZcqn/2c2cd4d0834e.jpg	["https:\\/\\/i.ibb.co\\/7dV59wYp\\/dcfb89ead0fe.jpg"]	swargacoffe	kopi susu botolan	Jl.Banjawaru kota madiun	Banjarejo	Taman	Madiun	Kuliner	2026	Kecil	500000	Ya	["Modal terbatas"]	["WhatsApp","Instagram"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	0	0	Mandiri	Sudah tapi belum maksimal	Belum	ingin produk saya dikenal banyak orang dan disukai semua kalangan	bisa buka kedai sendiri	f	2026-08-13 12:29:11	2026-08-13 12:29:11	\N
57	Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut	Alvian surya adi cahya	3501072010950001	2601220039406	alvianzuto22@gmail.com	082139079095	Laki-laki	1995-10-20	https://i.ibb.co/R4Hy0tnC/ac4b81eccc11.jpg	["https:\\/\\/i.ibb.co\\/DgtXtC92\\/63eb00e65f90.jpg","https:\\/\\/i.ibb.co\\/8FQwzQB\\/1f31a9813792.jpg"]	TOYIBAH KOPI	Kopi	Jl gegono manis 5 no:8 manisrejo, taman, madiun kota	Manisrejo	Taman	Madiun	Kuliner	2021	Mikro	500000	Ya	["Modal terbatas","Lainnya"]	["Offline (toko)","WhatsApp"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	0	0	Mandiri	Sudah tapi belum maksimal	Belum	Laris manis	Produksi meningkat, punya outlet	f	2026-08-13 14:15:34	2026-08-13 14:15:34	\N
58	Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut	Andhika Ali Mustafa	3519040603060004	Belum (Bersedia)	andhikaalimustafa@gmail.com	087855688304	Laki-laki	2006-03-06	https://i.ibb.co/p6G3G7m6/d54b29ebfc4f.jpg	["https:\\/\\/i.ibb.co\\/MDRjJLP3\\/5badb4a0b0f8.jpg"]	-	Kopi	-	Oro-Oro Ombo	Kartoharjo	Madiun	Jasa	00000	Mikro	0	Tidak	["Lainnya"]	[]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	0	0	Mandiri	Belum	Belum	bisa buka coffeshop sendiri	belajar skill barista lebih mendalam	f	2026-08-13 20:21:21	2026-08-13 20:21:21	\N
59	Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut	Muhamad Noval	3577012505020007	Belum (Bersedia)	masknopal25@gmail.com	085536877898	Laki-laki	2026-08-14	https://i.ibb.co/1t88CVkK/7db92702819b.png	["https:\\/\\/i.ibb.co\\/pv29x0tK\\/29c83c9ba8d3.png"]	YourCoffe	Minuman Coffe & Non-Coffe	Jl.Bhakti Wijaya No.25 Kel.Klegen Kec.Kartoharjo Kota Madiun	Klegen	Kartoharjo	Madiun	Kuliner	2025	Menengah	10000000	Ya	["Marketing kurang efektif"]	["Instagram"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	6	0	Mandiri	Sudah aktif	Belum	Usaha menjadi lebih ramai	Masyarakat dapat mengetahui bahwa YourCoffe itu merupakan usaha coffeshop yang memiliki rasa yang nikmat dan tempat yang sangat nyaman,bersih, dan cozy.	f	2026-08-14 00:13:49	2026-08-14 00:13:49	\N
60	Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut	NOVIAWAN ROBY PRATAMA	3577020111920004	Belum (Bersedia)	21noviawanroby@gmail.com	08121608069	Laki-laki	1992-11-01	https://i.ibb.co/ymgyCf7z/b08ce4e9d70b.jpg	\N	Cafe Borobudur	Kopi dan caffe shop	Jl Borobudur gang 4 no 88 Kel Madiun Lor Kec Manguharjo Kota Madiun	Madiun Lor	Manguharjo	Madiun	Kuliner	2026	Menengah	2000000	Musiman	["SDM kurang"]	["WhatsApp"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	1	Mandiri	Sudah tapi belum maksimal	Belum	Harapan saya agar bisa buka coffe shop	Cuan cuan cuan	f	2026-08-14 01:24:32	2026-08-14 01:24:32	\N
61	Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut	Anggriono Setiawan	3577020207800003	2011230107947	shintasetyowati77@gmail.com	08118333295	Laki-laki	1980-07-02	https://i.ibb.co/V0k7Zrb6/cea52cb38821.jpg	["https:\\/\\/i.ibb.co\\/bjfSRWtw\\/784959548cb2.jpg"]	Kedai KopiKen	Minuman	Taman lalu lintas Bantaran Kota Madiun	Madiun Lor	Manguharjo	Madiun	Kuliner	2026	Kecil	25000000	Ya	["SDM kurang"]	["Offline (toko)"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	0	Mandiri	Sudah aktif	Belum	Usaha semakin berkembang	Penambahan lokasi usaha	f	2026-08-14 01:38:59	2026-08-14 01:38:59	\N
62	Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut	Vino munif ardianto	3321013011840006	2002250019569	vinomunifardianto@gmail.com	087829633357	Laki-laki	1984-11-30	https://i.ibb.co/twRHZDKz/e2bf911536b2.jpg	\N	Prima rasa ae	Rica paru	Perum BWI 2 blok B 12a	Manguharjo	Manguharjo	Madiun	Kuliner	2020	Mikro	3000000	Ya	["Modal terbatas"]	["WhatsApp"]	[]	0	0	Mandiri	Sudah tapi belum maksimal	Belum	Memperluas pemasaran	Omzet naik 10x\nPemasangan lambat luas	f	2026-08-14 04:15:18	2026-08-14 04:15:18	\N
63	Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut	Chornelius Indra Wijaya	3507251107010005	Belum (Bersedia)	kuunindra@gmail.com	08990066787	Laki-laki	2001-07-11	https://i.ibb.co/bRPdvVZK/db7f7d6dd95c.jpg	\N	Medika Merpati	Obat	Jl. Ruko Merpati No 22	Nambangan Lor	Manguharjo	Madiun	Jasa	2026	Menengah	5000000	Musiman	["Penjualan sepi","SDM kurang"]	["Offline (toko)"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	3	0	Mandiri	Belum	Belum	Ingin Membuka usaha di bidang kopi sendiri	Membuka usaha di bidang kopi	f	2026-08-14 06:03:50	2026-08-14 06:03:50	\N
64	Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut	Muhamad Al Fatih	3577030508970002	Belum (Bersedia)	alfmuhamad05@gmail.com	085895142784	Laki-laki	1997-08-05	https://i.ibb.co/YFgxmR0Y/948b0a58dcee.jpg	["https:\\/\\/i.ibb.co\\/8Hs6Hy5\\/68103f598b0a.jpg","https:\\/\\/i.ibb.co\\/mVsscrW4\\/cb50470f1ea8.jpg","https:\\/\\/i.ibb.co\\/XxMMXLn9\\/9adad88d25d7.jpg"]	Kopi Saujana	Kopi	Jl.Taman Praja Depan STIKES	Pandean	Taman	Madiun	Kuliner	2023	Menengah	18000000	Ya	["Modal terbatas","Produksi terbatas","SDM kurang"]	["Offline (toko)","WhatsApp","Instagram"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	3	2	Mandiri	Sudah aktif	Belum	ingin menjangkau pembeli secara luas, misalnya se karesidenan madiun	Menambah jumlah titik outlet	f	2026-08-14 07:33:23	2026-08-14 07:33:23	\N
65	Pelatihan Olahan Keripik - Fasilitasi Sertifikasi Halal Self Declare	Nur Habibah salam	3577034304950004	0701250013275	nurhabibahsalam03@gmail.com	083122011291	Perempuan	1995-04-03	https://i.ibb.co/N2xQwDNc/c1d6e810bce2.jpg	["https:\\/\\/i.ibb.co\\/s9gfGywG\\/8129764b2ba6.jpg"]	Pentol goreng	Pentol goreng isi puyuh,sosis	Jalan setia Budi no.89d	Mojorejo	Taman	Madiun	Kuliner	2025	Kecil	200000	Ya	["Modal terbatas"]	["Offline (toko)"]	[]	0	0	Mandiri	Belum	Belum	Ingin bisa berjualan online agar orang bisa membeli lewat online	Semoga bisa maju terus	f	2026-08-14 08:18:41	2026-08-14 08:18:41	\N
66	Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare	GABRIELLE LETY CLEARESTA	3577035907030003	2808210002933	gabriellelety19@gmail.com	085712734045	Perempuan	2003-07-19	https://i.ibb.co/mrnBQRc7/c1c4a2002437.jpg	["https:\\/\\/i.ibb.co\\/14b9BLs\\/b5dfd37a2f0c.jpg","https:\\/\\/i.ibb.co\\/3YydgVpR\\/b774b3fa055e.jpg","https:\\/\\/i.ibb.co\\/fz36tt0q\\/d0cb672cce72.jpg"]	BEE’S	Layers Cake, Zuppa Soup, Kue Kering Lebaran, Donat, Croissant, Roti Manis	Jl. Pucang Arum No.9 RT.15/RW.05\nKecamatan Taman, Kelurahan Manisrejo, Kota Madiun	Manisrejo	Taman	Madiun	Kuliner	2019	Menengah	5000000	Ya	["Lainnya"]	["Offline (toko)","WhatsApp","Instagram"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)","Regional (Antar Provinsi\\/Nasional)"]	2	2	Mandiri	Sudah tapi belum maksimal	Belum	Bisa memperluas penjualan lebih safety dengan sertifikat halal	omzet naik 2x lipat	f	2026-08-14 11:23:26	2026-08-14 11:23:26	\N
67	Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare	Elvian Tri Windrarti	3577036506720003	0611240017335	elvianomar72@gmail.com	082131349994	Perempuan	1972-06-25	https://i.ibb.co/fddRXFTR/dc16e14633e1.jpg	["https:\\/\\/i.ibb.co\\/cSYdkGZp\\/a85f59cba6e9.jpg"]	Omah Bu Tri	Makanan dan masakan olahan	Perum Bumi Mas III Blok III No.06	Mojorejo	Taman	Madiun	Kuliner	2024	Mikro	500000	Musiman	["Penjualan sepi"]	["Offline (toko)","Instagram"]	["Regional (Antar Provinsi\\/Nasional)"]	0	0	Mandiri	Belum	Belum	Ingin bisa menjual produk di berbagai platform digital dan memperluas relasi	Omzet naik 2x	f	2026-08-16 07:07:18	2026-08-16 07:07:18	\N
68	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	Lilik Widiawati	3577026312750002	1710210005475	m.widya.hendra75@gmail.com	081217133836	Perempuan	1975-12-23	https://i.ibb.co/QGCk6jq/42fd434e4044.jpg	["https:\\/\\/i.ibb.co\\/gMxt7PLD\\/a406600339bf.jpg","https:\\/\\/i.ibb.co\\/MDQbzyHZ\\/beba6e4b5b91.jpg","https:\\/\\/i.ibb.co\\/39Y1Mk8f\\/2e1a093b4004.jpg"]	WMH Batik	Batik tulis dan cap	Jl. Gajah Mada 21 Madiun	Winongo	Manguharjo	Madiun	Kriya	2018	Kecil	4000000	Ya	["Modal terbatas","SDM kurang"]	["Offline (toko)","WhatsApp","Instagram","Marketplace"]	["Regional (Antar Provinsi\\/Nasional)"]	2	2	Mandiri	Sudah aktif	Pernah	Meningkatkan value dan penjualan pada produk	Value dan income bertambah	f	2026-08-18 01:49:12	2026-08-18 01:49:12	\N
69	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	Veronika Dwi Sulistiyani	3577035407710003	9120006611071	veronikads1971@gmail.com	085124255339	Perempuan	1971-07-14	https://i.ibb.co/pvV3mhVN/4f2401a7eb3c.jpg	["https:\\/\\/i.ibb.co\\/v6ZrfnZ1\\/28c103f4a47c.jpg","https:\\/\\/i.ibb.co\\/m5gFScBs\\/8ca8223a5a2c.jpg","https:\\/\\/i.ibb.co\\/n8zZvxY2\\/5c0003b7a87a.jpg"]	Aveilla Batik	Kain ,fashion ,craft batik	Jl.Candi Boko No.9 Rt.07 Rw.02 Patihan	Patihan	Manguharjo	Madiun	Fashion	2012	Mikro	40000000	Tidak	["Marketing kurang efektif"]	["Offline (toko)","WhatsApp","Instagram","Marketplace"]	["Regional (Antar Provinsi\\/Nasional)"]	2	2	Mandiri	Sudah tapi belum maksimal	Pernah	Mengembangakan usaha batik n fashion	Meningkatkan produksi dg motif yg lebih variatif dan bagus	f	2026-08-18 01:50:00	2026-08-18 01:50:00	\N
70	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	SITI ROWIYAH	3577036911730002	0203230011455	srowiyah382@gmail.com	082143385379	Perempuan	2026-11-29	https://i.ibb.co/FkyPMHZp/a98cd9ec6a16.jpg	["https:\\/\\/i.ibb.co\\/zh3j2yY3\\/926ec6be53a7.jpg","https:\\/\\/i.ibb.co\\/RTBBCTQt\\/9e8ce870c1bf.jpg","https:\\/\\/i.ibb.co\\/N6CkRYMn\\/02502ec2748f.jpg"]	Fortuna 73	Batik tulis dan batik cap	Perum Griya Persada Asri no A.11 jl.koperasi RT 12 RW 04 Kel.Banjarejo kec Taman kota Madiun	Banjarejo	Taman	Madiun	Kriya	2011	Mikro	250	Ya	["Modal terbatas","SDM kurang"]	["Offline (toko)","WhatsApp"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	0	2	Mandiri	Sudah tapi belum maksimal	Belum	Ingin bisa mendesain batik kota Madiun yg lebih estetik lgi	Menambah omzet	f	2026-08-18 01:50:44	2026-08-18 01:50:44	\N
71	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	Septy Kusumawardani	3577034409720002	0511210000879	mbaksepti77@gmail.com	085336947438	Perempuan	1972-09-04	https://i.ibb.co/q3hwnjjt/4f0a011ea047.jpg	["https:\\/\\/i.ibb.co\\/fdNt9vGc\\/80ad0017a2b8.jpg","https:\\/\\/i.ibb.co\\/v4pqpryh\\/0e3aaf9f2c9d.jpg","https:\\/\\/i.ibb.co\\/Fk5LD7PN\\/a36136566e91.jpg"]	Deyfa batik	Batik tulis,cap,kombinasi cap tulis	Jl.Pagu Indah 6 no 6 Manisrejo Taman Madiun	Manisrejo	Taman	Madiun	Fashion	2020	Mikro	2000000	Ya	["Marketing kurang efektif","Modal terbatas","Produksi terbatas","SDM kurang"]	["Offline (toko)","WhatsApp"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)","Regional (Antar Provinsi\\/Nasional)"]	1	1	Mandiri	Belum	Pernah	Bisa meningkatkan skill sehingga menghasilkan produk yang lebih baik,unik dengan ide desain kreatif untuk meningkatkan omset	Menambah omset penjualan	f	2026-08-18 01:52:30	2026-08-18 01:52:30	\N
72	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	Helda Tri Habsari	3577035801840003	1505240026057	soethinkseraphim@gmail.com	082132083171	Perempuan	1984-01-18	https://i.ibb.co/PG25nzrq/e4cb92c0f38d.jpg	["https:\\/\\/i.ibb.co\\/RT36Rgzt\\/7072df03e817.jpg"]	Batik Habsari	Kain Batik Tulis	Perum Widodo Kencana Indah 1 blok H3 Madiun	Pandean	Taman	Madiun	Kriya	2018	Mikro	500000	Musiman	["Produksi terbatas"]	["WhatsApp","Instagram"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)","Regional (Antar Provinsi\\/Nasional)"]	0	0	Mandiri	Sudah tapi belum maksimal	Pernah	Lebih memperdalam skill produksi batik tulis	Menambah produksi dan penjualan	f	2026-08-18 01:52:34	2026-08-18 01:52:34	\N
73	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	Eny Mujayanah	3577015903770002	1509210044936	enymujayanah.2021@gmail.com	081335817372	Perempuan	1977-03-19	https://i.ibb.co/rRLKwqNp/7368955fdba1.jpg	["https:\\/\\/i.ibb.co\\/N2VV7Pjk\\/244caab59034.jpg","https:\\/\\/i.ibb.co\\/0jrt4GTp\\/7b7bac3e3fdf.jpg","https:\\/\\/i.ibb.co\\/1x0kQSd\\/5e9ca2eb14ef.jpg"]	Batik Aruny	Batik tulis, cap, ciprat	Jalan Masjid 3C RT 22 RW 5 Kota Madiun	Kanigoro	Kartoharjo	Madiun	Kriya	2019	Mikro	3000000	Ya	["Modal terbatas"]	["Offline (toko)"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	0	Mandiri	Sudah tapi belum maksimal	Belum	Untuk meningkatkan skill Agar usaha semakin maju dan berkembang	Usaha maju dan omzet naik 5x lipat	f	2026-08-18 01:52:41	2026-08-18 01:52:41	\N
74	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	Ratna Sugiarti Sukati Putri	3577015910820001	2110210026605	chana2stars@gmail.com	087753831122	Perempuan	1982-10-19	https://i.ibb.co/4nD7kBf2/4935c4aa2f07.jpg	["https:\\/\\/i.ibb.co\\/XfJT56cs\\/c68377543f69.jpg"]	Batik Ndalem Nusantara	Kain batik	Jl.Nusantara no.6b	Klegen	Kartoharjo	Madiun	Fashion	2023	Mikro	300000	Tidak	["Penjualan sepi","Modal terbatas","Produksi terbatas"]	["WhatsApp","Instagram"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	1	Mandiri	Sudah tapi belum maksimal	Pernah	Mendapatkan banyak orderan	Omset naik	f	2026-08-18 01:53:31	2026-08-18 01:53:31	\N
75	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	wiwin panorama	3518146907770001	1109210033467	win.panoramabatik@gmail.com	085604148600	Perempuan	1977-07-29	https://i.ibb.co/WvztL6Td/a9baa71fa098.jpg	["https:\\/\\/i.ibb.co\\/4wd40Nr3\\/ec907ad9716f.jpg","https:\\/\\/i.ibb.co\\/MxWSfN0r\\/b39e62d58ff8.jpg","https:\\/\\/i.ibb.co\\/Qj3hf9rF\\/679ef00c5e65.jpg"]	Panorama	Batik tulis, cap, kombinasi, ecoprint, shibory ciprat craf	Perum panorama wilis blok a no 23 rt 55 re 18	Pandean	Taman	Madiun	Kriya	2013	Mikro	3500000	Ya	[]	["Offline (toko)","WhatsApp","Instagram","Website"]	["Regional (Antar Provinsi\\/Nasional)"]	2	1	Mandiri	Sudah tapi belum maksimal	Pernah	Menambah variasi utk motif batik	Omset rp 10.000.000 per bulan	f	2026-08-18 01:55:54	2026-08-18 01:55:54	\N
76	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	Wiwik Mariyati	3577014501740003	0210000902584	wiwikmariyati0501@gmail.com	085732842848	Perempuan	1974-01-05	https://i.ibb.co/6cLKrQDy/079563835a19.jpg	["https:\\/\\/i.ibb.co\\/twkgbBmh\\/a8f78e126574.jpg","https:\\/\\/i.ibb.co\\/MDPb20qg\\/3aefc4fb2bd3.jpg","https:\\/\\/i.ibb.co\\/0Vcyqgpp\\/d70f784f4b3e.jpg"]	Batik Dewi anggraini	Kain batik	Jl Gambir sawit selatan no 27 kelurahan sogaten	Sogaten	Manguharjo	Madiun	Fashion	2015	Mikro	2000000	Ya	["Penjualan sepi","Marketing kurang efektif"]	["Offline (toko)","WhatsApp"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	2	1	Mandiri	Sudah tapi belum maksimal	Belum	Mampu meningkatkan mutu produk	Membuat produk pakaian jadi dan tas batik atau craf dari batik	f	2026-08-18 02:20:07	2026-08-18 02:20:07	\N
77	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	Dina Aryati	3577024308810002	1406220028406	dinaaryati99@gmail.com	085235790579	Perempuan	1981-08-03	https://i.ibb.co/3ysryHFH/330ef2ccb978.jpg	["https:\\/\\/i.ibb.co\\/wN1Wy1bm\\/35a152d84797.jpg","https:\\/\\/i.ibb.co\\/Y7gkHdbr\\/4f167db2e5c3.jpg","https:\\/\\/i.ibb.co\\/fYxZRs3s\\/cd969e6687ed.jpg"]	Batik tulis nurdina	Batik tulis dan cap	Jl. Mj. sungkono gg. perkutut no.16b Rw.12 Rt.51	Nambangan Lor	Manguharjo	Madiun	Kerajinan	2012	Mikro	1000000	Tidak	["Penjualan sepi","Modal terbatas","Lainnya"]	["Offline (toko)","WhatsApp","Instagram"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	2	1	Mandiri	Sudah tapi belum maksimal	Pernah	Ingin jangkauan penjualan lebih luas dan lebih bisa bersaing dengan produk yang lain	Menambah karyawan dan memiliki galeri	f	2026-08-18 02:21:14	2026-08-18 02:21:14	2026-08-18 03:57:04
78	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	SHINTA WIJAYANTI CANDRA WARDHANI	3577034401870003	1601250061989	shinta.wijayanti04@gmail.com	085645859956	Perempuan	1987-01-04	https://i.ibb.co/hxT48fVn/5cfe94df7458.jpg	["https:\\/\\/i.ibb.co\\/mVQRHKXP\\/0ab67722d058.jpg"]	MEGANUSA	Batik	Jl. Mangga no.63	Kejuron	Taman	Madiun	Kriya	2024	Mikro	1050000	Musiman	["Produksi terbatas"]	["Offline (toko)","WhatsApp","Instagram","Website"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)","Regional (Antar Provinsi\\/Nasional)"]	0	0	Mandiri	Sudah aktif	Belum	ingin mendapatkan ilmu yang berhubungan dengan batik seperti cara design / pola yg benar dan hasilnya bisa menarik customer dengan begitu bisa meningkatkan kualitas usaha diri	menambah customer baru + omzet, bisa memproduksi banyak jenis pola batik yang lagi diminati trend sekarang	f	2026-08-18 02:22:14	2026-08-18 02:22:14	\N
79	Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare	Yuyun yuniati	3577014606740003	2701230062891	yuyunzeila974@gmail.com	081234479525	Perempuan	1974-06-06	https://i.ibb.co/SXw5k933/96b982d2a262.jpg	["https:\\/\\/i.ibb.co\\/nqG3st6k\\/dc6553939fab.jpg","https:\\/\\/i.ibb.co\\/Kx0LG3Sr\\/c2c88f60e2e6.jpg","https:\\/\\/i.ibb.co\\/V0xDQW22\\/002f1566d99d.jpg"]	Liem'Tsye Snack& Cookies	Kue	Jl. Tri Jaya VIII/ 208  RT 033 RW 007 Kel. Klegen Kec. Kartoharjo Kota Madiun	Klegen	Kartoharjo	Madiun	Kuliner	2019	Mikro	300000	Musiman	["Penjualan sepi","Marketing kurang efektif","Modal terbatas"]	["WhatsApp"]	[]	1	0	Mandiri	Belum	Belum	Ingin lebih maju dan bisa mengembangkan usaha sehingga omzet semakin meningkat	Omzet naik	f	2026-08-18 02:26:48	2026-08-18 02:26:48	\N
80	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	Nada Fairuz Izdihar	3577034803000004	1103220004568	fairuznada08@gmail.com	083845701440	Perempuan	2000-03-08	https://i.ibb.co/tTt93xmP/a6d6cd1fcf71.jpg	["https:\\/\\/i.ibb.co\\/DPxkLBmw\\/2cb6210369d6.jpg"]	Batik Nadthom	Batik tulis	Jl Sentul GG IV No 4B	Banjarejo	Taman	Madiun	Fashion	2019	Mikro	2500000	Musiman	["Produksi terbatas"]	["Offline (toko)","WhatsApp"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	2	1	Mandiri	Sudah tapi belum maksimal	Pernah	Menghasilkan produk yang lebih baik dan berdaya saing	Omzet naik dua kali lipat	f	2026-08-18 02:42:27	2026-08-18 02:42:27	\N
81	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	SLAMET	3577020508720001	2704220022874	castifaslamet@gmail.com	085648695229	Laki-laki	1972-08-05	https://i.ibb.co/kgWs8PDc/7394ee540a3c.jpg	["https:\\/\\/i.ibb.co\\/pr1QkC4q\\/6b0cc0ebf65a.jpg"]	BATIK PINCOEK	Batik tulis	Jln. Merpati no.47B	Nambangan Lor	Manguharjo	Madiun	Kerajinan	2014	Mikro	800000	Musiman	["Penjualan sepi","Marketing kurang efektif","Modal terbatas"]	["Offline (toko)"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	4	Mandiri	Sudah tapi belum maksimal	Pernah	Ingin menjual produk melalui Tiktok, Shopee agar penjualan lebih maksimal	Menambah omzet 2x lipat	f	2026-08-18 02:42:28	2026-08-18 02:42:28	\N
82	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	Agus Wijanarko	3577021411790001	0306250007516	sanggarkayonkridakenanga@gmail.com	081235902190	Laki-laki	1979-11-14	https://i.ibb.co/JwQhVLKn/a71a13f8b673.jpg	["https:\\/\\/i.ibb.co\\/nMncDZcP\\/38edf040e234.jpg","https:\\/\\/i.ibb.co\\/sp0dzNRn\\/7509dd285cb6.jpg","https:\\/\\/i.ibb.co\\/zV3d8fJJ\\/3fb3f7c449b9.jpg"]	Sanggar Kayon Krida Kenanga	Industri Batik & Kriya Wayang Kulit	Jl. Minak Koncar GG. I no 2	Winongo	Manguharjo	Madiun	Kriya	2025	Mikro	500000	Musiman	["Produksi terbatas"]	["Offline (toko)","WhatsApp","Instagram"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	0	Mandiri	Sudah tapi belum maksimal	Belum	Memperluas jaringan	Peningkatan omset	f	2026-08-18 02:43:00	2026-08-18 02:43:00	\N
83	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	Dina Aryati	3577024308810002	1406220028406	dinaaryati99@gmail.com	085235790579	Perempuan	1981-08-03	https://i.ibb.co/XfdM6Fvd/aa2610b335a9.jpg	["https:\\/\\/i.ibb.co\\/cXg2GmRt\\/5e5d12bc8e77.jpg","https:\\/\\/i.ibb.co\\/C3jLYLnb\\/9db753ad0cea.jpg","https:\\/\\/i.ibb.co\\/PGhnBKmQ\\/0473117e7a59.jpg"]	Batik Tulis Nurdina	Batik tulis dan batik cap	Jl. Mj. Sungkono Gg. Perkutut No. 16B RT 51 RW 12	Nambangan Lor	Manguharjo	Madiun	Kerajinan	2012	Mikro	1000000	Tidak	["Penjualan sepi","Marketing kurang efektif","Modal terbatas","Produksi terbatas","SDM kurang"]	["Offline (toko)","WhatsApp"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	2	1	Mandiri	Sudah tapi belum maksimal	Pernah	Ingin menjangkau pemasaran lebih luas	Menambah karyawan dan memiliki galeri atau butik	f	2026-08-18 02:43:12	2026-08-18 02:43:12	2026-08-18 03:57:12
84	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	Dina Aryati	3577024308810002	1406220028406	dinaaryati99@gmail.com	085235790579	Perempuan	1981-08-03	https://i.ibb.co/XfdM6Fvd/aa2610b335a9.jpg	["https:\\/\\/i.ibb.co\\/cXg2GmRt\\/5e5d12bc8e77.jpg","https:\\/\\/i.ibb.co\\/C3jLYLnb\\/9db753ad0cea.jpg","https:\\/\\/i.ibb.co\\/PGhnBKmQ\\/0473117e7a59.jpg"]	Batik Tulis Nurdina	Batik Tulis dan Batik cap	Jl. Mj Sungkono Gg. Perkutut No. 16B RT 51 RW 12	Nambangan Lor	Manguharjo	Madiun	Kerajinan	2012	Mikro	1000000	Tidak	["Penjualan sepi","Marketing kurang efektif","Modal terbatas","Produksi terbatas","SDM kurang"]	["Offline (toko)","WhatsApp"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	2	1	Mandiri	Sudah tapi belum maksimal	Pernah	Ingin memperluas pemasaran dan layak bersaing dengan produk lain	Menambah karyawan dan memiliki butik	f	2026-08-18 02:48:53	2026-08-18 02:48:53	\N
85	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	ELY INAYAH	3577026904710003	1108210005529	elyinayah@gmail.com	085136026495	Perempuan	1971-04-29	https://i.ibb.co/MkjK5Ftg/9d3d80441be9.jpg	["https:\\/\\/ikmjuara.my.id\\/uploads\\/foto_produk\\/1787025784_6a83d97881f18.jpg"]	BATIK RETNO DUMILAH	BATIK TULIS	JL.Cendrawasih gang pinguin 42 kota madiun	Nambangan Lor	Manguharjo	Madiun	Fashion	2018	Kecil	500000	Musiman	["Modal terbatas"]	["Offline (toko)"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	3	Mandiri	Sudah tapi belum maksimal	Pernah	UMKM terus terkafer sampai bisa meningkatkan produksi dan pemasaran	Tambah omzet penjualan dan meluas	f	2026-08-18 04:03:04	2026-08-18 04:03:04	\N
86	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	Sundari	3577016308680001	1904220028231	s19065810@gmail.com	082116550678	Perempuan	2026-08-23	https://i.ibb.co/6RQvXRLb/c4d93952bbd8.jpg	["https:\\/\\/i.ibb.co\\/CptNys8d\\/497899d26349.jpg","https:\\/\\/i.ibb.co\\/s9gdNW85\\/d1c0eeecdec8.jpg","https:\\/\\/i.ibb.co\\/rK24TntZ\\/dc66248f47a5.jpg"]	Batik tulis ndredes	Batik tulis	Jl Jaya 15b	Klegen	Kartoharjo	Madiun	Fashion	2012	Kecil	500000	Tidak	["Penjualan sepi","Marketing kurang efektif","Modal terbatas"]	["Offline (toko)","WhatsApp"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	0	1	Mandiri	Belum	Pernah	Lebih dikenal produknya	Omset bertambah	f	2026-08-18 04:17:33	2026-08-18 04:17:33	\N
87	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	WIJIATI	3577024605670002	0411240004628	wijiatimadiun@gmail.com	085335306070	Perempuan	1967-05-06	https://i.ibb.co/Z1KScx5N/700b862a1c29.jpg	["https:\\/\\/i.ibb.co\\/20Hxv7ch\\/ae356070558c.jpg"]	Batik tulis Ndima	Batik tulis	Jl. Walet No. 15	Nambangan Kidul	Manguharjo	Madiun	Kriya	2019	Mikro	2500000	Tidak	["Modal terbatas","Produksi terbatas"]	["WhatsApp","Instagram"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	0	Mandiri	Sudah tapi belum maksimal	Belum	Mampu menguasai teknik pembuatan dan eksplorasi desain motif batik khas Kota Madiun	Mengembangkan dan merilis minimal 3–5 motif batik khas Kota Madiun	f	2026-08-18 04:30:59	2026-08-18 04:30:59	2026-08-18 06:03:12
88	Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut	ALVIO MARCHELLY WINARKO	3577020103040003	Belum (Bersedia)	alvioatj@gmail.com	089630781115	Laki-laki	2004-03-01	https://i.ibb.co/v6yR3TfQ/4942f32f6874.jpg	["https:\\/\\/i.ibb.co\\/svMJTvRV\\/210dac04f609.jpg","https:\\/\\/i.ibb.co\\/VYmZFPFn\\/63f2ecd1cf5c.jpg","https:\\/\\/i.ibb.co\\/s9jvDLP2\\/001e707493eb.jpg"]	Svaada	Perkopian	Jl. Sabdopalon	Winongo	Manguharjo	Madiun	Kuliner	2026	Mikro	100000	Musiman	["Penjualan sepi","Modal terbatas","Produksi terbatas"]	["Offline (toko)","WhatsApp","Instagram","Website"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	0	0	Mandiri	Sudah tapi belum maksimal	Belum	Menambah wawasan	Menambah reseller baru	f	2026-08-18 04:31:41	2026-08-18 04:31:41	\N
89	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	Wijiati	3577024605670002	0408220021771	wijiatimadiun@gmail.com	085335306070	Perempuan	1967-05-06	https://i.ibb.co/Z1KScx5N/700b862a1c29.jpg	["https:\\/\\/i.ibb.co\\/Jwc95T3B\\/f1e419495289.jpg","https:\\/\\/i.ibb.co\\/YFBfJZS1\\/23ac590d7e83.jpg","https:\\/\\/i.ibb.co\\/20Hxv7ch\\/ae356070558c.jpg"]	Batik tulis Ndima	Kain batik	Jl walet mo 5	Nambangan Kidul	Manguharjo	Madiun	Fashion	2019	Mikro	1500000	Ya	["Penjualan sepi","Produksi terbatas"]	[]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	1	Mandiri	Sudah tapi belum maksimal	Belum	Mampu meningkatkan produksi dan mutu produk	Meningkatkan penjualan dan mutu produk	f	2026-08-18 04:38:26	2026-08-18 04:38:26	\N
90	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	WIKEN RAHMAWATI NASRIKAH	3577034811870001	2410210010895	we.rahma811@gmail.com	082257139723	Perempuan	1987-11-08	https://i.ibb.co/BKgSx0YK/30db2443ef41.jpg	["https:\\/\\/i.ibb.co\\/zhcqnrkN\\/1ea67e1e520c.jpg","https:\\/\\/i.ibb.co\\/nMmbznGN\\/5ef80ea15eb8.jpg","https:\\/\\/i.ibb.co\\/6RFXLhV2\\/6c656b9b3b7a.jpg"]	Wiyarta Raya Batik	Batik tulis	Jl Tilamupih GG V	Josenan	Taman	Madiun	Kerajinan	2020	Mikro	1000000	Musiman	["Produksi terbatas"]	["Offline (toko)"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	0	0	Mandiri	Sudah tapi belum maksimal	Belum	Ingin meningkatkan kualitas produk dan dapat berkreasi dengan motif motif baru yang bisa menjadi trend di era sekarang	Omset naik diatas 10juta / bulan, buka toko online disemua medsos dan banyak orderan, motif dan warna batik lebih bervariatif	f	2026-08-18 04:41:36	2026-08-18 04:41:36	\N
91	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	ANY HARIJANTI	3577014812690001	1710210004729	anyharijanti@gmail.com	081217198468	Perempuan	1969-12-08	https://i.ibb.co/fjMbh7S/41c50ccf82cb.jpg	["https:\\/\\/i.ibb.co\\/0ySst1bt\\/fa9123a5acc8.jpg","https:\\/\\/i.ibb.co\\/pN93yff\\/d627a7137d52.jpg","https:\\/\\/i.ibb.co\\/kgBNqrJN\\/a9d6bd0dd23c.jpg"]	Yu.An Batik	Batik Tulis, Batik Cap, Batik Ciprat	Jl. Sarana Mulya Gg. Buntu No. 21	Rejomulyo	Kartoharjo	Madiun	Kerajinan	2019	Mikro	1200000	Ya	["Penjualan sepi","Marketing kurang efektif","Produksi terbatas"]	["Offline (toko)","WhatsApp","Instagram"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)","Regional (Antar Provinsi\\/Nasional)"]	1	1	Mandiri	Sudah tapi belum maksimal	Pernah	Ingin meningkatkan penjualan melalui media sosial	Menambah omzet	f	2026-08-18 04:43:45	2026-08-18 04:43:45	\N
92	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	Sutamah	3517206511640001	0711220036616	sutama698@gmail.com	085755006759	Perempuan	1964-11-25	https://i.ibb.co/YngBTyh/78284b23bbe7.jpg	["https:\\/\\/i.ibb.co\\/MyPhHLXc\\/66b1b525686e.jpg","https:\\/\\/i.ibb.co\\/3mJnbRCS\\/71e7350eed1a.jpg"]	Batik Utama	Kain batik	Jl. Dieng Gg. Pangeran No.16 Rt.17/Rw.06	Pangongangan	Manguharjo	Madiun	Fashion	2014	Mikro	2000000	Musiman	["Penjualan sepi","Modal terbatas"]	["Offline (toko)","WhatsApp"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	0	Mandiri	Sudah tapi belum maksimal	Pernah	Bisa memperluas pemasaran di media sosial	Menaikkan omzet penjualan	f	2026-08-18 04:44:54	2026-08-18 04:44:54	\N
93	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	SUBIARSIH	3577026409680001	0711220033354	subiarsih24@gmail.com	085257038858	Perempuan	1968-09-24	https://i.ibb.co/Q3KFB3pV/4a10eb22b414.jpg	["https:\\/\\/i.ibb.co\\/8gBpHMqQ\\/e61d07ba6930.jpg","https:\\/\\/i.ibb.co\\/PGkwKRf6\\/05f0f06e70e2.jpg"]	Samara Batik	Kain Batik	Jl. Sriti, Gg. Swadaya No. 9D	Nambangan Lor	Manguharjo	Madiun	Fashion	2012	Kecil	1100000	Musiman	["Marketing kurang efektif","SDM kurang"]	["WhatsApp"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	0	0	Mandiri	Sudah tapi belum maksimal	Pernah	bisa lebih maksimal dalam penjualan	semakin banyak orderan	f	2026-08-18 04:48:01	2026-08-18 04:48:01	\N
94	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	Yuyun yuniati	3577014606740003	2701230062891	yuyunzeila974@gmail.com	081234479525	Perempuan	1974-06-06	https://i.ibb.co/1GNpDyGR/af41bd4c32b4.jpg	["https:\\/\\/i.ibb.co\\/353HwBGT\\/a27c6987fc53.jpg","https:\\/\\/i.ibb.co\\/mVHZ4p5r\\/69ca1bdc772b.jpg","https:\\/\\/i.ibb.co\\/W48jynwX\\/fb707155965a.jpg"]	Batik tulis Canting Yunita	Batik tulis	Jl. Tri Jaya VIII/208 RT 033 RW 007 Kel. Klegen Kec. Kartoharjo Kota Madiun	Klegen	Kartoharjo	Madiun	Fashion	2019	Mikro	300000	Musiman	["Marketing kurang efektif","Modal terbatas"]	["WhatsApp"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	0	Mandiri	Belum	Belum	Ingin semakin berkembang	Omzet naik	f	2026-08-18 04:52:21	2026-08-18 04:52:21	\N
95	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	DIAH ANGGRAINI	3506176109690003	1312210015044	diahanggraini021@gmail.com	081230181068	Perempuan	1969-09-21	https://i.ibb.co/tp2WK3gZ/5c7f3aca19fc.jpg	["https:\\/\\/i.ibb.co\\/ywtRfF8\\/a0eaa10f0a31.jpg"]	Batik.pergiwo pergiwati	Batik Tulis	Jl Borobudur gg V/1	Madiun Lor	Manguharjo	Madiun	Fashion	2018	Mikro	500000	Ya	["Penjualan sepi"]	["Offline (toko)","WhatsApp","Instagram","Marketplace"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	0	0	Mandiri	Sudah tapi belum maksimal	Pernah	Ingin menambah wawasan desain lebih baik.lag dan bisa.mengikuti perkembangan ( up to date) serta selalu.di upgrade pengetahuan desain ny	Menambah variasi desain.yg. pada.ujungny ada peningktan.produksi serta.peningkatan income	f	2026-08-18 04:52:58	2026-08-18 04:52:58	\N
96	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	Sri Murniati	3577016112670001	0811210040396	batikmurnimadiun@gmail.com	081335547087	Perempuan	1967-12-21	https://i.ibb.co/1G5K6WtD/8dedb1bafd5c.jpg	["https:\\/\\/i.ibb.co\\/wNxG4Rrz\\/fa7165a5001a.jpg","https:\\/\\/i.ibb.co\\/dwrLCCQh\\/0604b8c775e8.jpg","https:\\/\\/i.ibb.co\\/PvW8KkTf\\/089277dab085.jpg"]	Batik Murni Madiun	Batik tulis, Batik cap, Batik Kombinasi cap & tulis, Batik Sarimbit, Batik Pecel, Batik Pendekar	Jl. Halmahera No. 21	Oro-Oro Ombo	Kartoharjo	Madiun	Fashion	2011	Mikro	22467750	Ya	["Marketing kurang efektif","SDM kurang"]	["Offline (toko)","WhatsApp","Instagram"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)","Regional (Antar Provinsi\\/Nasional)"]	1	2	Mandiri	Sudah tapi belum maksimal	Belum	ingin berjualan di tiktok shop, shopee	omzet meningkat	f	2026-08-18 05:08:30	2026-08-18 05:08:30	\N
97	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	Djoko Slameto	3577021302560001	0220208811034	batikathanisa19@gmail.com	085855528577	Laki-laki	1956-02-13	https://i.ibb.co/yF51Vpg4/0460c504694f.jpg	["https:\\/\\/i.ibb.co\\/3yWWgM7V\\/59c11896bdfc.jpg","https:\\/\\/i.ibb.co\\/mFtwkDZX\\/2a9d4a50627c.jpg"]	Batik athanisa	Batik tulis	Jl. Sabdopalon no 19 Madiun	Winongo	Manguharjo	Madiun	Kriya	2010	Mikro	2000000	Tidak	["Penjualan sepi","Marketing kurang efektif","Modal terbatas","SDM kurang"]	["Offline (toko)"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	0	Mandiri	Belum	Pernah	Pendapatan meningkat	Pendapatan meningkat	f	2026-08-18 05:18:10	2026-08-18 05:18:10	\N
98	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	Wiwik rumiyani	3577026702700001	0306220016884	rumiyaniwiwik@gmail.com	+62 895-8085-03366	Perempuan	1970-02-27	https://i.ibb.co/jvnL6XDd/61c0a72fed89.jpg	["https:\\/\\/i.ibb.co\\/F4K0NLjz\\/cd9350b91e50.jpg","https:\\/\\/i.ibb.co\\/QBJzRK6\\/dfeb708fb5e9.jpg","https:\\/\\/i.ibb.co\\/cK9HzBCt\\/a5dc8cc1ba6e.jpg"]	Batik abadi	Kain batik	Jl sikatan gang gemak no 16 Nambangan lor	Nambangan Lor	Manguharjo	Madiun	Fashion	2012	Mikro	1000000	Ya	["Marketing kurang efektif","Produksi terbatas"]	["Offline (toko)","WhatsApp"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	1	Mandiri	Sudah tapi belum maksimal	Belum	Bisa meningkatkan kualitas produk	Menambah produksi dengan kwalitas terbaik	f	2026-08-18 05:25:22	2026-08-18 05:25:22	\N
99	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	Marsuni	3577026311750001	2410210000532	marsunisuwarsono@gmail.com	082142788653	Perempuan	1975-11-23	https://i.ibb.co/rLPL1fq/65154750c1f0.jpg	["https:\\/\\/i.ibb.co\\/HLZzMfMS\\/fa56196eb613.jpg","https:\\/\\/i.ibb.co\\/6RWZRHXZ\\/d10d6abcc8a3.jpg","https:\\/\\/i.ibb.co\\/6cgZrq9B\\/eb8f5934535f.jpg"]	Batik Qiyasan	Batik tulis ,cap ,kombinasi batik tulis dan cap	Jl.cendrawasih gg.pinguin no.24 rt 22 rw 06 kelurahan nambangan lor	Nambangan Lor	Manguharjo	Madiun	Fashion	2012	Mikro	500000	Ya	["Modal terbatas"]	["Offline (toko)","WhatsApp"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	1	Mandiri	Belum	Belum	Memprluas jaringan dan wawasan dan ingin jualan onlin	Omsetnya naik 2× lipat dan smua warga kota madiun memakai batik	f	2026-08-18 05:26:21	2026-08-18 05:26:21	\N
100	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	Aulia  Afiifah Fauzi	3577016502980002	1601230004677	auliafauzi02@gmail.com	087858042353	Perempuan	1998-02-25	https://i.ibb.co/9m2hqTkL/2c297bba05a8.jpg	\N	Batik Nabastala	Kain batik tulis dan Pakaian batik	Jalan serayu Perumahan Mutiara kencana B-7	Pandean	Taman	Madiun	Kriya	2022	Mikro	300000	Musiman	["Marketing kurang efektif","Modal terbatas","Produksi terbatas"]	["Offline (toko)","WhatsApp","Instagram"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	0	0	Mandiri	Sudah tapi belum maksimal	Pernah	Ingin meningkatkan pemahaman mengenai bisnis dan meningkat produksi	Rutin memproduksi kain batik	f	2026-08-18 05:35:59	2026-08-18 05:35:59	\N
101	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	Djoko Slameto	3577021302560001	0220208811034	batikathanisa19@gmail.com	085855528577	Laki-laki	1956-02-13	https://i.ibb.co/yF51Vpg4/0460c504694f.jpg	["https:\\/\\/i.ibb.co\\/mFtwkDZX\\/2a9d4a50627c.jpg","https:\\/\\/i.ibb.co\\/kshDcNK5\\/23c1cb2b0491.jpg","https:\\/\\/i.ibb.co\\/3yWWgM7V\\/59c11896bdfc.jpg"]	Batik athanisa	Batik tulis	Jl.sapdopalon , Madiun	Winongo	Manguharjo	Madiun	Kriya	2010	Mikro	2000000	Tidak	["Penjualan sepi","Marketing kurang efektif","Modal terbatas","Produksi terbatas","SDM kurang"]	["Offline (toko)"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	0	Mandiri	Belum	Pernah	Penjualan meningkat	Penjualan meningkat	f	2026-08-18 05:41:38	2026-08-18 05:41:38	2026-08-18 06:02:20
102	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	Suyitno	3577021109490001	1005220006733	wiwikmariyati0501@gmail.com	+62 898-5547-616	Laki-laki	1949-09-11	https://i.ibb.co/ccp9ttrV/11fa842413f5.jpg	["https:\\/\\/i.ibb.co\\/FkJ0dm4j\\/69bf63f2eda5.jpg","https:\\/\\/i.ibb.co\\/Nn6Y9zgB\\/dfdc65cf9a22.jpg","https:\\/\\/i.ibb.co\\/jkYWDcPZ\\/af5b70d5155a.jpg"]	Batik Rejo keningar	Kain batik	Jl keningar	Ngegong	Manguharjo	Madiun	Fashion	2010	Mikro	2000000	Ya	["Marketing kurang efektif"]	["Offline (toko)","WhatsApp"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	1	Mandiri	Sudah tapi belum maksimal	Belum	Meningkatkan produksi dan mutu produk	Meningkatkan penjualan dengan menjaga kwalitas produk	f	2026-08-18 06:28:04	2026-08-18 06:28:04	\N
103	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	Sri Wahyuni Muji Astuti	3577015504650001	2110210001664	sriwahyunimujiastuti65@gmail.com	08123406200	Perempuan	1965-04-15	https://i.ibb.co/rRf1Gmf7/86b9b5f28c66.jpg	["https:\\/\\/i.ibb.co\\/MystdzWP\\/e506fd0dae8c.jpg"]	Kiyoshi	Batik dan ecoprint	Jl Anekasari no 4	Rejomulyo	Kartoharjo	Madiun	Fashion	2018	Mikro	6000000	Tidak	["Penjualan sepi"]	["Offline (toko)","Instagram"]	["Regional (Antar Provinsi\\/Nasional)"]	1	2	Mandiri	Sudah tapi belum maksimal	Belum	Bisa jualan di tiktok ,etsy,omzet naik walaupun kondisi lesu	Omzet naik,bisa nmbh tenaga kerja	f	2026-08-18 06:53:29	2026-08-18 06:53:29	\N
104	Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun	Novilia Ratnawati	3577015411730002	2704220015876	liaalioo600@gmail.co	082143777744	Perempuan	1973-11-14	https://i.ibb.co/Kc6jPRjM/f8c5d657ac5f.jpg	["https:\\/\\/i.ibb.co\\/GvVCJ3MX\\/ef5687a7229c.jpg"]	Lialio Batik	Kain dan baju batik tulis, kain dan baju shibori, kain dan baju ecoprint	Jl Jati Kampir A-6	Kanigoro	Kartoharjo	Madiun	Kerajinan	2019	Mikro	1500000	Musiman	["Penjualan sepi","Modal terbatas"]	["WhatsApp","Instagram"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	2	0	Mandiri	Sudah tapi belum maksimal	Pernah	Dapat menambah ilmu dan diaplikasikan ke produk sehingga menmbah pesanan.	Adanya penambahan pesanan	f	2026-08-18 07:48:10	2026-08-18 07:48:10	\N
105	Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut	ADITYA MUSTOFA PUTRA	3519070101940002	1407260114418	putra1263022@gmail.com	08132604035	Laki-laki	1994-01-01	https://i.ibb.co/hJNFLGpy/16368925e051.jpg	["https:\\/\\/i.ibb.co\\/PzvRyVdW\\/2e69f0dbee5d.jpg","https:\\/\\/i.ibb.co\\/mVT1jhTh\\/a1a9b1acbcf2.jpg","https:\\/\\/i.ibb.co\\/ZQ9KKWY\\/cf18f7f7999e.jpg"]	TERAS SEGAR	Jus Buah	Jl. Endah Manis II No. 21	Manisrejo	Taman	Madiun	Kuliner	2026	Mikro	5000000	Musiman	["Penjualan sepi","Modal terbatas","Produksi terbatas","Lainnya"]	["Offline (toko)","WhatsApp","Instagram"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	0	0	Mandiri	Sudah aktif	Belum	memperluas jaringan penjualan di sosial media maupun offline	menaikkan omzet 2x dan menambah fasilitas alat	f	2026-08-20 07:16:57	2026-08-20 07:16:57	\N
106	Pelatihan Olahan Keripik - Fasilitasi Sertifikasi Halal Self Declare	ANGELIKA GUNADI WIDJANARKO	3577034806820001	0712210013688	chirochips.id@gmail.com	085735831635	Perempuan	1982-06-08	https://i.ibb.co/mVwtDM2c/dc8a00532adc.jpg	\N	Keripik Rambak Pisang Cheero Chips	Keripik Rambak Pisang	Jl Cokroaminoto no 88	Pandean	Taman	Madiun	Kuliner	2020	Mikro	3000000	Tidak	["Penjualan sepi","Produksi terbatas"]	["Offline (toko)","WhatsApp","Instagram","Marketplace"]	["Regional (Antar Provinsi\\/Nasional)"]	0	2	Mandiri	Sudah tapi belum maksimal	Pernah	Bisa mendapat sertifikat halal	Masuk ke retail komersial seperti supermarket, indomaret, alfamart	f	2026-08-20 07:19:37	2026-08-20 07:19:37	\N
107	Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut	TIWUK WARIYANTI	3577024109890002	Belum (Bersedia)	kedaizhikya@gmail.com	085854682746	Perempuan	1989-09-01	https://i.ibb.co/SwhR1JJb/6cc3ac117fab.jpg	["https:\\/\\/i.ibb.co\\/BKGKch5M\\/8e85e17d52f5.jpg","https:\\/\\/i.ibb.co\\/6cmnDTM1\\/f59a36919f4b.jpg","https:\\/\\/i.ibb.co\\/mFyCrKh1\\/dad5295e90dc.jpg"]	Kedai zhikya	Jasuke, telur gulung, basreng, sosis bakar, dll	TAMAN LALU LINTAS BANTARAN	Manguharjo	Manguharjo	Madiun	Kuliner	2016	Kecil	600000	Ya	["Penjualan sepi"]	["WhatsApp"]	[]	0	0	Mandiri	Belum	Belum	Bisa jadi pebisnis, dn jualannya laris srta di minati bnyk orng	Omset naik dulu deh, bru buka cabang	f	2026-08-21 07:10:21	2026-08-21 07:10:21	\N
108	Pelatihan Olahan Makanan Beku - Fasilitasi Sertifikasi Halal Self Declare	Argha Rahutama Sofiandi	3509212003840002	1006230023925	arsofiandi@gmail.com	085234433973	Laki-laki	1984-03-20	https://ikmjuara.my.id/uploads/ktp/1787309566_6a882dfee613d.jpg	["https:\\/\\/ikmjuara.my.id\\/uploads\\/foto_produk\\/1787309568_6a882e00115f8.jpg","https:\\/\\/ikmjuara.my.id\\/uploads\\/foto_produk\\/1787309569_6a882e0158bd8.jpg"]	Cwie mie amien	Cwie mie	Jl keradenan	Demangan	Taman	Madiun	Kuliner	4	Mikro	1000000	Musiman	["Lainnya"]	["WhatsApp"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	1	Mandiri	Belum	Belum	Bisa menyempurnakan produk dan menambah jaringan pemasaran agar omset bertambah dan usaha bisa dijadikan pemasukan untuk keluarga	Omset naik 5x lipat	f	2026-08-21 10:52:49	2026-08-21 10:52:49	\N
109	Pelatihan Olahan Keripik - Fasilitasi Sertifikasi Halal Self Declare	Chofifah Fitriana	2171105508849010	Belum (Bersedia)	chofifahfitriana373@gmail.com	081536307031	Perempuan	1984-08-15	https://i.ibb.co/gM0PL8zF/3400de937844.jpg	["https:\\/\\/i.ibb.co\\/nN4TPV0G\\/a46a48a0f605.jpg"]	Huda	Lempeng	Jl merpati no 47	Nambangan Lor	Manguharjo	Madiun	Kuliner	2018	Kecil	1200000	Musiman	["Lainnya"]	["Offline (toko)"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	0	0	Mandiri	Belum	Belum	Usaha lebih berkembang serta dapat ilmu	Penjualan meningkat	f	2026-08-24 16:41:14	2026-08-24 16:41:14	\N
110	Pelatihan Olahan Makanan Beku - Fasilitasi Sertifikasi Halal Self Declare	JOFI TRIYONO	3577030808830005	2408260087773	halalindonesia1997+jofi@gmail.com	085708443895	Laki-laki	1983-08-08	https://i.ibb.co/JVwbBqP/6e95c4295666.jpg	["https:\\/\\/i.ibb.co\\/1tJmm7H1\\/c5b5bf32cb77.jpg"]	Ayam Goreng BuKaji	Ayam Ungkep	Jl. Serayu Timur, No. 15, Kota Madiun	Pandean	Taman	Madiun	Kuliner	2025	Mikro	6750000	Ya	["Penjualan sepi","Marketing kurang efektif","Modal terbatas","Produksi terbatas","SDM kurang"]	["Offline (toko)","WhatsApp"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	0	Mandiri	Sudah tapi belum maksimal	Belum	Omzet naik	Omzet naik	f	2026-08-25 02:10:45	2026-08-25 02:10:45	\N
111	Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut	Yanuar Priambodo	3520111209590001	1611220035626	yanuara16@gmail.com	085895464539	Laki-laki	2026-08-11	https://i.ibb.co/0jKTTVXX/18b063554491.jpg	["https:\\/\\/i.ibb.co\\/0jKTTVXX\\/18b063554491.jpg"]	Es Doger Nona Manies	H	H	Pangongangan	Manguharjo	Madiun	Jasa	2020	Kecil	1000000	Tidak	["Penjualan sepi"]	["Offline (toko)"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	0	Mandiri	Sudah tapi belum maksimal	Belum	H	H	f	2026-08-25 04:50:22	2026-08-25 04:50:22	2026-08-26 00:54:30
112	Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut	Fifit Faturohman	3203162403840003	0908240019194	fifitfaturohman999@gmail.com	082139067114	Laki-laki	1984-03-24	https://i.ibb.co/Kzs1KDVq/357932bc7d76.jpg	["https:\\/\\/i.ibb.co\\/J8F4hxY\\/84e7773e9b52.jpg","https:\\/\\/i.ibb.co\\/B5VDqFcs\\/fac04d9706e6.jpg","https:\\/\\/i.ibb.co\\/9k5GCJdg\\/c269487eb16d.jpg"]	Es Kopi SOMAD solomadiun	Es teh dan varian es kopi	Jl. Salak no 58b	Mojorejo	Taman	Madiun	Kuliner	2024	Mikro	9000000	Tidak	["Penjualan sepi","Modal terbatas","Lainnya"]	["Offline (toko)","Instagram"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	2	2	Mandiri	Sudah tapi belum maksimal	Belum	Menambah ilmu dan strategi dari pelatihan ini	Menambah omset	f	2026-08-25 05:06:49	2026-08-25 05:06:49	\N
113	Pelatihan Minuman Instan dan Sirup - Fasilitasi Sertifikasi Halal Self Declare	Berlien safitri	3577036408790002	2608260003713	halalindonesia1997+berlien@gmail.com	0895710447888	Perempuan	1979-08-24	https://i.ibb.co/k23K4Bjp/114da6f441b4.jpg	["https:\\/\\/i.ibb.co\\/LdKwJ9bc\\/77e7ee970d2a.jpg"]	sehat bugar	minuman kunyit asem	jl mangga gg 7 no 7b	Kejuron	Taman	Madiun	Kuliner	2025	Mikro	5000000	Ya	["Penjualan sepi","Marketing kurang efektif","Modal terbatas","Produksi terbatas","SDM kurang"]	["Offline (toko)","WhatsApp"]	[]	1	0	Mandiri	Sudah tapi belum maksimal	Belum	omzet bertambah	omzet bertambah	f	2026-08-26 02:34:43	2026-08-26 02:34:43	\N
114	Pelatihan Olahan Sambal - Fasilitasi Sertifikasi Halal Self Declare	atien kiswani	3216066907760011	2608260004229	halalindonesia1997+atien@gmail.com	081233301967	Perempuan	1976-07-26	https://i.ibb.co/3HVJPj2/18777890f2c4.jpg	["https:\\/\\/i.ibb.co\\/LzMHGnF0\\/008cbd5a3aa2.jpg"]	Rahayu	sambel pecel Rahayu	jl mangga gg7 no 1	Pandean	Taman	Madiun	Kuliner	2025	Mikro	5000000	Ya	["Penjualan sepi","Marketing kurang efektif","Modal terbatas","Produksi terbatas","SDM kurang"]	["Offline (toko)","WhatsApp"]	[]	1	0	Mandiri	Sudah tapi belum maksimal	Belum	ingin omzet meningat	ingin omzet meningkat	f	2026-08-26 02:43:07	2026-08-26 02:43:07	\N
115	Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare	Hari fadjar tri kusumawardani engle	3577035107700004	1509250072335	halalindonesia1997+hari@gmail.com	081357686886	Perempuan	1970-07-11	https://i.ibb.co/8LPFznv9/773e2ce2e873.jpg	["https:\\/\\/i.ibb.co\\/DD5GSc1j\\/e97944deb6d9.jpg"]	jajanan basah nena cake	lumpia	jl mundu no 20	Taman	Taman	Madiun	Kuliner	2025	Mikro	10000000	Ya	["Penjualan sepi","Marketing kurang efektif","Produksi terbatas","SDM kurang"]	["Offline (toko)","WhatsApp","Marketplace"]	[]	1	0	Mandiri	Sudah tapi belum maksimal	Belum	ingin omzet meningkat	ingin omzet meningka	f	2026-08-26 04:29:42	2026-08-26 04:29:42	\N
116	Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare	Rr.Maria guadalupe sekar puspitasari nurtjahjo	3577035711000002	2608260007394	halalindonesia1997+maria@gmail.com	085784971990	Perempuan	2000-11-17	https://i.ibb.co/pB9GrK8D/afbc28c743b9.jpg	["https:\\/\\/i.ibb.co\\/LXc8Vnfg\\/318c7eb9cad1.jpg"]	Dacheesey bakery & cake	cupcake	jl mundo no 20	Taman	Taman	Madiun	Kuliner	2025	Mikro	10000000	Ya	["Penjualan sepi","Marketing kurang efektif","Modal terbatas","Produksi terbatas","SDM kurang"]	["Offline (toko)","WhatsApp","Marketplace"]	[]	1	0	Mandiri	Sudah tapi belum maksimal	Belum	ingin omzet meningkat	ingin omzet meningkat	f	2026-08-26 04:39:21	2026-08-26 04:39:21	\N
117	Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare	Ratnawati Al Hasan	3577036311630002	2710210015455	ratnawatialhasan5@gmail.com	081231337322	Perempuan	1963-11-23	https://i.ibb.co/pvfDYthZ/7f63c37fb364.jpg	["https:\\/\\/i.ibb.co\\/Dg9nj9Tg\\/1571a3229a33.jpg"]	Warung Stop Inflasi	Kedai	Perum Taman asri No. 4	Banjarejo	Taman	Madiun	Kuliner	2018	Mikro	2000000	Tidak	["Penjualan sepi"]	["Offline (toko)","WhatsApp","Instagram"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	0	Mandiri	Sudah tapi belum maksimal	Belum	Ingin lebih mendapatkan pengakuan legalitas produk	Bisa menambah omzet	f	2026-08-27 01:56:07	2026-08-27 01:56:07	\N
118	Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare	RIA HARUM MAWARNI	3577015911770001	1248000531179	riaharum77@gmail.com	082337663901	Perempuan	1977-11-19	https://i.ibb.co/MkfT1C8G/cc4d44fd0b6a.jpg	["https:\\/\\/i.ibb.co\\/Jjfz0hwD\\/b8c84e3c6019.jpg"]	Numani	Pia	Jl. Imam Bonjol Gang Jati Subur No. 24	Klegen	Kartoharjo	Madiun	Kuliner	2020	Mikro	1500000	Tidak	["Modal terbatas"]	["WhatsApp","Instagram"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	0	Mandiri	Sudah tapi belum maksimal	Belum	ingin menambah ilmu	bisa memproduksi lebih banyak	f	2026-08-27 02:03:29	2026-08-27 02:03:29	\N
119	Pelatihan Olahan Sambal - Fasilitasi Sertifikasi Halal Self Declare	Suharni	3577024108630002	Belum (Bersedia)	dhehar55@gmail.com	081334655383	Perempuan	1963-08-01	https://i.ibb.co/G355bXhG/46239b238881.jpg	["https:\\/\\/i.ibb.co\\/XkN1b2Rb\\/de1c8e85ba27.jpg","https:\\/\\/i.ibb.co\\/XrzwhSzH\\/eae1a355601c.jpg"]	Kedai Dhe Har	Nasi Pecel, Peyek	Jl. Banda Block C No. 40C	Madiun Lor	Manguharjo	Madiun	Kuliner	2021	Mikro	1000000	Ya	["Modal terbatas","SDM kurang"]	["Offline (toko)"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	0	Mandiri	Belum	Belum	Ingin melengkapi halal	semoga makin laris lagi	f	2026-08-27 02:12:34	2026-08-27 02:12:34	\N
120	Pelatihan Olahan Makanan Beku - Fasilitasi Sertifikasi Halal Self Declare	Ari Puji Astuti	3577025605760004	2206220030655	aripuji693@gmail.com	082264484500	Perempuan	1976-05-16	https://i.ibb.co/27jr7J8z/b16cd08c2133.jpg	["https:\\/\\/i.ibb.co\\/ZRxBKL4X\\/8733df1ffe10.jpg"]	Kedai PRC	Soto, Rawon	JL.RING ROAD NO.01	Sogaten	Manguharjo	Madiun	Kuliner	2024	Mikro	2000000	Ya	["Penjualan sepi"]	["Offline (toko)"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	0	Mandiri	Belum	Belum	ingin lebih meningkatkan omzet	bisa menambah cabang jualan	f	2026-08-27 02:18:01	2026-08-27 02:18:01	\N
121	Pelatihan Olahan Makanan Beku - Fasilitasi Sertifikasi Halal Self Declare	RETNO INDARTI	3674025507790004	3001220005737	dutabintaro0911@gmail.com	081909000907	Perempuan	1979-07-15	https://ikmjuara.my.id/uploads/ktp/1787798278_6a8fa306bddbe.jpg	["https:\\/\\/i.ibb.co\\/20mN4sbd\\/cebaca40053d.jpg"]	Asinan Simoel	Salad Buah, Rujak, Asinan	Jl. Sidomulyo 1 No. 35	Kanigoro	Kartoharjo	Madiun	Kuliner	2019	Mikro	1500000	Tidak	["Penjualan sepi"]	["Offline (toko)"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	0	Mandiri	Sudah tapi belum maksimal	Belum	Ingin melengkapi halal produk saya	semoga semakin maju dan sukses	f	2026-08-27 02:37:59	2026-08-27 02:37:59	\N
122	Pelatihan Olahan Makanan Beku - Fasilitasi Sertifikasi Halal Self Declare	DIYAH SRI KUSUMA DEWI	3577034909850004	0811210043952	dadocakep30@gmail.com	081334629835	Perempuan	1985-09-09	https://ikmjuara.my.id/uploads/ktp/1787798561_6a8fa421801c1.jpg	["https:\\/\\/i.ibb.co\\/8DDht1my\\/c9038d285532.jpg"]	Cireng Mb Diyah	Cireng	Jl. Asahan No. 36	Taman	Taman	Madiun	Kuliner	2018	Mikro	3000000	Tidak	["Marketing kurang efektif"]	["Offline (toko)","WhatsApp","Instagram"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	2	0	Mandiri	Sudah tapi belum maksimal	Belum	Memperbaharui legalitas saya	bisa menambah omzet signifikan	f	2026-08-27 02:42:43	2026-08-27 02:42:43	\N
123	Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare	CITRA PUTRI ERITIKA	3520117112890002	2907230085116	halalindon.es.ia1.23@gmail.com	081252420682	Perempuan	1989-12-31	https://i.ibb.co/ks3W92Nq/4514e45c6fcb.jpg	["https:\\/\\/i.ibb.co\\/Vp0bXmbK\\/2731d67cc72b.jpg"]	mamach.eat	Bakery	PERUMAHAN REJOMULYO JL MEGA MULYA BLOK G/14	Rejomulyo	Kartoharjo	Madiun	Kuliner	2024	Mikro	1000000	Ya	["Penjualan sepi"]	["Offline (toko)"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	0	0	Mandiri	Sudah tapi belum maksimal	Belum	Ingin dapat halal	meningkatkan omzet	f	2026-08-27 02:48:49	2026-08-27 02:48:49	\N
124	Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut	Noviawan Roby Pratama	3577020111920004	Belum (Bersedia)	noviawanroby@gmail.com	08121608069	Laki-laki	1992-11-01	https://i.ibb.co/NdfZXwCk/df3d4b8ab90f.jpg	\N	Kletak kopi	Caffe	Jl Borobudur Kota Madiun	Madiun Lor	Manguharjo	Madiun	Kuliner	2026	Menengah	4000000	Ya	["Penjualan sepi","Modal terbatas","SDM kurang"]	["Offline (toko)","WhatsApp","Instagram","Marketplace","Website"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	1	Mandiri	Sudah tapi belum maksimal	Belum	Semoga bisa menjadi barista handal	Ber cuan dan menguntungkan	f	2026-08-27 10:17:26	2026-08-27 10:17:26	\N
125	Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut	Anny Dwi Poerwahjoeningtyas	3577014612790002	1509210046863	anny.dwi01@gmail.com	08121663279	Perempuan	1979-12-06	https://i.ibb.co/5XFj5mnY/5d8e68b7d237.jpg	["https:\\/\\/i.ibb.co\\/MDDqP8cL\\/52790bff46e8.jpg"]	Queen Oke	Sari kedelai	Jl. Imam Bonjol Gg Jati Trubus no 7	Klegen	Kartoharjo	Madiun	Kuliner	2015	Mikro	2000000	Ya	["Penjualan sepi","Marketing kurang efektif","Modal terbatas"]	["Offline (toko)","WhatsApp","Instagram"]	[]	1	1	Mandiri	Sudah tapi belum maksimal	Pernah	Menambah varian produk	Omzet naik	f	2026-08-28 09:39:52	2026-08-28 09:39:52	\N
126	Pelatihan Olahan Makanan Beku - Fasilitasi Sertifikasi Halal Self Declare	Anny Dwi Poerwahjoeningtyas	3577014612790002	1509210046863	anny.dwi01@gmail.com	08121663279	Perempuan	1979-12-06	https://i.ibb.co/5XFj5mnY/5d8e68b7d237.jpg	["https:\\/\\/i.ibb.co\\/rKmSgJB8\\/e3a2d8c960ca.jpg"]	Queen Oke	Kebab	Jl. Imam Bonjol Gg Jati Trubus no 7	Klegen	Kartoharjo	Madiun	Kuliner	2015	Mikro	2000000	Ya	["Penjualan sepi","Marketing kurang efektif","Modal terbatas"]	["Offline (toko)","WhatsApp","Instagram"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	1	Mandiri	Sudah tapi belum maksimal	Pernah	Menambah varian produk	Omzet naik	f	2026-08-28 09:45:03	2026-08-28 09:45:03	\N
127	Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare	Anny Dwi Poerwahjoeningtyas	3577014612790002	1509210046863	anny.dwi01@gmail.com	08121663279	Perempuan	1979-12-06	https://i.ibb.co/5XFj5mnY/5d8e68b7d237.jpg	["https:\\/\\/i.ibb.co\\/RpTVhNwH\\/c71f44f6e6b7.jpg","https:\\/\\/i.ibb.co\\/XfJyvYDq\\/c30012ed4fcf.jpg","https:\\/\\/i.ibb.co\\/KjcCX6GR\\/c2f95d14901f.jpg"]	Queenny	Kue kue	Jl. Imam Bonjol Gg Jati Trubus no 7	Klegen	Kartoharjo	Madiun	Kuliner	2020	Mikro	1000000	Musiman	["Penjualan sepi","Marketing kurang efektif","Modal terbatas"]	["Offline (toko)","WhatsApp","Instagram"]	[]	1	1	Mandiri	Sudah tapi belum maksimal	Pernah	Menambah varian	Omzet naik	f	2026-08-28 09:49:33	2026-08-28 09:49:33	\N
128	Pelatihan Olahan Keripik - Fasilitasi Sertifikasi Halal Self Declare	BUNGA MELATI	3577026506920001	2808260059732	bungamelati92@yopmail.com	085748652355	Perempuan	1992-06-25	https://i.ibb.co/tPXpXQ62/a1462c6352ea.jpg	["https:\\/\\/i.ibb.co\\/20gS9H9x\\/2866464a5807.jpg"]	Cemkir (Cemilan Kenikir)	Cemkir (Cemilan Kenikir)	Jl. Podang No. 17B	Nambangan Kidul	Manguharjo	Madiun	Kuliner	2024	Mikro	1000000	Tidak	["Modal terbatas","SDM kurang"]	["Offline (toko)","WhatsApp"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	0	Mandiri	Sudah tapi belum maksimal	Belum	Mendapatkan pemahaman mendalam tentang standar operasional dan prosedur pengajuan sertifikasi Halal khusus untuk produk olahan keripik.	Sertifikat Halal resmi terbit dan logo Halal sudah tercetak pada seluruh desain kemasan baru produk.	f	2026-08-31 00:45:48	2026-08-31 00:45:48	\N
129	Pelatihan Olahan Keripik - Fasilitasi Sertifikasi Halal Self Declare	ARNI ROHAYATI	3577024404740003	2808260062566	arnirohayati04@yopmail.com	085748652355	Perempuan	1974-04-04	https://i.ibb.co/rKqNmyph/5cc9e02a3bf4.jpg	["https:\\/\\/i.ibb.co\\/RWMcdym\\/ea803e299f3c.jpg"]	Pangsit Balado Mbk Arni	Pangsit Balado	JL. PODANG NO. 32 MADIUN	Nambangan Kidul	Manguharjo	Madiun	Kuliner	2025	Mikro	1000000	Tidak	["Penjualan sepi","Modal terbatas","Produksi terbatas"]	["Offline (toko)","WhatsApp"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	0	Mandiri	Sudah tapi belum maksimal	Belum	Memahami aturan pencantuman logo Halal yang benar dan sah pada desain kemasan produk keripik.	Meningkatkan nilai jual atau harga produk secara wajar yang diimbangi dengan perbaikan kualitas kemasan bersertifikat.	f	2026-08-31 00:49:21	2026-08-31 00:49:21	\N
130	Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut	Aradeansyah Satria Muladata	3577011911860002	Belum (Bersedia)	aradata19@gmail.com	085736645678	Laki-laki	1986-11-19	https://i.ibb.co/931xtxbD/5bf3ed0a7f42.jpg	["https:\\/\\/i.ibb.co\\/DD0bgs9M\\/bc4c9f76ee55.jpg","https:\\/\\/i.ibb.co\\/mrz26NvT\\/3533c5f5ba1d.jpg","https:\\/\\/i.ibb.co\\/svcCKX5z\\/daeeb0e44bce.jpg"]	Kelakon Ngopi	Sajian minuman berbasis kopi dan non kopi	Jalan Rokan no 4 Taman Kota Madiun	Taman	Taman	Madiun	Kuliner	2026	Kecil	5000000	Ya	["Modal terbatas","Produksi terbatas"]	["Offline (toko)","WhatsApp","Instagram"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	0	Mandiri	Sudah tapi belum maksimal	Pernah	mengembangkan usaha dan bisnis	lebih dikenal dan tentunya menguntungkan	f	2026-08-31 01:57:09	2026-08-31 01:57:09	\N
131	Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut	Agusta Permana putra	3520041708980004	Belum (Bersedia)	agustapermana@gmail.com	088217890619	Laki-laki	1998-08-17	https://i.ibb.co/Fqn16CD0/f1c64660e5b0.jpg	["https:\\/\\/i.ibb.co\\/Q3vPCVCm\\/7dc0af7cd4ce.jpg","https:\\/\\/i.ibb.co\\/FqyKBZ7D\\/69b9b7f0910a.jpg","https:\\/\\/i.ibb.co\\/gZ5r6HN0\\/82400ab7e1ee.jpg"]	Srawung coffee	Kopi dan non kopi	Jl Raya Barat ds. Sempol Maospati	Winongo	Manguharjo	Madiun	Kuliner	2026	Mikro	15000000	Ya	["Penjualan sepi","Marketing kurang efektif","Modal terbatas","Produksi terbatas","SDM kurang"]	["Offline (toko)"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	6	0	Mandiri	Sudah tapi belum maksimal	Belum	Memperluas market	Omzet naik, dan memperluas usaha	f	2026-08-31 03:29:22	2026-08-31 03:29:22	\N
132	Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut	Suwanto	3577033006770005	2508230005586	oanto6378@gmail.com	081214294533	Laki-laki	1977-06-30	https://i.ibb.co/pvCrptrM/53fbace406e6.jpg	["https:\\/\\/i.ibb.co\\/Z1Ng6CJ0\\/ecd54ed67904.jpg"]	Soto	Makanan soto ayam	Jl Duku	Kejuron	Taman	Madiun	Kuliner	2015	Kecil	4000000	Tidak	["Penjualan sepi"]	["Offline (toko)"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	0	0	Mandiri	Belum	Belum	Berharap penjualan lebih laku lagi	Target saya supaya lebih berkembang lagi(laku).mengingat pembeli yang kurang sekali.	f	2026-08-31 04:19:35	2026-08-31 04:19:35	\N
133	Pelatihan Minuman Instan dan Sirup - Fasilitasi Sertifikasi Halal Self Declare	ARDHIANA SEPTIANINGRUM	3577025309920001	0220206791842	ardhianasep13@gmail.com	085736440004	Perempuan	1992-09-13	https://i.ibb.co/FLTncS6v/0401934cd6ec.jpg	["https:\\/\\/i.ibb.co\\/YBTx41Kg\\/9372864bbf41.jpg"]	WRAHAS	KEFIR	JL. CAMPUR SARI III NO.4	Sogaten	Manguharjo	Madiun	Kuliner	2026	Mikro	5000000	Ya	["Modal terbatas","Produksi terbatas"]	["WhatsApp","Instagram","Marketplace"]	["Regional (Antar Provinsi\\/Nasional)"]	0	0	Mandiri	Sudah aktif	Pernah	Product menjadi lebih di percaya masyarakat karena sudah halal	Naik omset 3x lipat	f	2026-08-31 12:31:25	2026-08-31 12:31:25	\N
134	Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare	Rini Yuni Rahayu	3577037006750002	2708260016261	riniyunirahayu@gmail.com	085113221861	Perempuan	1975-06-30	https://i.ibb.co/q3JskMhB/eca40c78162d.jpg	["https:\\/\\/i.ibb.co\\/GvMP7vcR\\/d4ab976e097b.jpg","https:\\/\\/i.ibb.co\\/V0711Dx2\\/d87ca58904f5.jpg","https:\\/\\/i.ibb.co\\/pjzbKW8y\\/91d6893b3d2c.jpg"]	Warung bu anik	Jajanan basah	Jl. Cempedak nomor 57 Kota madiun	Taman	Taman	Madiun	Kuliner	2021	Mikro	800000	Musiman	["Penjualan sepi","Modal terbatas"]	["Offline (toko)","WhatsApp"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	0	0	Mandiri	Belum	Pernah	Ingin berjualan di marketplace dan menambah modal	Omzet naik 2x lipat	f	2026-09-01 00:48:54	2026-09-01 00:48:54	\N
135	Pelatihan Olahan Makanan Beku - Fasilitasi Sertifikasi Halal Self Declare	Suwanto	3577033006770005	2508230005586	oanto6378@gmail.com	081214294533	Laki-laki	1977-06-30	https://i.ibb.co/C58JmPdt/6f713d409dc9.jpg	["https:\\/\\/i.ibb.co\\/Z1Ng6CJ0\\/ecd54ed67904.jpg"]	Soto	Kuliner makanan soto ayam	Jl duku	Kejuron	Taman	Madiun	Kuliner	2015	Kecil	4000000	Tidak	["Penjualan sepi"]	["Offline (toko)"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	0	0	Mandiri	Belum	Belum	Bisa berkembang	Harapan nya bisa lebih laku lagi dan bisa lebih mencukupi kebutuhan keluarga	f	2026-09-01 02:06:12	2026-09-01 02:06:12	\N
136	Pelatihan Minuman Instan dan Sirup - Fasilitasi Sertifikasi Halal Self Declare	Puji Hastuti	3577034604770002	0403240026255	pujih1092@gmail.com	089696309051	Perempuan	1978-04-06	https://i.ibb.co/LDBctSrS/1a8c0d50dbcd.jpg	["https:\\/\\/i.ibb.co\\/WSjFSGB\\/8b4c550413a1.jpg","https:\\/\\/i.ibb.co\\/RK17YHF\\/28945236b4b0.jpg","https:\\/\\/i.ibb.co\\/S4kt10yb\\/b3e5a8eb7b7a.jpg"]	Sabrina Juice	Juice buah, salad buah, sop buah, minuman sachet, kopi	Jl. Kapten saputra no 20	Kejuron	Taman	Madiun	Kuliner	2022	Mikro	2000000	Tidak	["Penjualan sepi","Modal terbatas"]	["Offline (toko)"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	0	0	Mandiri	Belum	Belum	Memperbanyak pembeli	Omset naik 2x	f	2026-09-01 04:52:52	2026-09-01 04:52:52	\N
137	Pelatihan Olahan Makanan Beku - Fasilitasi Sertifikasi Halal Self Declare	Irfan Fadhillah	3577021809990003	2708260020083	irfanfadhillah111@gmail.com	083845528380	Laki-laki	1999-09-18	https://i.ibb.co/mVy8Tx8V/233c5b905812.jpg	["https:\\/\\/i.ibb.co\\/XxDM5pB9\\/fa968feee2c7.jpg","https:\\/\\/i.ibb.co\\/s94Vc2YK\\/e64543f37537.jpg","https:\\/\\/i.ibb.co\\/TBsCY48D\\/10ec52430902.jpg"]	OKAYY DIMSUM	DIMSUM	Jalan Duku (Lapangan Gulun sisi Timur)	Kejuron	Taman	Madiun	Kuliner	2025	Mikro	4200000	Tidak	["Penjualan sepi","Marketing kurang efektif","Modal terbatas","Produksi terbatas","SDM kurang"]	["Offline (toko)","WhatsApp"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	0	Mandiri	Sudah tapi belum maksimal	Belum	Segera ingin memiliki sertifikasi Halal agar customer atau pelanggan lebih yakin untuk kulineran	Menurut saya tahun ini merasa ekonomi dari segi apapun lagi lesu , harapan untuk bulan kedepannya pembeli tetap ada dan usaha tetap bertahan	f	2026-09-01 13:17:25	2026-09-01 13:17:25	\N
138	Pelatihan Minuman Instan dan Sirup - Fasilitasi Sertifikasi Halal Self Declare	Endang Bagiyawanti	3577036805600002	2708260020408	endangsaigon60@gmail.com	081359116278	Perempuan	1960-05-28	https://i.ibb.co/xtJhYcvM/c72d0da36c4f.jpg	["https:\\/\\/i.ibb.co\\/5gn3T915\\/1a4629360001.jpg","https:\\/\\/i.ibb.co\\/q3dYKZ98\\/40c913658d2b.jpg","https:\\/\\/i.ibb.co\\/Q3PGZHTY\\/26d033352143.jpg"]	Coklat kurindu	Minuman es teh,dan es coklat	Jl duku lapangan gulun sebelah timhr	Kejuron	Taman	Madiun	Kuliner	2024	Mikro	1000000	Tidak	["Penjualan sepi","Marketing kurang efektif"]	["Offline (toko)"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	0	0	Mandiri	Belum	Belum	Ingin bisa berjualan di marketplace	Omzet naik 2x lipat	f	2026-09-02 00:32:40	2026-09-02 00:32:40	\N
139	Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut	Ganang Dwiki Pamungkas	3273230309950002	Belum (Bersedia)	ganangdwiki03@gmail.com	082116096616	Laki-laki	1995-09-03	https://i.ibb.co/tpv8dLx0/91780d496b63.jpg	["https:\\/\\/i.ibb.co\\/Kzx25Km7\\/b66c6e352447.jpg"]	Tjap Tjokro	Kopi	Jl. Indramanis 3 no.18	Manisrejo	Taman	Madiun	Kuliner	2026	Mikro	500000	Musiman	["Penjualan sepi","Modal terbatas"]	["Offline (toko)","WhatsApp"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	0	0	Mandiri	Belum	Belum	Memperluas jaringan	Menaikan omset	f	2026-09-02 05:33:29	2026-09-02 05:33:29	\N
140	Pelatihan Olahan Sambal - Fasilitasi Sertifikasi Halal Self Declare	Yanuar Priambodo	3520111209590001	1611220035626	yanuara16@gmail.com	085655480223	Laki-laki	2026-09-08	https://ikmjuara.my.id/uploads/ktp/1789512937_6aa9cce9917ee.jpg	["https:\\/\\/ikmjuara.my.id\\/uploads\\/foto_produk\\/1789512937_6aa9cce9a1465.jpg"]	Es Doger Nona Manies	H	Jl. Bolodewo No. 8	Kartoharjo	Kartoharjo	Madiun	Kuliner	2020	Mikro	1000000	Tidak	["Penjualan sepi"]	["Offline (toko)"]	["Lokal (Kabupaten\\/Kota\\/Provinsi)"]	1	0	Mandiri	Belum	Belum	Test	Test	f	2026-09-15 22:55:37	2026-09-15 22:55:37	\N
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
ZxYCT9RalkQb79HoaVeJT5yQQkv2auUbN3MagxbV	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	YTo0OntzOjY6Il90b2tlbiI7czo0MDoidTJVbm1Gc093VFJVYURaeko0ZHBKUDdaWTRJalBMaDN2cmdvZDNHMyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL2Rhc2hib2FyZCI7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvbG9naW4iO3M6NToicm91dGUiO3M6NToibG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1774324319
\.


--
-- Data for Name: siinas_industries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.siinas_industries (id, no_urut, nama_perusahaan, alamat_kantor_pusat, provinsi_kantor, kode_provinsi_kantor, kabkota_kantor, kode_kabkota_kantor, kode_kelurahan_kantor, kode_kecamatan_kantor, alamat_pabrik, provinsi_pabrik, kode_provinsi_pabrik, kabkota_pabrik, kode_kabkota_pabrik, kode_kelurahan_pabrik, kode_kecamatan_pabrik, kbli, bidang_usaha, tanggal_registrasi, skala_usaha, status_pelaporan, created_at, updated_at) FROM stdin;
1	1	PT Industri Kereta Api (Persero)	Jl. Yos Sudarso No. 71, Madiun Lor, Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Yos Sudarso No. 71, Madiun Lor, Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	28193,30200,29101	INDUSTRI MESIN PENDINGIN, INDUSTRI LOKOMOTIF DAN GERBONG KERETA SERTA INDUSTRI KENDARAAN BERMOTOR RODA EMPAT ATAU LEBIH	04/11/2016 13:57	Besar	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
2	2	PT PABRIK GULA RAJAWALI I	Jalan Undaan Kulon 57-59, Peneleh, Genteng, Kota Surabaya, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	PG Rejo Agung Baru Jl Yos. Sudarso No 23, Patihan, Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	01140,20129,10722,10721,10771,20125,11059,86104,46331,11090	Perkebunan tebu, Perdagangan gula, Industri Gula Merah, Industri Gula Pasir, Industri Kecap	30/08/2019 14:39	Besar	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
3	3	PT NITAMA	Jl. Tawang Soko Tembus Sukosari Wonodadi, Rejomulyo, Kartoharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Tawang Soko Tembus Sukosari, Wonodadi, Rejomulyo, Madiun 63119, Tawangrejo, Kartoharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920,47521	JASA INDUSTRI UNTUK BERBAGAI PENGERJAAN KHUSUS LOGAM DAN BARANG DARI LOGAM, Hot Dip Galvanize	06/11/2019 10:11	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
4	4	PT Refindo Intiselaras Indonesia	Jl Basuki Rahmad No 5, Sukosari, Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl Basuki Rahmad No 5, Sukosari, Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25119,28240,25920,68111	INDUSTRI BARANG DARI LOGAM SIAP PASANG UNTUK KONSTRUKSI LAINNYA, INDUSTRI MESIN PENAMBANGAN	27/04/2020 11:00	Besar	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
5	5	PT Latuindo Murni Perkasa	JL. URIP SUMOHARJO NO. 108 A, Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	JL. URIP SUMOHARJO NO. 108 A, Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	30200	INDUSTRI LOKOMOTIF DAN GERBONG KERETA	27/04/2020 15:37	Besar	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
6	6	PT Rekaindo Global Jasa	Jalan Candi Sewu No. 30, Madiun Lor, Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jalan Candi Sewu No. 30, Madiun Lor, Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	33141,46593,27120,33152,62019,70202,33121,72102,78200,30200	Reparasi Motor Listrik, Generator, Transformator, Reparasi Lokomotif & Gerbong Kereta	28/07/2020 17:54	Besar	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
7	7	CV Cokro Bersatu	Jln. Hayam Wuruk No. 51-53, Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jln. Hayam Wuruk No. 51-53, Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti	17/02/2021 11:05	Menengah	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
8	8	PT Surya Anugrah Gempita	Jl. Basuki Rahmad No. 3, Sukosari, Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 3, Sukosari, Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	45301,45201,45101	Perdagangan Besar Suku Cadang Dan Aksesori Mobil, REPARASI MOBIL	06/07/2021 14:37	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
9	9	PT Astra International	Menara Astra Lantai 58-63, Jl. Jenderal Sudirman Kav 5-6, Jakarta Pusat	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. HOS Cokroaminoto 47, Kejuron, Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	45201	Reparasi Mobil	07/07/2021 20:56	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
10	10	PT Willindo Kali Catur	Jl. Soekarno Hatta 1B, Demangan, Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Soekarno Hatta 1B, Demangan, Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	20292	Industri Bahan Peledak	25/08/2021 10:47	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
11	11	PR Arkana. Ud	Jl. Kalasan No 58, Patihan, Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Kalasan No 58, Patihan, Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	16221,16101,31001	Perdagangan kayu jati bahan mebel dan kusen, Industri mebel	18/10/2021 15:03	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
12	12	PT Pt.berdikari Berkat Semesta	Jl Merak, Perum Puri Permata Hijau Blok A No 27, Nambangan Kidul, Manguharjo	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl Merak, Perum Puri Permata Hijau Blok A No 27, Nambangan Kidul, Manguharjo	Jawa Timur	\N	Kota Madiun	\N	\N	\N	16230,47411,14111,47415	Peti mati covid, Perlengkapan komputer, Konveksi	25/10/2021 09:56	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
13	13	PT Pt.maju Mapan Pangastuti	Jl. Sari Mulya No. 65, Rejomulyo, Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat 10-5, Sukosari, Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	49431,23963,23957	Supplier Material, Stone Crusher, Ready Mixed and Dry Mixed Concrete	26/10/2021 16:29	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
14	14	PT Porang Rejeki Jaya	Jl. Tirta Raya No 33 Nambangan Kidul, Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Tirta Raya No 33 Nambangan Kidul, Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10613	INDUSTRI TEPUNG DARI PORANG	27/10/2021 10:06	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
15	15	PR Cipta Rasa	Jl. Mandalasari 9 Utara, Rejomulyo, Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Mandalasari No 9, Rejomulyo, Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Kue kering tradisional	21/12/2021 10:51	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
16	16	PR Aveilla Batik	Jl. Candi Boko No. 9, Patihan, Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Candi Boko No. 9, Patihan, Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik	21/12/2021 10:53	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
17	17	PR Brovelda	Jl. Thamrin Gg Melati No. 03, Klegen, Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	JL. THAMRIN GG. KAMBOJA 13C, Klegen, Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13924	Industri Kerajinan	21/12/2021 13:21	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
18	18	CV Cipta Karya Abadi Bersama	JL. TIRTA RAYA, NAMBANGAN LOR, MANGUHARJO, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	JL. TIRTA RAYA, NAMBANGAN LOR, MANGUHARJO, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11051	PRODUKSI AIR MINUM DALAM KEMASAN	11/02/2022 09:36	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
19	19	PT Inka Multi Solusi Consulting	JL. SALAK NO 23, Manisrejo, Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	JL. SALAK NO 23, Taman, Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	71102,70209,62199,62029,71201,71101,62209	AKTIVITAS KEINSINYURAN DAN KONSULTASI TEKNIS YBDI, AKTIVITAS PERANCANGAN PABRIK	18/03/2022 11:30	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
20	20	CV Abbasy Megah Karya	JL. LUMBUNG HIDUP NO 20 RT 012 RW 004, NGEGONG, MANGUHARJO, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	JL. LUMBUNG HIDUP NO 20 RT 012 RW 004, NGEGONG, MANGUHARJO, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	PENJAHITAN DAN PEMBUATAN SESUAI PESANAN	07/04/2022 17:50	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
21	21	PR Eronggo	JL. SAMBIJAJAR NO. 11, TAMAN, TAMAN, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	JL. SAMBIJAJAR NO. 11, TAMAN, TAMAN, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10612,10614	Sambel Kacang, Sambel Kepyur	11/04/2022 10:25	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
22	22	PR ENY WAHYUNINGSIH	JL. WIRARAJA NO 3, WINONGO, MANGUHARJO, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	JL. WIRARAJA NO 3, WINONGO, MANGUHARJO, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10612,13134,10710	SAMBEL KACANG, BATIK KENANGA, ONDE ONDE	19/04/2022 09:56	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
23	23	PR Rita Batik	Jl Bawono Mulyo E 25 RT 33 RW 10, Rejomulyo, Kartoharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl Bawono Mulyo E 25 RT 33 RW 10, Rejomulyo, Kartoharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik	19/04/2022 13:20	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
24	24	PUD Perumda Air Minum Tirta Taman Sari	Jl. Sulawesi No. 18, Kartoharjo, Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Pesanggrahan, Kejuron, Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11051	Air Minum Dalam Kemasan	20/04/2022 07:59	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
25	25	CV Faniyo	Jl. Tawangsuko, Sawah Lor Ban, Rejomulyo, Kartoharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Tawangsuko, Sawah Lor Ban, Rejomulyo, Kartoharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920	Jasa Pengerjaan Khusus Logam dan Barang Dari Logam	21/06/2022 11:01	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
26	26	PR Surya Kencana	Jl. Basuki Rahmat No. 9, Tawangrejo, Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 9, Tawangrejo, Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	20292	Kembang Api Mainan	29/07/2022 15:54	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
27	27	PR Lestari Wuni	JL. Wuni No. 12-B RT/RW 039/012, Kejuron, Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	JL. Wuni No. 12-B RT/RW 039/012, Kejuron, Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10794,10793	Kering Kentang, Sambel Pecel	23/08/2022 14:37	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
28	28	PR Depot Air Minum Doni	Jl. Yos Sudarso Gg. Setia No. 19, Patihan, Manguharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Yos Sudarso Gg. Setia No. 19, Patihan, Manguharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11052	Air Isi Ulang	30/08/2022 09:25	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
29	29	PR Istana Mode	Jl. Dungus Manis 18/20, Manisrejo, Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Dungus Manis 18/20, Manisrejo, Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Penjahit / Konveksi	30/08/2022 11:16	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
30	30	PR Rumah Produksi Suni	Jl. Terate Gg 2, Banjarejo, Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Terate Gg 2, Banjarejo, Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10793,11090,10710	Produksi Sambel, Produksi Jamu, Produksi Pop Corn	08/09/2022 16:13	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
31	31	PR Tebu	Jl. Panglima Sudirman No. 25 RT.032 RW.010, Kejuron, Taman, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Panglima Sudirman No. 25 RT.032 RW.010, Kejuron, Taman, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	12019	Rokok Klobot	16/09/2022 09:28	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
32	32	CV Pink Inspiration	Jl. Widosari No. 28, Oro-oro Ombo, Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Widosari No. 28, Oro-oro Ombo, Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	18111,14111	Percetakan, Konveksi	18/10/2022 14:31	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
33	33	PR Rapi	Jalan Indragiri Gg II No 14, Pandean, Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jalan Indragiri Gg II No 14, Pandean, Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120,47712,47714,14111,47713	Konveksi, Sablon, Bordir, Perlengkapan Kantor dan Sekolah	23/11/2022 09:10	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
34	34	PR In Muno	Jl. Majapahit No 47 Madiun, Winongo, Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Doho No 15 Madiun, Winongo, Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	TAS	11/01/2023 16:09	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
35	35	PR Myartin	Jl. Dwijaya 3 No 10, Klegen, Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Dwijaya 3 No 10, Klegen, Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	32903,1412	Lukis kaca, Tas kain	11/01/2023 16:16	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
36	36	PR Charu Dhatri	Jln. Semangka No. 48 RT 32/RW 10, Taman, Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jln. Semangka No. 36 RT 32/RW 10, Taman, Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	16292	Kerajinan tas goni	11/01/2023 16:18	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
37	37	PR DIAH ANGGRAINI	Jl. Borobudur Gang V/1, Madiun Lor, Manguharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Borobudur Gang V/1, Madiun Lor, Manguharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis, Batik Pergiwo Pergiwati	11/01/2023 16:22	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
38	38	PR Heny Moerdaningsih	Jl. Dwi Jaya 3 no. 9 Madiun, Klegen, Kartoharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Dwi Jaya 3 no. 9 Madiun, Klegen, Kartoharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14302,13922	Baju, Tas, Jilbab	11/01/2023 16:28	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
39	39	PR Suciae	Jalan Borobudur Gg. I No. 97, Madiun Lor, Manguharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jalan Borobudur Gg. I No. 97, Madiun Lor, Manguharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	32903	Jilbab lukis, Tas lukis, Topi lukis	11/01/2023 16:43	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
40	40	PR WIWIN SUPRIANI	PERM PANORAMA WILIS BLOK A NO 23, Pandean, Taman, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	PERM PANORAMA WILIS BLOK A NO 23, Pandean, Taman, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Industri Batik	13/01/2023 08:51	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
41	41	PR Ketut Taylor	Jl. Kamboja No. 20, Oro-oro Ombo, Kartoharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Kamboja No. 20, Oro-oro Ombo, Kartoharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Penjahitan dan Pembuatan Pakaian sesuai Pesanan	02/02/2023 13:58	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
42	42	PR Grindo	Jl. Kutai 54, Pandean, Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Kutai 54, Pandean, Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	12019	Industri	24/02/2023 19:27	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
43	43	PR Asih Wartiani	Jl. Jonggrang No. 34-B, Patihan, Manguharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Jonggrang No. 34-B, Patihan, Manguharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Jonggrang	01/03/2023 16:38	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
44	44	PR R.R Yoeni Astoeti	Jl. Banda No. 18, Madiun Lor, Manguharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Banda No. 18, Madiun Lor, Manguharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134,13912	Batik Ceriwis, YOEKFA CRAFT	02/03/2023 09:36	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
45	45	PR Wiwik Rumiyani	Jl. Sikatan Gg. Gemak No. 16, Nambangan Lor, Manguharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Sikatan Gg. Gemak No. 16, Nambangan Lor, Manguharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10750,13134	Industri Makanan dan Masakan Olahan, Batik Abadi	02/03/2023 09:38	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
46	46	PR SRI MURNIATI	Jl. Halmahera No. 14 RT/RW 026/006, Oro-oro Ombo, Kartoharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Halmahera No. 21 RT/RW 026/006, Oro-oro Ombo, Kartoharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134,10772	Batik Moerni 21, Sambel Pecel	02/03/2023 09:40	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
47	47	PR Wmh Batik	Jl. Gajahmada No. 21, Winongo, Manguharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Gajahmada No. 21, Winongo, Manguharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	WmH Batik	02/03/2023 09:43	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
48	48	PR Yu.an Batik	Jl. Sarana Mulya Gg. Buntu No. 21, Rejomulyo, Kartoharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Sarana Mulya Gg. Buntu No. 21, Rejomulyo, Kartoharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Yu.An Batik	02/03/2023 09:45	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
49	49	PR Kesiana Batik	Jl. Gambirsawit Utara No. 29, Sogaten, Manguharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Gambirsawit Utara No. 29, Sogaten, Manguharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134,38302	Batik tulis, Batik Kesiana Ana	02/03/2023 10:25	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
50	50	PR Batik Nadthom	Jl. Sentul Gg IV No 4-B, Banjarejo, Taman, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Sentul Gg IV No 4-B, Banjarejo, Taman, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Nadthom	02/03/2023 10:28	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
51	51	PR Deyfa Batik	Jl. Pagu Indah VI No. 6, Manisrejo, Taman, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Pagu Indah VI No. 6, Manisrejo, Taman, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134,14111	Deyfa Batik, Deyfa Jahit	02/03/2023 10:38	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
52	52	PR Batik Aruny	Jl. Masjid No. 3C RT.22/RW.05, Kanigoro, Kartoharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Masjid No. 3C RT.22/RW.05, Kanigoro, Kartoharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Aruny	02/03/2023 10:42	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
53	53	PR Wijiati	Jl. Walet No. 15, Nambangan Kidul, Manguharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Walet No. 15, Nambangan Kidul, Manguharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	BATIK ZAHIDA	02/03/2023 11:25	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
54	54	PR MARSUNI	Jl. Cendrawasih Gg. Pinguin No.24, Nambangan Lor, Manguharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Cendrawasih Gg. Pinguin No.24, Nambangan Lor, Manguharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Permata	02/03/2023 11:38	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
55	55	PR Lintang Mas	Jl. Prajuritan Gang Sekolah No. 04, Madiun Lor, Manguharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Prajuritan Gang Sekolah No. 04, Madiun Lor, Manguharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	21022,13134,56103	Teh Rosela, Batik tulis dan cap, Makanan ringan	02/03/2023 13:19	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
56	56	PR Batik Ndredes	Jalan Jaya 11, Klegen, Kartoharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jalan Jaya Nomor 15, Klegen, Kartoharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Kain Batik	02/03/2023 13:20	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
57	57	PR Catering El	SABDOPALON GG 1. RT/RW 005/002, Winongo, Manguharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	SABDOPALON GG 1. RT/RW 005/002, Winongo, Manguharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10799	Makanan dan Minuman Lainnya	02/03/2023 13:27	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
58	58	PR D'prim	Jalan Srigadis Gg Melati No 8 F, Kanigoro, Kartoharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jalan Srigadis Gg Melati No 8 F, Kanigoro, Kartoharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu D'Prim	02/03/2023 13:30	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
59	59	PR Sidomulyo Kitchen	jl sido mulyo 1 no.35, Kanigoro, Kartoharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	jl sido mulyo 1 no.35, Kanigoro, Kartoharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Roti dan Kue	02/03/2023 13:49	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
60	60	PR Batik Pincoek	Jl. Merpati No.47-B, Nambangan Lor, Manguharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Merpati No.47-B, Nambangan Lor, Manguharjo, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Industri Batik	02/03/2023 14:20	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
61	61	PR Sundus Suraida	Jl. Yos Sudarso No. 92, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Yos Sudarso No. 92, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis	09/04/2024 10:43	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
62	62	PR Laksmita Endah Palupi	Jl. Basuki Rahmat No. 33, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 33, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Konveksi & Tailor	16/03/2024 10:48	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
63	63	PR Argo Suryo Saputro	Jl. Yos Sudarso No. 67, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Yos Sudarso No. 67, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	25/08/2024 10:16	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
64	64	PR Asrifan	Jl. Yos Sudarso No. 63, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Yos Sudarso No. 63, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920	Jasa Bengkel Las Logam	08/09/2024 10:39	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
65	65	PR Hari Fitri Rokhayati	Jl. Thamrin No. 131, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Thamrin No. 131, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10793	Sambel Pecel	17/01/2024 10:57	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
66	66	PR Eny Setiyowati	Jl. Serayu No. 3, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Serayu No. 3, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	18/12/2024 10:18	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
67	67	PR Angelika Gunadi Widjanarko	Jl. HOS Cokroaminoto No. 139, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. HOS Cokroaminoto No. 139, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920	Jasa Bengkel Las Logam	15/06/2024 10:34	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
68	68	PR Gleddy Dinar Andytha	Jl. Basuki Rahmat No. 119, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 119, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	06/08/2024 10:26	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
69	69	PR Chairatun Lies Setyorini	Jl. Basuki Rahmat No. 30, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 30, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	21/04/2024 10:29	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
70	70	PR Dyan Hira Kuncahyowati	Jl. Pandean No. 51, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Pandean No. 51, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	23/07/2024 10:12	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
71	71	PR Endang Puji Astuti	Jl. Thamrin No. 61, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Thamrin No. 61, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	05/11/2024 10:12	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
72	72	PR Rizki Puspito Rahayu	Jl. Pandean No. 128, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Pandean No. 128, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10794	Keripik Tempe / Pisang	12/05/2024 10:21	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
73	73	CV Energy Cipta Kreasi	Jl. HOS Cokroaminoto No. 84, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. HOS Cokroaminoto No. 84, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10794	Keripik Tempe / Pisang	10/03/2024 10:16	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
74	74	PR Enny Indartie	Jl. Pandean No. 108, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Pandean No. 108, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	19/11/2024 10:34	Menengah	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
75	75	PR Ria Harum Mawarni	Jl. Soekarno Hatta No. 116, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Soekarno Hatta No. 116, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	20/07/2024 10:11	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
76	76	CV Bina Remaja Sejahtera	Jl. Yos Sudarso No. 35, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Yos Sudarso No. 35, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10793	Sambel Pecel	10/06/2024 10:56	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
77	77	PR Anny Dwi Poerwahjoeningtyas	Jl. Basuki Rahmat No. 52, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 52, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	23/03/2024 10:17	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
78	78	PR Siti Jubaidhah	Jl. HOS Cokroaminoto No. 137, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. HOS Cokroaminoto No. 137, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920	Jasa Bengkel Las Logam	16/11/2024 10:53	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
79	79	PT Gudang Makmur Tobacco	Jl. Thamrin No. 96, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Thamrin No. 96, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	09/02/2024 10:56	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
80	80	PR Marseno Budi Prasetiyo	Jl. Yos Sudarso No. 120, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Yos Sudarso No. 120, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	08/04/2024 10:28	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
81	81	PR Nurul Khamidiyah	Jl. Pandean No. 122, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Pandean No. 122, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	18/11/2024 10:20	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
82	82	PR Diah Fitri Puspitasari	Jl. Thamrin No. 144, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Thamrin No. 144, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920	Jasa Bengkel Las Logam	25/02/2024 10:44	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
83	83	PR Pamuko Kisyudho Hadi	Jl. Yos Sudarso No. 51, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Yos Sudarso No. 51, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	28/03/2024 10:26	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
84	84	PR Yuni Sulistyowati	Jl. Mayjen Sungkono No. 100, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Mayjen Sungkono No. 100, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10793	Sambel Pecel	06/11/2024 10:21	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
85	85	PR Arik Ardiana	Jl. Soekarno Hatta No. 134, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Soekarno Hatta No. 134, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	08/08/2024 10:44	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
86	86	FA Hartono & Sons	Jl. Salak No. 88, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Salak No. 88, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	28/03/2024 10:25	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
87	87	PR Kusnan Marjuki	Jl. Yos Sudarso No. 109, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Yos Sudarso No. 109, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis	15/10/2024 10:15	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
88	88	PT Starone Mitra Telekomunikasi	Jl. Salak No. 72, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Salak No. 72, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Konveksi & Tailor	16/11/2024 10:53	Menengah	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
89	89	CV Krakatoa Sukses Mandiri	Jl. Mayjen Sungkono No. 45, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Mayjen Sungkono No. 45, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis	04/02/2024 10:23	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
90	90	PR Syafril Hidayat	Jl. Mayjen Sungkono No. 5, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Mayjen Sungkono No. 5, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	21/02/2024 10:44	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
91	91	PR Nurissa Ervikasari	Jl. Mayjen Sungkono No. 74, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Mayjen Sungkono No. 74, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920, 10710	PENGERJAAN DAN PELAPISAN LOGAM, INDUSTRI PRODUK BAKERI	02/09/2024 10:16	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:06:42
92	92	PR Rustika Dewi Wijayanti	Jl. Basuki Rahmat No. 121, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 121, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090, 10750	INDUSTRI MINUMAN LAINNYA & JAMU BOTOLAN, INDUSTRI MAKANAN DAN MASAKAN OLAHAN	04/02/2024 10:21	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:03:13
93	93	PR Cahyo Kuncoro Suni Pratomo	Jl. HOS Cokroaminoto No. 79, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. HOS Cokroaminoto No. 79, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10793	Sambel Pecel	23/07/2024 10:19	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
94	94	PR Rischy Anisa Posa Putri Antono	Jl. Pandean No. 28, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Pandean No. 28, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Konveksi & Tailor	22/10/2024 10:54	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
95	95	PR Robet Frenida	Jl. Soekarno Hatta No. 120, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Soekarno Hatta No. 120, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Konveksi & Tailor	07/06/2024 10:55	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
96	96	PR Dyah Lukitasari Wardhani	Jl. Soekarno Hatta No. 12, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Soekarno Hatta No. 12, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Konveksi & Tailor	02/09/2024 10:20	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
97	97	PR Kuswati	Jl. Yos Sudarso No. 133, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Yos Sudarso No. 133, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	18/12/2024 10:33	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
98	98	PR Ika Lusiana Magdalena	Jl. Basuki Rahmat No. 20, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 20, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis	20/01/2024 10:54	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
99	99	PR Enggar Lestari Rahayu	Jl. Thamrin No. 24, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Thamrin No. 24, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	23/12/2024 10:59	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
100	100	PR Wahyu Lestari	Jl. Thamrin No. 127, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Thamrin No. 127, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis	14/03/2024 10:18	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
101	101	PR Peny Setyowati	Jl. Salak No. 113, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Salak No. 113, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	02/02/2024 10:33	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
102	102	PR Sri Suwartini	Jl. Trunojoyo No. 89, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Trunojoyo No. 89, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	27/06/2024 10:14	Menengah	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
103	103	PR Rodhiyah Agustina	Jl. Trunojoyo No. 96, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Trunojoyo No. 96, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	18/07/2024 10:56	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
104	104	PD Indah Palupi	Jl. Pandean No. 103, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Pandean No. 103, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	27/12/2024 10:31	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
105	105	PR Lily Nani Susanti	Jl. Trunojoyo No. 71, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Trunojoyo No. 71, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis	20/01/2024 10:35	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
106	106	PR Fendi Dwi Iswanto	Jl. Soekarno Hatta No. 147, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Soekarno Hatta No. 147, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10794	Keripik Tempe / Pisang	13/12/2024 10:42	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
107	107	PR Diah Novia Erlensi	Jl. HOS Cokroaminoto No. 134, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. HOS Cokroaminoto No. 134, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	20/10/2024 10:11	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
108	108	PR Retno Dinnar Mela Ambari	Jl. HOS Cokroaminoto No. 87, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. HOS Cokroaminoto No. 87, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10794	Keripik Tempe / Pisang	24/12/2024 10:13	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
109	109	PR Eva Maya Laksmina Dewi	Jl. Soekarno Hatta No. 117, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Soekarno Hatta No. 117, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920	Jasa Bengkel Las Logam	20/01/2024 10:22	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
110	110	PT Mars Tech Global	Jl. Trunojoyo No. 78, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Trunojoyo No. 78, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10794	Keripik Tempe / Pisang	02/09/2024 10:22	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
111	111	PR Sri Ismiati	Jl. Serayu No. 128, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Serayu No. 128, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	16/01/2024 10:51	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
112	112	PR Resmita Sari	Jl. Mayjen Sungkono No. 97, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Mayjen Sungkono No. 97, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Konveksi & Tailor	23/12/2024 10:56	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
113	113	PR Hesty Irawati	Jl. Soekarno Hatta No. 110, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Soekarno Hatta No. 110, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10793	Sambel Pecel	19/02/2024 10:41	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
114	114	PR Fariz Tresnanto Jati Kusuma	Jl. HOS Cokroaminoto No. 4, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. HOS Cokroaminoto No. 4, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	27/04/2024 10:52	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
115	115	PR Kristian Frenky Prasetyo	Jl. Basuki Rahmat No. 109, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 109, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis	03/10/2024 10:29	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
116	116	PR Vicha Aurelya Septiarty	Jl. Soekarno Hatta No. 12, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Soekarno Hatta No. 12, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	24/10/2024 10:33	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
117	117	PR Aditya Nur Pradipta	Jl. Mayjen Sungkono No. 89, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Mayjen Sungkono No. 89, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	19/01/2024 10:32	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
118	118	PR Adella Firdhi Irawan	Jl. Mayjen Sungkono No. 71, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Mayjen Sungkono No. 71, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	04/10/2024 10:36	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
119	119	PR Uung Sriwulan Wijayanti	Jl. HOS Cokroaminoto No. 54, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. HOS Cokroaminoto No. 54, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis	21/05/2024 10:19	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
120	120	PR Yusni Antarika Wijayanti	Jl. Yos Sudarso No. 51, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Yos Sudarso No. 51, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10794	Keripik Tempe / Pisang	27/10/2024 10:15	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
121	121	PR Herlin Susilowati	Jl. Yos Sudarso No. 71, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Yos Sudarso No. 71, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Konveksi & Tailor	01/11/2024 10:56	Menengah	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
122	122	PR Dinada Wahyu Septiana	Jl. Trunojoyo No. 31, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Trunojoyo No. 31, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	10/09/2024 10:37	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
123	123	PR Diyah Sri Kusuma Dewi	Jl. Salak No. 84, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Salak No. 84, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920	Jasa Bengkel Las Logam	01/12/2024 10:34	Menengah	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
124	124	PR Afrilia Fouri Akadiani	Jl. Trunojoyo No. 15, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Trunojoyo No. 15, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	08/02/2024 10:17	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
125	125	PR Hafidz Hazanul Azmi	Jl. HOS Cokroaminoto No. 144, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. HOS Cokroaminoto No. 144, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Konveksi & Tailor	11/07/2024 10:28	Menengah	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
126	126	CV Mitra Jaya Sejahtera	Jl. Salak No. 3, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Salak No. 3, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	12/06/2024 10:22	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
127	127	PR Yuli Nursanti	Jl. Trunojoyo No. 19, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Trunojoyo No. 19, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	03/12/2024 10:18	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
128	128	CV Toti Bintang Sakti	Jl. Salak No. 144, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Salak No. 144, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	20/04/2024 10:16	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
129	129	CV Tambang Kuliner Nusantara	Jl. Basuki Rahmat No. 72, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 72, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10793	Sambel Pecel	21/08/2024 10:57	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
130	130	CV Amins Project Teknologi Indonesia	Jl. Salak No. 84, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Salak No. 84, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Konveksi & Tailor	12/02/2024 10:52	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
131	131	CV Sumber Pangestu Mandiri	Jl. Yos Sudarso No. 104, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Yos Sudarso No. 104, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10793	Sambel Pecel	04/11/2024 10:14	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
132	132	PR Sudarti	Jl. Soekarno Hatta No. 110, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Soekarno Hatta No. 110, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis	15/03/2024 10:47	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
133	133	PR Yenita Ginawati	Jl. Yos Sudarso No. 27, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Yos Sudarso No. 27, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis	03/10/2024 10:24	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
134	134	PR Endah Tri Lestari	Jl. HOS Cokroaminoto No. 89, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. HOS Cokroaminoto No. 89, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis	10/04/2024 10:42	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
135	135	PR Ema Maharani	Jl. Salak No. 65, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Salak No. 65, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10794	Keripik Tempe / Pisang	01/05/2024 10:10	Menengah	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
136	136	CV Surya Buana Perkasa	Jl. Salak No. 102, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Salak No. 102, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Konveksi & Tailor	17/01/2024 10:36	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
137	137	CV Wirasena Mulia Abadi	Jl. Trunojoyo No. 130, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Trunojoyo No. 130, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Konveksi & Tailor	05/03/2024 10:14	Menengah	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
138	138	PR Erma Indi Silviana	Jl. Basuki Rahmat No. 121, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 121, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	02/03/2024 10:14	Menengah	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
139	139	PT Crucil Factory Indonesia	Jl. Pandean No. 22, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Pandean No. 22, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	05/02/2024 10:40	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
140	140	CV Tiga Putra Mandiri	Jl. Mayjen Sungkono No. 41, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Mayjen Sungkono No. 41, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920	Jasa Bengkel Las Logam	18/02/2024 10:23	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
141	141	PT Yada Wasista Indonesia	Jl. Soekarno Hatta No. 51, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Soekarno Hatta No. 51, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	05/09/2024 10:48	Menengah	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
142	142	PT Surya Kencana Sakti	Jl. Basuki Rahmat No. 10, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 10, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	01/11/2024 10:33	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
143	143	PR Endah Prabaning Siwi	Jl. Mayjen Sungkono No. 107, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Mayjen Sungkono No. 107, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10794	Keripik Tempe / Pisang	25/07/2024 10:58	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
144	144	PT Bebas Inti Cendekia	Jl. Mayjen Sungkono No. 65, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Mayjen Sungkono No. 65, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	05/04/2024 10:36	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
145	145	PR Erlina Dhinardijah	Jl. Salak No. 62, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Salak No. 62, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10793	Sambel Pecel	02/08/2024 10:14	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
146	146	PR Visca Lonika Silviola	Jl. Soekarno Hatta No. 123, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Soekarno Hatta No. 123, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis	22/06/2024 10:36	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
147	147	PR Rahmat Yuliawan	Jl. Basuki Rahmat No. 125, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 125, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Konveksi & Tailor	22/01/2024 10:14	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
148	148	CV Fotosintesis	Jl. Thamrin No. 118, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Thamrin No. 118, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	17/06/2024 10:10	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
149	149	PR Dewi Sulistyani	Jl. Pandean No. 22, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Pandean No. 22, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	27/08/2024 10:42	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
150	150	PR Gunawan Sastrowiyono	Jl. Salak No. 138, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Salak No. 138, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920	Jasa Bengkel Las Logam	28/09/2024 10:56	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
151	151	CV Makmur Jaya Abadi	Jl. Thamrin No. 11, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Thamrin No. 11, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920	Jasa Bengkel Las Logam	19/08/2024 10:57	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
152	152	PR Sumarsih	Jl. Mayjen Sungkono No. 100, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Mayjen Sungkono No. 100, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	22/11/2024 10:14	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
153	153	PR A.h Mintardja	Jl. Soekarno Hatta No. 66, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Soekarno Hatta No. 66, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Konveksi & Tailor	28/02/2024 10:51	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
154	154	PR Dewi Chuzaimah	Jl. Mayjen Sungkono No. 145, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Mayjen Sungkono No. 145, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	28/04/2024 10:50	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
155	155	PR Wahyu Nawangsari	Jl. Mayjen Sungkono No. 139, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Mayjen Sungkono No. 139, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis	25/03/2024 10:13	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
156	156	PR Warsi Astutiningsih	Jl. Basuki Rahmat No. 46, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 46, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920	Jasa Bengkel Las Logam	24/11/2024 10:39	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
157	157	CV Megah Kusuma	Jl. Mayjen Sungkono No. 49, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Mayjen Sungkono No. 49, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10793	Sambel Pecel	17/05/2024 10:50	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
158	158	PR Kristinar Ayu Dya	Jl. Trunojoyo No. 95, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Trunojoyo No. 95, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10794	Keripik Tempe / Pisang	07/05/2024 10:58	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
159	159	PR Wardoyo	Jl. Serayu No. 60, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Serayu No. 60, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	04/06/2024 10:46	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
160	160	PR Ahmad Syafrie Syamsudin	Jl. Basuki Rahmat No. 129, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 129, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	10/03/2024 10:11	Menengah	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
161	161	PR E Kristin Yuliana	Jl. Serayu No. 138, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Serayu No. 138, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920	Jasa Bengkel Las Logam	23/05/2024 10:30	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
162	162	PR Nunung Setiyani	Jl. Mayjen Sungkono No. 17, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Mayjen Sungkono No. 17, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis	02/06/2024 10:15	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
163	163	PR Yustikha Ratih	Jl. Salak No. 87, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Salak No. 87, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Konveksi & Tailor	16/08/2024 10:56	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
164	164	PR Muchamad Ludvi Ash Arianto	Jl. HOS Cokroaminoto No. 90, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. HOS Cokroaminoto No. 90, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920	Jasa Bengkel Las Logam	16/04/2024 10:55	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
165	165	PR Aminah Cendrakasih	Jl. Thamrin No. 87, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Thamrin No. 87, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	16/09/2024 10:39	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
166	166	PR Diyah Arum Purnomo Wulan	Jl. Mayjen Sungkono No. 90, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Mayjen Sungkono No. 90, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10793	Sambel Pecel	03/05/2024 10:54	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
167	167	PR Tina Susanti	Jl. Thamrin No. 2, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Thamrin No. 2, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	10/11/2024 10:22	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
168	168	PR Tri Vyatra Rahmawati	Jl. Salak No. 28, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Salak No. 28, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Konveksi & Tailor	07/01/2024 10:25	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
169	169	PR Ana Kasri Hendarwati	Jl. Basuki Rahmat No. 131, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 131, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10794	Keripik Tempe / Pisang	22/01/2024 10:31	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
170	170	PR Heri Eli Nuriyani	Jl. Salak No. 148, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Salak No. 148, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10794	Keripik Tempe / Pisang	17/08/2024 10:35	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
171	171	PR Novi Wijaya	Jl. Mayjen Sungkono No. 1, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Mayjen Sungkono No. 1, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis	03/01/2024 10:43	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
172	172	PR Yulis Andriana	Jl. Yos Sudarso No. 60, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Yos Sudarso No. 60, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	23/06/2024 10:44	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
173	173	PR Sambal Cumi Mak E Arsy	Jl. Salak No. 137, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Salak No. 137, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920	Jasa Bengkel Las Logam	04/08/2024 10:42	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
174	174	PR Sambel Pecel Sembilan Bintang	Jl. Soekarno Hatta No. 118, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Soekarno Hatta No. 118, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10794	Keripik Tempe / Pisang	11/04/2024 10:26	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
175	175	PR Rahmad Rejeqi Kurniawan	Jl. Mayjen Sungkono No. 85, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Mayjen Sungkono No. 85, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Konveksi & Tailor	02/12/2024 10:38	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
176	176	PT Nusa Karya Mulya Medika	Jl. Pandean No. 128, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Pandean No. 128, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Konveksi & Tailor	23/08/2024 10:20	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
177	177	PR Sri Wurjanti	Jl. Mayjen Sungkono No. 122, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Mayjen Sungkono No. 122, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Konveksi & Tailor	11/05/2024 10:14	Kecil	Terverifikasi SIINas	2026-07-30 04:00:41	2026-07-30 04:00:41
178	178	CV Berkah Konveksi	Jl. Trunojoyo No. 52, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Trunojoyo No. 52, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis	23/04/2024 10:26	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
179	179	PR Rice Indyawati	Jl. Basuki Rahmat No. 109, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 109, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	26/02/2024 10:49	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
180	180	PR Akhmad Subkhan	Jl. Serayu No. 116, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Serayu No. 116, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10794	Keripik Tempe / Pisang	24/08/2024 10:18	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
181	181	PR Titin Supini	Jl. Soekarno Hatta No. 37, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Soekarno Hatta No. 37, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10794	Keripik Tempe / Pisang	26/03/2024 10:56	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
182	182	PR Yussuf Herlambang Nurendroyono	Jl. Salak No. 20, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Salak No. 20, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10794	Keripik Tempe / Pisang	06/09/2024 10:29	Menengah	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
183	183	PR Yuyun Dwi Pangesti	Jl. HOS Cokroaminoto No. 22, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. HOS Cokroaminoto No. 22, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Konveksi & Tailor	17/09/2024 10:49	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
184	184	PR Aan Pristianto	Jl. Serayu No. 72, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Serayu No. 72, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920	Jasa Bengkel Las Logam	22/10/2024 10:44	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
185	185	PR Tutik Hariyanti	Jl. Serayu No. 148, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Serayu No. 148, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10793	Sambel Pecel	16/02/2024 10:36	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
186	186	PR Ani Sukowilistari	Jl. Mayjen Sungkono No. 85, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Mayjen Sungkono No. 85, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10793	Sambel Pecel	25/06/2024 10:52	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
187	187	PR Yahya Sriwinarti	Jl. Trunojoyo No. 124, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Trunojoyo No. 124, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	08/10/2024 10:27	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
188	188	PR Ervina Sulistyaningsih	Jl. Soekarno Hatta No. 45, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Soekarno Hatta No. 45, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10793	Sambel Pecel	21/03/2024 10:36	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
189	189	PR Amalia Ekasari Haryanti	Jl. Basuki Rahmat No. 64, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 64, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	24/08/2024 10:34	Menengah	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
190	190	PR Sutiknyo	Jl. Basuki Rahmat No. 77, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 77, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	22/09/2024 10:55	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
191	191	PR Sulistiyani	Jl. Yos Sudarso No. 62, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Yos Sudarso No. 62, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	07/04/2024 10:29	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
192	192	PR Muhammad Saifudin	Jl. Basuki Rahmat No. 66, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 66, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10793	Sambel Pecel	20/12/2024 10:22	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
193	193	PR Helda Tri Habsari	Jl. Thamrin No. 89, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Thamrin No. 89, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis	09/08/2024 10:38	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
194	194	PR Aditya Ilham Nuradhy	Jl. Serayu No. 125, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Serayu No. 125, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920	Jasa Bengkel Las Logam	03/05/2024 10:33	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
195	195	PR Arlisa Jati Wulandari	Jl. Basuki Rahmat No. 58, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 58, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920	Jasa Bengkel Las Logam	12/04/2024 10:25	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
196	196	PR Pipit Ananti Wulandari	Jl. Yos Sudarso No. 42, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Yos Sudarso No. 42, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Konveksi & Tailor	14/03/2024 10:25	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
197	197	PR Rini Pujiastuti	Jl. Basuki Rahmat No. 111, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 111, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	15/03/2024 10:41	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
198	198	PR Kiki Yuliana Gerssom	Jl. Basuki Rahmat No. 20, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 20, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	08/10/2024 10:33	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
199	199	PR Shinta Wijayanti Candra Wardhani	Jl. Thamrin No. 33, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Thamrin No. 33, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920	Jasa Bengkel Las Logam	08/08/2024 10:38	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
200	200	PT Marolis Cahaya Internasional	Jl. Salak No. 4, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Salak No. 4, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	06/07/2024 10:16	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
201	201	PR Felicia Gunawan	Jl. Yos Sudarso No. 80, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Yos Sudarso No. 80, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10793	Sambel Pecel	01/01/2024 10:45	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
202	202	PR Sri Sugiarti	Jl. HOS Cokroaminoto No. 127, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. HOS Cokroaminoto No. 127, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10793	Sambel Pecel	14/10/2024 10:50	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
203	203	PR Indria Sari Dewi	Jl. Trunojoyo No. 140, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Trunojoyo No. 140, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	20/10/2024 10:33	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
204	204	PR Lilik Susiana	Jl. Basuki Rahmat No. 67, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 67, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10794	Keripik Tempe / Pisang	02/08/2024 10:23	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
205	205	PR Tutik Purnamawati	Jl. Thamrin No. 27, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Thamrin No. 27, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10793	Sambel Pecel	18/12/2024 10:55	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
206	206	PR Anita Puspitasari	Jl. Thamrin No. 23, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Thamrin No. 23, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920	Jasa Bengkel Las Logam	14/07/2024 10:21	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
207	207	PR Risalia Asri Dewi	Jl. Thamrin No. 138, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Thamrin No. 138, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	14/11/2024 10:34	Menengah	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
208	208	PR Irma Prihatin	Jl. Pandean No. 24, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Pandean No. 24, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	28/04/2024 10:29	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
209	209	PR Atik Pundhi Asmorowati	Jl. Salak No. 23, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Salak No. 23, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Konveksi & Tailor	14/05/2024 10:18	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
210	210	PR Wasini	Jl. Soekarno Hatta No. 66, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Soekarno Hatta No. 66, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Konveksi & Tailor	14/12/2024 10:18	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
211	211	PR Lexi Diana Rakhmayanti	Jl. Pandean No. 29, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Pandean No. 29, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	24/04/2024 10:23	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
212	212	PR Heni Nur Chasanah	Jl. Mayjen Sungkono No. 109, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Mayjen Sungkono No. 109, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	11/06/2024 10:24	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
213	213	PR Agustina Supriati	Jl. Pandean No. 97, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Pandean No. 97, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	26/01/2024 10:16	Menengah	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
214	214	PR Marmi	Jl. Serayu No. 73, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Serayu No. 73, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	22/02/2024 10:11	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
215	215	PR Vivi Agustin	Jl. Soekarno Hatta No. 20, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Soekarno Hatta No. 20, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis	10/01/2024 10:56	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
216	216	PR Dwi Ambar Wati	Jl. Thamrin No. 5, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Thamrin No. 5, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis	01/06/2024 10:33	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
217	217	PR Wiwik Mariyati	Jl. Yos Sudarso No. 4, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Yos Sudarso No. 4, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10793	Sambel Pecel	17/12/2024 10:29	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
218	218	PR Fitria Krisnawati	Jl. Serayu No. 46, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Serayu No. 46, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	24/07/2024 10:32	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
219	219	PR Sugeng Maryadi	Jl. Mayjen Sungkono No. 80, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Mayjen Sungkono No. 80, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	03/05/2024 10:54	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
220	220	PR Indra Susilani	Jl. Trunojoyo No. 106, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Trunojoyo No. 106, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	20/04/2024 10:32	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
221	221	PR Romy Satya Yan Haryanto	Jl. Basuki Rahmat No. 69, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 69, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920	Jasa Bengkel Las Logam	12/10/2024 10:59	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
222	222	PR Hasna Fadhilah	Jl. Serayu No. 38, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Serayu No. 38, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	10/12/2024 10:37	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
223	223	PR Ariyanti	Jl. Pandean No. 2, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Pandean No. 2, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Konveksi & Tailor	23/02/2024 10:41	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
224	224	PR Hasmawati	Jl. Trunojoyo No. 144, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Trunojoyo No. 144, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920	Jasa Bengkel Las Logam	20/05/2024 10:58	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
225	225	PR Yuningsih	Jl. Serayu No. 12, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Serayu No. 12, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	04/02/2024 10:50	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
226	226	PR Septi Hari Kurniawati	Jl. Trunojoyo No. 83, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Trunojoyo No. 83, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920	Jasa Bengkel Las Logam	04/11/2024 10:17	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
227	227	PR Irawati Widyaningsih	Jl. Basuki Rahmat No. 86, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 86, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	05/04/2024 10:17	Menengah	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
228	228	PR Syabella Rachmadiaocta Tataksmara	Jl. Yos Sudarso No. 73, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Yos Sudarso No. 73, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis	28/07/2024 10:57	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
229	229	PR Johanes Leo Agung	Jl. Salak No. 28, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Salak No. 28, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Konveksi & Tailor	28/04/2024 10:44	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
230	230	PR Sari Shanti Marahela	Jl. Salak No. 116, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Salak No. 116, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	22/03/2024 10:42	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
231	231	PR Vina Catur Agustin	Jl. Salak No. 84, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Salak No. 84, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10794	Keripik Tempe / Pisang	20/01/2024 10:16	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
232	232	PR Noven Pramusta	Jl. Salak No. 39, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Salak No. 39, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	26/11/2024 10:46	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
233	233	PR Revina Febriani Putri	Jl. HOS Cokroaminoto No. 37, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. HOS Cokroaminoto No. 37, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Konveksi & Tailor	12/02/2024 10:19	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
234	234	PR Rahayu Pontjowati	Jl. HOS Cokroaminoto No. 57, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. HOS Cokroaminoto No. 57, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920	Jasa Bengkel Las Logam	07/01/2024 10:58	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
235	235	PR Rini Wijayanti	Jl. Yos Sudarso No. 114, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Yos Sudarso No. 114, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Konveksi & Tailor	22/11/2024 10:17	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
236	236	PR Betty Megayanti	Jl. HOS Cokroaminoto No. 117, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. HOS Cokroaminoto No. 117, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	27/11/2024 10:52	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
237	237	PR Shara Ferista Maharani	Jl. Thamrin No. 107, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Thamrin No. 107, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	02/01/2024 10:19	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
238	238	PR Muhammad Amir Pramana	Jl. Serayu No. 31, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Serayu No. 31, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Konveksi & Tailor	22/10/2024 10:57	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
239	239	PR Sunarko Tri Mulyo Seputro	Jl. Yos Sudarso No. 26, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Yos Sudarso No. 26, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	25/05/2024 10:21	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
240	240	PR Indro Gautomo	Jl. Salak No. 109, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Salak No. 109, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	17/07/2024 10:26	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
241	241	PR Imaduddin Ifai	Jl. Soekarno Hatta No. 29, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Soekarno Hatta No. 29, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920	Jasa Bengkel Las Logam	18/07/2024 10:35	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
242	242	PR Lisa Christiani	Jl. Serayu No. 20, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Serayu No. 20, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920	Jasa Bengkel Las Logam	16/04/2024 10:15	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
243	243	PR Nalia Anggraini	Jl. Mayjen Sungkono No. 101, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Mayjen Sungkono No. 101, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	01/06/2024 10:22	Menengah	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
244	244	PR Zofarlis Damayanti	Jl. Thamrin No. 72, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Thamrin No. 72, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920	Jasa Bengkel Las Logam	05/02/2024 10:39	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
245	245	PR Niniek Yuliarti Panembahan Bandoro Putri	Jl. Salak No. 79, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Salak No. 79, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	21/02/2024 10:36	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
246	246	PR Rahayu	Jl. Pandean No. 77, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Pandean No. 77, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	06/08/2024 10:24	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
247	247	PR Okky Dian Pradika	Jl. Basuki Rahmat No. 121, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 121, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10793	Sambel Pecel	02/12/2024 10:37	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
248	248	PR Sri Utami	Jl. Pandean No. 130, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Pandean No. 130, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920	Jasa Bengkel Las Logam	03/09/2024 10:16	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
249	249	PR Ferdinaya Ratu Wibawa	Jl. Soekarno Hatta No. 98, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Soekarno Hatta No. 98, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis	12/01/2024 10:53	Menengah	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
250	250	PR Devi Ani Astuti	Jl. Thamrin No. 78, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Thamrin No. 78, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10793	Sambel Pecel	27/07/2024 10:43	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
251	251	PR Dita Ardianingrum	Jl. Trunojoyo No. 61, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Trunojoyo No. 61, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10793	Sambel Pecel	20/03/2024 10:19	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
252	252	PR Andhi Juniawan	Jl. Mayjen Sungkono No. 119, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Mayjen Sungkono No. 119, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10793	Sambel Pecel	19/01/2024 10:26	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
253	253	PR Ayu Mega Agustina	Jl. Thamrin No. 56, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Thamrin No. 56, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	24/01/2024 10:57	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
254	254	PR Suhartini	Jl. HOS Cokroaminoto No. 51, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. HOS Cokroaminoto No. 51, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10793	Sambel Pecel	25/07/2024 10:45	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
255	255	PR Ratih Astria	Jl. Yos Sudarso No. 114, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Yos Sudarso No. 114, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis	10/03/2024 10:29	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
256	256	PR Ririn Rahayu Prihatmi	Jl. Serayu No. 30, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Serayu No. 30, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	09/11/2024 10:17	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
257	257	PR Ariz Wahyu Sampurna	Jl. Yos Sudarso No. 12, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Yos Sudarso No. 12, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	19/09/2024 10:29	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
258	258	PR Dessy Aryanti	Jl. Thamrin No. 86, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Thamrin No. 86, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920	Jasa Bengkel Las Logam	22/09/2024 10:22	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
259	259	PR Rizky Mahendra Wijaya	Jl. Salak No. 70, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Salak No. 70, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Konveksi & Tailor	09/07/2024 10:42	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
260	260	PR Lina Dian Anggraini	Jl. Mayjen Sungkono No. 30, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Mayjen Sungkono No. 30, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis	11/12/2024 10:34	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
261	261	PR Ardiana Septianingrum	Jl. Serayu No. 86, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Serayu No. 86, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Konveksi & Tailor	21/07/2024 10:16	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
262	262	PR Bimo Galih Pinandhito	Jl. HOS Cokroaminoto No. 67, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. HOS Cokroaminoto No. 67, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	02/04/2024 10:55	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
263	263	PR Tri Puji Handayani	Jl. Soekarno Hatta No. 1, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Soekarno Hatta No. 1, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	28/03/2024 10:31	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
264	264	PR Retno Hartatik	Jl. Pandean No. 128, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Pandean No. 128, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10793	Sambel Pecel	19/09/2024 10:49	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
265	265	PR Erna Dyah Ayu Susilowaty	Jl. Serayu No. 110, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Serayu No. 110, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	21/01/2024 10:23	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
266	266	PR Nurul Ramadhani	Jl. Trunojoyo No. 118, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Trunojoyo No. 118, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10793	Sambel Pecel	13/12/2024 10:52	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
267	267	PR Ninin Lia Herlina	Jl. Basuki Rahmat No. 111, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 111, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10793	Sambel Pecel	13/09/2024 10:17	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
268	268	PR Suratminingsih	Jl. Soekarno Hatta No. 3, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Soekarno Hatta No. 3, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	18/02/2024 10:15	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
269	269	PR Djajem	Jl. Basuki Rahmat No. 85, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 85, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10794	Keripik Tempe / Pisang	20/10/2024 10:17	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
270	270	PR Sumarni	Jl. Salak No. 141, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Salak No. 141, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	07/11/2024 10:51	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
271	271	PR Dewi Kurniastutik	Jl. Serayu No. 116, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Serayu No. 116, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10794	Keripik Tempe / Pisang	25/10/2024 10:30	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
272	272	PR Warsini	Jl. Pandean No. 122, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Pandean No. 122, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	18/07/2024 10:19	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
273	273	PR Susy Kurniasari	Jl. Pandean No. 137, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Pandean No. 137, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	22/12/2024 10:18	Menengah	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
274	274	PR Yulisusilowati	Jl. Thamrin No. 26, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Thamrin No. 26, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	25/04/2024 10:58	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
275	275	PR Mutiara Zahra Arsyita	Jl. Thamrin No. 14, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Thamrin No. 14, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	11/05/2024 10:45	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
276	276	PR Ani Sutarni	Jl. Yos Sudarso No. 77, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Yos Sudarso No. 77, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10794	Keripik Tempe / Pisang	09/05/2024 10:11	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
277	277	PR Muhammad Riyan Perkasa Utomo	Jl. Basuki Rahmat No. 81, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 81, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10793	Sambel Pecel	19/07/2024 10:35	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
278	278	PR Rokayah	Jl. Yos Sudarso No. 110, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Yos Sudarso No. 110, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	27/02/2024 10:28	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
279	279	PR Aristin Ratna Ningrum	Jl. Soekarno Hatta No. 94, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Soekarno Hatta No. 94, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920	Jasa Bengkel Las Logam	17/12/2024 10:59	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
280	280	PR Edi Sutrisno	Jl. Serayu No. 73, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Serayu No. 73, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10794	Keripik Tempe / Pisang	02/02/2024 10:52	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
281	281	PR Murniati	Jl. Basuki Rahmat No. 131, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 131, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	15/06/2024 10:30	Menengah	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
282	282	PR Sri Rahayuningsih	Jl. Pandean No. 140, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Pandean No. 140, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis	28/12/2024 10:19	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
283	283	PR Suryani	Jl. Serayu No. 78, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Serayu No. 78, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	24/02/2024 10:56	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
284	284	CV Angkasa Muda	Jl. Thamrin No. 117, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Thamrin No. 117, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	25/01/2024 10:16	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
285	285	PR Anik Kasiatun	Jl. HOS Cokroaminoto No. 57, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. HOS Cokroaminoto No. 57, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	27/05/2024 10:44	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
286	286	PR Dina Aryati	Jl. Thamrin No. 13, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Thamrin No. 13, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	26/07/2024 10:34	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
287	287	PR Batik Ndalem Nusantara	Jl. Thamrin No. 95, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Thamrin No. 95, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis	11/02/2024 10:27	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
288	288	PR Batik Nabastala	Jl. Mayjen Sungkono No. 12, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Mayjen Sungkono No. 12, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis	27/05/2024 10:36	Menengah	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
289	289	PR ELY INAYAH	Jl. Thamrin No. 65, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Thamrin No. 65, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10794	Keripik Tempe / Pisang	09/03/2024 10:54	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
290	290	PR Soeyitno	Jl. Trunojoyo No. 29, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Trunojoyo No. 29, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10794	Keripik Tempe / Pisang	15/04/2024 10:47	Menengah	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
291	291	PR Batik Tulis Pandan Putri	Jl. Mayjen Sungkono No. 2, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Mayjen Sungkono No. 2, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10794	Keripik Tempe / Pisang	10/04/2024 10:16	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
292	292	PR Ryzha Batik	Jl. Pandean No. 92, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Pandean No. 92, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis	06/09/2024 10:57	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
293	293	PR Sutamah	Jl. Mayjen Sungkono No. 57, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Mayjen Sungkono No. 57, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920	Jasa Bengkel Las Logam	06/11/2024 10:24	Menengah	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
294	294	PR Rolas	Jl. HOS Cokroaminoto No. 107, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. HOS Cokroaminoto No. 107, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	09/06/2024 10:27	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
295	295	PT Berdikari Berkat Semesta	Jl. Thamrin No. 115, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Thamrin No. 115, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	06/01/2024 10:12	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
296	296	PR Yuyun Yuniati	Jl. Serayu No. 100, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Serayu No. 100, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis	18/04/2024 10:31	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
297	297	PR Endang Sri Rahayu	Jl. HOS Cokroaminoto No. 16, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. HOS Cokroaminoto No. 16, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Konveksi & Tailor	06/01/2024 10:29	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
298	298	PR Lilik Yulianti	Jl. HOS Cokroaminoto No. 3, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. HOS Cokroaminoto No. 3, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	18/06/2024 10:40	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
299	299	PR Francisca Erida Irawati	Jl. Mayjen Sungkono No. 48, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Mayjen Sungkono No. 48, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis	02/10/2024 10:19	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
300	300	PR Siti Rowiyah	Jl. Salak No. 18, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Salak No. 18, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Konveksi & Tailor	20/09/2024 10:30	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
301	301	PR Novilia Ratnawati	Jl. Serayu No. 85, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Serayu No. 85, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	14/10/2024 10:49	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
302	302	PR Djoko Slameto	Jl. Trunojoyo No. 149, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Trunojoyo No. 149, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	18/01/2024 10:39	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
303	303	PR Sri Wahyuni Mujiastuti	Jl. Pandean No. 112, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Pandean No. 112, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	19/09/2024 10:42	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
304	304	PR Diyan Cahyati	Jl. HOS Cokroaminoto No. 113, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. HOS Cokroaminoto No. 113, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	20/12/2024 10:38	Menengah	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
305	305	PR Subiarsih	Jl. Basuki Rahmat No. 127, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 127, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10794	Keripik Tempe / Pisang	02/09/2024 10:11	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
306	306	PR Tri Istini	Jl. Trunojoyo No. 84, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Trunojoyo No. 84, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	01/01/2024 10:52	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
307	307	PR Yuliana	Jl. Pandean No. 123, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Pandean No. 123, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis	04/11/2024 10:47	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
308	308	PR Heru Kuntoyo	Jl. Salak No. 65, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Salak No. 65, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920	Jasa Bengkel Las Logam	07/04/2024 10:24	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
309	309	PR Tunggal Sari Handayani	Jl. Serayu No. 15, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Serayu No. 15, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	26/04/2024 10:14	Menengah	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
310	310	PR Sukma Kurniasih	Jl. Pandean No. 134, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Pandean No. 134, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10794	Keripik Tempe / Pisang	04/01/2024 10:34	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
311	311	PR Lien Choirul Hadjariah	Jl. Serayu No. 73, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Serayu No. 73, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	09/10/2024 10:54	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
312	312	PR Agustin Noraini	Jl. Salak No. 21, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Salak No. 21, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis	08/12/2024 10:49	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
313	313	PR Sri Lestari	Jl. Yos Sudarso No. 111, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Yos Sudarso No. 111, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	16/06/2024 10:36	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
314	314	PR Yuniati	Jl. Mayjen Sungkono No. 44, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Mayjen Sungkono No. 44, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	22/10/2024 10:25	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
315	315	PR Mila Ponia	Jl. HOS Cokroaminoto No. 17, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. HOS Cokroaminoto No. 17, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	03/07/2024 10:50	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
316	316	PR Ida Farida	Jl. Yos Sudarso No. 66, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Yos Sudarso No. 66, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	27/02/2024 10:31	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
317	317	PR Mas Arief Kusumawijaya	Jl. Thamrin No. 70, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Thamrin No. 70, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Konveksi & Tailor	07/10/2024 10:58	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
318	318	PR Nunuk Sugiarti	Jl. Serayu No. 70, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Serayu No. 70, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	17/09/2024 10:55	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
319	319	PR Nurharjanti	Jl. Soekarno Hatta No. 75, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Soekarno Hatta No. 75, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10794	Keripik Tempe / Pisang	26/04/2024 10:27	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
320	320	PR Endah Istiyani	Jl. Serayu No. 90, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Serayu No. 90, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920	Jasa Bengkel Las Logam	01/01/2024 10:48	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
321	321	PR Eko Subekti Raharjo	Jl. Soekarno Hatta No. 18, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Soekarno Hatta No. 18, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	24/12/2024 10:50	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
322	322	PT Sinergi Mitra Utama	Jl. Trunojoyo No. 31, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Trunojoyo No. 31, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10794	Keripik Tempe / Pisang	20/10/2024 10:36	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
323	323	PR Ninik Wijaya	Jl. Salak No. 22, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Salak No. 22, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	02/08/2024 10:59	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
324	324	PR Murtini	Jl. Soekarno Hatta No. 80, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Soekarno Hatta No. 80, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Konveksi & Tailor	13/11/2024 10:49	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
325	325	PR Astutik	Jl. Basuki Rahmat No. 139, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 139, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	08/08/2024 10:38	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
326	326	PR Heruwati	Jl. Trunojoyo No. 104, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Trunojoyo No. 104, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis	21/01/2024 10:27	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
327	327	PR Ratnawati Al Hasan	Jl. Pandean No. 115, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Pandean No. 115, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	17/09/2024 10:52	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
328	328	PR Hidayati	Jl. Soekarno Hatta No. 135, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Soekarno Hatta No. 135, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	17/06/2024 10:32	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
329	329	PR Nafifah	Jl. Pandean No. 54, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Pandean No. 54, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10793	Sambel Pecel	05/02/2024 10:17	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
330	330	PR Rachmawati Widyastuti	Jl. HOS Cokroaminoto No. 125, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. HOS Cokroaminoto No. 125, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	25/07/2024 10:26	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
331	331	PR Eva Hetty Puspitasari	Jl. HOS Cokroaminoto No. 110, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. HOS Cokroaminoto No. 110, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920	Jasa Bengkel Las Logam	06/06/2024 10:27	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
332	332	PR Sulistiyowati	Jl. Serayu No. 89, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Serayu No. 89, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis	10/04/2024 10:35	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
333	333	PR Niniek Prasetyani	Jl. Basuki Rahmat No. 53, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 53, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11040	Minuman Herbal / Olahan	18/10/2024 10:42	Menengah	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
334	334	PR Fitrotul Mafulah	Jl. Soekarno Hatta No. 138, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Soekarno Hatta No. 138, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	14120	Konveksi & Tailor	21/07/2024 10:31	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
335	335	PR Sri Suhartini	Jl. Trunojoyo No. 140, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Trunojoyo No. 140, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10794	Keripik Tempe / Pisang	03/02/2024 10:11	Menengah	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
336	336	PR Rosmini	Jl. Thamrin No. 86, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Thamrin No. 86, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10793	Sambel Pecel	02/04/2024 10:39	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
337	337	PR Budi Handaru	Jl. Trunojoyo No. 111, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Trunojoyo No. 111, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	17/02/2024 10:22	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
338	338	PR Nyaminatun	Jl. Soekarno Hatta No. 32, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Soekarno Hatta No. 32, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	Produksi Roti & Kue	14/06/2024 10:38	Belum Melapor/Mengisi Investasi	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
339	339	PR Kuni Chasanah	Jl. Serayu No. 30, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Serayu No. 30, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10794	Keripik Tempe / Pisang	17/12/2024 10:42	Menengah	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
340	340	PR Ernawati	Jl. Serayu No. 18, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Serayu No. 18, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	11090	Jamu Tradisional	18/02/2024 10:55	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
341	341	CV Laksana Sinar Permata	Jl. Trunojoyo No. 17, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Trunojoyo No. 17, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	13134	Batik Tulis	18/02/2024 10:24	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
342	342	PR Vitri Wulandari	Jl. Yos Sudarso No. 121, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Yos Sudarso No. 121, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10793	Sambel Pecel	03/01/2024 10:52	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
343	343	PR Danuk Sri Arini	Jl. Basuki Rahmat No. 1, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Basuki Rahmat No. 1, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur	Jawa Timur	\N	Kota Madiun	\N	\N	\N	25920	Jasa Bengkel Las Logam	04/08/2024 10:42	Kecil	Terverifikasi SIINas	2026-07-30 04:00:42	2026-07-30 04:00:42
346	345	CInta Sejati Makmur	Jl. Gulun Utama Jaya, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	Jl. Gulun Utama Jaya, Kota Madiun	Jawa Timur	\N	Kota Madiun	\N	\N	\N	10710	INDUSTRI PRODUK ROTI DAN KUE	25/07/2026 11:30	Kecil	Terverifikasi SIINas	2026-07-30 04:31:38	2026-07-30 04:32:01
\.


--
-- Data for Name: statistik_kecamatan; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.statistik_kecamatan (id, kecamatan, jumlah_ikm, jumlah, created_at, updated_at, total_kunjungan, pengunjung_aktif, ikm_terdaftar, kunjungan_hari_ini, kunjungan_bulan_ini, kunjungan_tahun_ini, kunjungan_total, sosial_media, telp_dinas, email_dinas, fonnte_token, admin_wa_number, wa_notif_active, kunjungan_tahun_lalu) FROM stdin;
1	Kartoharjo	2013	0	\N	2026-11-22 21:13:38	14354	7	560	23	456	6889	14354	[{"platform":"Instagram","username":"@disnakerkukm.madiunkota","url":"https:\\/\\/www.instagram.com\\/disnakerkukm.madiunkota?igsh=cXJqZ3ZjNmJudWFn"},{"platform":"Instagram","username":"@perindustrian.kotamadiun","url":"https:\\/\\/www.instagram.com\\/perindustrian.kotamadiun?igsh=MTFzYnQwMnRhamNs"},{"platform":"Facebook","username":"Disnakerkukm Kota Madiun","url":"https:\\/\\/www.facebook.com\\/share\\/19RgNeZgVq\\/"},{"platform":"TikTok","username":"@disnakerkukmkotamadiun","url":"https:\\/\\/vm.tiktok.com\\/ZS9hYefCLguks-CQgR6\\/"},{"platform":"X","username":"@DisnakerKUKM","url":"https:\\/\\/x.com\\/DisnakerKUKM"}]	(0351) 454288	disnaker@madiunkota.go.id	TqK5aiZZSwXPEqmRu411	085655480223	t	6986
2	Manguharjo	2371	0	\N	2026-11-22 21:13:38	14354	7	560	23	456	6889	14354	[{"platform":"Instagram","username":"@disnakerkukm.madiunkota","url":"https:\\/\\/www.instagram.com\\/disnakerkukm.madiunkota?igsh=cXJqZ3ZjNmJudWFn"},{"platform":"Instagram","username":"@perindustrian.kotamadiun","url":"https:\\/\\/www.instagram.com\\/perindustrian.kotamadiun?igsh=MTFzYnQwMnRhamNs"},{"platform":"Facebook","username":"Disnakerkukm Kota Madiun","url":"https:\\/\\/www.facebook.com\\/share\\/19RgNeZgVq\\/"},{"platform":"TikTok","username":"@disnakerkukmkotamadiun","url":"https:\\/\\/vm.tiktok.com\\/ZS9hYefCLguks-CQgR6\\/"},{"platform":"X","username":"@DisnakerKUKM","url":"https:\\/\\/x.com\\/DisnakerKUKM"}]	(0351) 454288	disnaker@madiunkota.go.id	TqK5aiZZSwXPEqmRu411	085655480223	t	6986
3	Taman	3507	0	\N	2026-11-22 21:13:38	14354	7	560	23	456	6889	14354	[{"platform":"Instagram","username":"@disnakerkukm.madiunkota","url":"https:\\/\\/www.instagram.com\\/disnakerkukm.madiunkota?igsh=cXJqZ3ZjNmJudWFn"},{"platform":"Instagram","username":"@perindustrian.kotamadiun","url":"https:\\/\\/www.instagram.com\\/perindustrian.kotamadiun?igsh=MTFzYnQwMnRhamNs"},{"platform":"Facebook","username":"Disnakerkukm Kota Madiun","url":"https:\\/\\/www.facebook.com\\/share\\/19RgNeZgVq\\/"},{"platform":"TikTok","username":"@disnakerkukmkotamadiun","url":"https:\\/\\/vm.tiktok.com\\/ZS9hYefCLguks-CQgR6\\/"},{"platform":"X","username":"@DisnakerKUKM","url":"https:\\/\\/x.com\\/DisnakerKUKM"}]	(0351) 454288	disnaker@madiunkota.go.id	TqK5aiZZSwXPEqmRu411	085655480223	t	6986
\.


--
-- Data for Name: tna_digitals; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tna_digitals (id, ikm_id, nama_usaha, pemilik, nik, nib, no_hp, kecamatan, kelurahan, kendala_operasional, keterampilan_kurang, topik_pelatihan_prioritas, materi_praktik_spesifik, kebutuhan_ilmu_baru, metode_efektif, komitmen_penerapan, tag_antrean_pelatihan, created_at, updated_at) FROM stdin;
4	72	Konveksi Baju Ceria	Siti Aminah	3573275259659190	2802754416809	81234567894	Kartoharjo	Kartoharjo	["Kesulitan akses permodalan"]	["Cara produksi sesuai standar mutu"]	["Fasilitasi Sertifikasi (Halal\\/BPOM\\/SNI)","Manajemen Keuangan","Desain Kemasan"]	test	test	Pelatihan daring/Zoom	Ya	["Antrean: Fasilitasi Sertifikasi (Halal\\/BPOM\\/SNI) (Batch 2026)","Antrean: Manajemen Keuangan (Batch 2026)","Antrean: Desain Kemasan (Batch 2026)"]	2026-07-29 16:19:05	2026-07-29 16:19:05
7	69	Warung Makan Bu Susi	Susi Susanti	3573590573056990	2961251404189	81234567891	Manguharjo	Madiun Lor	["Kesulitan akses permodalan"]	["Cara produksi sesuai standar mutu"]	["Fasilitasi Sertifikasi (Halal\\/BPOM\\/SNI)","Desain Kemasan"]	Test	Test	Kelas tatap muka	Ya	["Antrean: Fasilitasi Sertifikasi (Halal\\/BPOM\\/SNI) (Batch 2026)","Antrean: Desain Kemasan (Batch 2026)"]	2026-07-29 16:25:06	2026-07-29 16:25:06
\.


--
-- Data for Name: tna_pertanyaans; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tna_pertanyaans (id, bagian, nomor_soal, teks_pertanyaan, jenis_soal, opsi_jawaban, placeholder, is_active, created_at, updated_at) FROM stdin;
1	1	1	Apa kendala operasional terbesar yang paling menghambat perkembangan usaha Anda saat ini?	checkbox	["Kesulitan akses permodalan","Kualitas\\/kapasitas produksi terbatas","Belum memiliki legalitas\\/sertifikasi","Pembukuan keuangan berantakan","Jiwa Kewirausahaan Kurang","Entusias kurang","Semangat kurang","Motivasi Kuarang 31 JUli"]	\N	t	2026-07-29 16:44:59	2026-07-31 04:24:16
2	1	2	Keterampilan teknis apa yang saat ini dirasa paling kurang dan sangat Anda butuhkan?	checkbox	["Penggunaan media sosial\\/marketplace","Cara produksi sesuai standar mutu","Manajemen kas","Prosedur izin usaha","Strategi pengemasan\\/packaging"]	\N	t	2026-07-29 16:44:59	2026-07-29 16:53:08
3	2	3	Topik pelatihan apa yang paling mendesak dan relevan untuk usaha Anda tahun depan?	checkbox	["Fasilitasi Sertifikasi (Halal\\/BPOM\\/SNI)","Digital Marketing & TikTok Shop","Manajemen Keuangan & Pembukuan","Desain Kemasan & Branding Produk","Peningkatan Kualitas & Inovasi Produk"]	\N	t	2026-07-29 16:44:59	2026-07-29 16:53:08
4	2	4	Materi praktik spesifik yang paling ingin Anda pelajari secara langsung?	text	[]	Contoh: Cara membuat iklan FB/TikTok Ads...	t	2026-07-29 16:44:59	2026-07-29 16:44:59
5	2	5	Kebutuhan ilmu baru dalam menghadapi persaingan bisnis saat ini?	text	[]	Contoh: Penggunaan AI untuk desain promosi...	t	2026-07-29 16:44:59	2026-07-29 16:44:59
6	3	6	Metode pelatihan apa yang paling efektif bagi Anda?	radio	["Kelas tatap muka","Pelatihan daring\\/Zoom","Pendampingan langsung (On-site)"]	\N	t	2026-07-29 16:44:59	2026-07-29 16:44:59
7	3	7	Apakah Anda berkomitmen menerapkan hasil pelatihan demi kemajuan usaha?	radio	["Ya","Tidak"]	\N	t	2026-07-29 16:44:59	2026-07-29 16:44:59
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, name, username, email, email_verified_at, password, remember_token, created_at, updated_at, role) FROM stdin;
8	Yanuar Priambodo	Mimin02	\N	\N	$2y$12$8NJFzHyanlyewkyAmxjzRuEUflbL0mrN.xuDQTVLAH0K.kyaIfssS	\N	2026-03-25 04:05:18	2026-03-25 04:05:18	admin
12	IKM Juara	Mimin06	\N	\N	$2y$12$XAEy2gA4tFjW/h3JsthVs.P3rTBBEEKKPRYN2l.zRVJCD8P5riN4u	\N	2026-03-25 06:19:21	2026-03-25 06:19:21	admin
14	Tambahan	123Admin	\N	\N	$2y$12$OpiIpxPYDD9CgPGwvkCzCuXFXpY8tygji5.5liJh/17RVeOUL6cby	\N	2026-03-30 15:01:26	2026-03-30 15:01:26	superadmin
15	SuperAdmin2-Yanuar	SA2IKMJUARA	\N	\N	$2y$12$T9akPcr8OFS6ZzPuz9gMeekiWvVTYy41gxgl2dxmYLw0nnxaA.Ub6	\N	2026-03-31 02:46:56	2026-03-31 02:48:44	superadmin
16	Admin Dukungan	dukungan	\N	\N	$2y$12$KvIxW4GE1QS28UUob67SoOydlU.GoXICA3DM.OF59RnNGkc.5u7QW	\N	2026-07-27 14:58:46	2026-07-27 14:58:46	dukungan
18	Annisa Rahayu	dukungan02	\N	\N	$2y$12$kj6Pjn258kDF8JlgjQNVL.A9zKf87ghQN.pSxNyhnLVgP7k9gzXwy	\N	2026-07-30 14:08:35	2026-07-30 14:08:35	dukungan
\.


--
-- Data for Name: usulan_perubahan; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.usulan_perubahan (id, pelaku_usaha_id, nib, nik, nama_perusahaan, nama_pemilik, alamat_usaha, kecamatan, kelurahan, skala_usaha, jenis_perusahaan, tingkat_risiko, investasi, tenaga_kerja, no_telp, email, status_usulan, catatan_admin, created_at, updated_at, nama_proyek, kbli, uraian_kbli, tgl_terbit, status, sertifikat_halal, bpom, cppob, sni, tipe_usulan, latitude, longitude) FROM stdin;
1	109	9120000000109	3573010000000109	KAIN	ELLYSA SANTOSO	JL. P. SUDIRMAN 265 MADIUNDESA/KELURAHAN PANDEAN, KEC. TAMAN, KOTA MADIUN	Taman	TAMAN	Kecil	Perseorangan	Rendah	25000000	12	081234567109	ellysasantoso109@gmail.com	disetujui	\N	2026-07-24 05:13:20	2026-07-24 05:13:44	\N	\N	\N	\N	\N	\N	\N	\N	\N	perubahan	\N	\N
2	109	9120000000109	3573010000000109	KAIN	ELLYSA SANTOSO	JL. P. SUDIRMAN 265 MADIUNDESA/KELURAHAN PANDEAN, KEC. TAMAN, KOTA MADIUN	Taman	TAMAN	Kecil	Perseorangan	Rendah	25000000	17	081234567109	ellysasantoso109@gmail.com	disetujui	\N	2026-07-24 05:14:40	2026-07-24 05:15:21	\N	\N	\N	\N	\N	\N	\N	\N	\N	perubahan	\N	\N
3	109	9120000000109	3573010000000109	KAIN	ELLYSA SANTOSO	JL. P. SUDIRMAN 265 MADIUNDESA/KELURAHAN PANDEAN, KEC. TAMAN, KOTA MADIUN	Taman	TAMAN	Kecil	Perseorangan	Rendah	25000000	17	081234567109	ellysasantoso109@gmail.com	disetujui	\N	2026-07-24 05:24:25	2026-07-24 05:24:48	KAIN	56101	Penyediaan Makanan dan Minuman (Kuliner)	2026-01-20	Tidak Aktif	ID35110000000109	BPOM02	\N	\N	perubahan	\N	\N
4	109	9120000000109	3573010000000109	KAIN	ELLYSA SANTOSO	JL. P. SUDIRMAN 265 MADIUNDESA/KELURAHAN PANDEAN, KEC. TAMAN, KOTA MADIUN	Taman	TAMAN	Kecil	Perseorangan	Rendah	25000000	17	081234567109	ellysasantoso@gmail.com	disetujui	\N	2026-07-24 14:31:12	2026-07-24 14:36:05	KAIN	56101	Penyediaan Makanan dan Minuman (Kuliner)	2026-01-20	Aktif	ID35110000000109	BPOM02	\N	\N	perubahan	\N	\N
5	109	9120000000109	3573010000000109	KAIN	ELLYSA SANTOSO	JL. P. SUDIRMAN 265 MADIUNDESA/KELURAHAN PANDEAN, KEC. TAMAN, KOTA MADIUN	Taman	TAMAN	Kecil	Perseorangan	Rendah	26000000	17	081234567109	ellysasantoso@gmail.com	disetujui	\N	2026-07-24 14:36:36	2026-07-24 14:36:52	KAIN	56101	Penyediaan Makanan dan Minuman (Kuliner)	2026-01-20	Aktif	ID35110000000109	BPOM02	\N	\N	perubahan	\N	\N
6	109	9120000000109	3573010000000109	KAIN	ELLYSA SANTOSO	JL. P. SUDIRMAN 265 MADIUNDESA/KELURAHAN PANDEAN, KEC. TAMAN, KOTA MADIUN	Taman	TAMAN	Kecil	Perseorangan	Rendah	26000000	15	081234567109	ellysasantoso@gmail.com	disetujui	\N	2026-07-24 14:37:06	2026-07-24 14:41:27	KAIN	56101	Penyediaan Makanan dan Minuman (Kuliner)	2026-01-20	Aktif	ID35110000000109	BPOM02	\N	\N	perubahan	\N	\N
7	109	9120000000109	3573010000000109	KAIN	ELLYSA SANTOSO	JL. P. SUDIRMAN 265 MADIUNDESA/KELURAHAN PANDEAN, KEC. TAMAN, KOTA MADIUN	Taman	TAMAN	Kecil	Perseorangan	Rendah	26000000	15	081234567109	ellysasantoso01@gmail.com	disetujui	\N	2026-07-24 14:41:49	2026-07-24 15:04:53	KAIN	56101	Penyediaan Makanan dan Minuman (Kuliner)	2026-01-20	Aktif	ID35110000000109	BPOM02	\N	\N	perubahan	\N	\N
8	111	9120000000667	3573010000000667	CInta Sejati Makmur	Bu Cinta	Jl. Selalu Sayang 55	Taman	Kartoharjo	Mikro	Makanan	Mikro	10000000	1	085655488220	bagfas.ikmjuara@gmail.com	disetujui	\N	2026-07-24 15:07:57	2026-07-24 15:08:24	CInta Sejati Makmur	11090	Industri Minuman Dengan Pengolahan	2026-07-15	Aktif	ID7723724149294920	u2372747	724274727	ID727742	perubahan	\N	\N
9	109	9120000000109	3573010000000109	KAIN	ELLYSA SANTOSO	JL. P. SUDIRMAN 265 MADIUNDESA/KELURAHAN PANDEAN, KEC. TAMAN, KOTA MADIUN	Taman	TAMAN	Kecil	Perseorangan	Rendah	26000005	15	081234567109	ellysasantoso01@gmail.com	disetujui	\N	2026-07-24 15:17:35	2026-07-24 15:17:43	KAIN	56101	Penyediaan Makanan dan Minuman (Kuliner)	2026-01-20	Aktif	ID35110000000109	BPOM02	\N	\N	perubahan	\N	\N
10	111	9120000000667	3573010000000667	CInta Sejati Makmur	Bu Cinta	Jl. Selalu Sayang 55	Taman	Kartoharjo	Mikro	Makanan	Mikro	100000000	88	085655488220	bagfas.ikmjuara@gmail.com	disetujui	\N	2026-07-24 15:18:36	2026-07-24 15:19:09	CInta Sejati Makmur	11090	Industri Minuman Dengan Pengolahan	2026-07-15	Aktif	ID7723724149294920	u2372747	724274727	ID727742	perubahan	\N	\N
11	111	9120000000667	3573010000000667	CInta Sejati Makmur	Bu Cinta	Jl. Selalu Sayang 55	Taman	Kartoharjo	Mikro	Makanan Minuman	Mikro	100000000	88	085655488220	bagfas.ikmjuara@gmail.com	disetujui	\N	2026-07-24 15:19:50	2026-07-24 15:20:05	CInta Sejati Makmur	11090	Industri Minuman Dengan Pengolahan	2026-07-15	Aktif	ID7723724149294920	u2372747	724274727	ID727742	perubahan	\N	\N
12	112	5089747908747	3573336890980650	Bengkel Las Jaya	Hendra Gunawan	Jl. Thamrin	Kartoharjo	Klegen	Kecil	Logam dan Mesin	\N	\N	\N	081234567897	\N	disetujui	Usulan telah diverifikasi dan disetujui oleh Admin Dinas.	2026-07-28 06:26:04	2026-07-29 09:47:50	Pagar dan Teralis	\N	\N	\N	\N	\N	\N	\N	\N	perubahan	\N	\N
13	113	5309033439831	3573407473554860	Kerajinan Kayu Jati	Joko Anwar	Jl. Cokroaminoto	Taman	Kejuron	Kecil	Pangan	Menengah Rendah	225000000	2	81234567892	\N	disetujui	Usulan telah diverifikasi dan disetujui oleh Admin Dinas.	2026-07-29 10:36:03	2026-07-29 10:36:25	Mebel Kayu	10799	INDUSTRI PRODUK MAKANAN LAINNYA YTDL	\N	\N	\N	\N	\N	\N	perubahan	\N	\N
14	75	5089747908747	3573336890980650	Bengkel Las Jaya	Hendra Gunawan	Jl. Thamrin	Kartoharjo	Klegen	Kecil	Logam dan Mesin	Menengah Tinggi	33000500	10	081234567897	\N	disetujui	Usulan telah diverifikasi dan disetujui oleh Admin Dinas.	2026-07-29 15:37:44	2026-07-29 15:39:03	Pagar dan Teralis	10795	INDUSTRI SARI NABATI DAN KRIMER NABATI	\N	\N	\N	\N	\N	\N	perubahan	\N	\N
15	75	5089747908747	3573336890980650	Bengkel Las Jaya	Hendra Gunawan	Jl. Thamrin	Kartoharjo	Klegen	Kecil	Logam dan Mesin	Menengah Tinggi	33000678	10	081234567897	\N	disetujui	Usulan telah diverifikasi dan disetujui oleh Admin Dinas.	2026-07-29 15:40:07	2026-07-29 15:40:38	Pagar dan Teralis	10795	INDUSTRI SARI NABATI DAN KRIMER NABATI	\N	\N	\N	\N	\N	\N	perubahan	\N	\N
17	114	9999999999999	3577019999999999	Test Verifikasi Perusahaan	Test Verifikasi Pemilik	Jl. Test No 17	Taman	Pandean	Mikro	Pangan	\N	\N	\N	085712345678	\N	disetujui	Usulan telah diverifikasi dan disetujui oleh Admin Dinas.	2026-07-31 07:55:18	2026-07-31 07:55:18	\N	\N	\N	\N	\N	\N	\N	\N	\N	baru	\N	\N
18	115	5089747908747	3573336890980650	Bengkel Las Jaya Madiun	Hendra Gunawan	Jl. Thamrin No. 45	Kartoharjo	Klegen	Kecil	Metal dan Mesin	Menengah Tinggi	3300067800	10	081234567897	\N	disetujui	Usulan telah diverifikasi dan disetujui oleh Admin Dinas.	2026-07-31 08:53:51	2026-07-31 08:55:35	Pagar dan Teralis	10795	INDUSTRI SARI NABATI DAN KRIMER NABATI	\N	\N	\N	\N	\N	\N	baru	\N	\N
20	116	5089747908746	3528838888888883	Nilahi	Nilainahitadil	Perum Panorama Wilis 84	Taman	Pandean	Mikro	Pangan	Rendah	2000000	1	0856365357375	\N	disetujui	Usulan telah diverifikasi dan disetujui oleh Admin Dinas.	2026-07-31 09:00:23	2026-07-31 09:00:52	Roti Basah	10792	INDUSTRI KUE BASAH	\N	\N	\N	\N	\N	\N	baru	\N	\N
23	79	5089747908746	3528838888888883	Nilahi	Nilainahitadil	Perum Panorama Wilis 84	Taman	Pandean	Mikro	Pangan	Rendah	200000000	1	0856365357375	\N	disetujui	Usulan telah diverifikasi dan disetujui oleh Admin Dinas.	2026-07-31 09:11:20	2026-07-31 09:11:59	Roti Basah	10792	INDUSTRI KUE BASAH	\N	\N	\N	\N	\N	\N	perubahan	-7.647627	111.532947
25	116	5089747908746	3528838888888883	Nilahi	Nilainahitadil	Perum Panorama Wilis 84	Taman	Pandean	Mikro	Pangan	Rendah	20000000000	2	0856365357375	\N	disetujui	Usulan telah diverifikasi dan disetujui oleh Admin Dinas.	2026-07-31 09:21:47	2026-07-31 09:22:00	Roti Basah	10792	INDUSTRI KUE BASAH	\N	\N	\N	\N	\N	\N	perubahan	-7.647627	111.532947
\.


--
-- Name: database_halals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.database_halals_id_seq', 45, true);


--
-- Name: database_hki_mereks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.database_hki_mereks_id_seq', 20, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, true);


--
-- Name: form_app_responses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.form_app_responses_id_seq', 44, true);


--
-- Name: form_app_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.form_app_templates_id_seq', 3, true);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, true);


--
-- Name: kategori_konsultasis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.kategori_konsultasis_id_seq', 4, true);


--
-- Name: kbli_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.kbli_id_seq', 1580, true);


--
-- Name: konsultasi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.konsultasi_id_seq', 13, true);


--
-- Name: konsultasi_pesan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.konsultasi_pesan_id_seq', 26, true);


--
-- Name: kuesioner_evaluasi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.kuesioner_evaluasi_id_seq', 1, true);


--
-- Name: list_kegiatan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.list_kegiatan_id_seq', 14, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.migrations_id_seq', 62, true);


--
-- Name: pelaku_usaha_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pelaku_usaha_id_seq', 118, true);


--
-- Name: pelaku_usahas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pelaku_usahas_id_seq', 1, true);


--
-- Name: permohonan_hki_merek_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.permohonan_hki_merek_id_seq', 6, true);


--
-- Name: peta_sebaran_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.peta_sebaran_id_seq', 84, true);


--
-- Name: publikasi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.publikasi_id_seq', 8, true);


--
-- Name: registrasi_pelatihan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.registrasi_pelatihan_id_seq', 140, true);


--
-- Name: siinas_industries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.siinas_industries_id_seq', 346, true);


--
-- Name: statistik_kecamatan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.statistik_kecamatan_id_seq', 3, true);


--
-- Name: tna_digitals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tna_digitals_id_seq', 7, true);


--
-- Name: tna_pertanyaans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tna_pertanyaans_id_seq', 7, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 18, true);


--
-- Name: usulan_perubahan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.usulan_perubahan_id_seq', 25, true);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: database_halals database_halals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.database_halals
    ADD CONSTRAINT database_halals_pkey PRIMARY KEY (id);


--
-- Name: database_hki_mereks database_hki_mereks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.database_hki_mereks
    ADD CONSTRAINT database_hki_mereks_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: form_app_responses form_app_responses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.form_app_responses
    ADD CONSTRAINT form_app_responses_pkey PRIMARY KEY (id);


--
-- Name: form_app_templates form_app_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.form_app_templates
    ADD CONSTRAINT form_app_templates_pkey PRIMARY KEY (id);


--
-- Name: form_app_templates form_app_templates_slug_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.form_app_templates
    ADD CONSTRAINT form_app_templates_slug_unique UNIQUE (slug);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: kategori_konsultasis kategori_konsultasis_nama_kategori_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kategori_konsultasis
    ADD CONSTRAINT kategori_konsultasis_nama_kategori_unique UNIQUE (nama_kategori);


--
-- Name: kategori_konsultasis kategori_konsultasis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kategori_konsultasis
    ADD CONSTRAINT kategori_konsultasis_pkey PRIMARY KEY (id);


--
-- Name: kbli kbli_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kbli
    ADD CONSTRAINT kbli_pkey PRIMARY KEY (id);


--
-- Name: konsultasi_pesan konsultasi_pesan_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.konsultasi_pesan
    ADD CONSTRAINT konsultasi_pesan_pkey PRIMARY KEY (id);


--
-- Name: konsultasi konsultasi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.konsultasi
    ADD CONSTRAINT konsultasi_pkey PRIMARY KEY (id);


--
-- Name: kuesioner_evaluasi kuesioner_evaluasi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kuesioner_evaluasi
    ADD CONSTRAINT kuesioner_evaluasi_pkey PRIMARY KEY (id);


--
-- Name: list_kegiatan list_kegiatan_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.list_kegiatan
    ADD CONSTRAINT list_kegiatan_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: pelaku_usaha pelaku_usaha_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pelaku_usaha
    ADD CONSTRAINT pelaku_usaha_pkey PRIMARY KEY (id);


--
-- Name: pelaku_usahas pelaku_usahas_nib_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pelaku_usahas
    ADD CONSTRAINT pelaku_usahas_nib_unique UNIQUE (nib);


--
-- Name: pelaku_usahas pelaku_usahas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pelaku_usahas
    ADD CONSTRAINT pelaku_usahas_pkey PRIMARY KEY (id);


--
-- Name: permohonan_hki_merek permohonan_hki_merek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.permohonan_hki_merek
    ADD CONSTRAINT permohonan_hki_merek_pkey PRIMARY KEY (id);


--
-- Name: peta_sebaran peta_sebaran_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.peta_sebaran
    ADD CONSTRAINT peta_sebaran_pkey PRIMARY KEY (id);


--
-- Name: publikasi publikasi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.publikasi
    ADD CONSTRAINT publikasi_pkey PRIMARY KEY (id);


--
-- Name: registrasi_pelatihan registrasi_pelatihan_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registrasi_pelatihan
    ADD CONSTRAINT registrasi_pelatihan_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: siinas_industries siinas_industries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.siinas_industries
    ADD CONSTRAINT siinas_industries_pkey PRIMARY KEY (id);


--
-- Name: statistik_kecamatan statistik_kecamatan_kecamatan_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.statistik_kecamatan
    ADD CONSTRAINT statistik_kecamatan_kecamatan_unique UNIQUE (kecamatan);


--
-- Name: statistik_kecamatan statistik_kecamatan_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.statistik_kecamatan
    ADD CONSTRAINT statistik_kecamatan_pkey PRIMARY KEY (id);


--
-- Name: tna_digitals tna_digitals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tna_digitals
    ADD CONSTRAINT tna_digitals_pkey PRIMARY KEY (id);


--
-- Name: tna_pertanyaans tna_pertanyaans_nomor_soal_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tna_pertanyaans
    ADD CONSTRAINT tna_pertanyaans_nomor_soal_unique UNIQUE (nomor_soal);


--
-- Name: tna_pertanyaans tna_pertanyaans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tna_pertanyaans
    ADD CONSTRAINT tna_pertanyaans_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_unique UNIQUE (username);


--
-- Name: usulan_perubahan usulan_perubahan_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usulan_perubahan
    ADD CONSTRAINT usulan_perubahan_pkey PRIMARY KEY (id);


--
-- Name: cache_expiration_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cache_expiration_index ON public.cache USING btree (expiration);


--
-- Name: cache_locks_expiration_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cache_locks_expiration_index ON public.cache_locks USING btree (expiration);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: pelaku_usaha_nib_kbli_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pelaku_usaha_nib_kbli_index ON public.pelaku_usaha USING btree (nib, kbli);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: form_app_responses form_app_responses_template_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.form_app_responses
    ADD CONSTRAINT form_app_responses_template_id_foreign FOREIGN KEY (template_id) REFERENCES public.form_app_templates(id) ON DELETE CASCADE;


--
-- Name: konsultasi_pesan konsultasi_pesan_konsultasi_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.konsultasi_pesan
    ADD CONSTRAINT konsultasi_pesan_konsultasi_id_foreign FOREIGN KEY (konsultasi_id) REFERENCES public.konsultasi(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict 9XaJobbL6S1gfS0UsySzwfLnLm3OhC5ihlbQYVHxn2NjBVNcPgYrH9qxd9mMDBQ

