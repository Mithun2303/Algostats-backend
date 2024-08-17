--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8
-- Dumped by pg_dump version 14.10 (Homebrew)

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
-- Name: Difficulty; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."Difficulty" AS ENUM (
    'EASY',
    'MEDIUM',
    'HARD',
    'EXPERT'
);


ALTER TYPE public."Difficulty" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Problem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Problem" (
    id text NOT NULL,
    name text NOT NULL,
    platform text DEFAULT 'Leetcode'::text NOT NULL,
    points integer NOT NULL,
    difficulty public."Difficulty" NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Problem" OWNER TO postgres;

--
-- Name: Task; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Task" (
    id text NOT NULL,
    count integer NOT NULL,
    "assignedById" text,
    "timestamp" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deadline timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    "userId" text NOT NULL
);


ALTER TABLE public."Task" OWNER TO postgres;

--
-- Name: Topic; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Topic" (
    id text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Topic" OWNER TO postgres;

--
-- Name: Topic_Problem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Topic_Problem" (
    "topicId" text NOT NULL,
    "problemId" text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Topic_Problem" OWNER TO postgres;

--
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    id text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    role text DEFAULT 'STUDENT'::text NOT NULL,
    "linkedIn" text,
    github text,
    leetcode text,
    class text,
    stream text,
    batch text,
    "lastBackupTime" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- Name: User_Problem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User_Problem" (
    "timestamp" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "problemId" text NOT NULL,
    "userId" text NOT NULL
);


ALTER TABLE public."User_Problem" OWNER TO postgres;

--
-- Name: User_Task; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User_Task" (
    "timestamp" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "taskId" text NOT NULL,
    "userId" text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."User_Task" OWNER TO postgres;

--
-- Name: _ProblemToTopic; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."_ProblemToTopic" (
    "A" text NOT NULL,
    "B" text NOT NULL
);


ALTER TABLE public."_ProblemToTopic" OWNER TO postgres;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- Name: leaderboard; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.leaderboard AS
 SELECT u.id AS "userId",
    u.class,
    u.stream,
    u.batch,
    p.id AS "problemId",
    p.points,
    up."timestamp"
   FROM ((public."User_Problem" up
     JOIN public."User" u ON ((u.id = up."userId")))
     JOIN public."Problem" p ON ((p.id = up."problemId")));


ALTER TABLE public.leaderboard OWNER TO postgres;

