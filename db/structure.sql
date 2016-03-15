--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: carts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE carts (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: carts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE carts_id_seq OWNED BY carts.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    vertical_image character varying,
    description text
);


--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: categorypics; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categorypics (
    id integer NOT NULL,
    image character varying,
    category_id integer,
    subcategory_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: categorypics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE categorypics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categorypics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE categorypics_id_seq OWNED BY categorypics.id;


--
-- Name: images; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE images (
    id integer NOT NULL,
    image character varying,
    product_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE images_id_seq OWNED BY images.id;


--
-- Name: line_items; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE line_items (
    id integer NOT NULL,
    product_id integer,
    cart_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    quantity integer DEFAULT 1,
    sellprice double precision,
    order_id integer
);


--
-- Name: line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE line_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE line_items_id_seq OWNED BY line_items.id;


--
-- Name: options; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE options (
    id integer NOT NULL,
    price double precision,
    power double precision,
    product_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: options_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE options_id_seq OWNED BY options.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE orders (
    id integer NOT NULL,
    name character varying,
    address text,
    email character varying,
    phone character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    payment_type character varying,
    totalsum double precision
);


--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- Name: powers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE powers (
    id integer NOT NULL,
    value integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: powers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE powers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: powers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE powers_id_seq OWNED BY powers.id;


--
-- Name: product_tags; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE product_tags (
    id integer NOT NULL,
    product_id integer,
    tag_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: product_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE product_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE product_tags_id_seq OWNED BY product_tags.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE products (
    id integer NOT NULL,
    name character varying,
    description text,
    sku integer,
    intro_text text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    category_id integer,
    voltage double precision,
    electric_current double precision,
    advertising_main_slider character varying,
    hotproduct boolean,
    main_slider_image character varying,
    subcategory_id integer,
    keywords text
);


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE products_id_seq OWNED BY products.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: settings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE settings (
    id integer NOT NULL,
    logo character varying,
    adv_text_1 text,
    adv_text_2 text,
    adv_text_3 text,
    about text,
    phone1 character varying,
    phone2 character varying,
    mail character varying,
    opening character varying,
    social_media hstore,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    keywords character varying,
    description text,
    title character varying,
    site character varying
);


--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE settings_id_seq OWNED BY settings.id;


--
-- Name: subcategories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE subcategories (
    id integer NOT NULL,
    name character varying,
    description text,
    category_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    product_id integer
);


--
-- Name: subcategories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE subcategories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: subcategories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE subcategories_id_seq OWNED BY subcategories.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tags (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY carts ALTER COLUMN id SET DEFAULT nextval('carts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY categorypics ALTER COLUMN id SET DEFAULT nextval('categorypics_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY images ALTER COLUMN id SET DEFAULT nextval('images_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY line_items ALTER COLUMN id SET DEFAULT nextval('line_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY options ALTER COLUMN id SET DEFAULT nextval('options_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY powers ALTER COLUMN id SET DEFAULT nextval('powers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY product_tags ALTER COLUMN id SET DEFAULT nextval('product_tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY settings ALTER COLUMN id SET DEFAULT nextval('settings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY subcategories ALTER COLUMN id SET DEFAULT nextval('subcategories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Name: carts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: categorypics_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categorypics
    ADD CONSTRAINT categorypics_pkey PRIMARY KEY (id);


--
-- Name: images_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY line_items
    ADD CONSTRAINT line_items_pkey PRIMARY KEY (id);


--
-- Name: options_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY options
    ADD CONSTRAINT options_pkey PRIMARY KEY (id);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: powers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY powers
    ADD CONSTRAINT powers_pkey PRIMARY KEY (id);


--
-- Name: product_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY product_tags
    ADD CONSTRAINT product_tags_pkey PRIMARY KEY (id);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: subcategories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY subcategories
    ADD CONSTRAINT subcategories_pkey PRIMARY KEY (id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: index_categorypics_on_category_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_categorypics_on_category_id ON categorypics USING btree (category_id);


--
-- Name: index_categorypics_on_subcategory_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_categorypics_on_subcategory_id ON categorypics USING btree (subcategory_id);


--
-- Name: index_images_on_product_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_images_on_product_id ON images USING btree (product_id);


--
-- Name: index_line_items_on_cart_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_line_items_on_cart_id ON line_items USING btree (cart_id);


--
-- Name: index_line_items_on_order_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_line_items_on_order_id ON line_items USING btree (order_id);


--
-- Name: index_line_items_on_product_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_line_items_on_product_id ON line_items USING btree (product_id);


--
-- Name: index_options_on_product_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_options_on_product_id ON options USING btree (product_id);


--
-- Name: index_product_tags_on_product_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_product_tags_on_product_id ON product_tags USING btree (product_id);


--
-- Name: index_product_tags_on_tag_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_product_tags_on_tag_id ON product_tags USING btree (tag_id);


--
-- Name: index_products_on_subcategory_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_products_on_subcategory_id ON products USING btree (subcategory_id);


--
-- Name: index_subcategories_on_category_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_subcategories_on_category_id ON subcategories USING btree (category_id);


--
-- Name: index_subcategories_on_product_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_subcategories_on_product_id ON subcategories USING btree (product_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_11e15d5c6b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY line_items
    ADD CONSTRAINT fk_rails_11e15d5c6b FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: fk_rails_150008c07d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products
    ADD CONSTRAINT fk_rails_150008c07d FOREIGN KEY (subcategory_id) REFERENCES subcategories(id);


--
-- Name: fk_rails_207ed641db; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY subcategories
    ADD CONSTRAINT fk_rails_207ed641db FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: fk_rails_2dc2e5c22c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY line_items
    ADD CONSTRAINT fk_rails_2dc2e5c22c FOREIGN KEY (order_id) REFERENCES orders(id);


--
-- Name: fk_rails_3937626525; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY subcategories
    ADD CONSTRAINT fk_rails_3937626525 FOREIGN KEY (category_id) REFERENCES categories(id);


--
-- Name: fk_rails_61f9a8ecbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY options
    ADD CONSTRAINT fk_rails_61f9a8ecbd FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: fk_rails_a402a4c881; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY product_tags
    ADD CONSTRAINT fk_rails_a402a4c881 FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: fk_rails_af645e8e5f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY line_items
    ADD CONSTRAINT fk_rails_af645e8e5f FOREIGN KEY (cart_id) REFERENCES carts(id);


--
-- Name: fk_rails_bd36e75ae4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY images
    ADD CONSTRAINT fk_rails_bd36e75ae4 FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: fk_rails_ecabaad74a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY product_tags
    ADD CONSTRAINT fk_rails_ecabaad74a FOREIGN KEY (tag_id) REFERENCES tags(id);


--
-- Name: fk_rails_ef292a3659; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categorypics
    ADD CONSTRAINT fk_rails_ef292a3659 FOREIGN KEY (category_id) REFERENCES categories(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20160227132325');

INSERT INTO schema_migrations (version) VALUES ('20160228102059');

INSERT INTO schema_migrations (version) VALUES ('20160228103921');

INSERT INTO schema_migrations (version) VALUES ('20160228110401');

INSERT INTO schema_migrations (version) VALUES ('20160228110538');

INSERT INTO schema_migrations (version) VALUES ('20160228174755');

INSERT INTO schema_migrations (version) VALUES ('20160228183049');

INSERT INTO schema_migrations (version) VALUES ('20160301174441');

INSERT INTO schema_migrations (version) VALUES ('20160301174504');

INSERT INTO schema_migrations (version) VALUES ('20160301175305');

INSERT INTO schema_migrations (version) VALUES ('20160301190037');

INSERT INTO schema_migrations (version) VALUES ('20160301201108');

INSERT INTO schema_migrations (version) VALUES ('20160301201223');

INSERT INTO schema_migrations (version) VALUES ('20160301201601');

INSERT INTO schema_migrations (version) VALUES ('20160305145951');

INSERT INTO schema_migrations (version) VALUES ('20160305150330');

INSERT INTO schema_migrations (version) VALUES ('20160305150450');

INSERT INTO schema_migrations (version) VALUES ('20160306152813');

INSERT INTO schema_migrations (version) VALUES ('20160306154852');

INSERT INTO schema_migrations (version) VALUES ('20160306162100');

INSERT INTO schema_migrations (version) VALUES ('20160306170332');

INSERT INTO schema_migrations (version) VALUES ('20160306171200');

INSERT INTO schema_migrations (version) VALUES ('20160306173042');

INSERT INTO schema_migrations (version) VALUES ('20160306180854');

INSERT INTO schema_migrations (version) VALUES ('20160306182406');

INSERT INTO schema_migrations (version) VALUES ('20160306192314');

INSERT INTO schema_migrations (version) VALUES ('20160306213403');

INSERT INTO schema_migrations (version) VALUES ('20160306213652');

INSERT INTO schema_migrations (version) VALUES ('20160312172800');

INSERT INTO schema_migrations (version) VALUES ('20160315175546');

INSERT INTO schema_migrations (version) VALUES ('20160315181714');

