--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg120+2)
-- Dumped by pg_dump version 16.2 (Debian 16.2-1.pgdg120+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: categories; Type: SCHEMA; Schema: -; Owner: huyanh
--

CREATE SCHEMA categories;


ALTER SCHEMA categories OWNER TO huyanh;

--
-- Name: options; Type: SCHEMA; Schema: -; Owner: huyanh
--

CREATE SCHEMA options;


ALTER SCHEMA options OWNER TO huyanh;

--
-- Name: posts; Type: SCHEMA; Schema: -; Owner: huyanh
--

CREATE SCHEMA posts;


ALTER SCHEMA posts OWNER TO huyanh;

--
-- Name: questions; Type: SCHEMA; Schema: -; Owner: huyanh
--

CREATE SCHEMA questions;


ALTER SCHEMA questions OWNER TO huyanh;

--
-- Name: resets; Type: SCHEMA; Schema: -; Owner: huyanh
--

CREATE SCHEMA resets;


ALTER SCHEMA resets OWNER TO huyanh;

--
-- Name: users; Type: SCHEMA; Schema: -; Owner: huyanh
--

CREATE SCHEMA users;


ALTER SCHEMA users OWNER TO huyanh;

--
-- Name: post_status; Type: TYPE; Schema: public; Owner: huyanh
--

CREATE TYPE public.post_status AS ENUM (
    'draft',
    'published'
);


ALTER TYPE public.post_status OWNER TO huyanh;

--
-- Name: user_status; Type: TYPE; Schema: public; Owner: huyanh
--

CREATE TYPE public.user_status AS ENUM (
    'disabled',
    'unverified',
    'active'
);


ALTER TYPE public.user_status OWNER TO huyanh;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: bac_hoc; Type: TABLE; Schema: public; Owner: huyanh
--

CREATE TABLE public.bac_hoc (
    id text NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.bac_hoc OWNER TO huyanh;

--
-- Name: posts; Type: TABLE; Schema: public; Owner: huyanh
--

CREATE TABLE public.posts (
    id bigint NOT NULL,
    author_id bigint NOT NULL,
    title character varying(60) NOT NULL,
    body text NOT NULL,
    status public.post_status NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.posts OWNER TO huyanh;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: huyanh
--

CREATE SEQUENCE public.posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.posts_id_seq OWNER TO huyanh;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: huyanh
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: huyanh
--

CREATE TABLE public.questions (
    id integer NOT NULL,
    bac_hoc_id text NOT NULL,
    question_text text NOT NULL,
    explanation text,
    option1 jsonb,
    option2 jsonb,
    option3 jsonb,
    option4 jsonb
);


ALTER TABLE public.questions OWNER TO huyanh;

--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: huyanh
--

CREATE SEQUENCE public.questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.questions_id_seq OWNER TO huyanh;

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: huyanh
--

ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;


--
-- Name: resets; Type: TABLE; Schema: public; Owner: huyanh
--

CREATE TABLE public.resets (
    user_id bigint NOT NULL,
    code character varying(60) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.resets OWNER TO huyanh;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: huyanh
--

CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    dirty boolean NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO huyanh;

--
-- Name: users; Type: TABLE; Schema: public; Owner: huyanh
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying(254) NOT NULL,
    pass character varying(60) NOT NULL,
    salt character varying(60) NOT NULL,
    status public.user_status NOT NULL,
    verification character varying(60) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.users OWNER TO huyanh;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: huyanh
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO huyanh;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: huyanh
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: huyanh
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: questions id; Type: DEFAULT; Schema: public; Owner: huyanh
--

ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: huyanh
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: bac_hoc; Type: TABLE DATA; Schema: public; Owner: huyanh
--

COPY public.bac_hoc (id, name) FROM stdin;
luc3	Bậc lực năm thứ 3
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: huyanh
--

COPY public.posts (id, author_id, title, body, status, created_at, updated_at) FROM stdin;
1	1	test	teest te	published	2024-05-10 12:27:23.23769	2024-05-10 12:27:23.23769
2	1	who rew	dsa jlof	published	2024-05-10 12:27:34.672582	2024-05-10 12:27:34.672582
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: huyanh
--

COPY public.questions (id, bac_hoc_id, question_text, explanation, option1, option2, option3, option4) FROM stdin;
101	luc3	test test	\N	{"option": "dsf"}	{"option": "fsdf", "is_answer": false}	{"option": "fsdf", "is_answer": false}	{"option": "dsfsd", "is_answer": false}
94	luc3	Sau năm 1975, GHPGVNTN có tổ chức một kỳ Đại hội đánh dấu cho sự phục hoạt GH sau bao nhiêu năm thăng trầm, gian khó. Kỳ Đại Hội đó được tổ chức tại	Chưa có lời giải thích	{"option": "Tu viện Nguyên Thiều, Tỉnh Bình Định", "is_answer": true}	{"option": "Chùa Giác Hoa , TPHCM", "is_answer": false}	{"option": "Tu viện Quảng Hương Già Lam, TPHCM", "is_answer": false}	{"option": "Thanh Minh Thiền Viện, TPHCM", "is_answer": false}
85	luc3	Phật giáo Campuchia hiện nay được chia làm hai tông phái đó là	Chưa có lời giải thích	{"option": "Pháp tướng tông và Tịnh độ tông", "is_answer": false}	{"option": "Đại tông và Thành tông", "is_answer": false}	{"option": "Nam tông và Bắc tông", "is_answer": false}	{"option": "Đại tông và Pháp tông", "is_answer": true}
96	luc3	Quan điểm của Phật giáo về hoà bình là	Chưa có lời giải thích	{"option": "Hoà bình phải có từ trong ý thức, từ trong tâm niệm của mỗi người", "is_answer": false}	{"option": "Hoà bình là mọi người dân được no đủ, bình yên", "is_answer": false}	{"option": "Tâm bình, thế giới bình", "is_answer": false}	{"option": "Câu a,c đúng", "is_answer": true}
97	luc3	Theo Phật giáo thì nguồn gốc của chiến tranh là	Chưa có lời giải thích	{"option": "Sự hận thù", "is_answer": false}	{"option": "Tham, sân, si", "is_answer": true}	{"option": "Nghèo đói", "is_answer": false}	{"option": "Tranh chấp giữa các quốc gia", "is_answer": false}
98	luc3	Tư tưởng của toàn bộ kinh Thắng Man là	Chưa có lời giải thích	{"option": "Như Lai Tạng", "is_answer": true}	{"option": "Đại thừa", "is_answer": false}	{"option": "Nhất thừa", "is_answer": false}	{"option": "Bồ đề tâm", "is_answer": false}
99	luc3	Đại hội Huynh trưởng toàn quốc lần thứ 9 được diễn ra vào năm nào, trú xứ nào	Chưa có lời giải thích	{"option": "Năm 2012 tại Tu viện Quảng Hương Già Lam", "is_answer": false}	{"option": "Năm 2012 tại Chùa Pháp Vân", "is_answer": false}	{"option": "Năm 2012 tại Tu Viện Quảng Đức", "is_answer": true}	{"option": "Năm 2013 tại Tu Viện Quảng Đức", "is_answer": false}
100	luc3	Điền vào cụm từ còn thiếu trong bài kệ sau: Bồ đề bổn vô thọ. Minh cảnh diệc phi đài. Bản lại vô nhất vật. ….......................	Chưa có lời giải thích	{"option": "Vật sử hạ trần ai", "is_answer": false}	{"option": "Hà sử nhạ trần ai", "is_answer": false}	{"option": "Vật xứ nhạ trần ai", "is_answer": false}	{"option": "Hà xứ nhạ trần ai", "is_answer": true}
20	luc3	Bồ tát Quán thế âm đã hiện ra bao nhiêu ứng thân để hoá độ chúng sanh?	Chưa có lời giải thích	{"option": "25 ứng thân", "is_answer": false}	{"option": "80 ứng thân", "is_answer": false}	{"option": "32 ứng thân", "is_answer": true}	{"option": "81 ứng thân", "is_answer": false}
21	luc3	Trong Kinh Thủ Lăng Nghiêm, phương pháp tu hành mà Đức Phật dạy cho Tôn giả A Nan để độ chúng sanh đời sau đó là:	Chưa có lời giải thích	{"option": "Nhĩ căn viên thông", "is_answer": false}	{"option": "37 phẩm trợ đạo", "is_answer": false}	{"option": "Tam vô lậu học", "is_answer": true}	{"option": "Đốn ngộ - tiệm tu", "is_answer": false}
50	luc3	Tất cả các bộ môn tu học của GĐPT đều giúp cho người áo Lam được	Chưa có lời giải thích	{"option": "Hoạt động", "is_answer": false}	{"option": "Hội nhập", "is_answer": false}	{"option": "Huân tập", "is_answer": true}	{"option": "Tấn tu", "is_answer": false}
22	luc3	Trong Kinh Thủ Lăng Nghiêm có nói về Đại Thừa Tâm Giới bao gồm:	Chưa có lời giải thích	{"option": "Nhiếp luật nghi giới - Nhiếp thiện pháp giới - Nhiếp chúng sanh giới", "is_answer": false}	{"option": "Bố thí- ái ngữ - lợi hành - đồng sự", "is_answer": false}	{"option": "Từ - Bi - Hỷ - Xả", "is_answer": false}	{"option": "Dâm - Sát - Đạo - Vọng", "is_answer": false}
23	luc3	Qua Kinh Thủ Lăng Nghiêm, Phật dạy hành giả tu tập phải trải qua bao nhiêu địa vị mới đến quả Phật?	Chưa có lời giải thích	{"option": "45 địa vị", "is_answer": false}	{"option": "55 địa vị", "is_answer": true}	{"option": "65 địa vị", "is_answer": false}	{"option": "75 địa vị", "is_answer": false}
24	luc3	Hán bản Kinh Thủ Lăng Nghiêm do ai dịch?	Chưa có lời giải thích	{"option": "Huyền Trang", "is_answer": false}	{"option": "Trí Giả", "is_answer": false}	{"option": "Trí Khải", "is_answer": false}	{"option": "Bát Lặc Mật Đế ", "is_answer": true}
25	luc3	Lấy Phật đảnh dụ cho Thủ Lăng Nghiêm là để chỉ tính chất:	Chưa có lời giải thích	{"option": "Tối thượng của Thủ Lăng Nghiêm", "is_answer": true}	{"option": "Vĩ đại của Thủ Lăng Nghiêm", "is_answer": false}	{"option": "Đại Định thượng thủ", "is_answer": false}	{"option": "Chân tâm thượng thủ", "is_answer": false}
26	luc3	Nội dung chính của Kinh Duy Ma Cật nhằm:	Chưa có lời giải thích	{"option": "Nói về Duy Ma Cật", "is_answer": false}	{"option": "Nói về \\"Tịnh Phật quốc độ, thành tựu chúng sanh\\"", "is_answer": true}	{"option": "Nói về giá trị siêu việt của cuộc sống", "is_answer": false}	{"option": "Nói về vị ngọt của chánh pháp", "is_answer": false}
27	luc3	Kinh Duy Ma Cật sở thuyết đặt trên cơ sở tư tưởng nào?	Chưa có lời giải thích	{"option": "Bất nhị pháp môn", "is_answer": false}	{"option": "Bất tư nghì giải thoát", "is_answer": false}	{"option": "Tịnh Phật quốc độ", "is_answer": false}	{"option": "Cả 3 câu trên đều đúng", "is_answer": true}
1	luc3	Đức Phật chỉ dạy trong Kinh Duy Ma Cật, Bồ tát hành đạo để tịnh Phật quốc độ vì biết rằng tất cả các pháp bản lai thanh tịnh. Đó là:	Chưa có lời giải thích	{"option": "Đại bi ", "is_answer": false}	{"option": "Đại hạnh", "is_answer": false}	{"option": "Đại nguyện", "is_answer": false}	{"option": "Đại trí", "is_answer": true}
2	luc3	Theo tinh thần Kinh Duy Ma Cật, Phật quốc ở đây được hiểu như thế nào?	Chưa có lời giải thích	{"option": "Là phạm vi mà trong đó giáo pháp của Phật được lưu truyền", "is_answer": false}	{"option": "Đó là môi trường chịu ảnh hưởng giáo hoá của một đức Phật nhất định trong một thời gian nhất định", "is_answer": false}	{"option": "Đó là thế giới của Phật ", "is_answer": false}	{"option": "Tất cả đều đúng", "is_answer": true}
3	luc3	Theo Kinh Duy Ma Cật, bệnh của Bồ tát từ đâu mà phát sinh?	Chưa có lời giải thích can tra sach	{"option": "Bệnh của Bồ tát từ phiền não, tham ái làm gốc phát sinh", "is_answer": false}	{"option": "Bệnh của Bồ tát xuất phát từ tuệ giác phát sinh ", "is_answer": false}	{"option": "Bệnh của Bồ tát xuất phát từ tâm đại bi", "is_answer": true}	{"option": "Bệnh của Bồ tát từ nghiệp thức luân hồi phát sinh", "is_answer": false}
4	luc3	Nhắm mục đích thoát khỏi thế giới Ta Bà được coi là uế trược này để sinh về một thế giới tốt đẹp hơn, đó chính là:	Chưa có lời giải thích	{"option": "Tịnh độ Bồ tát", "is_answer": false}	{"option": "Tịnh độ Tây phương", "is_answer": false}	{"option": "Tịnh độ cứu cánh", "is_answer": false}	{"option": "Tịnh độ tha lực ", "is_answer": true}
5	luc3	Vì sao tôn giả A Nan đã bảy lần chỉ tâm không trúng?	Chưa có lời giải thích	{"option": "Vì tôn giả không hiểu lời Phật dạy", "is_answer": false}	{"option": "Vì tôn giả thiếu công phu tu tập", "is_answer": false}	{"option": "Vì tôn giả chấp vọng tưởng làm tâm", "is_answer": true}	{"option": "Vì tôn giả thiếu sáng suốt ", "is_answer": false}
6	luc3	Giữa dòng đời ô nhiễm mà không hề bị nhiễm ô, vì bản chất tồn tại là vô nhiễm. Cho nên hành đạo và giải thoát của Duy Ma Cật nhắm đến cứu cánh hiện thực và cứu cánh được thể hiện:	Chưa có lời giải thích	{"option": "Diệt trừ phiền não nhiễm ô", "is_answer": false}	{"option": "Nhận thức thể tính của tham, sân, si", "is_answer": false}	{"option": "Tịnh Phật quốc độ và thành tự chúng sanh", "is_answer": true}	{"option": "Thành tựu giới thể thanh tịnh", "is_answer": false}
7	luc3	Có bao nhiêu loại Tịnh độ được để cập trong Kinh Duy Ma Cật?	Chưa có lời giải thích	{"option": "2 loại: hữu vi Tịnh độ và vô vi Tịnh độ", "is_answer": false}	{"option": "2 loại: Duy tâm Tịnh độ và Tây phương cực lạc Tịnh độ", "is_answer": false}	{"option": "2 loại: Tịnh độ tha lực và Tịnh độ Bồ tát", "is_answer": true}	{"option": "2 loại: Chân tâm Tịnh độ và Thắng xứ Tịnh độ", "is_answer": false}
45	luc3	Cấp Lãnh đạo Trung Ương GHPGVN có 2 Hội đồng đó là:	Chưa có lời giải thích	{"option": "Hội Đồng Tăng Già Chứng Minh - Hội Đồng trị sự", "is_answer": false}	{"option": "Hội Đồng Chứng Minh - Hội Đồng Điều Hành", "is_answer": false}	{"option": "Hồi Đồng Giáo Phẩm - Hội Đồng Trị Sự", "is_answer": false}	{"option": "Hội Đồng Chứng Minh - Hội Đồng Trị Sự", "is_answer": true}
8	luc3	Tông thể của Kinh Duy Ma Cật là gì?	Chưa có lời giải thích	{"option": "Bất tư nghị giải thoát", "is_answer": false}	{"option": "Tịnh Phật quốc độ, thành tựu chúng sanh", "is_answer": false}	{"option": "Nhập bất nhị pháp môn", "is_answer": true}	{"option": "Bất tư nghì giải thoát", "is_answer": false}
9	luc3	Tông dụng của Kinh Duy Ma Cật là:	Chưa có lời giải thích	{"option": "Bất tư nghị giải thoát", "is_answer": false}	{"option": "Tịnh Phật quốc độ, thành tựu chúng sanh", "is_answer": true}	{"option": "Nhập bất nhị pháp môn", "is_answer": false}	{"option": "Bất tư nghì giải thoát", "is_answer": false}
10	luc3	Tên gọi khác của Kinh Duy Ma Cật sở thuyết cũng chính là tông chỉ của Kinh?	Chưa có lời giải thích	{"option": "Bất tư nghị giải thoát", "is_answer": true}	{"option": "Tịnh Danh cư sĩ tôn kinh", "is_answer": false}	{"option": "Bất tư nghì giải thoát", "is_answer": false}	{"option": "Nhập bát nhị pháp môn", "is_answer": false}
11	luc3	Qua tinh thần "Tịnh Phật quốc độ, thành tựu chúng sanh"cho ta thấy cổ xe Đại thừa luôn luôn phải được vận chuyển bằng hai bánh xe đó là:	Chưa có lời giải thích	{"option": "Đại từ bi - Đại thệ nguyện", "is_answer": false}	{"option": "Đại trí - Đại bi", "is_answer": true}	{"option": "Cứu cánh - Giải thoát", "is_answer": false}	{"option": "Giới - Luật", "is_answer": false}
12	luc3	Trong chương đệ tử của Kinh Duy Ma Cật, Phật bảo bao nhiêu vị đệ tử đi thăm bệnh ngài Duy Ma Cật?	Chưa có lời giải thích	{"option": "09 vị", "is_answer": false}	{"option": "18 vị", "is_answer": false}	{"option": "10 vị", "is_answer": true}	{"option": "19 vị", "is_answer": false}
13	luc3	Ngài Duy Ma Cật trả lời Bồ tát Văn Thù Sư Lợi về gia nhân của mình là:	Chưa có lời giải thích	{"option": "Chẳng cần gia nhân hầu hạ vì tự tánh vốn bình đẳng", "is_answer": false}	{"option": "Hết thảy thân quyến và pháp giới chúng sanh đều là gia nhân của ta", "is_answer": false}	{"option": "Bọn Ma và Ngoại đạo là gia nhân ", "is_answer": true}	{"option": "Tất cả đều sai", "is_answer": false}
14	luc3	"Trí độ thành biện, thuyết pháp thuần thục, quyết định tu tập ở trong Đại thừa, đối với mọi tác nghiệp đều có thể khéo léo tư lương. An trú trong uy nghi của Phật. Vào sâu trong biển tâm tuệ".  Thành tự được tinh thần này là thành tựu được giai đoạn nào trong 5 giai đoạn tu tập theo tinh thần Kinh Duy Ma Cật	Chưa có lời giải thích	{"option": "Trí", "is_answer": false}	{"option": "Nguyện", "is_answer": false}	{"option": "Hành", "is_answer": false}	{"option": "Cứu cánh", "is_answer": true}
15	luc3	Duy Ma Cật nói: "Bệnh của ông không hình tướng, không phải thuộc thân, không phải thuộc tâm, không thuộc bốn đại". Nhận định này có thể hiểu trên cơ sở nào?	Chưa có lời giải thích	{"option": "Nhận thức về lý tính duyên khởi", "is_answer": true}	{"option": "Tình thương chúng sanh vô biên", "is_answer": false}	{"option": "Phiền não chúng sanh nhiều vô lượng", "is_answer": false}	{"option": "Trí tuệ và Từ bi luôn song hành", "is_answer": false}
16	luc3	Mười phương Đức Phật đều theo Kinh Thủ Lăng Nghiêm làm nhơn địa tu hành mà được thành đạo, chứng quả nên gọi là:	Chưa có lời giải thích	{"option": "Chư Bồ tát Vạn hạnh", "is_answer": false}	{"option": "Như Lai mật nhơn", "is_answer": true}	{"option": "Tu chứng liễu nghĩa", "is_answer": false}	{"option": "Đại định kiên cố", "is_answer": false}
17	luc3	Theo tinh thần Kinh Thủ Lăng Nghiêm, A Nan chính là:	Chưa có lời giải thích	{"option": "Vị thị giả của Phật", "is_answer": false}	{"option": "Chỉ cho chúng sanh mê mờ", "is_answer": true}	{"option": "Người bị Ma Đăng Già dụ dỗ", "is_answer": false}	{"option": "Tất cả đều sai", "is_answer": false}
18	luc3	Theo tinh thần Kinh Thủ Lăng Nghiêm, Chơn tâm bị ẩn là do nguyên nhân:	Chưa có lời giải thích	{"option": "Chẳng công phu tu tập", "is_answer": false}	{"option": "Chạy theo tà kiến", "is_answer": false}	{"option": "Thiếu thiền định", "is_answer": false}	{"option": "Vì vọng nổi lên", "is_answer": true}
19	luc3	Theo Kinh Thủ Lăng Nghiêm, có bao nhiêu vị Thánh giả thuật lại pháp tu của mình được chứng đạo quả?	Chưa có lời giải thích	{"option": "Có 24 vị", "is_answer": false}	{"option": "Có 26 vị", "is_answer": false}	{"option": "Có 25 vị", "is_answer": true}	{"option": "Có 27 vị", "is_answer": false}
28	luc3	Căn bản của Tịnh độ Bồ tát là:	Chưa có lời giải thích	{"option": "Tây phương Cực lạc", "is_answer": false}	{"option": "Vô cấu, vô nhiễm", "is_answer": false}	{"option": "Bất sinh bất diệt", "is_answer": false}	{"option": "Quốc độ chúng sinh", "is_answer": true}
29	luc3	Nội dung Kinh Lăng Nghiêm là lời Phật chỉ dạy cho chúng ta:	Chưa có lời giải thích	{"option": "Siêng năng trì chú", "is_answer": false}	{"option": "Ngộ được chơn tâm", "is_answer": true}	{"option": "Năng tụng kinh trì chú mỗi buổi sáng", "is_answer": false}	{"option": "Cả 3 ý trên", "is_answer": false}
30	luc3	Kinh Thủ Lăng Nghiêm giảng Tâm là:	Chưa có lời giải thích	{"option": "Cái \\"suy nghĩ phân biệt\\"", "is_answer": false}	{"option": "Cái do \\"nhân duyên sanh\\"", "is_answer": false}	{"option": "Cái \\"tự nhiên mà có\\"", "is_answer": false}	{"option": "Cái \\"thấy\\"(nghe, hay, biết) thanh tịnh, sáng suốt, thường còn", "is_answer": true}
31	luc3	Điền phần còn thiếu của đoạn văn phát nguyện của Tôn giả A Nan: "Đại hùng, đại lực, đại từ bi. Hy cánh thẩm trừ vi tế hoặc. Linh ngã tảo đăng vô thượng giác. Ư thập phương giới toạ đạo tràng. ….. Nam mô Thường trụ Thập Phương Phật.	Chưa có lời giải thích	{"option": "Ngũ trược ác thế thệ tiên nhập", "is_answer": false}	{"option": "Thuấn nhã đa tánh khả tiêu vong. Thước ca ra tâm vô động chuyển.", "is_answer": true}	{"option": "Như nhất chúng sanh vị thành phật, chung bất ư thử thủ nê hoàn", "is_answer": false}	{"option": "Câu a,c đúng.", "is_answer": false}
32	luc3	Sứ mệnh hoà bình của Phật giáo thể hiện qua:	Chưa có lời giải thích	{"option": "Kinh điển", "is_answer": false}	{"option": "Cuộc đời Đức Phật và những vị đệ tử", "is_answer": false}	{"option": "Lịch sử Phật giáo", "is_answer": false}	{"option": "Tất cả đều đúng", "is_answer": true}
33	luc3	Trong tinh thần hoà bình, khi cần bảo vệ những gì thiêng liêng cho dân tộc, tôn giáo thì người con Phật đã chọn phương pháp:	Chưa có lời giải thích	{"option": "Đấu tranh trong tinh thần bất bạo động", "is_answer": true}	{"option": "Im lặng để mọi việc tuỳ duyên", "is_answer": false}	{"option": "Quán tất cả đều do nhân quả nên không cần phải quan tâm", "is_answer": false}	{"option": "Tất cả các ý trên đều sai", "is_answer": false}
34	luc3	Ngày được chọn là ngày Hoà bình thế giới đó là:	Chưa có lời giải thích	{"option": "Ngày 20/09 dương lịch", "is_answer": false}	{"option": "Ngày 22/09 dương lịch", "is_answer": true}	{"option": "Ngày 21/09 dương lịch", "is_answer": false}	{"option": "Ngày 23/09 dương lịch", "is_answer": false}
83	luc3	Ngài Duy Ma Cật lên cõi Chúng Hương xin cơm về đãi tất cả hội chúng, sau đó trình bày tám pháp không lầm lỗi để được sanh về Tịnh độ. Đây là nội dung thuộc phẩm thứ mấy của Kinh	Chưa có lời giải thích	{"option": "Phẩm thứ 9", "is_answer": false}	{"option": "Phẩm thứ 10", "is_answer": true}	{"option": "Phẩm thứ 11", "is_answer": false}	{"option": "Phẩm thứ 12", "is_answer": false}
84	luc3	Phật giáo truyền thừa vào Thái Lan từ thời điểm nào	Chưa có lời giải thích	{"option": "Thế kỷ thứ 3 trước Tây lịch", "is_answer": true}	{"option": "Cuối thể kỷ thứ 3 trước Tây lịch", "is_answer": false}	{"option": "Giữa thế kỷ thứ 4 trước Tây lịch", "is_answer": false}	{"option": "Tất cả đều sai", "is_answer": false}
86	luc3	Bồ tát Văn Thù hỏi Duy Ma Cật: Chúng tôi mỗi người đã nói rồi, xin Nhân giả cho biết thế nào là Bồ tát vào cửa pháp bất nhị? Duy Ma Cật	Chưa có lời giải thích	{"option": "Trả lời rằng: Đối với hết thảy pháp không nói, không thuyết, không chỉ thị", "is_answer": false}	{"option": "Trả lời rằng: vượt ngoài vấn đáp", "is_answer": false}	{"option": "Im lặng không nói", "is_answer": true}	{"option": "Tất cả đều đúng", "is_answer": false}
87	luc3	Sứ mệnh hoà bình được Phật giáo thể hiện qua	Chưa có lời giải thích	{"option": "Kinh điển", "is_answer": false}	{"option": "Cuộc đời Đức Phật và những vị đệ tử", "is_answer": false}	{"option": "Lịch sử Phật giáo", "is_answer": false}	{"option": "Tất cả đều đúng", "is_answer": false}
88	luc3	Trong Kinh Duy Ma Cật phẩm chúc luỵ, Đức Phật đem pháp giác ngộ vô thượng chính đẳng chính giác đã tập thành trong vô lượng kiếp phó chúc lại cho	Chưa có lời giải thích	{"option": "Ngài Văn Thù Sư Lợi Bồ Tát", "is_answer": false}	{"option": "Ngài Di Lặc Bồ Tát", "is_answer": true}	{"option": "Ngài Duy Ma Cật", "is_answer": false}	{"option": "Ngài Xá Lợi Phất", "is_answer": false}
89	luc3	Sau thời kỳ suy tàn, Phật giáo Mã Lai phục hưng mạnh mẽ vào thời điểm nào	Chưa có lời giải thích	{"option": "Thế kỷ thứ 17", "is_answer": false}	{"option": "Thế kỷ thứ 18", "is_answer": false}	{"option": "Thế kỷ thứ 19", "is_answer": true}	{"option": "Thế kỷ thứ 20", "is_answer": false}
90	luc3	Nguồn gốc bệnh của ngài Duy Ma Cật là	Chưa có lời giải thích	{"option": "Do vô minh và hữu ái", "is_answer": true}	{"option": "Thích được thuyết giảng chánh pháp", "is_answer": false}	{"option": "Mong muốn dẫn dắt quần sanh", "is_answer": false}	{"option": "Hữu ái mà tạo thành nguồn gốc bệnh", "is_answer": false}
91	luc3	Đại hội Huynh trưởng toàn quốc lần thứ 5 được diễn ra vào năm nào, tại đâu	Chưa có lời giải thích	{"option": "Năm 1955 tại Đà Lạt", "is_answer": false}	{"option": "Năm 1961 tại Trường Gia Long", "is_answer": false}	{"option": "Năm 1964 tại Trường Gia Long", "is_answer": true}	{"option": "Năm 1967 tại Bình Định", "is_answer": false}
92	luc3	Lãnh đạo tinh thần của Phật giáo Lào là	Chưa có lời giải thích	{"option": "Quốc sư", "is_answer": true}	{"option": "Tăng trưởng", "is_answer": false}	{"option": "Tăng vương", "is_answer": false}	{"option": "Tăng thống", "is_answer": false}
93	luc3	Sau khi ngài Thiện Hoa viên tịch thì vị nào chính thức kế nhiệm Viện Trưởng Viện Hoá Đạo GHPGVNTN	Chưa có lời giải thích	{"option": "Hoà thượng Thích Thiện Minh", "is_answer": false}	{"option": "Hoà thượng Thích Thiện Hoà", "is_answer": false}	{"option": "Hoà thượng Thích Trí Nghiêm", "is_answer": false}	{"option": "Hoà thượng Thích Trí Thủ", "is_answer": true}
95	luc3	Sau giai đoạn diệt chủng Bôn bốt, Phật giáo Campuchia được khôi phục từ sự giúp sức của	Chưa có lời giải thích	{"option": "Phật giáo Lào", "is_answer": false}	{"option": "Phật giáo Mã Lai", "is_answer": false}	{"option": "Phật giáo Thái Lan", "is_answer": false}	{"option": "Phật giáo Việt Nam", "is_answer": true}
49	luc3	Quy chế Huynh trưởng được thiết lập vào năm	Chưa có lời giải thích	{"option": "1951", "is_answer": false}	{"option": "1955", "is_answer": true}	{"option": "1953", "is_answer": false}	{"option": "1961", "is_answer": false}
35	luc3	Giáo lý căn bản để xây dựng hoà bình là:	Chưa có lời giải thích	{"option": "Năm giới - Năm hạnh - Đức tin", "is_answer": false}	{"option": "Tứ nhiếp pháp - lục hoà - năm giới", "is_answer": false}	{"option": "Tứ nhiếp pháp - tứ vô lượng tâm - Lục độ", "is_answer": false}	{"option": "Ngũ giới - năm hạnh - lục hoà", "is_answer": true}
36	luc3	Quá trình của Bồ đề tâm theo tinh thần của Kinh Thắng Man là:	Chưa có lời giải thích	{"option": "Bồ tát giới là nhân, Bồ tát hạnh là quả", "is_answer": false}	{"option": "Thọ trì bồ tát hạnh là nhân, thực hành bồ tát đạo là quả", "is_answer": false}	{"option": "Phát tâm hộ trì Tam bảo là nhân, thành tựu Bồ tát là quả", "is_answer": false}	{"option": "Bồ đề tâm chính là nhân và nhất thừa là chính quả", "is_answer": false}
37	luc3	Thắng Man chỉ điểm, chỉ có một nơi nương tựa an toàn và cứu cánh đó là:	Chưa có lời giải thích	{"option": "Bồ đề tâm", "is_answer": false}	{"option": "Bồ tát đạo", "is_answer": false}	{"option": "Như Lai", "is_answer": true}	{"option": "Tất cả đều sai", "is_answer": false}
38	luc3	Lục Tổ Huệ Năng dạy: "Trong tâm mình không có quấy, không có ác, không tật đố, không tham sân, không cướp hại thì gọi là ..."	Chưa có lời giải thích	{"option": "Giới hương", "is_answer": true}	{"option": "Tuệ hương", "is_answer": false}	{"option": "Định hương", "is_answer": false}	{"option": "Giải thoát tri kiến hương", "is_answer": false}
39	luc3	Yếu nghĩa của lễ lạy mà Lục Tổ chỉ dạy cho ngài Pháp Đạt là gì?	Chưa có lời giải thích	{"option": "Bày tỏ lòng cung kính", "is_answer": false}	{"option": "Cốt chặt chờ ngã mạn", "is_answer": true}	{"option": "Quay về với bản tâm thanh tịnh", "is_answer": false}	{"option": "Cung kính tam thế Phật", "is_answer": false}
40	luc3	Điền vào cụm từ còn thiếu trong bài kệ sau: "Bồ đề bổn vô thọ. Minh cảnh diệc phi đài. Bản lai vô nhất vật....... "	Chưa có lời giải thích	{"option": "Vật sử hạ trần ai", "is_answer": false}	{"option": "Vật xứ nhạ trần ai", "is_answer": false}	{"option": "Hà sử nhạ trần ai", "is_answer": false}	{"option": "Hà xứ nhạ trần ai", "is_answer": true}
67	luc3	Kinh Duy Ma Cật nói về	Chưa có lời giải thích	{"option": "Lý tưởng cứu độ", "is_answer": false}	{"option": "Con người Duy Ma Cật", "is_answer": false}	{"option": "Vai trò của Bồ tát đạo và những công hạnh của Cư sĩ tại gia", "is_answer": true}	{"option": "Tất cả các ý trên đều sai", "is_answer": false}
68	luc3	"Nguyện sẽ giảng thuyết cho tất cả chúng sanh bằng tâm không mệt mỏi" là đại nguyện thứ mấy của Thắng Man	Chưa có lời giải thích	{"option": "Thứ nhất", "is_answer": false}	{"option": "Thứ hai", "is_answer": true}	{"option": "Thứ ba", "is_answer": false}	{"option": "Thứ tư", "is_answer": false}
69	luc3	Trước khi Đức Phật thuyết Kinh Pháp Hoa, trong chúng hội có bao nhiêu vị Tỳ kheo, Tỳ kheo ni, Cận sự Nam, Cận sự Nữ rời pháp hội	Chưa có lời giải thích	{"option": "50 vị", "is_answer": false}	{"option": "500 vị", "is_answer": false}	{"option": "5000 vị", "is_answer": true}	{"option": "50000 vị", "is_answer": false}
70	luc3	Bản tin Sen trắng GĐPT VN lần đầu tiên ra mắt vào năm	Chưa có lời giải thích	{"option": "Năm 1968", "is_answer": true}	{"option": "Năm 1970", "is_answer": false}	{"option": "Năm 1972", "is_answer": false}	{"option": "Năm 1973", "is_answer": false}
71	luc3	Trong Pháp Hội Thủ Lăng Nghiêm, có bao nhiêu vị đã trình bày Pháp môn tu chứng của mình	Chưa có lời giải thích	{"option": "25 vị", "is_answer": true}	{"option": "26 vị", "is_answer": false}	{"option": "27 vị", "is_answer": false}	{"option": "28 vị", "is_answer": false}
72	luc3	Đức Phật đã chỉ tâm cho ngài A Nan bao nhiêu lần	Chưa có lời giải thích	{"option": "6 lần", "is_answer": false}	{"option": "7 lần", "is_answer": true}	{"option": "8 lần", "is_answer": false}	{"option": "9 lần", "is_answer": false}
73	luc3	Vị Đại Sư nào của Trung Hoa đã xây bái kính đài để đảnh lễ trong 18 năm cầu thỉnh Kinh Thủ Lăng Nghiêm truyền bá đến Trung Hoa	Chưa có lời giải thích	{"option": "Đại sư Trí Giác", "is_answer": false}	{"option": "Đại sư Trí Khải", "is_answer": true}	{"option": "Đại sư Trí Khả", "is_answer": false}	{"option": "Đại sư Trí Kha", "is_answer": false}
41	luc3	Ví dụ "Trưởng giả và gã cùng tử" trong Kinh Pháp Hoa là nội dung	Chưa có lời giải thích	{"option": "Phật thuyết trong phẩm Tín Giải", "is_answer": false}	{"option": "Hàng Thanh văn đệ tử Phật trình bày để chứng minh cho sự tin hiểu của họ đối với Pháp Nhất thừa là cứu cánh, tam thừa là phương tiện", "is_answer": true}	{"option": "Phật khuyến tấn hàng trung căn đệ tử nỗ lực thành tựu nhất thừa Pháp", "is_answer": false}	{"option": "Phật và hàng Thanh văn đệ tử cùng nhau luận bàn", "is_answer": false}
42	luc3	Phẩm Đề Bà Đạt Đa trong kinh Pháp Hoa thể hiện tinh thần	Chưa có lời giải thích	{"option": "Pháp nhất thừa là khế lý", "is_answer": false}	{"option": "Pháp nhất thừa là bình đẳng", "is_answer": true}	{"option": "Pháp nhất thừa là khế cơ", "is_answer": false}	{"option": "Pháp nhất thừa là tuỳ duyên", "is_answer": false}
43	luc3	Đức Phật dạy đời sống của người hoằng truyền Pháp Hoa phải có đầy đủ 4 mặt đó là: Thân hành Pháp Hoa, Khẩu hành Pháp Hoa, Ý hành Pháp Hoa, Nguyện hành Pháp Hoa. Đây là nội dung của Phẩm	Chưa có lời giải thích	{"option": "Trì", "is_answer": false}	{"option": "Tùng địa dũng xuất", "is_answer": false}	{"option": "An lạc hạnh", "is_answer": true}	{"option": "Thường Bất Khinh Bồ Tát", "is_answer": false}
76	luc3	Điền đầy đủ đoạn văn sau: Bất lịch tăng kỳ hoạch Pháp thân. Nguyện kim đắc quả thành bảo vương. …................. Thị tắc danh vi báo Phật ân	Chưa có lời giải thích	{"option": "Hoàn độ như thị hằng sa chúng. Hi cánh thậm trừ vi tế hoặc", "is_answer": false}	{"option": "Linh ngã tảo đăng vô thượng giác. Ư thập phương giới toạ đạo tràng", "is_answer": false}	{"option": "Hoàn độ như thị hằng sa chúng. Tương thử thâm tâm phụng trần sát", "is_answer": true}	{"option": "Thuấn nhã đa tánh khả tiêu vong. Thước ca ra tâm vô động chuyển", "is_answer": false}
44	luc3	Điền đầy đủ nội dung như sau: "GHPGVNTN không đặt sự tồn tại của mình nơi ….. mà đặt sự tồn tại ấy trong sự tồn tại của Nhân loại và Dân tộc".	Chưa có lời giải thích	{"option": "Nguyên vị biệt truyền", "is_answer": false}	{"option": "Nguyên vị chánh pháp", "is_answer": false}	{"option": "Nguyên vị cá biệt", "is_answer": true}	{"option": "Nguyên vị đạo pháp", "is_answer": false}
46	luc3	Huynh trưởng Cấp Dũng Nguyên Tín - Nguyễn Châu chính thức giữ chức vụ Trưởng Ban Hướng Dẫn Trung Ương GĐPT Việt Nam vào năm 	Chưa có lời giải thích	{"option": "1994", "is_answer": false}	{"option": "1998", "is_answer": true}	{"option": "1995", "is_answer": false}	{"option": "2012", "is_answer": false}
47	luc3	"Nghĩ rằng trong sứ mệnh giáo dục thanh thiếu nhi, Huynh trưởng GĐPT tự khoác vào mình tính chất đặc thù mà khả năng và đạo đức không thể tách rời, tri thức và kinh nghiệm phải được thực hiện nương nhau". Câu nói này ghi rõ trong:	Chưa có lời giải thích	{"option": "Quy chế Huynh trưởng", "is_answer": true}	{"option": "Hiến chương của Giáo hội", "is_answer": false}	{"option": "Nội quy GĐPT Việt Nam", "is_answer": false}	{"option": "Bức tâm thư của anh Trưởng Ban Hướng Dẫn Trung Ương", "is_answer": false}
48	luc3	Tổng Vụ Trưởng Tổng Vụ Thanh niên đầu tiên của GHGPVNTN là	Chưa có lời giải thích	{"option": "Hoà thượng Thích Thiện Hoa", "is_answer": false}	{"option": "Hoà thượng Thích Thiện Hoà", "is_answer": false}	{"option": "Hoà thượng Thích Thiện Minh", "is_answer": true}	{"option": "Hoà thượng Thích Thanh Huyền", "is_answer": false}
51	luc3	Phật giáo tại Thái Lan hầu hết là theo truyền thống Phật giáo	Chưa có lời giải thích	{"option": "Nguyên thuỷ", "is_answer": false}	{"option": "Đại thừa", "is_answer": false}	{"option": "Theravada", "is_answer": false}	{"option": "Câu a và c đúng", "is_answer": true}
52	luc3	Phật giáo đã được xem là quốc giáo của đất nước Thái Lan vào thời nào	Chưa có lời giải thích	{"option": "Triều đại Sukhothai (1237-1456)", "is_answer": true}	{"option": "Triều đại Ayudhya (1350-1766)", "is_answer": false}	{"option": "Triều đại Bangkok (1782-nay)", "is_answer": false}	{"option": "Tất cả đều sai", "is_answer": false}
53	luc3	Phật giáo được truyền vào Mã Lai khi nào	Chưa có lời giải thích	{"option": "Thế kỷ thứ 1 trước Tây lịch", "is_answer": false}	{"option": "Thế kỷ thứ 2 trước Tây lịch", "is_answer": false}	{"option": "Thế kỷ thứ 3 trước Tây lịch", "is_answer": false}	{"option": "Thế kỷ thứ 4 trước Tây lịch", "is_answer": true}
54	luc3	Phật giáo ở Campuchia có hai tông phái chính	Chưa có lời giải thích	{"option": "Đại tông phái và Pháp tông phái", "is_answer": true}	{"option": "Đại tông phái và Mật tông phái", "is_answer": false}	{"option": "Nhật liên tông và Thiên thai tông", "is_answer": false}	{"option": "Cả ba đều sai", "is_answer": false}
55	luc3	Phật giáo Campuchia và Lào có điểm chung nổi bật nhất là	Chưa có lời giải thích	{"option": "Phật giáo đều được xem là quốc giáo", "is_answer": false}	{"option": "Đều chịu ảnh hưởng của Phật giáo Tích Lan", "is_answer": false}	{"option": "Cả hai đều đúng", "is_answer": true}	{"option": "Cả hai đều sai", "is_answer": false}
56	luc3	Trong bảy lần Phật hỏi về Tâm, đến lần thứ 7, A Nan chấp tâm ở đâu	Phật học phổ thông Thích Thiện Hoa	{"option": "Chấp tâm trong thân", "is_answer": false}	{"option": "Chấp tâm ở chính giữa", "is_answer": false}	{"option": "Chấp tâm tuỳ chỗ hoà hiệp mà có", "is_answer": false}	{"option": "Chấp cái không trước làm tâm ", "is_answer": true}
57	luc3	Để chứng nghiệm tánh nghe thường còn, Đức Phật đã	Chưa có lời giải thích	{"option": "Dùng cây đàn Tỳ bà để ví dụ", "is_answer": false}	{"option": "Sai tôn giả La Hầu La đánh một tiếng chuông", "is_answer": true}	{"option": "Dùng 3 ví dụ để A Nan chứng nghiệm", "is_answer": false}	{"option": "Tất cả đều sai", "is_answer": false}
58	luc3	Thủ lăng nghiêm tàu dịch là	Chưa có lời giải thích	{"option": "Đại định kiên cố", "is_answer": true}	{"option": "Như Lai mật nhơn", "is_answer": false}	{"option": "Như như bất động", "is_answer": false}	{"option": "Bất sanh bất diệt", "is_answer": false}
59	luc3	Tôn giả A Nan đã phát lời nguyện rộng lớn khi	Chưa có lời giải thích	{"option": "Về gặp Đức Thế Tôn trong Pháp hội Thủ Lăng Nghiêm", "is_answer": false}	{"option": "Sau khi ngộ được chơn tâm", "is_answer": true}	{"option": "Sau khi được Bồ tát Văn thù giải cứu", "is_answer": false}	{"option": "Sau khi được Phật chỉ cho pháp tu viên thông", "is_answer": false}
61	luc3	Qua pháp môn tu chứng của Chư vị Bồ tát, Thánh tăng trình bày thì Bồ tát Văn Thù tuyên dương pháp môn nào đệ nhất.	Chưa có lời giải thích	{"option": "Do nhĩ thức mà chứng Bồ tát", "is_answer": false}	{"option": "Do nhãn thức mà chứng Bồ tát", "is_answer": false}	{"option": "Do thiệt thức mà chứng đắc", "is_answer": false}	{"option": "Nhĩ căn viên thông", "is_answer": true}
62	luc3	Duy Ma Cật mở ra con đường thực tiễn hành động, con đường đó được gọi là	Chưa có lời giải thích	{"option": "Trực tâm thị đạo tràng", "is_answer": false}	{"option": "Tịnh Phật quốc độ", "is_answer": false}	{"option": "Bất tư nghị giải thoát", "is_answer": true}	{"option": "Thành tựu chúng sanh", "is_answer": false}
63	luc3	Duy Ma Cật	Chưa có lời giải thích	{"option": "Có nghĩa là Vô Cấu Xưng", "is_answer": false}	{"option": "Hay còn gọi là Tịnh Danh", "is_answer": false}	{"option": "Là một trong 500 đồng tử từ nước Diệu Hỷ du hành đến cõi này", "is_answer": false}	{"option": "Tất cả đều đúng", "is_answer": true}
64	luc3	Pháp vô tận đăng được ngài Duy Ma Cật hướng dẫn trong Phẩm và Phần nào	Chưa có lời giải thích	{"option": "Phẩm Bồ tát, Phần Ngài Trì Địa", "is_answer": false}	{"option": "Phẩm đệ tử, phần Ngài Trì Thế", "is_answer": false}	{"option": "Phẩm Bồ tát, phần Ngài Trì Thế", "is_answer": true}	{"option": "Phẩm đệ tử, phần Ngài Trì Địa", "is_answer": false}
65	luc3	"Tâm thuần nhất, không tà vạy, là căn bản của Vạn Hạnh" chỉ cho	Chưa có lời giải thích	{"option": "Trực tâm", "is_answer": true}	{"option": "Bồ đề tâm", "is_answer": false}	{"option": "Thâm tâm", "is_answer": false}	{"option": "Tất cả đều đúng", "is_answer": false}
66	luc3	Căn bản của Tịnh độ Bồ tát là	Chưa có lời giải thích	{"option": "Tây phương cực lạc", "is_answer": false}	{"option": "Bất sinh bất diệt", "is_answer": false}	{"option": "Vô cấu, vô nhiễm", "is_answer": false}	{"option": "Quốc độ chúng sinh", "is_answer": true}
74	luc3	Nguyên nhân mà ngài Duy Ma Cật bệnh	Chưa có lời giải thích	{"option": "Do quy luật tất yếu của vô thường", "is_answer": false}	{"option": "Vì chúng sanh bệnh nên ngài bệnh", "is_answer": true}	{"option": "Bệnh để mọi người đến thăm", "is_answer": false}	{"option": "Bệnh để Phật thương tưởng", "is_answer": false}
75	luc3	Tại Việt Nam, tác phẩm Kinh Thủ Lăng Nghiêm giảng giải nổi tiếng là của tác giả	Chưa có lời giải thích	{"option": "Chánh Trí - Mai Thọ Truyền", "is_answer": false}	{"option": "Thiều Chửu - Nguyễn Hữu Kha", "is_answer": false}	{"option": "Tâm Minh - Lê Đình Thám", "is_answer": true}	{"option": "Đoàn Trung Còn", "is_answer": false}
77	luc3	Ngài Duy Ma Cật dạy thiền cho vị Thánh tăng nào trong hàng đệ tử Phật 	Chưa có lời giải thích	{"option": "Ngài Ma Ha Ca Diếp", "is_answer": false}	{"option": "Ngài Xá Lợi Phất", "is_answer": true}	{"option": "Ngài Mục Kiền Liên", "is_answer": false}	{"option": "Ngài Tu Bồ Đề", "is_answer": false}
78	luc3	Phẩm thứ 11 của Kinh Duy Ma Cật nói về Phẩm Hạnh Bồ Tát, các vị Bồ tát của cõi Chúng Hương thỉnh Phật một lời dạy trước khi về bổn độ, và Đức Phật đã dạy về	Chưa có lời giải thích	{"option": "Thành tự chúng sanh", "is_answer": false}	{"option": "Bất nhị pháp môn", "is_answer": false}	{"option": "Bất tư nghì giải thoát", "is_answer": false}	{"option": "Hữu tận vô tận giải thoát", "is_answer": true}
79	luc3	Yếu tố đặc biệt của bộ kinh Thắng Man so với các bộ kinh khác là	Chưa có lời giải thích	{"option": "Nhiếp chúng sanh giới", "is_answer": false}	{"option": "Tam tu tịnh giới", "is_answer": false}	{"option": "Nhiêu ích hữu tình giớilưu", "is_answer": false}	{"option": "Nhiếp thọ chánh pháp", "is_answer": false}
80	luc3	Phẩm chúc luỵ thứ 22, Đức Phật ân cần phó chúc việc lưu bố Kinh Pháp Hoa này cho ai	Chưa có lời giải thích	{"option": "Ngài Văn Thù Sư Lợi", "is_answer": false}	{"option": "Ngài Di Lặc", "is_answer": false}	{"option": "Ngài Phổ Hiền Vương", "is_answer": false}	{"option": "Tất cả điều sai", "is_answer": true}
81	luc3	Kinh Duy Ma Cật đã nêu lên 5 giai đoạn tu tập của một hành giả là	Chưa có lời giải thích	{"option": "Phước, Trí, Quy, Hành, Cứu Cánh", "is_answer": false}	{"option": "Phước, Trí, Hành, Nguyện, Cứu Cánh", "is_answer": true}	{"option": "Phước, Trí, Quy, Nguyện, Cứu Cánh", "is_answer": false}	{"option": "Phước, Giới, Hành, Nguyện, Cứu Cánh", "is_answer": false}
82	luc3	Để thực hiện được sứ mệnh hoà bình của Phật giáo thì mỗi Phật tử cần phải lấy yếu tố nào làm nền tảng cho sự tu tập	Chưa có lời giải thích	{"option": "Lục hoà", "is_answer": false}	{"option": "Năm hạnh", "is_answer": false}	{"option": "Ngũ giới", "is_answer": true}	{"option": "Tứ nhiếp pháp", "is_answer": false}
60	luc3	Kinh Duy Ma Cật bao gồm bao nhiêu phẩm	Chưa có lời giải thích	{"option": "11 phẩm", "is_answer": false}	{"option": "12 phẩm", "is_answer": false}	{"option": "13 phẩm", "is_answer": false}	{"option": "14 phẩm", "is_answer": true}
\.


--
-- Data for Name: resets; Type: TABLE DATA; Schema: public; Owner: huyanh
--

COPY public.resets (user_id, code, created_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: huyanh
--

COPY public.schema_migrations (version, dirty) FROM stdin;
6	f
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: huyanh
--

COPY public.users (id, email, pass, salt, status, verification, created_at, updated_at) FROM stdin;
1	thi@gmail.com	$2a$14$59R6km0F2.orcHZqTmVsNudhJEp7KvqXm6lPIxOWv1JKlpI3zr6MW	aNRpuaXJFHiUZqRfJblqAbFepczUGlXT	active	stMVJzzSWicZYSUoBjTQhYUTKYalPpnZ	2024-05-10 12:26:57.12357	2024-05-10 12:27:09.688029
\.


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huyanh
--

SELECT pg_catalog.setval('public.posts_id_seq', 2, true);


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huyanh
--

SELECT pg_catalog.setval('public.questions_id_seq', 101, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huyanh
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: bac_hoc bac_hoc_pkey; Type: CONSTRAINT; Schema: public; Owner: huyanh
--

ALTER TABLE ONLY public.bac_hoc
    ADD CONSTRAINT bac_hoc_pkey PRIMARY KEY (id);


--
-- Name: bac_hoc categories_name_key; Type: CONSTRAINT; Schema: public; Owner: huyanh
--

ALTER TABLE ONLY public.bac_hoc
    ADD CONSTRAINT categories_name_key UNIQUE (name);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: huyanh
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: huyanh
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: resets resets_pkey; Type: CONSTRAINT; Schema: public; Owner: huyanh
--

ALTER TABLE ONLY public.resets
    ADD CONSTRAINT resets_pkey PRIMARY KEY (code, user_id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: huyanh
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: bac_hoc unique_categories_text; Type: CONSTRAINT; Schema: public; Owner: huyanh
--

ALTER TABLE ONLY public.bac_hoc
    ADD CONSTRAINT unique_categories_text UNIQUE (name);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: huyanh
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: huyanh
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: questions fk_bac_hoc_id; Type: FK CONSTRAINT; Schema: public; Owner: huyanh
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT fk_bac_hoc_id FOREIGN KEY (bac_hoc_id) REFERENCES public.bac_hoc(id);


--
-- Name: posts posts_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: huyanh
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.users(id) ON DELETE RESTRICT;


--
-- Name: resets resets_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: huyanh
--

ALTER TABLE ONLY public.resets
    ADD CONSTRAINT resets_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