--
-- Data for Name: Problem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Problem" (id, name, platform, points, difficulty, created_at, updated_at) FROM stdin;
build-array-from-permutation	Build Array from Permutation	Leetcode	5	EASY	2024-08-16 10:53:31.444	2024-08-16 10:53:31.444
jewels-and-stones	Jewels and Stones	Leetcode	5	EASY	2024-08-16 10:53:31.542	2024-08-16 10:53:31.542
summary-ranges	Summary Ranges	Leetcode	5	EASY	2024-08-17 06:19:03.397	2024-08-17 06:19:03.397
rotate-list	Rotate List	Leetcode	10	MEDIUM	2024-08-17 06:19:03.844	2024-08-17 06:19:03.844
maximum-average-subarray-i	Maximum Average Subarray I	Leetcode	5	EASY	2024-08-16 10:52:41.317	2024-08-16 10:52:41.317
flatten-binary-tree-to-linked-list	Flatten Binary Tree to Linked List	Leetcode	10	MEDIUM	2024-08-16 10:52:41.44	2024-08-16 10:52:41.44
add-two-numbers	Add Two Numbers	Leetcode	10	MEDIUM	2024-08-16 10:52:41.616	2024-08-16 10:52:41.616
number-of-steps-to-reduce-a-number-to-zero	Number of Steps to Reduce a Number to Zero	Leetcode	5	EASY	2024-08-16 10:52:41.74	2024-08-16 10:52:41.74
apply-transform-over-each-element-in-array	Apply Transform Over Each Element in Array	Leetcode	5	EASY	2024-08-16 10:52:41.861	2024-08-16 10:52:41.861
evaluate-reverse-polish-notation	Evaluate Reverse Polish Notation	Leetcode	10	MEDIUM	2024-08-16 10:53:01.358	2024-08-16 10:53:01.358
maximum-count-of-positive-integer-and-negative-integer	Maximum Count of Positive Integer and Negative Integer	Leetcode	5	EASY	2024-08-16 10:53:01.746	2024-08-16 10:53:01.746
find-customer-referee	Find Customer Referee	Leetcode	5	EASY	2024-08-16 10:53:01.874	2024-08-16 10:53:01.874
move-zeroes	Move Zeroes	Leetcode	5	EASY	2024-08-16 10:53:01.926	2024-08-16 10:53:01.926
3sum	3Sum	Leetcode	10	MEDIUM	2024-08-16 10:53:21.358	2024-08-16 10:53:21.358
pass-the-pillow	Pass the Pillow	Leetcode	5	EASY	2024-08-16 10:53:31.444	2024-08-16 10:53:31.444
two-sum	Two Sum	Leetcode	5	EASY	2024-08-16 10:52:41.419	2024-08-16 10:52:41.419
rectangle-overlap	Rectangle Overlap	Leetcode	5	EASY	2024-08-16 10:53:31.542	2024-08-16 10:53:31.542
sort-an-array	Sort an Array	Leetcode	10	MEDIUM	2024-08-16 10:52:41.481	2024-08-16 10:52:41.481
find-k-th-smallest-pair-distance	Find K-th Smallest Pair Distance	Leetcode	15	HARD	2024-08-17 06:19:03.037	2024-08-17 06:19:03.037
happy-number	Happy Number	Leetcode	5	EASY	2024-08-17 06:19:03.398	2024-08-17 06:19:03.398
find-the-minimum-and-maximum-number-of-nodes-between-critical-points	Find the Minimum and Maximum Number of Nodes Between Critical Points	Leetcode	10	MEDIUM	2024-08-17 06:19:03.844	2024-08-17 06:19:03.844
intersection-of-two-linked-lists	Intersection of Two Linked Lists	Leetcode	5	EASY	2024-08-16 10:52:41.74	2024-08-16 10:52:41.74
min-stack	Min Stack	Leetcode	10	MEDIUM	2024-08-17 06:19:04.375	2024-08-17 06:19:04.375
valid-parentheses	Valid Parentheses	Leetcode	5	EASY	2024-08-16 10:53:01.358	2024-08-16 10:53:01.358
third-maximum-number	Third Maximum Number	Leetcode	5	EASY	2024-08-16 10:53:01.924	2024-08-16 10:53:01.924
spiral-matrix-iii	Spiral Matrix III	Leetcode	10	MEDIUM	2024-08-16 10:53:31.542	2024-08-16 10:53:31.542
range-sum-query-immutable	Range Sum Query - Immutable	Leetcode	5	EASY	2024-08-17 06:19:03.038	2024-08-17 06:19:03.038
spiral-matrix	Spiral Matrix	Leetcode	10	MEDIUM	2024-08-17 06:19:03.398	2024-08-17 06:19:03.398
sort-colors	Sort Colors	Leetcode	10	MEDIUM	2024-08-16 10:52:41.419	2024-08-16 10:52:41.419
two-sum-ii-input-array-is-sorted	Two Sum II - Input Array Is Sorted	Leetcode	10	MEDIUM	2024-08-16 10:52:41.48	2024-08-16 10:52:41.48
ransom-note	Ransom Note	Leetcode	5	EASY	2024-08-16 10:52:41.74	2024-08-16 10:52:41.74
count-and-say	Count and Say	Leetcode	10	MEDIUM	2024-08-16 10:52:41.86	2024-08-16 10:52:41.86
make-two-arrays-equal-by-reversing-subarrays	Make Two Arrays Equal by Reversing Subarrays	Leetcode	5	EASY	2024-08-16 10:53:01.358	2024-08-16 10:53:01.358
assign-cookies	Assign Cookies	Leetcode	5	EASY	2024-08-16 10:53:01.923	2024-08-16 10:53:01.923
search-in-rotated-sorted-array	Search in Rotated Sorted Array	Leetcode	10	MEDIUM	2024-08-16 10:53:02.264	2024-08-16 10:53:02.264
jump-game	Jump Game	Leetcode	10	MEDIUM	2024-08-16 10:53:31.542	2024-08-16 10:53:31.542
find-pivot-index	Find Pivot Index	Leetcode	5	EASY	2024-08-17 06:19:03.038	2024-08-17 06:19:03.038
word-pattern	Word Pattern	Leetcode	5	EASY	2024-08-17 06:19:03.398	2024-08-17 06:19:03.398
set-matrix-zeroes	Set Matrix Zeroes	Leetcode	10	MEDIUM	2024-08-16 10:52:41.419	2024-08-16 10:52:41.419
candy	Candy	Leetcode	15	HARD	2024-08-16 10:52:41.481	2024-08-16 10:52:41.481
create-hello-world-function	Create Hello World Function	Leetcode	5	EASY	2024-08-16 10:52:41.616	2024-08-16 10:52:41.616
median-of-two-sorted-arrays	Median of Two Sorted Arrays	Leetcode	15	HARD	2024-08-16 10:52:41.801	2024-08-16 10:52:41.801
sort-list	Sort List	Leetcode	10	MEDIUM	2024-08-16 10:52:41.86	2024-08-16 10:52:41.86
majority-element	Majority Element	Leetcode	5	EASY	2024-08-16 10:53:01.358	2024-08-16 10:53:01.358
find-the-winner-of-the-circular-game	Find the Winner of the Circular Game	Leetcode	10	MEDIUM	2024-08-16 10:53:01.746	2024-08-16 10:53:01.746
minimum-swaps-to-group-all-1s-together-ii	Minimum Swaps to Group All 1's Together II	Leetcode	10	MEDIUM	2024-08-16 10:53:01.874	2024-08-16 10:53:01.874
merge-sorted-array	Merge Sorted Array	Leetcode	5	EASY	2024-08-16 10:53:01.922	2024-08-16 10:53:01.922
search-insert-position	Search Insert Position	Leetcode	5	EASY	2024-08-16 10:53:01.925	2024-08-16 10:53:01.925
shuffle-the-array	Shuffle the Array	Leetcode	5	EASY	2024-08-16 10:53:02.264	2024-08-16 10:53:02.264
remove-duplicates-from-sorted-array-ii	Remove Duplicates from Sorted Array II	Leetcode	10	MEDIUM	2024-08-16 10:53:31.542	2024-08-16 10:53:31.542
game-of-life	Game of Life	Leetcode	10	MEDIUM	2024-08-17 06:19:03.398	2024-08-17 06:19:03.398
merge-two-sorted-lists	Merge Two Sorted Lists	Leetcode	5	EASY	2024-08-16 10:52:41.44	2024-08-16 10:52:41.44
rotate-string	Rotate String	Leetcode	5	EASY	2024-08-16 10:52:41.48	2024-08-16 10:52:41.48
delete-the-middle-node-of-a-linked-list	Delete the Middle Node of a Linked List	Leetcode	10	MEDIUM	2024-08-16 10:52:41.86	2024-08-16 10:52:41.86
number-of-senior-citizens	Number of Senior Citizens	Leetcode	5	EASY	2024-08-16 10:53:01.358	2024-08-16 10:53:01.358
merge-nodes-in-between-zeros	Merge Nodes in Between Zeros	Leetcode	10	MEDIUM	2024-08-16 10:53:01.746	2024-08-16 10:53:01.746
reverse-linked-list	Reverse Linked List	Leetcode	5	EASY	2024-08-16 10:53:01.792	2024-08-16 10:53:01.792
reshape-data-melt	Reshape Data: Melt	Leetcode	5	EASY	2024-08-16 10:53:01.874	2024-08-16 10:53:01.874
reshape-data-pivot	Reshape Data: Pivot	Leetcode	5	EASY	2024-08-16 10:53:01.874	2024-08-16 10:53:01.874
find-words-containing-character	Find Words Containing Character	Leetcode	5	EASY	2024-08-16 10:53:02.271	2024-08-16 10:53:02.271
concatenation-of-array	Concatenation of Array	Leetcode	5	EASY	2024-08-16 10:53:11.615	2024-08-16 10:53:11.615
divide-two-integers	Divide Two Integers	Leetcode	10	MEDIUM	2024-08-16 10:53:21.358	2024-08-16 10:53:21.358
maximum-subarray	Maximum Subarray	Leetcode	10	MEDIUM	2024-08-17 05:05:41.752	2024-08-17 05:05:41.752
isomorphic-strings	Isomorphic Strings	Leetcode	5	EASY	2024-08-17 05:05:41.752	2024-08-17 05:05:41.752
maximum-number-of-balloons	Maximum Number of Balloons	Leetcode	5	EASY	2024-08-17 06:19:03.038	2024-08-17 06:19:03.038
squares-of-a-sorted-array	Squares of a Sorted Array	Leetcode	5	EASY	2024-08-16 10:52:41.44	2024-08-16 10:52:41.44
function-composition	Function Composition	Leetcode	5	EASY	2024-08-16 10:52:41.861	2024-08-16 10:52:41.861
best-time-to-buy-and-sell-stock	Best Time to Buy and Sell Stock	Leetcode	5	EASY	2024-08-16 10:53:01.358	2024-08-16 10:53:01.358
delete-node-in-a-linked-list	Delete Node in a Linked List	Leetcode	10	MEDIUM	2024-08-16 10:53:01.716	2024-08-16 10:53:01.716
odd-even-linked-list	Odd Even Linked List	Leetcode	10	MEDIUM	2024-08-16 10:53:01.746	2024-08-16 10:53:01.746
rotate-array	Rotate Array	Leetcode	10	MEDIUM	2024-08-16 10:53:01.792	2024-08-16 10:53:01.792
recyclable-and-low-fat-products	Recyclable and Low Fat Products	Leetcode	5	EASY	2024-08-16 10:53:01.874	2024-08-16 10:53:01.874
missing-number	Missing Number	Leetcode	5	EASY	2024-08-16 10:53:01.926	2024-08-16 10:53:01.926
find-first-and-last-position-of-element-in-sorted-array	Find First and Last Position of Element in Sorted Array	Leetcode	10	MEDIUM	2024-08-16 10:53:02.264	2024-08-16 10:53:02.264
n-repeated-element-in-size-2n-array	N-Repeated Element in Size 2N Array	Leetcode	5	EASY	2024-08-16 10:53:21.604	2024-08-16 10:53:21.604
longest-increasing-subsequence	Longest Increasing Subsequence	Leetcode	10	MEDIUM	2024-08-17 06:19:01.182	2024-08-17 06:19:01.182
reverse-integer	Reverse Integer	Leetcode	10	MEDIUM	2024-08-17 06:19:02.208	2024-08-17 06:19:02.208
remove-nth-node-from-end-of-list	Remove Nth Node From End of List	Leetcode	10	MEDIUM	2024-08-16 10:52:41.44	2024-08-16 10:52:41.44
find-all-numbers-disappeared-in-an-array	Find All Numbers Disappeared in an Array	Leetcode	5	EASY	2024-08-17 06:19:03.038	2024-08-17 06:19:03.038
insert-interval	Insert Interval	Leetcode	10	MEDIUM	2024-08-17 06:19:03.397	2024-08-17 06:19:03.397
excel-sheet-column-number	Excel Sheet Column Number	Leetcode	5	EASY	2024-08-17 06:21:03.806	2024-08-17 06:21:03.806
spiral-matrix-ii	Spiral Matrix II	Leetcode	10	MEDIUM	2024-08-16 10:52:41.481	2024-08-16 10:52:41.481
container-with-most-water	Container With Most Water	Leetcode	10	MEDIUM	2024-08-16 10:52:41.616	2024-08-16 10:52:41.616
fizz-buzz	Fizz Buzz	Leetcode	5	EASY	2024-08-16 10:52:41.74	2024-08-16 10:52:41.74
maximum-product-difference-between-two-pairs	Maximum Product Difference Between Two Pairs	Leetcode	5	EASY	2024-08-16 10:52:41.802	2024-08-16 10:52:41.802
minimum-bit-flips-to-convert-number	Minimum Bit Flips to Convert Number	Leetcode	5	EASY	2024-08-16 10:52:41.86	2024-08-16 10:52:41.86
linked-list-cycle	Linked List Cycle	Leetcode	5	EASY	2024-08-16 10:53:01.747	2024-08-16 10:53:01.747
minimum-number-of-pushes-to-type-word-ii	Minimum Number of Pushes to Type Word II	Leetcode	10	MEDIUM	2024-08-16 10:53:01.874	2024-08-16 10:53:01.874
remove-duplicates-from-sorted-array	Remove Duplicates from Sorted Array	Leetcode	5	EASY	2024-08-16 10:53:01.924	2024-08-16 10:53:01.924
strictly-palindromic-number	Strictly Palindromic Number	Leetcode	10	MEDIUM	2024-08-16 10:53:02.264	2024-08-16 10:53:02.264
first-missing-positive	First Missing Positive	Leetcode	15	HARD	2024-08-17 06:19:01.183	2024-08-17 06:19:01.183
pascals-triangle-ii	Pascal's Triangle II	Leetcode	5	EASY	2024-08-17 06:19:03.038	2024-08-17 06:19:03.038
minimum-window-substring	Minimum Window Substring	Leetcode	15	HARD	2024-08-17 06:19:03.398	2024-08-17 06:19:03.398
valid-anagram	Valid Anagram	Leetcode	5	EASY	2024-08-16 10:52:41.861	2024-08-16 10:52:41.861
is-subsequence	Is Subsequence	Leetcode	5	EASY	2024-08-17 06:19:04.374	2024-08-17 06:19:04.374
minimum-difference-between-largest-and-smallest-value-in-three-moves	Minimum Difference Between Largest and Smallest Value in Three Moves	Leetcode	10	MEDIUM	2024-08-17 06:35:21.726	2024-08-17 06:35:21.726
palindrome-linked-list	Palindrome Linked List	Leetcode	5	EASY	2024-08-16 10:53:01.716	2024-08-16 10:53:01.716
water-bottles	Water Bottles	Leetcode	5	EASY	2024-08-16 10:53:01.746	2024-08-16 10:53:01.746
h-index	H-Index	Leetcode	10	MEDIUM	2024-08-17 06:35:21.726	2024-08-17 06:35:21.726
insert-delete-getrandom-o1	Insert Delete GetRandom O(1)	Leetcode	10	MEDIUM	2024-08-17 06:35:21.726	2024-08-17 06:35:21.726
article-views-i	Article Views I	Leetcode	5	EASY	2024-08-16 10:53:01.874	2024-08-16 10:53:01.874
simplify-path	Simplify Path	Leetcode	10	MEDIUM	2024-08-16 10:53:01.925	2024-08-16 10:53:01.925
sort-the-people	Sort the People	Leetcode	5	EASY	2024-08-16 10:53:02.262	2024-08-16 10:53:02.262
ugly-number	Ugly Number	Leetcode	5	EASY	2024-08-16 10:53:21.358	2024-08-16 10:53:21.358
maximum-distance-in-arrays	Maximum Distance in Arrays	Leetcode	10	MEDIUM	2024-08-17 06:19:01.183	2024-08-17 06:19:01.183
vowels-game-in-a-string	Vowels Game in a String	Leetcode	10	MEDIUM	2024-08-17 06:19:02.208	2024-08-17 06:19:02.208
next-greater-element-i	Next Greater Element I	Leetcode	5	EASY	2024-08-17 06:19:03.038	2024-08-17 06:19:03.038
add-binary	Add Binary	Leetcode	5	EASY	2024-08-17 06:19:04.127	2024-08-17 06:19:04.127
product-of-array-except-self	Product of Array Except Self	Leetcode	10	MEDIUM	2024-08-17 06:35:21.726	2024-08-17 06:35:21.726
path-crossing	Path Crossing	Leetcode	5	EASY	2024-08-16 10:52:41.804	2024-08-16 10:52:41.804
to-be-or-not-to-be	To Be Or Not To Be	Leetcode	5	EASY	2024-08-16 10:52:41.861	2024-08-16 10:52:41.861
roman-to-integer	Roman to Integer	Leetcode	5	EASY	2024-08-16 10:53:01.716	2024-08-16 10:53:01.716
remove-element	Remove Element	Leetcode	5	EASY	2024-08-16 10:53:01.791	2024-08-16 10:53:01.791
invalid-tweets	Invalid Tweets	Leetcode	5	EASY	2024-08-16 10:53:01.874	2024-08-16 10:53:01.874
merge-in-between-linked-lists	Merge In Between Linked Lists	Leetcode	10	MEDIUM	2024-08-16 10:53:01.924	2024-08-16 10:53:01.924
remove-duplicates-from-sorted-list	Remove Duplicates from Sorted List	Leetcode	5	EASY	2024-08-16 10:53:01.925	2024-08-16 10:53:01.925
count-pairs-whose-sum-is-less-than-target	Count Pairs Whose Sum is Less than Target	Leetcode	5	EASY	2024-08-16 10:53:02.264	2024-08-16 10:53:02.264
counter	Counter	Leetcode	5	EASY	2024-08-16 10:53:02.343	2024-08-16 10:53:02.343
first-unique-character-in-a-string	First Unique Character in a String	Leetcode	5	EASY	2024-08-16 10:53:11.615	2024-08-16 10:53:11.615
subarray-sum-equals-k	Subarray Sum Equals K	Leetcode	10	MEDIUM	2024-08-17 06:19:01.182	2024-08-17 06:19:01.182
find-words-that-can-be-formed-by-characters	Find Words That Can Be Formed by Characters	Leetcode	5	EASY	2024-08-17 06:19:03.038	2024-08-17 06:19:03.038
jump-game-ii	Jump Game II	Leetcode	10	MEDIUM	2024-08-17 06:35:21.726	2024-08-17 06:35:21.726
largest-odd-number-in-string	Largest Odd Number in String	Leetcode	5	EASY	2024-08-16 10:52:41.861	2024-08-16 10:52:41.861
reverse-substrings-between-each-pair-of-parentheses	Reverse Substrings Between Each Pair of Parentheses	Leetcode	10	MEDIUM	2024-08-16 10:53:01.746	2024-08-16 10:53:01.746
powx-n	Pow(x, n)	Leetcode	10	MEDIUM	2024-08-16 10:53:01.792	2024-08-16 10:53:01.792
integer-to-english-words	Integer to English Words	Leetcode	15	HARD	2024-08-16 10:53:01.874	2024-08-16 10:53:01.874
change-data-type	Change Data Type	Leetcode	5	EASY	2024-08-16 10:53:01.874	2024-08-16 10:53:01.874
reshape-data-concatenate	Reshape Data: Concatenate	Leetcode	5	EASY	2024-08-16 10:53:01.874	2024-08-16 10:53:01.874
reverse-words-in-a-string	Reverse Words in a String	Leetcode	10	MEDIUM	2024-08-16 10:53:01.921	2024-08-16 10:53:01.921
contains-duplicate	Contains Duplicate	Leetcode	5	EASY	2024-08-16 10:53:01.924	2024-08-16 10:53:01.924
richest-customer-wealth	Richest Customer Wealth	Leetcode	5	EASY	2024-08-16 10:53:02.035	2024-08-16 10:53:02.035
nim-game	Nim Game	Leetcode	5	EASY	2024-08-16 10:53:02.264	2024-08-16 10:53:02.264
check-if-array-is-sorted-and-rotated	Check if Array Is Sorted and Rotated	Leetcode	5	EASY	2024-08-16 10:53:02.264	2024-08-16 10:53:02.264
find-minimum-operations-to-make-all-elements-divisible-by-three	Find Minimum Operations to Make All Elements Divisible by Three	Leetcode	5	EASY	2024-08-16 10:53:11.615	2024-08-16 10:53:11.615
lucky-numbers-in-a-matrix	Lucky Numbers in a Matrix	Leetcode	5	EASY	2024-08-16 10:53:21.358	2024-08-16 10:53:21.358
find-valid-matrix-given-row-and-column-sums	Find Valid Matrix Given Row and Column Sums	Leetcode	10	MEDIUM	2024-08-16 10:53:21.358	2024-08-16 10:53:21.358
pascals-triangle	Pascal's Triangle	Leetcode	5	EASY	2024-08-17 06:19:01.648	2024-08-17 06:19:01.648
monotonic-array	Monotonic Array	Leetcode	5	EASY	2024-08-17 06:19:03.038	2024-08-17 06:19:03.038
valid-sudoku	Valid Sudoku	Leetcode	10	MEDIUM	2024-08-17 06:19:03.398	2024-08-17 06:19:03.398
binary-search	Binary Search	Leetcode	5	EASY	2024-08-16 10:53:01.747	2024-08-16 10:53:01.747
big-countries	Big Countries	Leetcode	5	EASY	2024-08-16 10:53:01.874	2024-08-16 10:53:01.874
max-consecutive-ones	Max Consecutive Ones	Leetcode	5	EASY	2024-08-16 10:53:01.923	2024-08-16 10:53:01.923
minimum-number-of-days-to-disconnect-island	Minimum Number of Days to Disconnect Island	Leetcode	15	HARD	2024-08-16 10:53:02.262	2024-08-16 10:53:02.262
find-the-original-array-of-prefix-xor	Find The Original Array of Prefix Xor	Leetcode	10	MEDIUM	2024-08-17 06:19:01.648	2024-08-17 06:19:01.648
destination-city	Destination City	Leetcode	5	EASY	2024-08-17 06:19:03.038	2024-08-17 06:19:03.038
group-anagrams	Group Anagrams	Leetcode	10	MEDIUM	2024-08-17 06:19:03.398	2024-08-17 06:19:03.398
binary-tree-inorder-traversal	Binary Tree Inorder Traversal	Leetcode	5	EASY	2024-08-16 10:52:41.44	2024-08-16 10:52:41.44
coin-change-ii	Coin Change II	Leetcode	10	MEDIUM	2024-08-16 10:52:41.616	2024-08-16 10:52:41.616
reverse-string	Reverse String	Leetcode	5	EASY	2024-08-16 10:52:41.74	2024-08-16 10:52:41.74
filter-elements-from-array	Filter Elements from Array	Leetcode	5	EASY	2024-08-16 10:52:41.86	2024-08-16 10:52:41.86
find-the-index-of-the-first-occurrence-in-a-string	Find the Index of the First Occurrence in a String	Leetcode	5	EASY	2024-08-16 10:53:01.792	2024-08-16 10:53:01.792
sqrtx	Sqrt(x)	Leetcode	5	EASY	2024-08-16 10:53:01.925	2024-08-16 10:53:01.925
plus-one	Plus One	Leetcode	5	EASY	2024-08-16 10:53:02.25	2024-08-16 10:53:02.25
single-element-in-a-sorted-array	Single Element in a Sorted Array	Leetcode	10	MEDIUM	2024-08-16 10:53:02.264	2024-08-16 10:53:02.264
score-of-a-string	Score of a String	Leetcode	5	EASY	2024-08-16 10:53:21.358	2024-08-16 10:53:21.358
maximum-nesting-depth-of-the-parentheses	Maximum Nesting Depth of the Parentheses	Leetcode	5	EASY	2024-08-17 06:19:01.649	2024-08-17 06:19:01.649
merge-intervals	Merge Intervals	Leetcode	10	MEDIUM	2024-08-17 06:19:03.398	2024-08-17 06:19:03.398
longest-palindromic-substring	Longest Palindromic Substring	Leetcode	10	MEDIUM	2024-08-16 10:52:41.44	2024-08-16 10:52:41.44
count-the-number-of-vowel-strings-in-range	Count the Number of Vowel Strings in Range	Leetcode	5	EASY	2024-08-16 10:52:41.803	2024-08-16 10:52:41.803
counter-ii	Counter II	Leetcode	5	EASY	2024-08-16 10:52:41.861	2024-08-16 10:52:41.861
middle-of-the-linked-list	Middle of the Linked List	Leetcode	5	EASY	2024-08-16 10:53:01.792	2024-08-16 10:53:01.792
method-chaining	Method Chaining	Leetcode	5	EASY	2024-08-16 10:53:01.874	2024-08-16 10:53:01.874
number-of-1-bits	Number of 1 Bits	Leetcode	5	EASY	2024-08-16 10:53:01.925	2024-08-16 10:53:01.925
sort-the-jumbled-numbers	Sort the Jumbled Numbers	Leetcode	10	MEDIUM	2024-08-16 10:53:21.358	2024-08-16 10:53:21.358
removing-stars-from-a-string	Removing Stars From a String	Leetcode	10	MEDIUM	2024-08-17 06:19:01.649	2024-08-17 06:19:01.649
longest-common-prefix	Longest Common Prefix	Leetcode	5	EASY	2024-08-16 10:52:41.44	2024-08-16 10:52:41.44
rotate-image	Rotate Image	Leetcode	10	MEDIUM	2024-08-17 06:19:02.208	2024-08-17 06:19:02.208
maximum-score-after-splitting-a-string	Maximum Score After Splitting a String	Leetcode	5	EASY	2024-08-17 06:19:03.038	2024-08-17 06:19:03.038
longest-consecutive-sequence	Longest Consecutive Sequence	Leetcode	10	MEDIUM	2024-08-17 06:19:03.398	2024-08-17 06:19:03.398
find-numbers-with-even-number-of-digits	Find Numbers with Even Number of Digits	Leetcode	5	EASY	2024-08-16 10:52:41.74	2024-08-16 10:52:41.74
maximum-value-of-a-string-in-an-array	Maximum Value of a String in an Array	Leetcode	5	EASY	2024-08-16 10:52:41.803	2024-08-16 10:52:41.803
return-length-of-arguments-passed	Return Length of Arguments Passed	Leetcode	5	EASY	2024-08-16 10:52:41.86	2024-08-16 10:52:41.86
single-number	Single Number	Leetcode	5	EASY	2024-08-16 10:53:01.925	2024-08-16 10:53:01.925
crawler-log-folder	Crawler Log Folder	Leetcode	5	EASY	2024-08-17 06:19:01.649	2024-08-17 06:19:01.649
contains-duplicate-ii	Contains Duplicate II	Leetcode	5	EASY	2024-08-17 06:19:03.398	2024-08-17 06:19:03.398
delete-nodes-and-return-forest	Delete Nodes And Return Forest	Leetcode	10	MEDIUM	2024-08-17 06:19:04.375	2024-08-17 06:19:04.375
fibonacci-number	Fibonacci Number	Leetcode	5	EASY	2024-08-17 06:19:02.208	2024-08-17 06:19:02.208
string-to-integer-atoi	String to Integer (atoi)	Leetcode	10	MEDIUM	2024-08-17 06:19:03.037	2024-08-17 06:19:03.037
climbing-stairs	Climbing Stairs	Leetcode	5	EASY	2024-08-17 06:19:03.844	2024-08-17 06:19:03.844
hamming-distance	Hamming Distance	Leetcode	5	EASY	2024-08-17 06:19:04.127	2024-08-17 06:19:04.127
average-waiting-time	Average Waiting Time	Leetcode	10	MEDIUM	2024-08-17 06:19:04.375	2024-08-17 06:19:04.375
valid-palindrome	Valid Palindrome	Leetcode	5	EASY	2024-08-16 10:52:41.616	2024-08-16 10:52:41.616
running-sum-of-1d-array	Running Sum of 1d Array	Leetcode	5	EASY	2024-08-16 10:52:41.74	2024-08-16 10:52:41.74
palindrome-number	Palindrome Number	Leetcode	5	EASY	2024-08-16 10:53:01.358	2024-08-16 10:53:01.358
minimum-changes-to-make-alternating-binary-string	Minimum Changes To Make Alternating Binary String	Leetcode	5	EASY	2024-08-17 06:19:03.037	2024-08-17 06:19:03.037
minimum-number-of-arrows-to-burst-balloons	Minimum Number of Arrows to Burst Balloons	Leetcode	10	MEDIUM	2024-08-17 06:19:03.397	2024-08-17 06:19:03.397
lemonade-change	Lemonade Change	Leetcode	5	EASY	2024-08-17 06:19:04.127	2024-08-17 06:19:04.127
kth-distinct-string-in-an-array	Kth Distinct String in an Array	Leetcode	5	EASY	2024-08-16 10:53:01.358	2024-08-16 10:53:01.358
sum-of-unique-elements	Sum of Unique Elements	Leetcode	5	EASY	2024-08-16 10:53:01.716	2024-08-16 10:53:01.716
minimum-common-value	Minimum Common Value	Leetcode	5	EASY	2024-08-16 10:53:01.874	2024-08-16 10:53:01.874
fill-missing-data	Fill Missing Data	Leetcode	5	EASY	2024-08-16 10:53:01.874	2024-08-16 10:53:01.874
length-of-last-word	Length of Last Word	Leetcode	5	EASY	2024-08-16 10:53:01.922	2024-08-16 10:53:01.922
reverse-bits	Reverse Bits	Leetcode	5	EASY	2024-08-16 10:53:01.925	2024-08-16 10:53:01.925
number-of-good-pairs	Number of Good Pairs	Leetcode	5	EASY	2024-08-16 10:53:02.27	2024-08-16 10:53:02.27
k-items-with-the-maximum-sum	K Items With the Maximum Sum	Leetcode	5	EASY	2024-08-16 10:53:02.342	2024-08-16 10:53:02.342
final-value-of-variable-after-performing-operations	Final Value of Variable After Performing Operations	Leetcode	5	EASY	2024-08-16 10:53:11.615	2024-08-16 10:53:11.615
three-consecutive-odds	Three Consecutive Odds	Leetcode	5	EASY	2024-08-16 10:53:11.615	2024-08-16 10:53:11.615
\.


