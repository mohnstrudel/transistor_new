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
-- Name: accessoire_tags; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE accessoire_tags (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: accessoire_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE accessoire_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: accessoire_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE accessoire_tags_id_seq OWNED BY accessoire_tags.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: bootsy_image_galleries; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bootsy_image_galleries (
    id integer NOT NULL,
    bootsy_resource_type character varying,
    bootsy_resource_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: bootsy_image_galleries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE bootsy_image_galleries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bootsy_image_galleries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE bootsy_image_galleries_id_seq OWNED BY bootsy_image_galleries.id;


--
-- Name: bootsy_images; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bootsy_images (
    id integer NOT NULL,
    image_file character varying,
    image_gallery_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: bootsy_images_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE bootsy_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bootsy_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE bootsy_images_id_seq OWNED BY bootsy_images.id;


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
-- Name: coloralizations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE coloralizations (
    id integer NOT NULL,
    product_id integer,
    color_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: coloralizations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE coloralizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: coloralizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE coloralizations_id_seq OWNED BY coloralizations.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    title character varying,
    name character varying,
    email character varying,
    body text,
    product_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    picture character varying
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: deliveries; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE deliveries (
    id integer NOT NULL,
    reach character varying,
    price double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    delivery_type character varying
);


--
-- Name: deliveries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE deliveries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: deliveries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE deliveries_id_seq OWNED BY deliveries.id;


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
    order_id integer,
    color_id integer,
    size_id integer
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
-- Name: manufacturers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE manufacturers (
    id integer NOT NULL,
    name character varying,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: manufacturers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE manufacturers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: manufacturers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE manufacturers_id_seq OWNED BY manufacturers.id;


--
-- Name: options; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE options (
    id integer NOT NULL,
    price double precision,
    size character varying,
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
    totalsum double precision,
    delivery_id integer
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
-- Name: product_accessoire_tags; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE product_accessoire_tags (
    id integer NOT NULL,
    product_id integer,
    accessoire_tag_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: product_accessoire_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE product_accessoire_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_accessoire_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE product_accessoire_tags_id_seq OWNED BY product_accessoire_tags.id;


--
-- Name: product_deliveries; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE product_deliveries (
    id integer NOT NULL,
    product_id integer,
    delivery_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: product_deliveries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE product_deliveries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_deliveries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE product_deliveries_id_seq OWNED BY product_deliveries.id;


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
    characteristics text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    category_id integer,
    voltage double precision,
    electric_current double precision,
    advertising_main_slider character varying,
    hotproduct boolean,
    main_slider_image character varying,
    subcategory_id integer,
    keywords text,
    main_infographic character varying,
    sizes_infographic character varying,
    table_infographic character varying,
    manufacturer_id integer,
    warranty character varying,
    available boolean,
    price double precision
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
    site character varying,
    delivery_and_payment text
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
-- Name: sizes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sizes (
    id integer NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sizes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sizes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sizes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sizes_id_seq OWNED BY sizes.id;


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

ALTER TABLE ONLY accessoire_tags ALTER COLUMN id SET DEFAULT nextval('accessoire_tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY bootsy_image_galleries ALTER COLUMN id SET DEFAULT nextval('bootsy_image_galleries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY bootsy_images ALTER COLUMN id SET DEFAULT nextval('bootsy_images_id_seq'::regclass);


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

ALTER TABLE ONLY coloralizations ALTER COLUMN id SET DEFAULT nextval('coloralizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY deliveries ALTER COLUMN id SET DEFAULT nextval('deliveries_id_seq'::regclass);


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

ALTER TABLE ONLY manufacturers ALTER COLUMN id SET DEFAULT nextval('manufacturers_id_seq'::regclass);


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

ALTER TABLE ONLY product_accessoire_tags ALTER COLUMN id SET DEFAULT nextval('product_accessoire_tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY product_deliveries ALTER COLUMN id SET DEFAULT nextval('product_deliveries_id_seq'::regclass);


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

ALTER TABLE ONLY sizes ALTER COLUMN id SET DEFAULT nextval('sizes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY subcategories ALTER COLUMN id SET DEFAULT nextval('subcategories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Name: accessoire_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY accessoire_tags
    ADD CONSTRAINT accessoire_tags_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: bootsy_image_galleries_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bootsy_image_galleries
    ADD CONSTRAINT bootsy_image_galleries_pkey PRIMARY KEY (id);


--
-- Name: bootsy_images_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bootsy_images
    ADD CONSTRAINT bootsy_images_pkey PRIMARY KEY (id);


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
-- Name: coloralizations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY coloralizations
    ADD CONSTRAINT coloralizations_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: deliveries_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY deliveries
    ADD CONSTRAINT deliveries_pkey PRIMARY KEY (id);


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
-- Name: manufacturers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY manufacturers
    ADD CONSTRAINT manufacturers_pkey PRIMARY KEY (id);


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
-- Name: product_accessoire_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY product_accessoire_tags
    ADD CONSTRAINT product_accessoire_tags_pkey PRIMARY KEY (id);


--
-- Name: product_deliveries_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY product_deliveries
    ADD CONSTRAINT product_deliveries_pkey PRIMARY KEY (id);


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
-- Name: sizes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sizes
    ADD CONSTRAINT sizes_pkey PRIMARY KEY (id);


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
-- Name: index_coloralizations_on_color_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_coloralizations_on_color_id ON coloralizations USING btree (color_id);


--
-- Name: index_coloralizations_on_product_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_coloralizations_on_product_id ON coloralizations USING btree (product_id);


--
-- Name: index_comments_on_product_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_comments_on_product_id ON comments USING btree (product_id);


--
-- Name: index_images_on_product_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_images_on_product_id ON images USING btree (product_id);


--
-- Name: index_line_items_on_cart_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_line_items_on_cart_id ON line_items USING btree (cart_id);


--
-- Name: index_line_items_on_color_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_line_items_on_color_id ON line_items USING btree (color_id);


--
-- Name: index_line_items_on_order_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_line_items_on_order_id ON line_items USING btree (order_id);


--
-- Name: index_line_items_on_product_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_line_items_on_product_id ON line_items USING btree (product_id);


--
-- Name: index_line_items_on_size_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_line_items_on_size_id ON line_items USING btree (size_id);


--
-- Name: index_options_on_product_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_options_on_product_id ON options USING btree (product_id);


--
-- Name: index_orders_on_delivery_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_orders_on_delivery_id ON orders USING btree (delivery_id);


--
-- Name: index_product_accessoire_tags_on_accessoire_tag_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_product_accessoire_tags_on_accessoire_tag_id ON product_accessoire_tags USING btree (accessoire_tag_id);


--
-- Name: index_product_accessoire_tags_on_product_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_product_accessoire_tags_on_product_id ON product_accessoire_tags USING btree (product_id);


--
-- Name: index_product_deliveries_on_delivery_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_product_deliveries_on_delivery_id ON product_deliveries USING btree (delivery_id);


--
-- Name: index_product_deliveries_on_product_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_product_deliveries_on_product_id ON product_deliveries USING btree (product_id);


--
-- Name: index_product_tags_on_product_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_product_tags_on_product_id ON product_tags USING btree (product_id);


--
-- Name: index_product_tags_on_tag_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_product_tags_on_tag_id ON product_tags USING btree (tag_id);


--
-- Name: index_products_on_manufacturer_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_products_on_manufacturer_id ON products USING btree (manufacturer_id);


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
-- Name: fk_rails_106ab86b92; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY product_accessoire_tags
    ADD CONSTRAINT fk_rails_106ab86b92 FOREIGN KEY (product_id) REFERENCES products(id);


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
-- Name: fk_rails_33082c31de; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products
    ADD CONSTRAINT fk_rails_33082c31de FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(id);


--
-- Name: fk_rails_3937626525; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY subcategories
    ADD CONSTRAINT fk_rails_3937626525 FOREIGN KEY (category_id) REFERENCES categories(id);


--
-- Name: fk_rails_3ff0b294a6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY product_deliveries
    ADD CONSTRAINT fk_rails_3ff0b294a6 FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: fk_rails_5862e91693; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY coloralizations
    ADD CONSTRAINT fk_rails_5862e91693 FOREIGN KEY (color_id) REFERENCES manufacturers(id);


--
-- Name: fk_rails_61f9a8ecbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY options
    ADD CONSTRAINT fk_rails_61f9a8ecbd FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: fk_rails_68f27826c7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY coloralizations
    ADD CONSTRAINT fk_rails_68f27826c7 FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: fk_rails_909773478f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY line_items
    ADD CONSTRAINT fk_rails_909773478f FOREIGN KEY (color_id) REFERENCES manufacturers(id);


--
-- Name: fk_rails_a0d280f6e4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT fk_rails_a0d280f6e4 FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: fk_rails_a1e35bcaf6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY line_items
    ADD CONSTRAINT fk_rails_a1e35bcaf6 FOREIGN KEY (size_id) REFERENCES sizes(id);


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
-- Name: fk_rails_caacc132cc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY product_deliveries
    ADD CONSTRAINT fk_rails_caacc132cc FOREIGN KEY (delivery_id) REFERENCES deliveries(id);


--
-- Name: fk_rails_caba0da8d5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT fk_rails_caba0da8d5 FOREIGN KEY (delivery_id) REFERENCES deliveries(id);


--
-- Name: fk_rails_d8a50f7cb4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY product_accessoire_tags
    ADD CONSTRAINT fk_rails_d8a50f7cb4 FOREIGN KEY (accessoire_tag_id) REFERENCES accessoire_tags(id);


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

INSERT INTO "schema_migrations" (version) VALUES
('20160227132325'),
('20160228102059'),
('20160228103921'),
('20160228110401'),
('20160228110538'),
('20160228174755'),
('20160228183049'),
('20160301174441'),
('20160301174504'),
('20160301175305'),
('20160301190037'),
('20160301201108'),
('20160301201223'),
('20160301201601'),
('20160305145951'),
('20160305150330'),
('20160305150450'),
('20160306152813'),
('20160306154852'),
('20160306162100'),
('20160306170332'),
('20160306171200'),
('20160306173042'),
('20160306180854'),
('20160306182406'),
('20160306192314'),
('20160306213403'),
('20160306213652'),
('20160312172800'),
('20160315175546'),
('20160315181714'),
('20160322184410'),
('20170115171245'),
('20170115172449'),
('20170115174042'),
('20170115174628'),
('20170121215412'),
('20170121224440'),
('20170122094442'),
('20170130203447'),
('20170130203518'),
('20170202074356'),
('20170515193747'),
('20170515193748'),
('20170515195003'),
('20170515200018'),
('20170515200812'),
('20170516201137'),
('20170516201503'),
('20170516201709'),
('20170516201918'),
('20170516213245'),
('20170516215510'),
('20170516220535'),
('20170521164307'),
('20170522062750'),
('20170522063559');


