SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admins (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: companies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.companies (
    id bigint NOT NULL,
    name character varying NOT NULL,
    address character varying NOT NULL,
    email character varying,
    phone character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    company_owner_id bigint
);


--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;


--
-- Name: company_owners; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.company_owners (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    first_name character varying,
    last_name character varying,
    phone character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: company_owners_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.company_owners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: company_owners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.company_owners_id_seq OWNED BY public.company_owners.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    first_name character varying,
    last_name character varying,
    company_phone character varying NOT NULL,
    mobile_phone character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: driver_licenses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.driver_licenses (
    id bigint NOT NULL,
    categories character varying NOT NULL,
    valid_to character varying NOT NULL,
    additional_notes character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    driver_id bigint
);


--
-- Name: driver_licenses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.driver_licenses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: driver_licenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.driver_licenses_id_seq OWNED BY public.driver_licenses.id;


--
-- Name: drivers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.drivers (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    first_name character varying,
    last_name character varying,
    phone character varying NOT NULL,
    birth_date character varying,
    medical_examination_validity character varying NOT NULL,
    years_of_experience character varying,
    status character varying DEFAULT 'Free'::character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    company_id bigint
);


--
-- Name: drivers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.drivers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: drivers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.drivers_id_seq OWNED BY public.drivers.id;


--
-- Name: goods; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.goods (
    id bigint NOT NULL,
    name character varying NOT NULL,
    weight character varying NOT NULL,
    volume character varying NOT NULL,
    goods_type character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    customer_id bigint
);


--
-- Name: goods_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.goods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: goods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.goods_id_seq OWNED BY public.goods.id;


--
-- Name: goods_orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.goods_orders (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    good_id bigint,
    order_id bigint
);


--
-- Name: goods_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.goods_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: goods_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.goods_orders_id_seq OWNED BY public.goods_orders.id;


--
-- Name: insurance_policies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.insurance_policies (
    id bigint NOT NULL,
    valid_to character varying NOT NULL,
    insurance_policy_type character varying NOT NULL,
    cost numeric NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    driver_id bigint
);


--
-- Name: insurance_policies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.insurance_policies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: insurance_policies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.insurance_policies_id_seq OWNED BY public.insurance_policies.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    cost numeric,
    downloading_address character varying NOT NULL,
    unloading_address character varying NOT NULL,
    status character varying DEFAULT 'Issued'::character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    customer_id bigint,
    driver_id bigint
);


--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: trailers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trailers (
    id bigint NOT NULL,
    reg_number character varying NOT NULL,
    color character varying NOT NULL,
    trailer_type character varying NOT NULL,
    weight character varying,
    height character varying NOT NULL,
    length character varying NOT NULL,
    volume character varying NOT NULL,
    year_of_issue character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    truck_id bigint,
    company_id bigint
);


--
-- Name: trailers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trailers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trailers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trailers_id_seq OWNED BY public.trailers.id;


--
-- Name: trucks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trucks (
    id bigint NOT NULL,
    reg_number character varying NOT NULL,
    body_number character varying,
    weight character varying,
    color character varying NOT NULL,
    year_of_issue character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    driver_id bigint,
    company_id bigint
);


--
-- Name: trucks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trucks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trucks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trucks_id_seq OWNED BY public.trucks.id;


--
-- Name: admins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);


--
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);