--
-- Data for Name: Task; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Task" (id, count, "assignedById", "timestamp", deadline, created_at, updated_at, "userId") FROM stdin;
\.


--
-- Data for Name: Topic; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Topic" (id, created_at, updated_at) FROM stdin;
math	2024-08-16 06:16:09.04	2024-08-16 06:16:09.04
array	2024-08-16 06:16:09.096	2024-08-16 06:16:09.096
linked-list	2024-08-16 06:16:09.097	2024-08-16 06:16:09.097
simulation	2024-08-16 06:16:09.11	2024-08-16 06:16:09.11
recursion	2024-08-16 06:16:09.097	2024-08-16 06:16:09.097
hash-table	2024-08-16 06:16:09.123	2024-08-16 06:16:09.123
stack	2024-08-16 06:16:09.099	2024-08-16 06:16:09.099
two-pointers	2024-08-16 06:16:09.123	2024-08-16 06:16:09.123
radix-sort	2024-08-16 10:52:41.244	2024-08-16 10:52:41.244
string	2024-08-16 06:16:09.123	2024-08-16 06:16:09.123
matrix	2024-08-16 06:16:09.124	2024-08-16 06:16:09.124
counting	2024-08-16 06:16:09.109	2024-08-16 06:16:09.109
queue	2024-08-16 06:16:09.109	2024-08-16 06:16:09.109
sorting	2024-08-16 10:43:31.281	2024-08-16 10:43:31.281
greedy	2024-08-16 10:43:31.282	2024-08-16 10:43:31.282
divide-and-conquer	2024-08-16 06:19:22.111	2024-08-16 06:19:22.111
bit-manipulation	2024-08-16 06:19:22.111	2024-08-16 06:19:22.111
binary-search	2024-08-16 06:19:22.121	2024-08-16 06:19:22.121
string-matching	2024-08-16 06:19:22.122	2024-08-16 06:19:22.122
geometry	2024-08-16 10:43:31.608	2024-08-16 10:43:31.608
dynamic-programming	2024-08-16 10:43:31.679	2024-08-16 10:43:31.679
database	2024-08-16 10:43:31.77	2024-08-16 10:43:31.77
brainteaser	2024-08-16 10:43:41.403	2024-08-16 10:43:41.403
game-theory	2024-08-16 10:43:41.421	2024-08-16 10:43:41.421
merge-sort	2024-08-16 10:52:41.244	2024-08-16 10:52:41.244
heap-priority-queue	2024-08-16 10:52:41.244	2024-08-16 10:52:41.244
randomized	2024-08-17 06:35:21.725	2024-08-17 06:35:21.725
prefix-sum	2024-08-16 10:52:41.706	2024-08-16 10:52:41.706
binary-tree	2024-08-16 10:52:41.384	2024-08-16 10:52:41.384
trie	2024-08-16 10:52:41.398	2024-08-16 10:52:41.398
breadth-first-search	2024-08-16 10:43:41.959	2024-08-16 10:43:41.959
counting-sort	2024-08-16 10:52:41.244	2024-08-16 10:52:41.244
tree	2024-08-16 10:52:41.384	2024-08-16 10:52:41.384
bucket-sort	2024-08-16 10:52:41.244	2024-08-16 10:52:41.244
sliding-window	2024-08-16 10:43:41.503	2024-08-16 10:43:41.503
depth-first-search	2024-08-16 10:43:41.959	2024-08-16 10:43:41.959
design	2024-08-17 06:19:02.507	2024-08-17 06:19:02.507
monotonic-stack	2024-08-17 06:19:02.68	2024-08-17 06:19:02.68
memoization	2024-08-17 06:19:01.361	2024-08-17 06:19:01.361
union-find	2024-08-17 06:19:03.312	2024-08-17 06:19:03.312
strongly-connected-component	2024-08-16 10:43:41.959	2024-08-16 10:43:41.959
\.


