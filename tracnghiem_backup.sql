--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Ubuntu 16.2-2.pgdg24.04+1)
-- Dumped by pg_dump version 16.2 (Ubuntu 16.2-2.pgdg24.04+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: huyanh
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.categories OWNER TO huyanh;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: huyanh
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO huyanh;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: huyanh
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: options; Type: TABLE; Schema: public; Owner: huyanh
--

CREATE TABLE public.options (
    id integer NOT NULL,
    text text NOT NULL,
    is_answer boolean DEFAULT false
);


ALTER TABLE public.options OWNER TO huyanh;

--
-- Name: options_id_seq; Type: SEQUENCE; Schema: public; Owner: huyanh
--

CREATE SEQUENCE public.options_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.options_id_seq OWNER TO huyanh;

--
-- Name: options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: huyanh
--

ALTER SEQUENCE public.options_id_seq OWNED BY public.options.id;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: huyanh
--

CREATE TABLE public.questions (
    id integer NOT NULL,
    categoryid integer NOT NULL,
    text text NOT NULL,
    option1id integer NOT NULL,
    option2id integer NOT NULL,
    option3id integer NOT NULL,
    option4id integer NOT NULL,
    explanation text
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
-- Name: users; Type: TABLE; Schema: public; Owner: huyanh
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    password text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.users OWNER TO huyanh;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: huyanh
--

CREATE SEQUENCE public.users_id_seq
    AS integer
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
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: huyanh
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: options id; Type: DEFAULT; Schema: public; Owner: huyanh
--

ALTER TABLE ONLY public.options ALTER COLUMN id SET DEFAULT nextval('public.options_id_seq'::regclass);


--
-- Name: questions id; Type: DEFAULT; Schema: public; Owner: huyanh
--

ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: huyanh
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: huyanh
--

COPY public.categories (id, name) FROM stdin;
1	bacluc3
\.


--
-- Data for Name: options; Type: TABLE DATA; Schema: public; Owner: huyanh
--

COPY public.options (id, text, is_answer) FROM stdin;
5	Là phạm vi mà trong đó giáo pháp của Phật được lưu truyền	f
6	Đó là môi trường chịu ảnh hưởng giáo hoá của một đức Phật nhất định trong một thời gian nhất định	f
7	Đó là thế giới của Phật 	f
8	Tất cả đều đúng	t
9	Bệnh của Bồ tát từ phiền não, tham ái làm gốc phát sinh	f
10	Bệnh của Bồ tát xuất phát từ tuệ giác phát sinh 	f
11	Bệnh của Bồ tát xuất phát từ tâm đại bi	t
12	Bệnh của Bồ tát từ nghiệp thức luân hồi phát sinh	f
13	Tịnh độ Bồ tát	f
14	Tịnh độ Tây phương	f
15	Tịnh độ cứu cánh	f
16	Tịnh độ tha lực 	t
17	Vì tôn giả không hiểu lời Phật dạy	f
18	Vì tôn giả thiếu công phu tu tập	f
19	Vì tôn giả chấp vọng tưởng làm tâm	t
20	Vì tôn giả thiếu sáng suốt 	f
21	Diệt trừ phiền não nhiễm ô	f
22	Nhận thức thể tính của tham, sân, si	f
23	Tịnh Phật quốc độ và thành tự chúng sanh	t
24	Thành tựu giới thể thanh tịnh	f
25	2 loại: hữu vi Tịnh độ và vô vi Tịnh độ	f
26	2 loại: Duy tâm Tịnh độ và Tây phương cực lạc Tịnh độ	f
27	2 loại: Tịnh độ tha lực và Tịnh độ Bồ tát	t
28	2 loại: Chân tâm Tịnh độ và Thắng xứ Tịnh độ	f
29	Bất tư nghị giải thoát	f
30	Tịnh Phật quốc độ, thành tựu chúng sanh	f
31	Nhập bất nhị pháp môn	t
32	Bất tư nghì giải thoát	f
33	Bất tư nghị giải thoát	f
34	Tịnh Phật quốc độ, thành tựu chúng sanh	t
35	Nhập bất nhị pháp môn	f
36	Bất tư nghì giải thoát	f
37	Bất tư nghị giải thoát	t
38	Tịnh Danh cư sĩ tôn kinh	f
39	Bất tư nghì giải thoát	f
40	Nhập bát nhị pháp môn	f
41	Đại từ bi - Đại thệ nguyện	f
42	Đại trí - Đại bi	t
43	Cứu cánh - Giải thoát	f
44	Giới - Luật	f
45	09 vị	f
46	18 vị	f
47	10 vị	t
48	19 vị	f
1	Đại bi 	f
2	Đại hạnh	f
3	Đại nguyện	f
4	Đại trí	t
49	Chẳng cần gia nhân hầu hạ vì tự tánh vốn bình đẳng	f
50	Hết thảy thân quyến và pháp giới chúng sanh đều là gia nhân của ta	f
51	Bọn Ma và Ngoại đạo là gia nhân 	t
52	Tất cả đều sai	f
53	Trí	f
54	Nguyện	f
55	Hành	f
56	Cứu cánh	t
57	Nhận thức về lý tính duyên khởi	t
58	Tình thương chúng sanh vô biên	f
59	Phiền não chúng sanh nhiều vô lượng	f
60	Trí tuệ và Từ bi luôn song hành	f
61	Chư Bồ tát Vạn hạnh	f
62	Như Lai mật nhơn	t
63	Tu chứng liễu nghĩa	f
64	Đại định kiên cố	f
65	Vị thị giả của Phật	f
66	Chỉ cho chúng sanh mê mờ	t
67	Người bị Ma Đăng Già dụ dỗ	f
68	Tất cả đều sai	f
69	Chẳng công phu tu tập	f
70	Chạy theo tà kiến	f
71	Thiếu thiền định	f
72	Vì vọng nổi lên	t
73	Có 24 vị	f
74	Có 26 vị	f
75	Có 25 vị	t
76	Có 27 vị	f
77	25 ứng thân	f
78	80 ứng thân	f
79	32 ứng thân	t
80	81 ứng thân	f
81	Nhĩ căn viên thông	f
82	37 phẩm trợ đạo	f
83	Tam vô lậu học	t
84	Đốn ngộ - tiệm tu	f
85	Nhiếp luật nghi giới - Nhiếp thiện pháp giới - Nhiếp chúng sanh giới	f
86	Bố thí- ái ngữ - lợi hành - đồng sự	f
87	Từ - Bi - Hỷ - Xả	f
88	Dâm - Sát - Đạo - Vọng	f
89	45 địa vị	f
90	55 địa vị	t
91	65 địa vị	f
92	75 địa vị	f
93	Huyền Trang	f
94	Trí Giả	f
95	Trí Khải	f
96	Bát Lặc Mật Đế 	t
97	Tối thượng của Thủ Lăng Nghiêm	t
98	Vĩ đại của Thủ Lăng Nghiêm	f
99	Đại Định thượng thủ	f
100	Chân tâm thượng thủ	f
101	Nói về Duy Ma Cật	f
102	Nói về "Tịnh Phật quốc độ, thành tựu chúng sanh"	t
103	Nói về giá trị siêu việt của cuộc sống	f
104	Nói về vị ngọt của chánh pháp	f
105	Bất nhị pháp môn	f
106	Bất tư nghì giải thoát	f
107	Tịnh Phật quốc độ	f
108	Cả 3 câu trên đều đúng	t
109	Tây phương Cực lạc	f
110	Vô cấu, vô nhiễm	f
111	Bất sinh bất diệt	f
112	Quốc độ chúng sinh	t
113	Siêng năng trì chú	f
114	Ngộ được chơn tâm	t
115	Năng tụng kinh trì chú mỗi buổi sáng	f
116	Cả 3 ý trên	f
117	Cái "suy nghĩ phân biệt"	f
118	Cái do "nhân duyên sanh"	f
119	Cái "tự nhiên mà có"	f
120	Cái "thấy"(nghe, hay, biết) thanh tịnh, sáng suốt, thường còn	t
121	Ngũ trược ác thế thệ tiên nhập	f
122	Thuấn nhã đa tánh khả tiêu vong. Thước ca ra tâm vô động chuyển.	t
123	Như nhất chúng sanh vị thành phật, chung bất ư thử thủ nê hoàn	f
124	Câu a,c đúng.	f
125	Kinh điển	f
126	Cuộc đời Đức Phật và những vị đệ tử	f
127	Lịch sử Phật giáo	f
128	Tất cả đều đúng	t
129	Đấu tranh trong tinh thần bất bạo động	t
130	Im lặng để mọi việc tuỳ duyên	f
131	Quán tất cả đều do nhân quả nên không cần phải quan tâm	f
132	Tất cả các ý trên đều sai	f
133	Ngày 20/09 dương lịch	f
134	Ngày 22/09 dương lịch	t
135	Ngày 21/09 dương lịch	f
136	Ngày 23/09 dương lịch	f
137	Năm giới - Năm hạnh - Đức tin	f
138	Tứ nhiếp pháp - lục hoà - năm giới	f
139	Tứ nhiếp pháp - tứ vô lượng tâm - Lục độ	f
140	Ngũ giới - năm hạnh - lục hoà	t
141	Bồ tát giới là nhân, Bồ tát hạnh là quả	f
142	Thọ trì bồ tát hạnh là nhân, thực hành bồ tát đạo là quả	f
143	Phát tâm hộ trì Tam bảo là nhân, thành tựu Bồ tát là quả	f
144	Bồ đề tâm chính là nhân và nhất thừa là chính quả	f
145	Bồ đề tâm	f
146	Bồ tát đạo	f
147	Như Lai	t
148	Tất cả đều sai	f
149	Giới hương	t
150	Tuệ hương	f
151	Định hương	f
152	Giải thoát tri kiến hương	f
153	Bày tỏ lòng cung kính	f
154	Cốt chặt chờ ngã mạn	t
155	Quay về với bản tâm thanh tịnh	f
156	Cung kính tam thế Phật	f
157	Vật sử hạ trần ai	f
158	Vật xứ nhạ trần ai	f
159	Hà sử nhạ trần ai	f
160	Hà xứ nhạ trần ai	t
161	Phật thuyết trong phẩm Tín Giải	f
162	Hàng Thanh văn đệ tử Phật trình bày để chứng minh cho sự tin hiểu của họ đối với Pháp Nhất thừa là cứu cánh, tam thừa là phương tiện	t
163	Phật khuyến tấn hàng trung căn đệ tử nỗ lực thành tựu nhất thừa Pháp	f
164	Phật và hàng Thanh văn đệ tử cùng nhau luận bàn	f
165	Pháp nhất thừa là khế lý	f
166	Pháp nhất thừa là bình đẳng	t
167	Pháp nhất thừa là khế cơ	f
168	Pháp nhất thừa là tuỳ duyên	f
169	Trì	f
170	Tùng địa dũng xuất	f
171	An lạc hạnh	t
172	Thường Bất Khinh Bồ Tát	f
217	Phật giáo đều được xem là quốc giáo	f
218	Đều chịu ảnh hưởng của Phật giáo Tích Lan	f
219	Cả hai đều đúng	t
220	Cả hai đều sai	f
173	Nguyên vị biệt truyền	f
174	Nguyên vị chánh pháp	f
175	Nguyên vị cá biệt	t
176	Nguyên vị đạo pháp	f
177	Hội Đồng Tăng Già Chứng Minh - Hội Đồng trị sự	f
178	Hội Đồng Chứng Minh - Hội Đồng Điều Hành	f
179	Hồi Đồng Giáo Phẩm - Hội Đồng Trị Sự	f
180	Hội Đồng Chứng Minh - Hội Đồng Trị Sự	t
181	1994	f
182	1998	t
183	1995	f
184	2012	f
185	Quy chế Huynh trưởng	t
186	Hiến chương của Giáo hội	f
187	Nội quy GĐPT Việt Nam	f
188	Bức tâm thư của anh Trưởng Ban Hướng Dẫn Trung Ương	f
189	Hoà thượng Thích Thiện Hoa	f
190	Hoà thượng Thích Thiện Hoà	f
191	Hoà thượng Thích Thiện Minh	t
192	Hoà thượng Thích Thanh Huyền	f
193	1951	f
194	1955	t
195	1953	f
196	1961	f
197	Hoạt động	f
198	Hội nhập	f
199	Huân tập	t
200	Tấn tu	f
201	Nguyên thuỷ	f
202	Đại thừa	f
203	Theravada	f
204	Câu a và c đúng	t
205	Triều đại Sukhothai (1237-1456)	t
206	Triều đại Ayudhya (1350-1766)	f
207	Triều đại Bangkok (1782-nay)	f
208	Tất cả đều sai	f
209	Thế kỷ thứ 1 trước Tây lịch	f
210	Thế kỷ thứ 2 trước Tây lịch	f
211	Thế kỷ thứ 3 trước Tây lịch	f
212	Thế kỷ thứ 4 trước Tây lịch	t
213	Đại tông phái và Pháp tông phái	t
214	Đại tông phái và Mật tông phái	f
215	Nhật liên tông và Thiên thai tông	f
216	Cả ba đều sai	f
221	Chấp tâm trong thân	f
222	Chấp tâm ở chính giữa	f
223	Chấp tâm tuỳ chỗ hoà hiệp mà có	f
224	Chấp cái không trước làm tâm 	t
225	Dùng cây đàn Tỳ bà để ví dụ	f
226	Sai tôn giả La Hầu La đánh một tiếng chuông	t
227	Dùng 3 ví dụ để A Nan chứng nghiệm	f
228	Tất cả đều sai	f
229	Đại định kiên cố	t
230	Như Lai mật nhơn	f
231	Như như bất động	f
232	Bất sanh bất diệt	f
233	Về gặp Đức Thế Tôn trong Pháp hội Thủ Lăng Nghiêm	f
234	Sau khi ngộ được chơn tâm	t
235	Sau khi được Bồ tát Văn thù giải cứu	f
236	Sau khi được Phật chỉ cho pháp tu viên thông	f
237	11 phẩm	f
238	12 phẩm	f
239	13 phẩm	f
240	14 phẩm	t
241	Do nhĩ thức mà chứng Bồ tát	f
242	Do nhãn thức mà chứng Bồ tát	f
243	Do thiệt thức mà chứng đắc	f
244	Nhĩ căn viên thông	t
245	Trực tâm thị đạo tràng	f
246	Tịnh Phật quốc độ	f
247	Bất tư nghị giải thoát	t
248	Thành tựu chúng sanh	f
249	Có nghĩa là Vô Cấu Xưng	f
250	Hay còn gọi là Tịnh Danh	f
251	Là một trong 500 đồng tử từ nước Diệu Hỷ du hành đến cõi này	f
252	Tất cả đều đúng	t
253	Phẩm Bồ tát, Phần Ngài Trì Địa	f
254	Phẩm đệ tử, phần Ngài Trì Thế	f
255	Phẩm Bồ tát, phần Ngài Trì Thế	t
256	Phẩm đệ tử, phần Ngài Trì Địa	f
257	Trực tâm	t
258	Bồ đề tâm	f
259	Thâm tâm	f
260	Tất cả đều đúng	f
261	Tây phương cực lạc	f
262	Bất sinh bất diệt	f
263	Vô cấu, vô nhiễm	f
264	Quốc độ chúng sinh	t
265	Lý tưởng cứu độ	f
266	Con người Duy Ma Cật	f
267	Vai trò của Bồ tát đạo và những công hạnh của Cư sĩ tại gia	t
268	Tất cả các ý trên đều sai	f
269	Thứ nhất	f
270	Thứ hai	t
271	Thứ ba	f
272	Thứ tư	f
273	50 vị	f
274	500 vị	f
275	5000 vị	t
276	50000 vị	f
277	Năm 1968	t
278	Năm 1970	f
279	Năm 1972	f
280	Năm 1973	f
281	25 vị	t
282	26 vị	f
283	27 vị	f
284	28 vị	f
285	6 lần	f
286	7 lần	t
287	8 lần	f
288	9 lần	f
289	Đại sư Trí Giác	f
290	Đại sư Trí Khải	t
291	Đại sư Trí Khả	f
292	Đại sư Trí Kha	f
293	Do quy luật tất yếu của vô thường	f
294	Vì chúng sanh bệnh nên ngài bệnh	t
295	Bệnh để mọi người đến thăm	f
296	Bệnh để Phật thương tưởng	f
297	Chánh Trí - Mai Thọ Truyền	f
298	Thiều Chửu - Nguyễn Hữu Kha	f
299	Tâm Minh - Lê Đình Thám	t
300	Đoàn Trung Còn	f
301	Hoàn độ như thị hằng sa chúng. Hi cánh thậm trừ vi tế hoặc	f
302	Linh ngã tảo đăng vô thượng giác. Ư thập phương giới toạ đạo tràng	f
303	Hoàn độ như thị hằng sa chúng. Tương thử thâm tâm phụng trần sát	t
304	Thuấn nhã đa tánh khả tiêu vong. Thước ca ra tâm vô động chuyển	f
305	Ngài Ma Ha Ca Diếp	f
306	Ngài Xá Lợi Phất	t
307	Ngài Mục Kiền Liên	f
308	Ngài Tu Bồ Đề	f
309	Thành tự chúng sanh	f
310	Bất nhị pháp môn	f
311	Bất tư nghì giải thoát	f
312	Hữu tận vô tận giải thoát	t
313	Nhiếp chúng sanh giới	f
314	Tam tu tịnh giới	f
315	Nhiêu ích hữu tình giớilưu	f
316	Nhiếp thọ chánh pháp	f
317	Ngài Văn Thù Sư Lợi	f
318	Ngài Di Lặc	f
319	Ngài Phổ Hiền Vương	f
320	Tất cả điều sai	t
321	Phước, Trí, Quy, Hành, Cứu Cánh	f
322	Phước, Trí, Hành, Nguyện, Cứu Cánh	t
323	Phước, Trí, Quy, Nguyện, Cứu Cánh	f
324	Phước, Giới, Hành, Nguyện, Cứu Cánh	f
325	Lục hoà	f
326	Năm hạnh	f
327	Ngũ giới	t
328	Tứ nhiếp pháp	f
329	Phẩm thứ 9	f
330	Phẩm thứ 10	t
331	Phẩm thứ 11	f
332	Phẩm thứ 12	f
333	Thế kỷ thứ 3 trước Tây lịch	t
334	Cuối thể kỷ thứ 3 trước Tây lịch	f
335	Giữa thế kỷ thứ 4 trước Tây lịch	f
336	Tất cả đều sai	f
337	Pháp tướng tông và Tịnh độ tông	f
338	Đại tông và Thành tông	f
339	Nam tông và Bắc tông	f
340	Đại tông và Pháp tông	t
341	Trả lời rằng: Đối với hết thảy pháp không nói, không thuyết, không chỉ thị	f
342	Trả lời rằng: vượt ngoài vấn đáp	f
343	Im lặng không nói	t
344	Tất cả đều đúng	f
345	Kinh điển	f
346	Cuộc đời Đức Phật và những vị đệ tử	f
347	Lịch sử Phật giáo	f
348	Tất cả đều đúng	f
349	Ngài Văn Thù Sư Lợi Bồ Tát	f
350	Ngài Di Lặc Bồ Tát	t
351	Ngài Duy Ma Cật	f
352	Ngài Xá Lợi Phất	f
353	Thế kỷ thứ 17	f
354	Thế kỷ thứ 18	f
355	Thế kỷ thứ 19	t
356	Thế kỷ thứ 20	f
357	Do vô minh và hữu ái	t
358	Thích được thuyết giảng chánh pháp	f
359	Mong muốn dẫn dắt quần sanh	f
360	Hữu ái mà tạo thành nguồn gốc bệnh	f
361	Năm 1955 tại Đà Lạt	f
362	Năm 1961 tại Trường Gia Long	f
363	Năm 1964 tại Trường Gia Long	t
364	Năm 1967 tại Bình Định	f
365	Quốc sư	t
366	Tăng trưởng	f
367	Tăng vương	f
368	Tăng thống	f
369	Hoà thượng Thích Thiện Minh	f
370	Hoà thượng Thích Thiện Hoà	f
371	Hoà thượng Thích Trí Nghiêm	f
372	Hoà thượng Thích Trí Thủ	t
373	Tu viện Nguyên Thiều, Tỉnh Bình Định	t
374	Chùa Giác Hoa , TPHCM	f
375	Tu viện Quảng Hương Già Lam, TPHCM	f
376	Thanh Minh Thiền Viện, TPHCM	f
377	Phật giáo Lào	f
378	Phật giáo Mã Lai	f
379	Phật giáo Thái Lan	f
380	Phật giáo Việt Nam	t
381	Hoà bình phải có từ trong ý thức, từ trong tâm niệm của mỗi người	f
382	Hoà bình là mọi người dân được no đủ, bình yên	f
383	Tâm bình, thế giới bình	f
384	Câu a,c đúng	t
385	Sự hận thù	f
386	Tham, sân, si	t
387	Nghèo đói	f
388	Tranh chấp giữa các quốc gia	f
389	Như Lai Tạng	t
390	Đại thừa	f
391	Nhất thừa	f
392	Bồ đề tâm	f
393	Năm 2012 tại Tu viện Quảng Hương Già Lam	f
394	Năm 2012 tại Chùa Pháp Vân	f
395	Năm 2012 tại Tu Viện Quảng Đức	t
396	Năm 2013 tại Tu Viện Quảng Đức	f
397	Vật sử hạ trần ai	f
398	Hà sử nhạ trần ai	f
399	Vật xứ nhạ trần ai	f
400	Hà xứ nhạ trần ai	t
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: huyanh
--

COPY public.questions (id, categoryid, text, option1id, option2id, option3id, option4id, explanation) FROM stdin;
20	1	Bồ tát Quán thế âm đã hiện ra bao nhiêu ứng thân để hoá độ chúng sanh?	77	78	79	80	Chưa có lời giải thích
21	1	Trong Kinh Thủ Lăng Nghiêm, phương pháp tu hành mà Đức Phật dạy cho Tôn giả A Nan để độ chúng sanh đời sau đó là:	81	82	83	84	Chưa có lời giải thích
22	1	Trong Kinh Thủ Lăng Nghiêm có nói về Đại Thừa Tâm Giới bao gồm:	85	86	87	88	Chưa có lời giải thích
23	1	Qua Kinh Thủ Lăng Nghiêm, Phật dạy hành giả tu tập phải trải qua bao nhiêu địa vị mới đến quả Phật?	89	90	91	92	Chưa có lời giải thích
24	1	Hán bản Kinh Thủ Lăng Nghiêm do ai dịch?	93	94	95	96	Chưa có lời giải thích
25	1	Lấy Phật đảnh dụ cho Thủ Lăng Nghiêm là để chỉ tính chất:	97	98	99	100	Chưa có lời giải thích
26	1	Nội dung chính của Kinh Duy Ma Cật nhằm:	101	102	103	104	Chưa có lời giải thích
27	1	Kinh Duy Ma Cật sở thuyết đặt trên cơ sở tư tưởng nào?	105	106	107	108	Chưa có lời giải thích
1	1	Đức Phật chỉ dạy trong Kinh Duy Ma Cật, Bồ tát hành đạo để tịnh Phật quốc độ vì biết rằng tất cả các pháp bản lai thanh tịnh. Đó là:	1	2	3	4	Chưa có lời giải thích
2	1	Theo tinh thần Kinh Duy Ma Cật, Phật quốc ở đây được hiểu như thế nào?	5	6	7	8	Chưa có lời giải thích
3	1	Theo Kinh Duy Ma Cật, bệnh của Bồ tát từ đâu mà phát sinh?	9	10	11	12	Chưa có lời giải thích can tra sach
4	1	Nhắm mục đích thoát khỏi thế giới Ta Bà được coi là uế trược này để sinh về một thế giới tốt đẹp hơn, đó chính là:	13	14	15	16	Chưa có lời giải thích
5	1	Vì sao tôn giả A Nan đã bảy lần chỉ tâm không trúng?	17	18	19	20	Chưa có lời giải thích
6	1	Giữa dòng đời ô nhiễm mà không hề bị nhiễm ô, vì bản chất tồn tại là vô nhiễm. Cho nên hành đạo và giải thoát của Duy Ma Cật nhắm đến cứu cánh hiện thực và cứu cánh được thể hiện:	21	22	23	24	Chưa có lời giải thích
7	1	Có bao nhiêu loại Tịnh độ được để cập trong Kinh Duy Ma Cật?	25	26	27	28	Chưa có lời giải thích
8	1	Tông thể của Kinh Duy Ma Cật là gì?	29	30	31	32	Chưa có lời giải thích
9	1	Tông dụng của Kinh Duy Ma Cật là:	33	34	35	36	Chưa có lời giải thích
10	1	Tên gọi khác của Kinh Duy Ma Cật sở thuyết cũng chính là tông chỉ của Kinh?	37	38	39	40	Chưa có lời giải thích
11	1	Qua tinh thần "Tịnh Phật quốc độ, thành tựu chúng sanh"cho ta thấy cổ xe Đại thừa luôn luôn phải được vận chuyển bằng hai bánh xe đó là:	41	42	43	44	Chưa có lời giải thích
12	1	Trong chương đệ tử của Kinh Duy Ma Cật, Phật bảo bao nhiêu vị đệ tử đi thăm bệnh ngài Duy Ma Cật?	45	46	47	48	Chưa có lời giải thích
13	1	Ngài Duy Ma Cật trả lời Bồ tát Văn Thù Sư Lợi về gia nhân của mình là:	49	50	51	52	Chưa có lời giải thích
14	1	"Trí độ thành biện, thuyết pháp thuần thục, quyết định tu tập ở trong Đại thừa, đối với mọi tác nghiệp đều có thể khéo léo tư lương. An trú trong uy nghi của Phật. Vào sâu trong biển tâm tuệ".  Thành tự được tinh thần này là thành tựu được giai đoạn nào trong 5 giai đoạn tu tập theo tinh thần Kinh Duy Ma Cật	53	54	55	56	Chưa có lời giải thích
15	1	Duy Ma Cật nói: "Bệnh của ông không hình tướng, không phải thuộc thân, không phải thuộc tâm, không thuộc bốn đại". Nhận định này có thể hiểu trên cơ sở nào?	57	58	59	60	Chưa có lời giải thích
16	1	Mười phương Đức Phật đều theo Kinh Thủ Lăng Nghiêm làm nhơn địa tu hành mà được thành đạo, chứng quả nên gọi là:	61	62	63	64	Chưa có lời giải thích
17	1	Theo tinh thần Kinh Thủ Lăng Nghiêm, A Nan chính là:	65	66	67	68	Chưa có lời giải thích
18	1	Theo tinh thần Kinh Thủ Lăng Nghiêm, Chơn tâm bị ẩn là do nguyên nhân:	69	70	71	72	Chưa có lời giải thích
19	1	Theo Kinh Thủ Lăng Nghiêm, có bao nhiêu vị Thánh giả thuật lại pháp tu của mình được chứng đạo quả?	73	74	75	76	Chưa có lời giải thích
28	1	Căn bản của Tịnh độ Bồ tát là:	109	110	111	112	Chưa có lời giải thích
29	1	Nội dung Kinh Lăng Nghiêm là lời Phật chỉ dạy cho chúng ta:	113	114	115	116	Chưa có lời giải thích
30	1	Kinh Thủ Lăng Nghiêm giảng Tâm là:	117	118	119	120	Chưa có lời giải thích
31	1	Điền phần còn thiếu của đoạn văn phát nguyện của Tôn giả A Nan: "Đại hùng, đại lực, đại từ bi. Hy cánh thẩm trừ vi tế hoặc. Linh ngã tảo đăng vô thượng giác. Ư thập phương giới toạ đạo tràng. ….. Nam mô Thường trụ Thập Phương Phật.	121	122	123	124	Chưa có lời giải thích
32	1	Sứ mệnh hoà bình của Phật giáo thể hiện qua:	125	126	127	128	Chưa có lời giải thích
33	1	Trong tinh thần hoà bình, khi cần bảo vệ những gì thiêng liêng cho dân tộc, tôn giáo thì người con Phật đã chọn phương pháp:	129	130	131	132	Chưa có lời giải thích
34	1	Ngày được chọn là ngày Hoà bình thế giới đó là:	133	134	135	136	Chưa có lời giải thích
35	1	Giáo lý căn bản để xây dựng hoà bình là:	137	138	139	140	Chưa có lời giải thích
36	1	Quá trình của Bồ đề tâm theo tinh thần của Kinh Thắng Man là:	141	142	143	144	Chưa có lời giải thích
37	1	Thắng Man chỉ điểm, chỉ có một nơi nương tựa an toàn và cứu cánh đó là:	145	146	147	148	Chưa có lời giải thích
38	1	Lục Tổ Huệ Năng dạy: "Trong tâm mình không có quấy, không có ác, không tật đố, không tham sân, không cướp hại thì gọi là ..."	149	150	151	152	Chưa có lời giải thích
39	1	Yếu nghĩa của lễ lạy mà Lục Tổ chỉ dạy cho ngài Pháp Đạt là gì?	153	154	155	156	Chưa có lời giải thích
40	1	Điền vào cụm từ còn thiếu trong bài kệ sau: "Bồ đề bổn vô thọ. Minh cảnh diệc phi đài. Bản lai vô nhất vật....... "	157	158	159	160	Chưa có lời giải thích
41	1	Ví dụ "Trưởng giả và gã cùng tử" trong Kinh Pháp Hoa là nội dung	161	162	163	164	Chưa có lời giải thích
42	1	Phẩm Đề Bà Đạt Đa trong kinh Pháp Hoa thể hiện tinh thần	165	166	167	168	Chưa có lời giải thích
43	1	Đức Phật dạy đời sống của người hoằng truyền Pháp Hoa phải có đầy đủ 4 mặt đó là: Thân hành Pháp Hoa, Khẩu hành Pháp Hoa, Ý hành Pháp Hoa, Nguyện hành Pháp Hoa. Đây là nội dung của Phẩm	169	170	171	172	Chưa có lời giải thích
76	1	Điền đầy đủ đoạn văn sau: Bất lịch tăng kỳ hoạch Pháp thân. Nguyện kim đắc quả thành bảo vương. …................. Thị tắc danh vi báo Phật ân	301	302	303	304	Chưa có lời giải thích
44	1	Điền đầy đủ nội dung như sau: "GHPGVNTN không đặt sự tồn tại của mình nơi ….. mà đặt sự tồn tại ấy trong sự tồn tại của Nhân loại và Dân tộc".	173	174	175	176	Chưa có lời giải thích
45	1	Cấp Lãnh đạo Trung Ương GHPGVN có 2 Hội đồng đó là:	177	178	179	180	Chưa có lời giải thích
46	1	Huynh trưởng Cấp Dũng Nguyên Tín - Nguyễn Châu chính thức giữ chức vụ Trưởng Ban Hướng Dẫn Trung Ương GĐPT Việt Nam vào năm 	181	182	183	184	Chưa có lời giải thích
47	1	"Nghĩ rằng trong sứ mệnh giáo dục thanh thiếu nhi, Huynh trưởng GĐPT tự khoác vào mình tính chất đặc thù mà khả năng và đạo đức không thể tách rời, tri thức và kinh nghiệm phải được thực hiện nương nhau". Câu nói này ghi rõ trong:	185	186	187	188	Chưa có lời giải thích
48	1	Tổng Vụ Trưởng Tổng Vụ Thanh niên đầu tiên của GHGPVNTN là	189	190	191	192	Chưa có lời giải thích
49	1	Quy chế Huynh trưởng được thiết lập vào năm	193	194	195	196	Chưa có lời giải thích
50	1	Tất cả các bộ môn tu học của GĐPT đều giúp cho người áo Lam được	197	198	199	200	Chưa có lời giải thích
51	1	Phật giáo tại Thái Lan hầu hết là theo truyền thống Phật giáo	201	202	203	204	Chưa có lời giải thích
52	1	Phật giáo đã được xem là quốc giáo của đất nước Thái Lan vào thời nào	205	206	207	208	Chưa có lời giải thích
53	1	Phật giáo được truyền vào Mã Lai khi nào	209	210	211	212	Chưa có lời giải thích
54	1	Phật giáo ở Campuchia có hai tông phái chính	213	214	215	216	Chưa có lời giải thích
55	1	Phật giáo Campuchia và Lào có điểm chung nổi bật nhất là	217	218	219	220	Chưa có lời giải thích
56	1	Trong bảy lần Phật hỏi về Tâm, đến lần thứ 7, A Nan chấp tâm ở đâu	221	222	223	224	Phật học phổ thông Thích Thiện Hoa
57	1	Để chứng nghiệm tánh nghe thường còn, Đức Phật đã	225	226	227	228	Chưa có lời giải thích
58	1	Thủ lăng nghiêm tàu dịch là	229	230	231	232	Chưa có lời giải thích
59	1	Tôn giả A Nan đã phát lời nguyện rộng lớn khi	233	234	235	236	Chưa có lời giải thích
60	1	Kinh Duy Ma Cật bao gồm bao nhiêu phẩm	237	238	239	240	Chưa có lời giải thích
61	1	Qua pháp môn tu chứng của Chư vị Bồ tát, Thánh tăng trình bày thì Bồ tát Văn Thù tuyên dương pháp môn nào đệ nhất.	241	242	243	244	Chưa có lời giải thích
62	1	Duy Ma Cật mở ra con đường thực tiễn hành động, con đường đó được gọi là	245	246	247	248	Chưa có lời giải thích
63	1	Duy Ma Cật	249	250	251	252	Chưa có lời giải thích
64	1	Pháp vô tận đăng được ngài Duy Ma Cật hướng dẫn trong Phẩm và Phần nào	253	254	255	256	Chưa có lời giải thích
65	1	"Tâm thuần nhất, không tà vạy, là căn bản của Vạn Hạnh" chỉ cho	257	258	259	260	Chưa có lời giải thích
66	1	Căn bản của Tịnh độ Bồ tát là	261	262	263	264	Chưa có lời giải thích
67	1	Kinh Duy Ma Cật nói về	265	266	267	268	Chưa có lời giải thích
68	1	"Nguyện sẽ giảng thuyết cho tất cả chúng sanh bằng tâm không mệt mỏi" là đại nguyện thứ mấy của Thắng Man	269	270	271	272	Chưa có lời giải thích
69	1	Trước khi Đức Phật thuyết Kinh Pháp Hoa, trong chúng hội có bao nhiêu vị Tỳ kheo, Tỳ kheo ni, Cận sự Nam, Cận sự Nữ rời pháp hội	273	274	275	276	Chưa có lời giải thích
70	1	Bản tin Sen trắng GĐPT VN lần đầu tiên ra mắt vào năm	277	278	279	280	Chưa có lời giải thích
71	1	Trong Pháp Hội Thủ Lăng Nghiêm, có bao nhiêu vị đã trình bày Pháp môn tu chứng của mình	281	282	283	284	Chưa có lời giải thích
72	1	Đức Phật đã chỉ tâm cho ngài A Nan bao nhiêu lần	285	286	287	288	Chưa có lời giải thích
73	1	Vị Đại Sư nào của Trung Hoa đã xây bái kính đài để đảnh lễ trong 18 năm cầu thỉnh Kinh Thủ Lăng Nghiêm truyền bá đến Trung Hoa	289	290	291	292	Chưa có lời giải thích
74	1	Nguyên nhân mà ngài Duy Ma Cật bệnh	293	294	295	296	Chưa có lời giải thích
75	1	Tại Việt Nam, tác phẩm Kinh Thủ Lăng Nghiêm giảng giải nổi tiếng là của tác giả	297	298	299	300	Chưa có lời giải thích
77	1	Ngài Duy Ma Cật dạy thiền cho vị Thánh tăng nào trong hàng đệ tử Phật 	305	306	307	308	Chưa có lời giải thích
78	1	Phẩm thứ 11 của Kinh Duy Ma Cật nói về Phẩm Hạnh Bồ Tát, các vị Bồ tát của cõi Chúng Hương thỉnh Phật một lời dạy trước khi về bổn độ, và Đức Phật đã dạy về	309	310	311	312	Chưa có lời giải thích
79	1	Yếu tố đặc biệt của bộ kinh Thắng Man so với các bộ kinh khác là	313	314	315	316	Chưa có lời giải thích
80	1	Phẩm chúc luỵ thứ 22, Đức Phật ân cần phó chúc việc lưu bố Kinh Pháp Hoa này cho ai	317	318	319	320	Chưa có lời giải thích
81	1	Kinh Duy Ma Cật đã nêu lên 5 giai đoạn tu tập của một hành giả là	321	322	323	324	Chưa có lời giải thích
82	1	Để thực hiện được sứ mệnh hoà bình của Phật giáo thì mỗi Phật tử cần phải lấy yếu tố nào làm nền tảng cho sự tu tập	325	326	327	328	Chưa có lời giải thích
83	1	Ngài Duy Ma Cật lên cõi Chúng Hương xin cơm về đãi tất cả hội chúng, sau đó trình bày tám pháp không lầm lỗi để được sanh về Tịnh độ. Đây là nội dung thuộc phẩm thứ mấy của Kinh	329	330	331	332	Chưa có lời giải thích
84	1	Phật giáo truyền thừa vào Thái Lan từ thời điểm nào	333	334	335	336	Chưa có lời giải thích
85	1	Phật giáo Campuchia hiện nay được chia làm hai tông phái đó là	337	338	339	340	Chưa có lời giải thích
86	1	Bồ tát Văn Thù hỏi Duy Ma Cật: Chúng tôi mỗi người đã nói rồi, xin Nhân giả cho biết thế nào là Bồ tát vào cửa pháp bất nhị? Duy Ma Cật	341	342	343	344	Chưa có lời giải thích
87	1	Sứ mệnh hoà bình được Phật giáo thể hiện qua	345	346	347	348	Chưa có lời giải thích
88	1	Trong Kinh Duy Ma Cật phẩm chúc luỵ, Đức Phật đem pháp giác ngộ vô thượng chính đẳng chính giác đã tập thành trong vô lượng kiếp phó chúc lại cho	349	350	351	352	Chưa có lời giải thích
89	1	Sau thời kỳ suy tàn, Phật giáo Mã Lai phục hưng mạnh mẽ vào thời điểm nào	353	354	355	356	Chưa có lời giải thích
90	1	Nguồn gốc bệnh của ngài Duy Ma Cật là	357	358	359	360	Chưa có lời giải thích
91	1	Đại hội Huynh trưởng toàn quốc lần thứ 5 được diễn ra vào năm nào, tại đâu	361	362	363	364	Chưa có lời giải thích
92	1	Lãnh đạo tinh thần của Phật giáo Lào là	365	366	367	368	Chưa có lời giải thích
93	1	Sau khi ngài Thiện Hoa viên tịch thì vị nào chính thức kế nhiệm Viện Trưởng Viện Hoá Đạo GHPGVNTN	369	370	371	372	Chưa có lời giải thích
94	1	Sau năm 1975, GHPGVNTN có tổ chức một kỳ Đại hội đánh dấu cho sự phục hoạt GH sau bao nhiêu năm thăng trầm, gian khó. Kỳ Đại Hội đó được tổ chức tại	373	374	375	376	Chưa có lời giải thích
95	1	Sau giai đoạn diệt chủng Bôn bốt, Phật giáo Campuchia được khôi phục từ sự giúp sức của	377	378	379	380	Chưa có lời giải thích
96	1	Quan điểm của Phật giáo về hoà bình là	381	382	383	384	Chưa có lời giải thích
97	1	Theo Phật giáo thì nguồn gốc của chiến tranh là	385	386	387	388	Chưa có lời giải thích
98	1	Tư tưởng của toàn bộ kinh Thắng Man là	389	390	391	392	Chưa có lời giải thích
99	1	Đại hội Huynh trưởng toàn quốc lần thứ 9 được diễn ra vào năm nào, trú xứ nào	393	394	395	396	Chưa có lời giải thích
100	1	Điền vào cụm từ còn thiếu trong bài kệ sau: Bồ đề bổn vô thọ. Minh cảnh diệc phi đài. Bản lại vô nhất vật. ….......................	397	398	399	400	Chưa có lời giải thích
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: huyanh
--

COPY public.users (id, name, password) FROM stdin;
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huyanh
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, true);


--
-- Name: options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huyanh
--

SELECT pg_catalog.setval('public.options_id_seq', 400, true);


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huyanh
--

SELECT pg_catalog.setval('public.questions_id_seq', 100, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huyanh
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: huyanh
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: options options_pkey; Type: CONSTRAINT; Schema: public; Owner: huyanh
--

ALTER TABLE ONLY public.options
    ADD CONSTRAINT options_pkey PRIMARY KEY (id);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: huyanh
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: categories unique_categories_text; Type: CONSTRAINT; Schema: public; Owner: huyanh
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT unique_categories_text UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: huyanh
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