--
-- Name: company_owners id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.company_owners ALTER COLUMN id SET DEFAULT nextval('public.company_owners_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: driver_licenses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.driver_licenses ALTER COLUMN id SET DEFAULT nextval('public.driver_licenses_id_seq'::regclass);


--
-- Name: drivers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.drivers ALTER COLUMN id SET DEFAULT nextval('public.drivers_id_seq'::regclass);


--
-- Name: goods id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.goods ALTER COLUMN id SET DEFAULT nextval('public.goods_id_seq'::regclass);


--
-- Name: goods_orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.goods_orders ALTER COLUMN id SET DEFAULT nextval('public.goods_orders_id_seq'::regclass);


--
-- Name: insurance_policies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.insurance_policies ALTER COLUMN id SET DEFAULT nextval('public.insurance_policies_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: trailers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trailers ALTER COLUMN id SET DEFAULT nextval('public.trailers_id_seq'::regclass);


--
-- Name: trucks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trucks ALTER COLUMN id SET DEFAULT nextval('public.trucks_id_seq'::regclass);


--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: company_owners company_owners_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.company_owners
    ADD CONSTRAINT company_owners_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: driver_licenses driver_licenses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.driver_licenses
    ADD CONSTRAINT driver_licenses_pkey PRIMARY KEY (id);


--
-- Name: drivers drivers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.drivers
    ADD CONSTRAINT drivers_pkey PRIMARY KEY (id);


--
-- Name: goods_orders goods_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.goods_orders
    ADD CONSTRAINT goods_orders_pkey PRIMARY KEY (id);


--
-- Name: goods goods_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.goods
    ADD CONSTRAINT goods_pkey PRIMARY KEY (id);


--
-- Name: insurance_policies insurance_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.insurance_policies
    ADD CONSTRAINT insurance_policies_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: trailers trailers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT trailers_pkey PRIMARY KEY (id);


--
-- Name: trucks trucks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trucks
    ADD CONSTRAINT trucks_pkey PRIMARY KEY (id);


--
-- Name: index_admins_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_admins_on_email ON public.admins USING btree (email);


--
-- Name: index_admins_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_admins_on_reset_password_token ON public.admins USING btree (reset_password_token);


--
-- Name: index_companies_on_company_owner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_companies_on_company_owner_id ON public.companies USING btree (company_owner_id);


--
-- Name: index_company_owners_on_confirmation_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_company_owners_on_confirmation_token ON public.company_owners USING btree (confirmation_token);


--
-- Name: index_company_owners_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_company_owners_on_email ON public.company_owners USING btree (email);


--
-- Name: index_company_owners_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_company_owners_on_reset_password_token ON public.company_owners USING btree (reset_password_token);


--
-- Name: index_customers_on_confirmation_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_customers_on_confirmation_token ON public.customers USING btree (confirmation_token);


--
-- Name: index_customers_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_customers_on_email ON public.customers USING btree (email);


--
-- Name: index_customers_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_customers_on_reset_password_token ON public.customers USING btree (reset_password_token);


--
-- Name: index_driver_licenses_on_driver_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_driver_licenses_on_driver_id ON public.driver_licenses USING btree (driver_id);


--
-- Name: index_drivers_on_company_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_drivers_on_company_id ON public.drivers USING btree (company_id);


--
-- Name: index_drivers_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_drivers_on_email ON public.drivers USING btree (email);


--
-- Name: index_drivers_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_drivers_on_reset_password_token ON public.drivers USING btree (reset_password_token);


--
-- Name: index_goods_on_customer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_goods_on_customer_id ON public.goods USING btree (customer_id);


--
-- Name: index_goods_orders_on_good_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_goods_orders_on_good_id ON public.goods_orders USING btree (good_id);


--
-- Name: index_goods_orders_on_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_goods_orders_on_order_id ON public.goods_orders USING btree (order_id);


--
-- Name: index_insurance_policies_on_driver_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_insurance_policies_on_driver_id ON public.insurance_policies USING btree (driver_id);


--
-- Name: index_orders_on_customer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_customer_id ON public.orders USING btree (customer_id);


--
-- Name: index_orders_on_driver_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_driver_id ON public.orders USING btree (driver_id);


--
-- Name: index_trailers_on_company_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trailers_on_company_id ON public.trailers USING btree (company_id);


--
-- Name: index_trailers_on_truck_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trailers_on_truck_id ON public.trailers USING btree (truck_id);


--
-- Name: index_trucks_on_company_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trucks_on_company_id ON public.trucks USING btree (company_id);


--
-- Name: index_trucks_on_driver_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trucks_on_driver_id ON public.trucks USING btree (driver_id);


--
-- Name: drivers fk_rails_1ae84e42c0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.drivers
    ADD CONSTRAINT fk_rails_1ae84e42c0 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: orders fk_rails_3dad120da9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_3dad120da9 FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: trucks fk_rails_654a697a5e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trucks
    ADD CONSTRAINT fk_rails_654a697a5e FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: orders fk_rails_704256a413; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_704256a413 FOREIGN KEY (driver_id) REFERENCES public.drivers(id);


--
-- Name: trucks fk_rails_77c8babecf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trucks
    ADD CONSTRAINT fk_rails_77c8babecf FOREIGN KEY (driver_id) REFERENCES public.drivers(id);


--
-- Name: goods fk_rails_94aa79ce98; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.goods
    ADD CONSTRAINT fk_rails_94aa79ce98 FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: trailers fk_rails_969bd1d1e2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_969bd1d1e2 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: goods_orders fk_rails_b85d752459; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.goods_orders
    ADD CONSTRAINT fk_rails_b85d752459 FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: insurance_policies fk_rails_b9b2256154; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.insurance_policies
    ADD CONSTRAINT fk_rails_b9b2256154 FOREIGN KEY (driver_id) REFERENCES public.drivers(id);


--
-- Name: driver_licenses fk_rails_cf3d52a227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.driver_licenses
    ADD CONSTRAINT fk_rails_cf3d52a227 FOREIGN KEY (driver_id) REFERENCES public.drivers(id);


--
-- Name: trailers fk_rails_e9692abcf7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_e9692abcf7 FOREIGN KEY (truck_id) REFERENCES public.trucks(id);


--
-- Name: goods_orders fk_rails_eec4783b60; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.goods_orders
    ADD CONSTRAINT fk_rails_eec4783b60 FOREIGN KEY (good_id) REFERENCES public.goods(id);


--
-- Name: companies fk_rails_fa012649f1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT fk_rails_fa012649f1 FOREIGN KEY (company_owner_id) REFERENCES public.company_owners(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20180507153014'),
('20180507173146'),
('20180507175236'),
('20180507180011'),
('20180507180759'),
('20180507181822'),
('20180507182512'),
('20180507183313'),
('20180507184600'),
('20180507184709'),
('20180507185203'),
('20180507191450'),
('20180513160034');