--
-- Data for Name: Topic_Problem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Topic_Problem" ("topicId", "problemId", created_at, updated_at) FROM stdin;
simulation	build-array-from-permutation	2024-08-16 10:53:31.446	2024-08-16 10:53:31.446
string	jewels-and-stones	2024-08-16 10:53:31.556	2024-08-16 10:53:31.556
string	isomorphic-strings	2024-08-17 05:05:41.767	2024-08-17 05:05:41.767
array	monotonic-array	2024-08-17 06:19:03.06	2024-08-17 06:19:03.06
hash-table	next-greater-element-i	2024-08-17 06:19:03.061	2024-08-17 06:19:03.061
string	word-pattern	2024-08-17 06:19:03.403	2024-08-17 06:19:03.403
sliding-window	contains-duplicate-ii	2024-08-17 06:19:03.409	2024-08-17 06:19:03.409
array	valid-sudoku	2024-08-17 06:19:03.412	2024-08-17 06:19:03.412
sorting	minimum-difference-between-largest-and-smallest-value-in-three-moves	2024-08-17 06:35:21.754	2024-08-17 06:35:21.754
array	jump-game-ii	2024-08-17 06:35:21.754	2024-08-17 06:35:21.754
array	maximum-average-subarray-i	2024-08-16 10:52:41.328	2024-08-16 10:52:41.328
sorting	sort-colors	2024-08-16 10:52:41.435	2024-08-16 10:52:41.435
stack	flatten-binary-tree-to-linked-list	2024-08-16 10:52:41.461	2024-08-16 10:52:41.461
radix-sort	sort-an-array	2024-08-16 10:52:41.492	2024-08-16 10:52:41.492
bucket-sort	sort-an-array	2024-08-16 10:52:41.492	2024-08-16 10:52:41.492
greedy	container-with-most-water	2024-08-16 10:52:41.62	2024-08-16 10:52:41.62
prefix-sum	running-sum-of-1d-array	2024-08-16 10:52:41.743	2024-08-16 10:52:41.743
merge-sort	sort-list	2024-08-16 10:52:41.862	2024-08-16 10:52:41.862
two-pointers	delete-the-middle-node-of-a-linked-list	2024-08-16 10:52:41.863	2024-08-16 10:52:41.863
sorting	majority-element	2024-08-16 10:53:01.364	2024-08-16 10:53:01.364
dynamic-programming	best-time-to-buy-and-sell-stock	2024-08-16 10:53:01.364	2024-08-16 10:53:01.364
math	evaluate-reverse-polish-notation	2024-08-16 10:53:01.364	2024-08-16 10:53:01.364
hash-table	sum-of-unique-elements	2024-08-16 10:53:01.768	2024-08-16 10:53:01.768
simulation	merge-nodes-in-between-zeros	2024-08-16 10:53:01.802	2024-08-16 10:53:01.802
array	remove-element	2024-08-16 10:53:01.898	2024-08-16 10:53:01.898
linked-list	reverse-linked-list	2024-08-16 10:53:01.9	2024-08-16 10:53:01.9
string-matching	find-the-index-of-the-first-occurrence-in-a-string	2024-08-16 10:53:01.9	2024-08-16 10:53:01.9
counting	minimum-number-of-pushes-to-type-word-ii	2024-08-16 10:53:01.992	2024-08-16 10:53:01.992
two-pointers	minimum-common-value	2024-08-16 10:53:01.993	2024-08-16 10:53:01.993
database	invalid-tweets	2024-08-16 10:53:01.995	2024-08-16 10:53:01.995
array	search-insert-position	2024-08-16 10:53:02.149	2024-08-16 10:53:02.149
two-pointers	move-zeroes	2024-08-16 10:53:02.149	2024-08-16 10:53:02.149
divide-and-conquer	number-of-1-bits	2024-08-16 10:53:02.159	2024-08-16 10:53:02.159
sorting	sort-the-people	2024-08-16 10:53:02.413	2024-08-16 10:53:02.413
binary-search	single-element-in-a-sorted-array	2024-08-16 10:53:02.417	2024-08-16 10:53:02.417
array	single-element-in-a-sorted-array	2024-08-16 10:53:02.417	2024-08-16 10:53:02.417
simulation	final-value-of-variable-after-performing-operations	2024-08-16 10:53:11.618	2024-08-16 10:53:11.618
math	find-minimum-operations-to-make-all-elements-divisible-by-three	2024-08-16 10:53:11.618	2024-08-16 10:53:11.618
counting	first-unique-character-in-a-string	2024-08-16 10:53:11.621	2024-08-16 10:53:11.621
two-pointers	3sum	2024-08-16 10:53:21.363	2024-08-16 10:53:21.363
math	divide-two-integers	2024-08-16 10:53:21.363	2024-08-16 10:53:21.363
array	build-array-from-permutation	2024-08-16 10:53:31.446	2024-08-16 10:53:31.446
array	subarray-sum-equals-k	2024-08-17 06:19:01.188	2024-08-17 06:19:01.188
math	vowels-game-in-a-string	2024-08-17 06:19:02.222	2024-08-17 06:19:02.222
two-pointers	find-k-th-smallest-pair-distance	2024-08-17 06:19:03.056	2024-08-17 06:19:03.056
hash-table	find-all-numbers-disappeared-in-an-array	2024-08-17 06:19:03.061	2024-08-17 06:19:03.061
array	game-of-life	2024-08-17 06:19:03.403	2024-08-17 06:19:03.403
array	summary-ranges	2024-08-17 06:19:03.408	2024-08-17 06:19:03.408
bit-manipulation	add-binary	2024-08-17 06:19:04.133	2024-08-17 06:19:04.133
string	excel-sheet-column-number	2024-08-17 06:21:03.814	2024-08-17 06:21:03.814
sliding-window	maximum-average-subarray-i	2024-08-16 10:52:41.328	2024-08-16 10:52:41.328
array	squares-of-a-sorted-array	2024-08-16 10:52:41.46	2024-08-16 10:52:41.46
depth-first-search	flatten-binary-tree-to-linked-list	2024-08-16 10:52:41.461	2024-08-16 10:52:41.461
merge-sort	sort-an-array	2024-08-16 10:52:41.492	2024-08-16 10:52:41.492
array	candy	2024-08-16 10:52:41.495	2024-08-16 10:52:41.495
array	spiral-matrix-ii	2024-08-16 10:52:41.495	2024-08-16 10:52:41.495
array	majority-element	2024-08-16 10:53:01.364	2024-08-16 10:53:01.364
string	valid-parentheses	2024-08-16 10:53:01.364	2024-08-16 10:53:01.364
hash-table	minimum-common-value	2024-08-16 10:53:01.993	2024-08-16 10:53:01.993
array	max-consecutive-ones	2024-08-16 10:53:02.146	2024-08-16 10:53:02.146
simulation	pass-the-pillow	2024-08-16 10:53:31.447	2024-08-16 10:53:31.447
geometry	rectangle-overlap	2024-08-16 10:53:31.556	2024-08-16 10:53:31.556
array	maximum-distance-in-arrays	2024-08-17 06:19:01.187	2024-08-17 06:19:01.187
array	crawler-log-folder	2024-08-17 06:19:01.665	2024-08-17 06:19:01.665
union-find	longest-consecutive-sequence	2024-08-17 06:19:03.408	2024-08-17 06:19:03.408
string	add-binary	2024-08-17 06:19:04.133	2024-08-17 06:19:04.133
binary-tree	delete-nodes-and-return-forest	2024-08-17 06:19:04.384	2024-08-17 06:19:04.384
math	excel-sheet-column-number	2024-08-17 06:21:03.814	2024-08-17 06:21:03.814
array	two-sum	2024-08-16 10:52:41.423	2024-08-16 10:52:41.423
array	set-matrix-zeroes	2024-08-16 10:52:41.435	2024-08-16 10:52:41.435
two-pointers	squares-of-a-sorted-array	2024-08-16 10:52:41.46	2024-08-16 10:52:41.46
binary-tree	flatten-binary-tree-to-linked-list	2024-08-16 10:52:41.461	2024-08-16 10:52:41.461
binary-tree	binary-tree-inorder-traversal	2024-08-16 10:52:41.507	2024-08-16 10:52:41.507
two-pointers	container-with-most-water	2024-08-16 10:52:41.62	2024-08-16 10:52:41.62
string	fizz-buzz	2024-08-16 10:52:41.742	2024-08-16 10:52:41.742
two-pointers	sort-list	2024-08-16 10:52:41.862	2024-08-16 10:52:41.862
string	largest-odd-number-in-string	2024-08-16 10:52:41.864	2024-08-16 10:52:41.864
divide-and-conquer	majority-element	2024-08-16 10:53:01.364	2024-08-16 10:53:01.364
array	number-of-senior-citizens	2024-08-16 10:53:01.364	2024-08-16 10:53:01.364
math	water-bottles	2024-08-16 10:53:01.801	2024-08-16 10:53:01.801
linked-list	middle-of-the-linked-list	2024-08-16 10:53:01.9	2024-08-16 10:53:01.9
recursion	integer-to-english-words	2024-08-16 10:53:01.988	2024-08-16 10:53:01.988
database	article-views-i	2024-08-16 10:53:01.995	2024-08-16 10:53:01.995
depth-first-search	minimum-number-of-days-to-disconnect-island	2024-08-16 10:53:02.412	2024-08-16 10:53:02.412
two-pointers	count-pairs-whose-sum-is-less-than-target	2024-08-16 10:53:02.433	2024-08-16 10:53:02.433
counting	number-of-good-pairs	2024-08-16 10:53:02.47	2024-08-16 10:53:02.47
math	pass-the-pillow	2024-08-16 10:53:31.447	2024-08-16 10:53:31.447
array	spiral-matrix-iii	2024-08-16 10:53:31.556	2024-08-16 10:53:31.556
dynamic-programming	longest-increasing-subsequence	2024-08-17 06:19:01.188	2024-08-17 06:19:01.188
array	pascals-triangle	2024-08-17 06:19:01.664	2024-08-17 06:19:01.664
matrix	rotate-image	2024-08-17 06:19:02.222	2024-08-17 06:19:02.222
binary-search	find-k-th-smallest-pair-distance	2024-08-17 06:19:03.056	2024-08-17 06:19:03.056
hash-table	destination-city	2024-08-17 06:19:03.059	2024-08-17 06:19:03.059
prefix-sum	range-sum-query-immutable	2024-08-17 06:19:03.06	2024-08-17 06:19:03.06
monotonic-stack	next-greater-element-i	2024-08-17 06:19:03.061	2024-08-17 06:19:03.061
sorting	group-anagrams	2024-08-17 06:19:03.402	2024-08-17 06:19:03.402
greedy	lemonade-change	2024-08-17 06:19:04.132	2024-08-17 06:19:04.132
depth-first-search	delete-nodes-and-return-forest	2024-08-17 06:19:04.384	2024-08-17 06:19:04.384
math	insert-delete-getrandom-o1	2024-08-17 06:35:21.754	2024-08-17 06:35:21.754
hash-table	two-sum	2024-08-16 10:52:41.423	2024-08-16 10:52:41.423
linked-list	merge-two-sorted-lists	2024-08-16 10:52:41.46	2024-08-16 10:52:41.46
divide-and-conquer	sort-an-array	2024-08-16 10:52:41.492	2024-08-16 10:52:41.492
array	two-sum-ii-input-array-is-sorted	2024-08-16 10:52:41.492	2024-08-16 10:52:41.492
matrix	spiral-matrix-ii	2024-08-16 10:52:41.495	2024-08-16 10:52:41.495
math	add-two-numbers	2024-08-16 10:52:41.618	2024-08-16 10:52:41.618
simulation	fizz-buzz	2024-08-16 10:52:41.742	2024-08-16 10:52:41.742
sorting	sort-list	2024-08-16 10:52:41.862	2024-08-16 10:52:41.862
sorting	valid-anagram	2024-08-16 10:52:41.863	2024-08-16 10:52:41.863
hash-table	majority-element	2024-08-16 10:53:01.364	2024-08-16 10:53:01.364
stack	valid-parentheses	2024-08-16 10:53:01.364	2024-08-16 10:53:01.364
database	find-customer-referee	2024-08-16 10:53:01.995	2024-08-16 10:53:01.995
greedy	assign-cookies	2024-08-16 10:53:02.146	2024-08-16 10:53:02.146
binary-search	search-insert-position	2024-08-16 10:53:02.149	2024-08-16 10:53:02.149
binary-search	missing-number	2024-08-16 10:53:02.15	2024-08-16 10:53:02.15
bit-manipulation	reverse-bits	2024-08-16 10:53:02.159	2024-08-16 10:53:02.159
linked-list	remove-duplicates-from-sorted-list	2024-08-16 10:53:02.164	2024-08-16 10:53:02.164
matrix	richest-customer-wealth	2024-08-16 10:53:02.226	2024-08-16 10:53:02.226
matrix	minimum-number-of-days-to-disconnect-island	2024-08-16 10:53:02.412	2024-08-16 10:53:02.412
two-pointers	strictly-palindromic-number	2024-08-16 10:53:02.419	2024-08-16 10:53:02.419
binary-search	find-first-and-last-position-of-element-in-sorted-array	2024-08-16 10:53:02.43	2024-08-16 10:53:02.43
array	check-if-array-is-sorted-and-rotated	2024-08-16 10:53:02.432	2024-08-16 10:53:02.432
matrix	find-valid-matrix-given-row-and-column-sums	2024-08-16 10:53:21.364	2024-08-16 10:53:21.364
hash-table	jewels-and-stones	2024-08-16 10:53:31.556	2024-08-16 10:53:31.556
greedy	maximum-distance-in-arrays	2024-08-17 06:19:01.187	2024-08-17 06:19:01.187
stack	maximum-nesting-depth-of-the-parentheses	2024-08-17 06:19:01.665	2024-08-17 06:19:01.665
greedy	minimum-number-of-arrows-to-burst-balloons	2024-08-17 06:19:03.402	2024-08-17 06:19:03.402
simulation	game-of-life	2024-08-17 06:19:03.404	2024-08-17 06:19:03.404
sorting	merge-intervals	2024-08-17 06:19:03.407	2024-08-17 06:19:03.407
hash-table	contains-duplicate-ii	2024-08-17 06:19:03.409	2024-08-17 06:19:03.409
prefix-sum	product-of-array-except-self	2024-08-17 06:35:21.754	2024-08-17 06:35:21.754
hash-table	set-matrix-zeroes	2024-08-16 10:52:41.435	2024-08-16 10:52:41.435
string-matching	rotate-string	2024-08-16 10:52:41.488	2024-08-16 10:52:41.488
string	ransom-note	2024-08-16 10:52:41.743	2024-08-16 10:52:41.743
linked-list	sort-list	2024-08-16 10:52:41.862	2024-08-16 10:52:41.862
array	make-two-arrays-equal-by-reversing-subarrays	2024-08-16 10:53:01.364	2024-08-16 10:53:01.364
string	roman-to-integer	2024-08-16 10:53:01.766	2024-08-16 10:53:01.766
two-pointers	palindrome-linked-list	2024-08-16 10:53:01.767	2024-08-16 10:53:01.767
simulation	water-bottles	2024-08-16 10:53:01.801	2024-08-16 10:53:01.801
string	integer-to-english-words	2024-08-16 10:53:01.988	2024-08-16 10:53:01.988
string	minimum-number-of-pushes-to-type-word-ii	2024-08-16 10:53:01.991	2024-08-16 10:53:01.991
two-pointers	merge-sorted-array	2024-08-16 10:53:02.146	2024-08-16 10:53:02.146
hash-table	missing-number	2024-08-16 10:53:02.15	2024-08-16 10:53:02.15
string	sort-the-people	2024-08-16 10:53:02.413	2024-08-16 10:53:02.413
string	first-unique-character-in-a-string	2024-08-16 10:53:11.621	2024-08-16 10:53:11.621
greedy	find-valid-matrix-given-row-and-column-sums	2024-08-16 10:53:21.364	2024-08-16 10:53:21.364
math	rectangle-overlap	2024-08-16 10:53:31.556	2024-08-16 10:53:31.556
hash-table	first-missing-positive	2024-08-17 06:19:01.187	2024-08-17 06:19:01.187
string	removing-stars-from-a-string	2024-08-17 06:19:01.665	2024-08-17 06:19:01.665
game-theory	vowels-game-in-a-string	2024-08-17 06:19:02.222	2024-08-17 06:19:02.222
array	minimum-number-of-arrows-to-burst-balloons	2024-08-17 06:19:03.402	2024-08-17 06:19:03.402
math	climbing-stairs	2024-08-17 06:19:03.847	2024-08-17 06:19:03.847
array	average-waiting-time	2024-08-17 06:19:04.384	2024-08-17 06:19:04.384
design	insert-delete-getrandom-o1	2024-08-17 06:35:21.754	2024-08-17 06:35:21.754
two-pointers	sort-colors	2024-08-16 10:52:41.435	2024-08-16 10:52:41.435
sorting	sort-an-array	2024-08-16 10:52:41.492	2024-08-16 10:52:41.492
simulation	spiral-matrix-ii	2024-08-16 10:52:41.495	2024-08-16 10:52:41.495
hash-table	ransom-note	2024-08-16 10:52:41.742	2024-08-16 10:52:41.742
two-pointers	reverse-string	2024-08-16 10:52:41.743	2024-08-16 10:52:41.743
string	count-the-number-of-vowel-strings-in-range	2024-08-16 10:52:41.815	2024-08-16 10:52:41.815
linked-list	delete-the-middle-node-of-a-linked-list	2024-08-16 10:52:41.863	2024-08-16 10:52:41.863
sorting	make-two-arrays-equal-by-reversing-subarrays	2024-08-16 10:53:01.364	2024-08-16 10:53:01.364
string	number-of-senior-citizens	2024-08-16 10:53:01.364	2024-08-16 10:53:01.364
hash-table	roman-to-integer	2024-08-16 10:53:01.766	2024-08-16 10:53:01.766
linked-list	delete-node-in-a-linked-list	2024-08-16 10:53:01.767	2024-08-16 10:53:01.767
math	rotate-array	2024-08-16 10:53:01.899	2024-08-16 10:53:01.899
string	find-the-index-of-the-first-occurrence-in-a-string	2024-08-16 10:53:01.9	2024-08-16 10:53:01.9
two-pointers	remove-duplicates-from-sorted-array	2024-08-16 10:53:02.146	2024-08-16 10:53:02.146
array	third-maximum-number	2024-08-16 10:53:02.148	2024-08-16 10:53:02.148
linked-list	merge-in-between-linked-lists	2024-08-16 10:53:02.153	2024-08-16 10:53:02.153
string	simplify-path	2024-08-16 10:53:02.158	2024-08-16 10:53:02.158
math	strictly-palindromic-number	2024-08-16 10:53:02.419	2024-08-16 10:53:02.419
array	count-pairs-whose-sum-is-less-than-target	2024-08-16 10:53:02.433	2024-08-16 10:53:02.433
string	find-words-containing-character	2024-08-16 10:53:02.467	2024-08-16 10:53:02.467
array	three-consecutive-odds	2024-08-16 10:53:11.619	2024-08-16 10:53:11.619
array	lucky-numbers-in-a-matrix	2024-08-16 10:53:21.364	2024-08-16 10:53:21.364
matrix	spiral-matrix-iii	2024-08-16 10:53:31.556	2024-08-16 10:53:31.556
prefix-sum	subarray-sum-equals-k	2024-08-17 06:19:01.188	2024-08-17 06:19:01.188
memoization	fibonacci-number	2024-08-17 06:19:02.222	2024-08-17 06:19:02.222
dynamic-programming	pascals-triangle-ii	2024-08-17 06:19:03.06	2024-08-17 06:19:03.06
sorting	minimum-number-of-arrows-to-burst-balloons	2024-08-17 06:19:03.402	2024-08-17 06:19:03.402
matrix	valid-sudoku	2024-08-17 06:19:03.412	2024-08-17 06:19:03.412
randomized	insert-delete-getrandom-o1	2024-08-17 06:35:21.754	2024-08-17 06:35:21.754
array	sort-colors	2024-08-16 10:52:41.435	2024-08-16 10:52:41.435
linked-list	flatten-binary-tree-to-linked-list	2024-08-16 10:52:41.461	2024-08-16 10:52:41.461
heap-priority-queue	sort-an-array	2024-08-16 10:52:41.492	2024-08-16 10:52:41.492
greedy	candy	2024-08-16 10:52:41.495	2024-08-16 10:52:41.495
dynamic-programming	coin-change-ii	2024-08-16 10:52:41.62	2024-08-16 10:52:41.62
counting	ransom-note	2024-08-16 10:52:41.742	2024-08-16 10:52:41.742
two-pointers	intersection-of-two-linked-lists	2024-08-16 10:52:41.743	2024-08-16 10:52:41.743
array	median-of-two-sorted-arrays	2024-08-16 10:52:41.813	2024-08-16 10:52:41.813
array	maximum-value-of-a-string-in-an-array	2024-08-16 10:52:41.814	2024-08-16 10:52:41.814
divide-and-conquer	sort-list	2024-08-16 10:52:41.862	2024-08-16 10:52:41.862
string	valid-anagram	2024-08-16 10:52:41.863	2024-08-16 10:52:41.863
counting	majority-element	2024-08-16 10:53:01.364	2024-08-16 10:53:01.364
math	find-the-winner-of-the-circular-game	2024-08-16 10:53:01.801	2024-08-16 10:53:01.801
recursion	reverse-linked-list	2024-08-16 10:53:01.9	2024-08-16 10:53:01.9
two-pointers	middle-of-the-linked-list	2024-08-16 10:53:01.9	2024-08-16 10:53:01.9
two-pointers	assign-cookies	2024-08-16 10:53:02.146	2024-08-16 10:53:02.146
math	missing-number	2024-08-16 10:53:02.15	2024-08-16 10:53:02.15
divide-and-conquer	reverse-bits	2024-08-16 10:53:02.159	2024-08-16 10:53:02.159
strongly-connected-component	minimum-number-of-days-to-disconnect-island	2024-08-16 10:53:02.412	2024-08-16 10:53:02.412
array	search-in-rotated-sorted-array	2024-08-16 10:53:02.418	2024-08-16 10:53:02.418
array	final-value-of-variable-after-performing-operations	2024-08-16 10:53:11.618	2024-08-16 10:53:11.618
math	ugly-number	2024-08-16 10:53:21.363	2024-08-16 10:53:21.363
simulation	spiral-matrix-iii	2024-08-16 10:53:31.557	2024-08-16 10:53:31.557
array	first-missing-positive	2024-08-17 06:19:01.187	2024-08-17 06:19:01.187
string	maximum-nesting-depth-of-the-parentheses	2024-08-17 06:19:01.665	2024-08-17 06:19:01.665
string	minimum-changes-to-make-alternating-binary-string	2024-08-17 06:19:03.057	2024-08-17 06:19:03.057
array	destination-city	2024-08-17 06:19:03.059	2024-08-17 06:19:03.059
string	maximum-number-of-balloons	2024-08-17 06:19:03.06	2024-08-17 06:19:03.06
array	find-pivot-index	2024-08-17 06:19:03.061	2024-08-17 06:19:03.061
matrix	game-of-life	2024-08-17 06:19:03.403	2024-08-17 06:19:03.403
two-pointers	rotate-list	2024-08-17 06:19:03.847	2024-08-17 06:19:03.847
array	insert-delete-getrandom-o1	2024-08-17 06:35:21.754	2024-08-17 06:35:21.754
matrix	set-matrix-zeroes	2024-08-16 10:52:41.435	2024-08-16 10:52:41.435
sorting	squares-of-a-sorted-array	2024-08-16 10:52:41.461	2024-08-16 10:52:41.461
math	fizz-buzz	2024-08-16 10:52:41.742	2024-08-16 10:52:41.742
hash-table	intersection-of-two-linked-lists	2024-08-16 10:52:41.743	2024-08-16 10:52:41.743
binary-search	median-of-two-sorted-arrays	2024-08-16 10:52:41.813	2024-08-16 10:52:41.813
array	maximum-product-difference-between-two-pairs	2024-08-16 10:52:41.814	2024-08-16 10:52:41.814
greedy	largest-odd-number-in-string	2024-08-16 10:52:41.864	2024-08-16 10:52:41.864
array	kth-distinct-string-in-an-array	2024-08-16 10:53:01.364	2024-08-16 10:53:01.364
math	palindrome-number	2024-08-16 10:53:01.364	2024-08-16 10:53:01.364
stack	palindrome-linked-list	2024-08-16 10:53:01.767	2024-08-16 10:53:01.767
simulation	find-the-winner-of-the-circular-game	2024-08-16 10:53:01.801	2024-08-16 10:53:01.801
linked-list	linked-list-cycle	2024-08-16 10:53:01.804	2024-08-16 10:53:01.804
sorting	minimum-number-of-pushes-to-type-word-ii	2024-08-16 10:53:01.992	2024-08-16 10:53:01.992
sorting	assign-cookies	2024-08-16 10:53:02.146	2024-08-16 10:53:02.146
sorting	third-maximum-number	2024-08-16 10:53:02.148	2024-08-16 10:53:02.148
sorting	missing-number	2024-08-16 10:53:02.15	2024-08-16 10:53:02.15
bit-manipulation	single-number	2024-08-16 10:53:02.159	2024-08-16 10:53:02.159
array	plus-one	2024-08-16 10:53:02.4	2024-08-16 10:53:02.4
breadth-first-search	minimum-number-of-days-to-disconnect-island	2024-08-16 10:53:02.412	2024-08-16 10:53:02.412
math	nim-game	2024-08-16 10:53:02.419	2024-08-16 10:53:02.419
binary-search	count-pairs-whose-sum-is-less-than-target	2024-08-16 10:53:02.433	2024-08-16 10:53:02.433
math	number-of-good-pairs	2024-08-16 10:53:02.47	2024-08-16 10:53:02.47
hash-table	first-unique-character-in-a-string	2024-08-16 10:53:11.62	2024-08-16 10:53:11.62
array	jump-game	2024-08-16 10:53:31.557	2024-08-16 10:53:31.557
binary-search	longest-increasing-subsequence	2024-08-17 06:19:01.188	2024-08-17 06:19:01.188
string	crawler-log-folder	2024-08-17 06:19:01.665	2024-08-17 06:19:01.665
hash-table	maximum-number-of-balloons	2024-08-17 06:19:03.06	2024-08-17 06:19:03.06
array	next-greater-element-i	2024-08-17 06:19:03.061	2024-08-17 06:19:03.061
sliding-window	minimum-window-substring	2024-08-17 06:19:03.404	2024-08-17 06:19:03.404
array	merge-intervals	2024-08-17 06:19:03.407	2024-08-17 06:19:03.407
math	happy-number	2024-08-17 06:19:03.409	2024-08-17 06:19:03.409
simulation	spiral-matrix	2024-08-17 06:19:03.411	2024-08-17 06:19:03.411
dynamic-programming	climbing-stairs	2024-08-17 06:19:03.847	2024-08-17 06:19:03.847
linked-list	remove-nth-node-from-end-of-list	2024-08-16 10:52:41.46	2024-08-16 10:52:41.46
tree	flatten-binary-tree-to-linked-list	2024-08-16 10:52:41.461	2024-08-16 10:52:41.461
counting-sort	sort-an-array	2024-08-16 10:52:41.492	2024-08-16 10:52:41.492
two-pointers	two-sum-ii-input-array-is-sorted	2024-08-16 10:52:41.492	2024-08-16 10:52:41.492
math	largest-odd-number-in-string	2024-08-16 10:52:41.864	2024-08-16 10:52:41.864
hash-table	kth-distinct-string-in-an-array	2024-08-16 10:53:01.364	2024-08-16 10:53:01.364
counting	sum-of-unique-elements	2024-08-16 10:53:01.768	2024-08-16 10:53:01.768
string	reverse-substrings-between-each-pair-of-parentheses	2024-08-16 10:53:01.8	2024-08-16 10:53:01.8
linked-list	odd-even-linked-list	2024-08-16 10:53:01.801	2024-08-16 10:53:01.801
two-pointers	linked-list-cycle	2024-08-16 10:53:01.804	2024-08-16 10:53:01.804
sliding-window	minimum-swaps-to-group-all-1s-together-ii	2024-08-16 10:53:01.993	2024-08-16 10:53:01.993
array	remove-duplicates-from-sorted-array	2024-08-16 10:53:02.146	2024-08-16 10:53:02.146
array	contains-duplicate	2024-08-16 10:53:02.148	2024-08-16 10:53:02.148
stack	simplify-path	2024-08-16 10:53:02.158	2024-08-16 10:53:02.158
array	single-number	2024-08-16 10:53:02.159	2024-08-16 10:53:02.159
array	concatenation-of-array	2024-08-16 10:53:11.619	2024-08-16 10:53:11.619
queue	first-unique-character-in-a-string	2024-08-16 10:53:11.621	2024-08-16 10:53:11.621
string	score-of-a-string	2024-08-16 10:53:21.363	2024-08-16 10:53:21.363
sorting	3sum	2024-08-16 10:53:21.364	2024-08-16 10:53:21.364
bit-manipulation	hamming-distance	2024-08-17 06:19:04.133	2024-08-17 06:19:04.133
tree	delete-nodes-and-return-forest	2024-08-17 06:19:04.384	2024-08-17 06:19:04.384
greedy	jump-game-ii	2024-08-17 06:35:21.754	2024-08-17 06:35:21.754
array	remove-duplicates-from-sorted-array-ii	2024-08-16 10:53:31.557	2024-08-16 10:53:31.557
array	longest-increasing-subsequence	2024-08-17 06:19:01.188	2024-08-17 06:19:01.188
array	rotate-image	2024-08-17 06:19:02.222	2024-08-17 06:19:02.222
hash-table	group-anagrams	2024-08-17 06:19:03.402	2024-08-17 06:19:03.402
array	minimum-difference-between-largest-and-smallest-value-in-three-moves	2024-08-17 06:35:21.754	2024-08-17 06:35:21.754
recursion	merge-two-sorted-lists	2024-08-16 10:52:41.46	2024-08-16 10:52:41.46
array	sort-an-array	2024-08-16 10:52:41.492	2024-08-16 10:52:41.492
binary-search	two-sum-ii-input-array-is-sorted	2024-08-16 10:52:41.492	2024-08-16 10:52:41.492
string	reverse-string	2024-08-16 10:52:41.743	2024-08-16 10:52:41.743
hash-table	make-two-arrays-equal-by-reversing-subarrays	2024-08-16 10:53:01.364	2024-08-16 10:53:01.364
linked-list	palindrome-linked-list	2024-08-16 10:53:01.767	2024-08-16 10:53:01.767
array	binary-search	2024-08-16 10:53:01.804	2024-08-16 10:53:01.804
two-pointers	find-the-index-of-the-first-occurrence-in-a-string	2024-08-16 10:53:01.9	2024-08-16 10:53:01.9
array	minimum-swaps-to-group-all-1s-together-ii	2024-08-16 10:53:01.992	2024-08-16 10:53:01.992
array	assign-cookies	2024-08-16 10:53:02.146	2024-08-16 10:53:02.146
brainteaser	strictly-palindromic-number	2024-08-16 10:53:02.419	2024-08-16 10:53:02.419
array	find-first-and-last-position-of-element-in-sorted-array	2024-08-16 10:53:02.43	2024-08-16 10:53:02.43
hash-table	number-of-good-pairs	2024-08-16 10:53:02.47	2024-08-16 10:53:02.47
greedy	k-items-with-the-maximum-sum	2024-08-16 10:53:02.479	2024-08-16 10:53:02.479
simulation	concatenation-of-array	2024-08-16 10:53:11.619	2024-08-16 10:53:11.619
array	3sum	2024-08-16 10:53:21.363	2024-08-16 10:53:21.363
matrix	lucky-numbers-in-a-matrix	2024-08-16 10:53:21.364	2024-08-16 10:53:21.364
greedy	jump-game	2024-08-16 10:53:31.557	2024-08-16 10:53:31.557
hash-table	subarray-sum-equals-k	2024-08-17 06:19:01.188	2024-08-17 06:19:01.188
array	find-the-original-array-of-prefix-xor	2024-08-17 06:19:01.664	2024-08-17 06:19:01.664
recursion	fibonacci-number	2024-08-17 06:19:02.222	2024-08-17 06:19:02.222
string	string-to-integer-atoi	2024-08-17 06:19:03.057	2024-08-17 06:19:03.057
string	maximum-score-after-splitting-a-string	2024-08-17 06:19:03.06	2024-08-17 06:19:03.06
array	find-all-numbers-disappeared-in-an-array	2024-08-17 06:19:03.06	2024-08-17 06:19:03.06
hash-table	minimum-window-substring	2024-08-17 06:19:03.404	2024-08-17 06:19:03.404
two-pointers	remove-nth-node-from-end-of-list	2024-08-16 10:52:41.46	2024-08-16 10:52:41.46
string	rotate-string	2024-08-16 10:52:41.487	2024-08-16 10:52:41.487
array	coin-change-ii	2024-08-16 10:52:41.62	2024-08-16 10:52:41.62
bit-manipulation	number-of-steps-to-reduce-a-number-to-zero	2024-08-16 10:52:41.742	2024-08-16 10:52:41.742
linked-list	intersection-of-two-linked-lists	2024-08-16 10:52:41.743	2024-08-16 10:52:41.743
string	path-crossing	2024-08-16 10:52:41.813	2024-08-16 10:52:41.813
hash-table	valid-anagram	2024-08-16 10:52:41.863	2024-08-16 10:52:41.863
counting	kth-distinct-string-in-an-array	2024-08-16 10:53:01.364	2024-08-16 10:53:01.364
math	roman-to-integer	2024-08-16 10:53:01.766	2024-08-16 10:53:01.766
recursion	palindrome-linked-list	2024-08-16 10:53:01.767	2024-08-16 10:53:01.767
stack	reverse-substrings-between-each-pair-of-parentheses	2024-08-16 10:53:01.8	2024-08-16 10:53:01.8
array	find-the-winner-of-the-circular-game	2024-08-16 10:53:01.801	2024-08-16 10:53:01.801
two-pointers	remove-element	2024-08-16 10:53:01.899	2024-08-16 10:53:01.899
math	integer-to-english-words	2024-08-16 10:53:01.987	2024-08-16 10:53:01.987
greedy	minimum-number-of-pushes-to-type-word-ii	2024-08-16 10:53:01.992	2024-08-16 10:53:01.992
binary-search	search-in-rotated-sorted-array	2024-08-16 10:53:02.418	2024-08-16 10:53:02.418
array	insert-interval	2024-08-17 06:19:03.407	2024-08-17 06:19:03.407
hash-table	longest-consecutive-sequence	2024-08-17 06:19:03.408	2024-08-17 06:19:03.408
counting-sort	h-index	2024-08-17 06:35:21.754	2024-08-17 06:35:21.754
dynamic-programming	jump-game	2024-08-16 10:53:31.557	2024-08-16 10:53:31.557
stack	crawler-log-folder	2024-08-17 06:19:01.665	2024-08-17 06:19:01.665
math	rotate-image	2024-08-17 06:19:02.222	2024-08-17 06:19:02.222
array	pascals-triangle-ii	2024-08-17 06:19:03.06	2024-08-17 06:19:03.06
prefix-sum	find-pivot-index	2024-08-17 06:19:03.061	2024-08-17 06:19:03.061
hash-table	word-pattern	2024-08-17 06:19:03.403	2024-08-17 06:19:03.403
linked-list	find-the-minimum-and-maximum-number-of-nodes-between-critical-points	2024-08-17 06:19:03.849	2024-08-17 06:19:03.849
dynamic-programming	is-subsequence	2024-08-17 06:19:04.38	2024-08-17 06:19:04.38
sorting	h-index	2024-08-17 06:35:21.754	2024-08-17 06:35:21.754
depth-first-search	binary-tree-inorder-traversal	2024-08-16 10:52:41.507	2024-08-16 10:52:41.507
dynamic-programming	longest-palindromic-substring	2024-08-16 10:52:41.514	2024-08-16 10:52:41.514
array	running-sum-of-1d-array	2024-08-16 10:52:41.743	2024-08-16 10:52:41.743
string	kth-distinct-string-in-an-array	2024-08-16 10:53:01.364	2024-08-16 10:53:01.364
recursion	find-the-winner-of-the-circular-game	2024-08-16 10:53:01.801	2024-08-16 10:53:01.801
counting	maximum-count-of-positive-integer-and-negative-integer	2024-08-16 10:53:01.803	2024-08-16 10:53:01.803
two-pointers	rotate-array	2024-08-16 10:53:01.899	2024-08-16 10:53:01.899
math	powx-n	2024-08-16 10:53:01.9	2024-08-16 10:53:01.9
array	merge-sorted-array	2024-08-16 10:53:02.146	2024-08-16 10:53:02.146
array	move-zeroes	2024-08-16 10:53:02.149	2024-08-16 10:53:02.149
bit-manipulation	number-of-1-bits	2024-08-16 10:53:02.16	2024-08-16 10:53:02.16
array	shuffle-the-array	2024-08-16 10:53:02.439	2024-08-16 10:53:02.439
array	find-words-containing-character	2024-08-16 10:53:02.467	2024-08-16 10:53:02.467
array	number-of-good-pairs	2024-08-16 10:53:02.47	2024-08-16 10:53:02.47
math	k-items-with-the-maximum-sum	2024-08-16 10:53:02.479	2024-08-16 10:53:02.479
sorting	sort-the-jumbled-numbers	2024-08-16 10:53:21.363	2024-08-16 10:53:21.363
array	n-repeated-element-in-size-2n-array	2024-08-16 10:53:21.605	2024-08-16 10:53:21.605
two-pointers	remove-duplicates-from-sorted-array-ii	2024-08-16 10:53:31.557	2024-08-16 10:53:31.557
dynamic-programming	pascals-triangle	2024-08-17 06:19:01.664	2024-08-17 06:19:01.664
math	fibonacci-number	2024-08-17 06:19:02.222	2024-08-17 06:19:02.222
sorting	find-k-th-smallest-pair-distance	2024-08-17 06:19:03.056	2024-08-17 06:19:03.056
string	destination-city	2024-08-17 06:19:03.059	2024-08-17 06:19:03.059
hash-table	happy-number	2024-08-17 06:19:03.409	2024-08-17 06:19:03.409
matrix	spiral-matrix	2024-08-17 06:19:03.411	2024-08-17 06:19:03.411
math	add-binary	2024-08-17 06:19:04.133	2024-08-17 06:19:04.133
dynamic-programming	jump-game-ii	2024-08-17 06:35:21.754	2024-08-17 06:35:21.754
tree	binary-tree-inorder-traversal	2024-08-16 10:52:41.507	2024-08-16 10:52:41.507
recursion	add-two-numbers	2024-08-16 10:52:41.619	2024-08-16 10:52:41.619
two-pointers	valid-palindrome	2024-08-16 10:52:41.619	2024-08-16 10:52:41.619
divide-and-conquer	median-of-two-sorted-arrays	2024-08-16 10:52:41.813	2024-08-16 10:52:41.813
string	maximum-value-of-a-string-in-an-array	2024-08-16 10:52:41.814	2024-08-16 10:52:41.814
array	evaluate-reverse-polish-notation	2024-08-16 10:53:01.364	2024-08-16 10:53:01.364
array	sum-of-unique-elements	2024-08-16 10:53:01.768	2024-08-16 10:53:01.768
queue	find-the-winner-of-the-circular-game	2024-08-16 10:53:01.801	2024-08-16 10:53:01.801
binary-search	binary-search	2024-08-16 10:53:01.804	2024-08-16 10:53:01.804
binary-search	minimum-common-value	2024-08-16 10:53:01.993	2024-08-16 10:53:01.993
sorting	merge-sorted-array	2024-08-16 10:53:02.146	2024-08-16 10:53:02.146
array	richest-customer-wealth	2024-08-16 10:53:02.226	2024-08-16 10:53:02.226
hash-table	sort-the-people	2024-08-16 10:53:02.413	2024-08-16 10:53:02.413
game-theory	nim-game	2024-08-16 10:53:02.419	2024-08-16 10:53:02.419
sorting	count-pairs-whose-sum-is-less-than-target	2024-08-16 10:53:02.433	2024-08-16 10:53:02.433
array	find-valid-matrix-given-row-and-column-sums	2024-08-16 10:53:21.364	2024-08-16 10:53:21.364
divide-and-conquer	maximum-subarray	2024-08-17 05:05:41.767	2024-08-17 05:05:41.767
stack	removing-stars-from-a-string	2024-08-17 06:19:01.665	2024-08-17 06:19:01.665
dynamic-programming	fibonacci-number	2024-08-17 06:19:02.222	2024-08-17 06:19:02.222
array	find-words-that-can-be-formed-by-characters	2024-08-17 06:19:03.06	2024-08-17 06:19:03.06
counting	maximum-number-of-balloons	2024-08-17 06:19:03.06	2024-08-17 06:19:03.06
two-pointers	happy-number	2024-08-17 06:19:03.409	2024-08-17 06:19:03.409
array	spiral-matrix	2024-08-17 06:19:03.411	2024-08-17 06:19:03.411
simulation	add-binary	2024-08-17 06:19:04.133	2024-08-17 06:19:04.133
two-pointers	is-subsequence	2024-08-17 06:19:04.38	2024-08-17 06:19:04.38
stack	binary-tree-inorder-traversal	2024-08-16 10:52:41.507	2024-08-16 10:52:41.507
string	longest-palindromic-substring	2024-08-16 10:52:41.514	2024-08-16 10:52:41.514
linked-list	add-two-numbers	2024-08-16 10:52:41.618	2024-08-16 10:52:41.618
string	valid-palindrome	2024-08-16 10:52:41.62	2024-08-16 10:52:41.62
math	number-of-steps-to-reduce-a-number-to-zero	2024-08-16 10:52:41.742	2024-08-16 10:52:41.742
linked-list	merge-nodes-in-between-zeros	2024-08-16 10:53:01.802	2024-08-16 10:53:01.802
array	maximum-count-of-positive-integer-and-negative-integer	2024-08-16 10:53:01.803	2024-08-16 10:53:01.803
array	minimum-common-value	2024-08-16 10:53:01.992	2024-08-16 10:53:01.992
two-pointers	reverse-words-in-a-string	2024-08-16 10:53:02.136	2024-08-16 10:53:02.136
string	reverse-words-in-a-string	2024-08-16 10:53:02.142	2024-08-16 10:53:02.142
string	length-of-last-word	2024-08-16 10:53:02.145	2024-08-16 10:53:02.145
math	plus-one	2024-08-16 10:53:02.4	2024-08-16 10:53:02.4
array	minimum-number-of-days-to-disconnect-island	2024-08-16 10:53:02.412	2024-08-16 10:53:02.412
brainteaser	nim-game	2024-08-16 10:53:02.419	2024-08-16 10:53:02.419
string	final-value-of-variable-after-performing-operations	2024-08-16 10:53:11.618	2024-08-16 10:53:11.618
design	min-stack	2024-08-17 06:19:04.383	2024-08-17 06:19:04.383
hash-table	delete-nodes-and-return-forest	2024-08-17 06:19:04.384	2024-08-17 06:19:04.384
hash-table	insert-delete-getrandom-o1	2024-08-17 06:35:21.754	2024-08-17 06:35:21.754
dynamic-programming	maximum-subarray	2024-08-17 05:05:41.767	2024-08-17 05:05:41.767
simulation	removing-stars-from-a-string	2024-08-17 06:19:01.665	2024-08-17 06:19:01.665
brainteaser	vowels-game-in-a-string	2024-08-17 06:19:02.222	2024-08-17 06:19:02.222
array	find-k-th-smallest-pair-distance	2024-08-17 06:19:03.056	2024-08-17 06:19:03.056
string	find-words-that-can-be-formed-by-characters	2024-08-17 06:19:03.06	2024-08-17 06:19:03.06
design	range-sum-query-immutable	2024-08-17 06:19:03.06	2024-08-17 06:19:03.06
stack	next-greater-element-i	2024-08-17 06:19:03.061	2024-08-17 06:19:03.061
two-pointers	longest-palindromic-substring	2024-08-16 10:52:41.514	2024-08-16 10:52:41.514
string	longest-common-prefix	2024-08-16 10:52:41.517	2024-08-16 10:52:41.517
array	find-numbers-with-even-number-of-digits	2024-08-16 10:52:41.742	2024-08-16 10:52:41.742
hash-table	path-crossing	2024-08-16 10:52:41.813	2024-08-16 10:52:41.813
sorting	maximum-product-difference-between-two-pairs	2024-08-16 10:52:41.814	2024-08-16 10:52:41.814
string	count-and-say	2024-08-16 10:52:41.861	2024-08-16 10:52:41.861
hash-table	linked-list-cycle	2024-08-16 10:53:01.804	2024-08-16 10:53:01.804
hash-table	minimum-number-of-pushes-to-type-word-ii	2024-08-16 10:53:01.991	2024-08-16 10:53:01.991
database	recyclable-and-low-fat-products	2024-08-16 10:53:01.996	2024-08-16 10:53:01.996
sorting	contains-duplicate	2024-08-16 10:53:02.149	2024-08-16 10:53:02.149
array	missing-number	2024-08-16 10:53:02.15	2024-08-16 10:53:02.15
binary-search	sqrtx	2024-08-16 10:53:02.159	2024-08-16 10:53:02.159
array	sort-the-people	2024-08-16 10:53:02.413	2024-08-16 10:53:02.413
bit-manipulation	divide-two-integers	2024-08-16 10:53:21.364	2024-08-16 10:53:21.364
array	longest-consecutive-sequence	2024-08-17 06:19:03.408	2024-08-17 06:19:03.408
linked-list	rotate-list	2024-08-17 06:19:03.847	2024-08-17 06:19:03.847
greedy	minimum-difference-between-largest-and-smallest-value-in-three-moves	2024-08-17 06:35:21.754	2024-08-17 06:35:21.754
array	maximum-subarray	2024-08-17 05:05:41.767	2024-08-17 05:05:41.767
bit-manipulation	find-the-original-array-of-prefix-xor	2024-08-17 06:19:01.664	2024-08-17 06:19:01.664
string	vowels-game-in-a-string	2024-08-17 06:19:02.222	2024-08-17 06:19:02.222
prefix-sum	maximum-score-after-splitting-a-string	2024-08-17 06:19:03.06	2024-08-17 06:19:03.06
string	group-anagrams	2024-08-17 06:19:03.402	2024-08-17 06:19:03.402
memoization	climbing-stairs	2024-08-17 06:19:03.847	2024-08-17 06:19:03.847
array	lemonade-change	2024-08-17 06:19:04.132	2024-08-17 06:19:04.132
string	is-subsequence	2024-08-17 06:19:04.38	2024-08-17 06:19:04.38
stack	min-stack	2024-08-17 06:19:04.383	2024-08-17 06:19:04.383
array	delete-nodes-and-return-forest	2024-08-17 06:19:04.384	2024-08-17 06:19:04.384
array	product-of-array-except-self	2024-08-17 06:35:21.754	2024-08-17 06:35:21.754
trie	longest-common-prefix	2024-08-16 10:52:41.517	2024-08-16 10:52:41.517
array	container-with-most-water	2024-08-16 10:52:41.62	2024-08-16 10:52:41.62
array	count-the-number-of-vowel-strings-in-range	2024-08-16 10:52:41.815	2024-08-16 10:52:41.815
bit-manipulation	minimum-bit-flips-to-convert-number	2024-08-16 10:52:41.864	2024-08-16 10:52:41.864
hash-table	isomorphic-strings	2024-08-17 05:05:41.767	2024-08-17 05:05:41.767
math	reverse-integer	2024-08-17 06:19:02.222	2024-08-17 06:19:02.222
hash-table	find-words-that-can-be-formed-by-characters	2024-08-17 06:19:03.06	2024-08-17 06:19:03.06
array	range-sum-query-immutable	2024-08-17 06:19:03.06	2024-08-17 06:19:03.06
array	group-anagrams	2024-08-17 06:19:03.402	2024-08-17 06:19:03.402
string	minimum-window-substring	2024-08-17 06:19:03.404	2024-08-17 06:19:03.404
array	contains-duplicate-ii	2024-08-17 06:19:03.409	2024-08-17 06:19:03.409
hash-table	valid-sudoku	2024-08-17 06:19:03.412	2024-08-17 06:19:03.412
simulation	average-waiting-time	2024-08-17 06:19:04.384	2024-08-17 06:19:04.384
array	best-time-to-buy-and-sell-stock	2024-08-16 10:53:01.364	2024-08-16 10:53:01.364
stack	evaluate-reverse-polish-notation	2024-08-16 10:53:01.364	2024-08-16 10:53:01.364
binary-search	maximum-count-of-positive-integer-and-negative-integer	2024-08-16 10:53:01.803	2024-08-16 10:53:01.803
array	rotate-array	2024-08-16 10:53:01.899	2024-08-16 10:53:01.899
recursion	powx-n	2024-08-16 10:53:01.901	2024-08-16 10:53:01.901
database	big-countries	2024-08-16 10:53:01.995	2024-08-16 10:53:01.995
hash-table	contains-duplicate	2024-08-16 10:53:02.148	2024-08-16 10:53:02.148
bit-manipulation	missing-number	2024-08-16 10:53:02.15	2024-08-16 10:53:02.15
math	sqrtx	2024-08-16 10:53:02.159	2024-08-16 10:53:02.159
array	find-minimum-operations-to-make-all-elements-divisible-by-three	2024-08-16 10:53:11.618	2024-08-16 10:53:11.618
array	sort-the-jumbled-numbers	2024-08-16 10:53:21.363	2024-08-16 10:53:21.363
hash-table	n-repeated-element-in-size-2n-array	2024-08-16 10:53:21.605	2024-08-16 10:53:21.605
array	h-index	2024-08-17 06:35:21.754	2024-08-17 06:35:21.754
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" (id, email, password, role, "linkedIn", github, leetcode, class, stream, batch, "lastBackupTime", created_at, updated_at) FROM stdin;
22PC38 	22pc38@psgtech.ac.in	$2b$10$jagEOnmb8kyTPZNpKLCNHeO7peQ9fv3XjF/FIMguxxFvQvmyW3Iw.	STUDENT	\N	\N	vishnu_priya_m	22PC	CS	2022	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879
22PC01	abhilashnxt@gmail.com	$2b$10$gULJSlocNNyKEZVK80oiv.NTPHpHAW3/wUe4uV.KYCi5mfyDMH4Gq	STUDENT	\N	\N	AbhilaSh3028	22PC	CS	2022	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879
22PC04	rimurusama235@gmail.com	$2b$10$odGFL0kI2TJml2pOCazmROIk/X9J1p9VAdxsMA6naWbQ.76HjGh.y	STUDENT	\N	\N	MikeyDono25	22PC	CS	2022	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879
22PC14	jhss12ahariharan@gmail.com	$2b$10$7vSmiYwjz4V7FYikRhP6NO7vCq4Z31a1V5MumWgJSSVsOof6xh7uu	STUDENT	\N	\N	HariHolmes	22PC	CS	2022	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879
22PC15	22pc15@psgtech.ac.in	$2b$10$FmkpYoik8weunY0UoHTeS.PnWLT.J5C5ld4PFblTxWny4KGhhiCMm	STUDENT	\N	\N	jaishree_k	22PC	CS	2022	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879
22PC16	22pc16@psgtech.ac.in	$2b$10$TJKjyVMUZLOXn.ba55BPJ.nI0OW7QYX5tRFZvwOVqECDDAhQXRasu	STUDENT	\N	\N	karthika_v	22PC	CS	2022	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879
22PC17	22pc17@psgtech.ac.in	$2b$10$cS1XdLLy9baLHpguEgR5CePF0.gCnn59y4JO5UwAsXPQqATcGQZQS	STUDENT	\N	\N	L_Shambhavi	22PC	CS	2022	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879
c1234	c1234.amcs@psgtech.ac.in	$2b$10$eSUewL1JWLdExlYf78TUOu6ny4xy65..QitdKSjkJXDtlVd98WHFm	TUTOR	\N	\N	\N	22PC	CS	2022	2024-08-17 05:52:54.819	2024-08-17 05:52:54.819	2024-08-17 05:52:54.819
22PC20	22pc20@psgtech.ac.in	$2b$10$JFZu3deNokUJAyleOXu4i.EYlxb/4fODbtTRY8RpPRq9w..z7SO5W	STUDENT	\N	\N	Muthu_meenakshi	22PC	CS	2022	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879
22PC21	shansitashri@gmail.com	$2b$10$X9O1xirAMbpgC6X9JgO2huXuOG2gQ1OhWhkISq2Fv9r9bP6lLh/.O	STUDENT	\N	\N	shansita	22PC	CS	2022	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879
22PC23	22pc23@psgtech.ac.in	$2b$10$pyU.4I4NIVAeCEavs6nz8eF3n1IukIzXBhf1Uku9G/srnbD0DO1IK	STUDENT	\N	\N	learner_always	22PC	CS	2022	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879
22PC24	nidharshana0402@gmail.com	$2b$10$ZpOquk4.JDsralVLjZ4FYeqqJYG/KfHHugfKUD9gIs/Xa75/ubOxC	STUDENT	\N	\N	nidharshana 	22PC	CS	2022	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879
22PC27	ravivarma1204@gmail.com	$2b$10$y9QXrijqohZX95TeMpAwceJqHuPeC6o5sKIgNwtAgw/ubvBbb6hzK	STUDENT	\N	\N	Ravivarma1204	22PC	CS	2022	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879
22PC29	22pc29@psgtech.ac.in	$2b$10$0ajZcp.guCG9dsrgESyrYeyQkMDSYfC5azoMcCdw3P/PG2pO06QPq	STUDENT	\N	\N	samrithiv	22PC	CS	2022	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879
22PC19	22pc19@psgtech.ac.in	$2b$10$2cZDqY4lQLOdSXAB/HerUugOcAnae9cUZjLGGro3vumX3wuE02A3W	PLACEMENT_REPRESENTATIVE	\N	\N	mithunkarthick1610	22PC	CS	2022	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879	2024-08-17 07:04:20.578
22PC28	22pc28@psgtech.ac.in	$2b$10$2LsoTCVGI8UqxDWuLD53D.SVlBLMGYgVoypNFNZYhnJhChl1ftF82	PLACEMENT_REPRESENTATIVE	\N	\N	sai_venki	22PC	CS	2022	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879	2024-08-17 07:04:20.578
22PC30	22pc30@psgtech.ac.in	$2b$10$5C2m/TQEK60BgsxGCMy77Oh4ohPWQsgflmZstJY7OT3Tfrdzr1Foa	STUDENT	\N	\N	Sanj_24	22PC	CS	2022	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879
22PC33	shreenithimanivelan@gmail.com	$2b$10$pwHBWHrza4jYksFBbKyLJei4UtXIBq7eTKiSjjRoEcowWNJRKgpFG	STUDENT	\N	\N	Shreenithi_2003	22PC	CS	2022	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879
22PC35	varshni1802@gmail.com	$2b$10$QDVYcbIMSg/OLGPUiZiVy.b1JIvXUwJP94FpMJf/Fa/Km099zg7kq	STUDENT	\N	\N	SreeVarshni	22PC	CS	2022	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879
22PC37	22pc37@psgtech.ac.in	$2b$10$R5uZbZy6NCAXF3hPmKih9eT530wBDlxz17eHl/FRsow0s9Xh7EZWi	STUDENT	\N	\N	Vengateshwaran	22PC	CS	2022	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879	2024-08-17 06:43:48.879
\.


--
-- Data for Name: User_Problem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User_Problem" ("timestamp", created_at, "problemId", "userId") FROM stdin;
\.


--
-- Data for Name: User_Task; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User_Task" ("timestamp", "taskId", "userId", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: _ProblemToTopic; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."_ProblemToTopic" ("A", "B") FROM stdin;
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
c4d599bc-da40-4b6b-b2f1-ce63a4c1edf0	d18e5e64f5926350bceb96737f705617080c64ae8e0b5f7e643af9a0cb546f91	2024-08-15 20:01:33.478249+05:30	20240815143133_squashed_migration	\N	\N	2024-08-15 20:01:33.452616+05:30	1
\.


--
-- Name: Problem Problem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Problem"
    ADD CONSTRAINT "Problem_pkey" PRIMARY KEY (id);


--
-- Name: Task Task_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Task"
    ADD CONSTRAINT "Task_pkey" PRIMARY KEY (id);


--
-- Name: Topic_Problem Topic_Problem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Topic_Problem"
    ADD CONSTRAINT "Topic_Problem_pkey" PRIMARY KEY ("topicId", "problemId");


--
-- Name: Topic Topic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Topic"
    ADD CONSTRAINT "Topic_pkey" PRIMARY KEY (id);


--
-- Name: User_Problem User_Problem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User_Problem"
    ADD CONSTRAINT "User_Problem_pkey" PRIMARY KEY ("problemId", "userId");


--
-- Name: User_Task User_Task_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User_Task"
    ADD CONSTRAINT "User_Task_pkey" PRIMARY KEY ("taskId", "userId");


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Task_assignedById_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Task_assignedById_key" ON public."Task" USING btree ("assignedById");


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- Name: User_leetcode_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "User_leetcode_key" ON public."User" USING btree (leetcode);


--
-- Name: _ProblemToTopic_AB_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "_ProblemToTopic_AB_unique" ON public."_ProblemToTopic" USING btree ("A", "B");


--
-- Name: _ProblemToTopic_B_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "_ProblemToTopic_B_index" ON public."_ProblemToTopic" USING btree ("B");


--
-- Name: Task Task_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Task"
    ADD CONSTRAINT "Task_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Topic_Problem Topic_Problem_problemId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Topic_Problem"
    ADD CONSTRAINT "Topic_Problem_problemId_fkey" FOREIGN KEY ("problemId") REFERENCES public."Problem"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Topic_Problem Topic_Problem_topicId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Topic_Problem"
    ADD CONSTRAINT "Topic_Problem_topicId_fkey" FOREIGN KEY ("topicId") REFERENCES public."Topic"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: User_Problem User_Problem_problemId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User_Problem"
    ADD CONSTRAINT "User_Problem_problemId_fkey" FOREIGN KEY ("problemId") REFERENCES public."Problem"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: User_Problem User_Problem_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User_Problem"
    ADD CONSTRAINT "User_Problem_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: User_Task User_Task_taskId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User_Task"
    ADD CONSTRAINT "User_Task_taskId_fkey" FOREIGN KEY ("taskId") REFERENCES public."Task"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: User_Task User_Task_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User_Task"
    ADD CONSTRAINT "User_Task_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: _ProblemToTopic _ProblemToTopic_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_ProblemToTopic"
    ADD CONSTRAINT "_ProblemToTopic_A_fkey" FOREIGN KEY ("A") REFERENCES public."Problem"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _ProblemToTopic _ProblemToTopic_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_ProblemToTopic"
    ADD CONSTRAINT "_ProblemToTopic_B_fkey" FOREIGN KEY ("B") REFERENCES public."Topic"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

