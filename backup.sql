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
merge-nodes-in-between-zeros	Merge Nodes in Between Zeros	Leetcode	10	MEDIUM	2024-08-15 08:46:15.345	2024-08-15 08:46:15.345
minimum-number-of-pushes-to-type-word-ii	Minimum Number of Pushes to Type Word II	Leetcode	10	MEDIUM	2024-08-15 08:46:15.345	2024-08-15 08:46:15.345
kth-distinct-string-in-an-array	Kth Distinct String in an Array	Leetcode	5	EASY	2024-08-15 08:46:15.345	2024-08-15 08:46:15.345
article-views-i	Article Views I	Leetcode	5	EASY	2024-08-15 08:46:15.345	2024-08-15 08:46:15.345
integer-to-english-words	Integer to English Words	Leetcode	15	HARD	2024-08-15 08:46:15.344	2024-08-15 08:46:15.344
number-of-senior-citizens	Number of Senior Citizens	Leetcode	5	EASY	2024-08-15 08:46:15.345	2024-08-15 08:46:15.345
minimum-common-value	Minimum Common Value	Leetcode	5	EASY	2024-08-15 08:46:15.345	2024-08-15 08:46:15.345
reshape-data-concatenate	Reshape Data: Concatenate	Leetcode	5	EASY	2024-08-15 08:46:15.345	2024-08-15 08:46:15.345
change-data-type	Change Data Type	Leetcode	5	EASY	2024-08-15 08:46:15.345	2024-08-15 08:46:15.345
find-customer-referee	Find Customer Referee	Leetcode	5	EASY	2024-08-15 08:46:15.345	2024-08-15 08:46:15.345
reshape-data-melt	Reshape Data: Melt	Leetcode	5	EASY	2024-08-15 08:46:15.345	2024-08-15 08:46:15.345
fill-missing-data	Fill Missing Data	Leetcode	5	EASY	2024-08-15 08:46:15.345	2024-08-15 08:46:15.345
reshape-data-pivot	Reshape Data: Pivot	Leetcode	5	EASY	2024-08-15 08:46:15.345	2024-08-15 08:46:15.345
binary-search	Binary Search	Leetcode	5	EASY	2024-08-15 08:46:15.345	2024-08-15 08:46:15.345
method-chaining	Method Chaining	Leetcode	5	EASY	2024-08-15 08:46:15.345	2024-08-15 08:46:15.345
evaluate-reverse-polish-notation	Evaluate Reverse Polish Notation	Leetcode	10	MEDIUM	2024-08-15 08:46:15.345	2024-08-15 08:46:15.345
minimum-swaps-to-group-all-1s-together-ii	Minimum Swaps to Group All 1's Together II	Leetcode	10	MEDIUM	2024-08-15 08:46:15.345	2024-08-15 08:46:15.345
invalid-tweets	Invalid Tweets	Leetcode	5	EASY	2024-08-15 08:46:15.345	2024-08-15 08:46:15.345
recyclable-and-low-fat-products	Recyclable and Low Fat Products	Leetcode	5	EASY	2024-08-15 08:46:15.345	2024-08-15 08:46:15.345
big-countries	Big Countries	Leetcode	5	EASY	2024-08-15 08:46:15.345	2024-08-15 08:46:15.345
palindrome-number	Palindrome Number	Leetcode	5	EASY	2024-08-15 08:46:31.6	2024-08-15 08:46:31.6
middle-of-the-linked-list	Middle of the Linked List	Leetcode	5	EASY	2024-08-15 08:46:31.6	2024-08-15 08:46:31.6
reverse-linked-list	Reverse Linked List	Leetcode	5	EASY	2024-08-15 08:46:31.6	2024-08-15 08:46:31.6
remove-duplicates-from-sorted-list	Remove Duplicates from Sorted List	Leetcode	5	EASY	2024-08-15 08:46:31.6	2024-08-15 08:46:31.6
concatenation-of-array	Concatenation of Array	Leetcode	5	EASY	2024-08-15 08:46:31.6	2024-08-15 08:46:31.6
shuffle-the-array	Shuffle the Array	Leetcode	5	EASY	2024-08-15 08:46:31.6	2024-08-15 08:46:31.6
find-words-containing-character	Find Words Containing Character	Leetcode	5	EASY	2024-08-15 08:46:31.6	2024-08-15 08:46:31.6
find-minimum-operations-to-make-all-elements-divisible-by-three	Find Minimum Operations to Make All Elements Divisible by Three	Leetcode	5	EASY	2024-08-15 08:46:31.6	2024-08-15 08:46:31.6
final-value-of-variable-after-performing-operations	Final Value of Variable After Performing Operations	Leetcode	5	EASY	2024-08-15 08:46:31.6	2024-08-15 08:46:31.6
build-array-from-permutation	Build Array from Permutation	Leetcode	5	EASY	2024-08-15 08:46:31.6	2024-08-15 08:46:31.6
water-bottles	Water Bottles	Leetcode	5	EASY	2024-08-15 08:46:31.6	2024-08-15 08:46:31.6
delete-node-in-a-linked-list	Delete Node in a Linked List	Leetcode	10	MEDIUM	2024-08-15 08:46:31.6	2024-08-15 08:46:31.6
palindrome-linked-list	Palindrome Linked List	Leetcode	5	EASY	2024-08-15 08:46:31.6	2024-08-15 08:46:31.6
number-of-good-pairs	Number of Good Pairs	Leetcode	5	EASY	2024-08-15 08:46:31.6	2024-08-15 08:46:31.6
three-consecutive-odds	Three Consecutive Odds	Leetcode	5	EASY	2024-08-15 08:46:31.6	2024-08-15 08:46:31.6
pass-the-pillow	Pass the Pillow	Leetcode	5	EASY	2024-08-15 08:46:31.6	2024-08-15 08:46:31.6
first-unique-character-in-a-string	First Unique Character in a String	Leetcode	5	EASY	2024-08-15 08:46:31.6	2024-08-15 08:46:31.6
richest-customer-wealth	Richest Customer Wealth	Leetcode	5	EASY	2024-08-15 08:46:31.6	2024-08-15 08:46:31.6
make-two-arrays-equal-by-reversing-subarrays	Make Two Arrays Equal by Reversing Subarrays	Leetcode	5	EASY	2024-08-15 13:08:17.202	2024-08-15 13:08:17.202
search-in-rotated-sorted-array	Search in Rotated Sorted Array	Leetcode	10	MEDIUM	2024-08-15 13:08:17.203	2024-08-15 13:08:17.203
score-of-a-string	Score of a String	Leetcode	5	EASY	2024-08-15 13:08:17.202	2024-08-15 13:08:17.202
ugly-number	Ugly Number	Leetcode	5	EASY	2024-08-15 13:08:17.202	2024-08-15 13:08:17.202
minimum-number-of-days-to-disconnect-island	Minimum Number of Days to Disconnect Island	Leetcode	15	HARD	2024-08-15 13:08:17.202	2024-08-15 13:08:17.202
3sum	3Sum	Leetcode	10	MEDIUM	2024-08-15 13:08:17.202	2024-08-15 13:08:17.202
merge-sorted-array	Merge Sorted Array	Leetcode	5	EASY	2024-08-15 13:08:17.203	2024-08-15 13:08:17.203
sort-the-people	Sort the People	Leetcode	5	EASY	2024-08-15 13:08:17.203	2024-08-15 13:08:17.203
find-first-and-last-position-of-element-in-sorted-array	Find First and Last Position of Element in Sorted Array	Leetcode	10	MEDIUM	2024-08-15 13:08:17.203	2024-08-15 13:08:17.203
sort-the-jumbled-numbers	Sort the Jumbled Numbers	Leetcode	10	MEDIUM	2024-08-15 13:08:17.203	2024-08-15 13:08:17.203
lucky-numbers-in-a-matrix	Lucky Numbers in a Matrix	Leetcode	5	EASY	2024-08-15 13:08:17.203	2024-08-15 13:08:17.203
find-valid-matrix-given-row-and-column-sums	Find Valid Matrix Given Row and Column Sums	Leetcode	10	MEDIUM	2024-08-15 13:08:17.203	2024-08-15 13:08:17.203
powx-n	Pow(x, n)	Leetcode	10	MEDIUM	2024-08-15 13:08:17.203	2024-08-15 13:08:17.203
divide-two-integers	Divide Two Integers	Leetcode	10	MEDIUM	2024-08-15 13:08:17.203	2024-08-15 13:08:17.203
sqrtx	Sqrt(x)	Leetcode	5	EASY	2024-08-15 13:08:27.35	2024-08-15 13:08:27.35
single-number	Single Number	Leetcode	5	EASY	2024-08-15 13:08:27.35	2024-08-15 13:08:27.35
valid-parentheses	Valid Parentheses	Leetcode	5	EASY	2024-08-15 13:08:27.35	2024-08-15 13:08:27.35
merge-in-between-linked-lists	Merge In Between Linked Lists	Leetcode	10	MEDIUM	2024-08-15 13:08:27.35	2024-08-15 13:08:27.35
number-of-1-bits	Number of 1 Bits	Leetcode	5	EASY	2024-08-15 13:08:27.35	2024-08-15 13:08:27.35
simplify-path	Simplify Path	Leetcode	10	MEDIUM	2024-08-15 13:08:27.351	2024-08-15 13:08:27.351
sum-of-unique-elements	Sum of Unique Elements	Leetcode	5	EASY	2024-08-15 13:08:27.35	2024-08-15 13:08:27.35
find-the-index-of-the-first-occurrence-in-a-string	Find the Index of the First Occurrence in a String	Leetcode	5	EASY	2024-08-15 13:08:27.35	2024-08-15 13:08:27.35
roman-to-integer	Roman to Integer	Leetcode	5	EASY	2024-08-15 13:08:27.35	2024-08-15 13:08:27.35
reverse-bits	Reverse Bits	Leetcode	5	EASY	2024-08-15 13:08:27.35	2024-08-15 13:08:27.35
remove-duplicates-from-sorted-array	Remove Duplicates from Sorted Array	Leetcode	5	EASY	2024-08-15 13:08:32.48	2024-08-15 13:08:32.48
move-zeroes	Move Zeroes	Leetcode	5	EASY	2024-08-15 13:08:32.48	2024-08-15 13:08:32.48
linked-list-cycle	Linked List Cycle	Leetcode	5	EASY	2024-08-15 13:08:32.479	2024-08-15 13:08:32.479
length-of-last-word	Length of Last Word	Leetcode	5	EASY	2024-08-15 13:08:32.48	2024-08-15 13:08:32.48
third-maximum-number	Third Maximum Number	Leetcode	5	EASY	2024-08-15 13:08:32.48	2024-08-15 13:08:32.48
reverse-words-in-a-string	Reverse Words in a String	Leetcode	10	MEDIUM	2024-08-15 13:08:32.48	2024-08-15 13:08:32.48
assign-cookies	Assign Cookies	Leetcode	5	EASY	2024-08-15 13:08:32.48	2024-08-15 13:08:32.48
max-consecutive-ones	Max Consecutive Ones	Leetcode	5	EASY	2024-08-15 13:08:32.48	2024-08-15 13:08:32.48
strictly-palindromic-number	Strictly Palindromic Number	Leetcode	10	MEDIUM	2024-08-15 13:08:37.51	2024-08-15 13:08:37.51
missing-number	Missing Number	Leetcode	5	EASY	2024-08-15 13:08:32.48	2024-08-15 13:08:32.48
search-insert-position	Search Insert Position	Leetcode	5	EASY	2024-08-15 13:08:32.48	2024-08-15 13:08:32.48
remove-element	Remove Element	Leetcode	5	EASY	2024-08-15 13:08:32.48	2024-08-15 13:08:32.48
majority-element	Majority Element	Leetcode	5	EASY	2024-08-15 13:08:32.48	2024-08-15 13:08:32.48
nim-game	Nim Game	Leetcode	5	EASY	2024-08-15 13:08:37.51	2024-08-15 13:08:37.51
reverse-substrings-between-each-pair-of-parentheses	Reverse Substrings Between Each Pair of Parentheses	Leetcode	10	MEDIUM	2024-08-15 13:08:40.004	2024-08-15 13:08:40.004
rotate-array	Rotate Array	Leetcode	10	MEDIUM	2024-08-15 13:08:37.511	2024-08-15 13:08:37.511
count-pairs-whose-sum-is-less-than-target	Count Pairs Whose Sum is Less than Target	Leetcode	5	EASY	2024-08-15 13:08:37.511	2024-08-15 13:08:37.511
find-the-winner-of-the-circular-game	Find the Winner of the Circular Game	Leetcode	10	MEDIUM	2024-08-15 13:08:40.004	2024-08-15 13:08:40.004
check-if-array-is-sorted-and-rotated	Check if Array Is Sorted and Rotated	Leetcode	5	EASY	2024-08-15 13:08:37.511	2024-08-15 13:08:37.511
odd-even-linked-list	Odd Even Linked List	Leetcode	10	MEDIUM	2024-08-15 13:08:40.004	2024-08-15 13:08:40.004
maximum-count-of-positive-integer-and-negative-integer	Maximum Count of Positive Integer and Negative Integer	Leetcode	5	EASY	2024-08-15 13:08:40.004	2024-08-15 13:08:40.004
rectangle-overlap	Rectangle Overlap	Leetcode	5	EASY	2024-08-15 13:09:04.795	2024-08-15 13:09:04.795
n-repeated-element-in-size-2n-array	N-Repeated Element in Size 2N Array	Leetcode	5	EASY	2024-08-15 13:09:04.795	2024-08-15 13:09:04.795
best-time-to-buy-and-sell-stock	Best Time to Buy and Sell Stock	Leetcode	5	EASY	2024-08-15 13:09:04.795	2024-08-15 13:09:04.795
rearrange-array-elements-by-sign	Rearrange Array Elements by Sign	Leetcode	10	MEDIUM	2024-08-15 13:09:04.795	2024-08-15 13:09:04.795
remove-duplicates-from-sorted-array-ii	Remove Duplicates from Sorted Array II	Leetcode	10	MEDIUM	2024-08-15 13:09:04.795	2024-08-15 13:09:04.795
spiral-matrix-iii	Spiral Matrix III	Leetcode	10	MEDIUM	2024-08-15 13:09:04.795	2024-08-15 13:09:04.795
jump-game	Jump Game	Leetcode	10	MEDIUM	2024-08-15 13:09:04.795	2024-08-15 13:09:04.795
set-matrix-zeroes	Set Matrix Zeroes	Leetcode	10	MEDIUM	2024-08-15 13:09:04.795	2024-08-15 13:09:04.795
power-of-two	Power of Two	Leetcode	5	EASY	2024-08-15 13:09:04.795	2024-08-15 13:09:04.795
jewels-and-stones	Jewels and Stones	Leetcode	5	EASY	2024-08-15 13:09:04.795	2024-08-15 13:09:04.795
squares-of-a-sorted-array	Squares of a Sorted Array	Leetcode	5	EASY	2024-08-15 13:38:45.804	2024-08-15 13:38:45.804
longest-palindromic-substring	Longest Palindromic Substring	Leetcode	10	MEDIUM	2024-08-15 13:38:45.804	2024-08-15 13:38:45.804
binary-tree-inorder-traversal	Binary Tree Inorder Traversal	Leetcode	5	EASY	2024-08-15 13:38:45.804	2024-08-15 13:38:45.804
merge-two-sorted-lists	Merge Two Sorted Lists	Leetcode	5	EASY	2024-08-15 13:38:45.804	2024-08-15 13:38:45.804
flatten-binary-tree-to-linked-list	Flatten Binary Tree to Linked List	Leetcode	10	MEDIUM	2024-08-15 13:38:45.804	2024-08-15 13:38:45.804
sort-colors	Sort Colors	Leetcode	10	MEDIUM	2024-08-15 13:38:45.804	2024-08-15 13:38:45.804
remove-nth-node-from-end-of-list	Remove Nth Node From End of List	Leetcode	10	MEDIUM	2024-08-15 13:38:45.804	2024-08-15 13:38:45.804
longest-common-prefix	Longest Common Prefix	Leetcode	5	EASY	2024-08-15 13:38:45.804	2024-08-15 13:38:45.804
two-sum	Two Sum	Leetcode	5	EASY	2024-08-15 14:02:22.03	2024-08-15 14:02:22.03
reverse-string	Reverse String	Leetcode	5	EASY	2024-08-15 14:02:22.03	2024-08-15 14:02:22.03
ransom-note	Ransom Note	Leetcode	5	EASY	2024-08-15 14:02:22.03	2024-08-15 14:02:22.03
minimum-bit-flips-to-convert-number	Minimum Bit Flips to Convert Number	Leetcode	5	EASY	2024-08-15 14:05:55.305	2024-08-15 14:05:55.305
to-be-or-not-to-be	To Be Or Not To Be	Leetcode	5	EASY	2024-08-15 14:05:55.305	2024-08-15 14:05:55.305
rotate-string	Rotate String	Leetcode	5	EASY	2024-08-15 14:05:55.306	2024-08-15 14:05:55.306
find-numbers-with-even-number-of-digits	Find Numbers with Even Number of Digits	Leetcode	5	EASY	2024-08-15 14:02:22.03	2024-08-15 14:02:22.03
return-length-of-arguments-passed	Return Length of Arguments Passed	Leetcode	5	EASY	2024-08-15 14:05:55.305	2024-08-15 14:05:55.305
fizz-buzz	Fizz Buzz	Leetcode	5	EASY	2024-08-15 14:02:22.03	2024-08-15 14:02:22.03
apply-transform-over-each-element-in-array	Apply Transform Over Each Element in Array	Leetcode	5	EASY	2024-08-15 14:05:55.306	2024-08-15 14:05:55.306
number-of-steps-to-reduce-a-number-to-zero	Number of Steps to Reduce a Number to Zero	Leetcode	5	EASY	2024-08-15 14:02:22.03	2024-08-15 14:02:22.03
filter-elements-from-array	Filter Elements from Array	Leetcode	5	EASY	2024-08-15 14:05:55.305	2024-08-15 14:05:55.305
function-composition	Function Composition	Leetcode	5	EASY	2024-08-15 14:05:55.306	2024-08-15 14:05:55.306
running-sum-of-1d-array	Running Sum of 1d Array	Leetcode	5	EASY	2024-08-15 14:02:22.03	2024-08-15 14:02:22.03
counter	Counter	Leetcode	5	EASY	2024-08-15 14:05:55.305	2024-08-15 14:05:55.305
intersection-of-two-linked-lists	Intersection of Two Linked Lists	Leetcode	5	EASY	2024-08-15 14:02:22.03	2024-08-15 14:02:22.03
valid-anagram	Valid Anagram	Leetcode	5	EASY	2024-08-15 14:05:55.306	2024-08-15 14:05:55.306
count-and-say	Count and Say	Leetcode	10	MEDIUM	2024-08-15 14:05:55.305	2024-08-15 14:05:55.305
largest-odd-number-in-string	Largest Odd Number in String	Leetcode	5	EASY	2024-08-15 14:05:55.305	2024-08-15 14:05:55.305
sort-list	Sort List	Leetcode	10	MEDIUM	2024-08-15 14:05:55.305	2024-08-15 14:05:55.305
delete-the-middle-node-of-a-linked-list	Delete the Middle Node of a Linked List	Leetcode	10	MEDIUM	2024-08-15 14:05:55.305	2024-08-15 14:05:55.305
create-hello-world-function	Create Hello World Function	Leetcode	5	EASY	2024-08-15 14:05:55.305	2024-08-15 14:05:55.305
add-two-numbers	Add Two Numbers	Leetcode	10	MEDIUM	2024-08-15 14:05:55.305	2024-08-15 14:05:55.305
counter-ii	Counter II	Leetcode	5	EASY	2024-08-15 14:05:55.306	2024-08-15 14:05:55.306
contains-duplicate	Contains Duplicate	Leetcode	5	EASY	2024-08-15 13:08:32.48	2024-08-15 13:08:32.48
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
math	2024-08-15 08:46:11.795	2024-08-15 08:46:11.795
string	2024-08-15 08:46:11.795	2024-08-15 08:46:11.795
recursion	2024-08-15 08:46:11.795	2024-08-15 08:46:11.795
array	2024-08-15 08:46:11.844	2024-08-15 08:46:11.844
sliding-window	2024-08-15 08:46:11.844	2024-08-15 08:46:11.844
stack	2024-08-15 08:46:11.913	2024-08-15 08:46:11.913
hash-table	2024-08-15 08:46:11.939	2024-08-15 08:46:11.939
two-pointers	2024-08-15 08:46:11.939	2024-08-15 08:46:11.939
binary-search	2024-08-15 08:46:11.939	2024-08-15 08:46:11.939
bit-manipulation	2024-08-15 13:08:11.67	2024-08-15 13:08:11.67
counting	2024-08-15 08:46:12.086	2024-08-15 08:46:12.086
database	2024-08-15 08:46:12.303	2024-08-15 08:46:12.303
dynamic-programming	2024-08-15 13:09:00.426	2024-08-15 13:09:00.426
sorting	2024-08-15 08:46:12.367	2024-08-15 08:46:12.367
geometry	2024-08-15 13:09:00.799	2024-08-15 13:09:00.799
greedy	2024-08-15 08:46:12.367	2024-08-15 08:46:12.367
linked-list	2024-08-15 08:46:13.351	2024-08-15 08:46:13.351
simulation	2024-08-15 08:46:13.351	2024-08-15 08:46:13.351
depth-first-search	2024-08-15 13:08:13.193	2024-08-15 13:08:13.193
breadth-first-search	2024-08-15 13:08:13.194	2024-08-15 13:08:13.194
strongly-connected-component	2024-08-15 13:08:13.194	2024-08-15 13:08:13.194
merge-sort	2024-08-15 14:05:54.468	2024-08-15 14:05:54.468
tree	2024-08-15 13:38:43.558	2024-08-15 13:38:43.558
binary-tree	2024-08-15 13:38:43.559	2024-08-15 13:38:43.559
matrix	2024-08-15 08:46:27.455	2024-08-15 08:46:27.455
divide-and-conquer	2024-08-15 13:08:22.785	2024-08-15 13:08:22.785
queue	2024-08-15 08:46:27.562	2024-08-15 08:46:27.562
trie	2024-08-15 13:38:44.799	2024-08-15 13:38:44.799
string-matching	2024-08-15 13:08:25.291	2024-08-15 13:08:25.291
prefix-sum	2024-08-15 14:02:19.667	2024-08-15 14:02:19.667
brainteaser	2024-08-15 13:08:36.183	2024-08-15 13:08:36.183
game-theory	2024-08-15 13:08:36.352	2024-08-15 13:08:36.352
\.


--
-- Data for Name: Topic_Problem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Topic_Problem" ("topicId", "problemId", created_at, updated_at) FROM stdin;
string	integer-to-english-words	2024-08-15 08:46:15.402	2024-08-15 08:46:15.402
math	integer-to-english-words	2024-08-15 08:46:15.403	2024-08-15 08:46:15.403
recursion	integer-to-english-words	2024-08-15 08:46:15.403	2024-08-15 08:46:15.403
array	number-of-senior-citizens	2024-08-15 08:46:15.403	2024-08-15 08:46:15.403
string	number-of-senior-citizens	2024-08-15 08:46:15.403	2024-08-15 08:46:15.403
array	minimum-common-value	2024-08-15 08:46:15.404	2024-08-15 08:46:15.404
hash-table	minimum-common-value	2024-08-15 08:46:15.404	2024-08-15 08:46:15.404
array	kth-distinct-string-in-an-array	2024-08-15 08:46:15.404	2024-08-15 08:46:15.404
counting	kth-distinct-string-in-an-array	2024-08-15 08:46:15.404	2024-08-15 08:46:15.404
hash-table	kth-distinct-string-in-an-array	2024-08-15 08:46:15.404	2024-08-15 08:46:15.404
two-pointers	minimum-common-value	2024-08-15 08:46:15.404	2024-08-15 08:46:15.404
string	kth-distinct-string-in-an-array	2024-08-15 08:46:15.404	2024-08-15 08:46:15.404
binary-search	minimum-common-value	2024-08-15 08:46:15.404	2024-08-15 08:46:15.404
hash-table	minimum-number-of-pushes-to-type-word-ii	2024-08-15 08:46:15.405	2024-08-15 08:46:15.405
sorting	minimum-number-of-pushes-to-type-word-ii	2024-08-15 08:46:15.405	2024-08-15 08:46:15.405
greedy	minimum-number-of-pushes-to-type-word-ii	2024-08-15 08:46:15.405	2024-08-15 08:46:15.405
string	minimum-number-of-pushes-to-type-word-ii	2024-08-15 08:46:15.405	2024-08-15 08:46:15.405
simulation	merge-nodes-in-between-zeros	2024-08-15 08:46:15.405	2024-08-15 08:46:15.405
counting	minimum-number-of-pushes-to-type-word-ii	2024-08-15 08:46:15.405	2024-08-15 08:46:15.405
database	article-views-i	2024-08-15 08:46:15.406	2024-08-15 08:46:15.406
linked-list	merge-nodes-in-between-zeros	2024-08-15 08:46:15.405	2024-08-15 08:46:15.405
database	find-customer-referee	2024-08-15 08:46:15.41	2024-08-15 08:46:15.41
array	binary-search	2024-08-15 08:46:15.431	2024-08-15 08:46:15.431
binary-search	binary-search	2024-08-15 08:46:15.431	2024-08-15 08:46:15.431
array	minimum-swaps-to-group-all-1s-together-ii	2024-08-15 08:46:15.44	2024-08-15 08:46:15.44
array	evaluate-reverse-polish-notation	2024-08-15 08:46:15.44	2024-08-15 08:46:15.44
sliding-window	minimum-swaps-to-group-all-1s-together-ii	2024-08-15 08:46:15.44	2024-08-15 08:46:15.44
math	evaluate-reverse-polish-notation	2024-08-15 08:46:15.44	2024-08-15 08:46:15.44
stack	evaluate-reverse-polish-notation	2024-08-15 08:46:15.44	2024-08-15 08:46:15.44
database	invalid-tweets	2024-08-15 08:46:15.451	2024-08-15 08:46:15.451
database	recyclable-and-low-fat-products	2024-08-15 08:46:15.453	2024-08-15 08:46:15.453
database	big-countries	2024-08-15 08:46:15.452	2024-08-15 08:46:15.452
linked-list	middle-of-the-linked-list	2024-08-15 08:46:31.607	2024-08-15 08:46:31.607
math	palindrome-number	2024-08-15 08:46:31.606	2024-08-15 08:46:31.606
linked-list	remove-duplicates-from-sorted-list	2024-08-15 08:46:31.607	2024-08-15 08:46:31.607
recursion	reverse-linked-list	2024-08-15 08:46:31.606	2024-08-15 08:46:31.606
linked-list	reverse-linked-list	2024-08-15 08:46:31.606	2024-08-15 08:46:31.606
two-pointers	middle-of-the-linked-list	2024-08-15 08:46:31.607	2024-08-15 08:46:31.607
string	find-words-containing-character	2024-08-15 08:46:31.607	2024-08-15 08:46:31.607
array	number-of-good-pairs	2024-08-15 08:46:31.607	2024-08-15 08:46:31.607
hash-table	number-of-good-pairs	2024-08-15 08:46:31.607	2024-08-15 08:46:31.607
math	number-of-good-pairs	2024-08-15 08:46:31.607	2024-08-15 08:46:31.607
array	find-minimum-operations-to-make-all-elements-divisible-by-three	2024-08-15 08:46:31.607	2024-08-15 08:46:31.607
array	build-array-from-permutation	2024-08-15 08:46:31.607	2024-08-15 08:46:31.607
simulation	build-array-from-permutation	2024-08-15 08:46:31.608	2024-08-15 08:46:31.608
math	find-minimum-operations-to-make-all-elements-divisible-by-three	2024-08-15 08:46:31.609	2024-08-15 08:46:31.609
array	find-words-containing-character	2024-08-15 08:46:31.607	2024-08-15 08:46:31.607
array	shuffle-the-array	2024-08-15 08:46:31.607	2024-08-15 08:46:31.607
counting	number-of-good-pairs	2024-08-15 08:46:31.609	2024-08-15 08:46:31.609
simulation	concatenation-of-array	2024-08-15 08:46:31.611	2024-08-15 08:46:31.611
linked-list	delete-node-in-a-linked-list	2024-08-15 08:46:31.612	2024-08-15 08:46:31.612
array	three-consecutive-odds	2024-08-15 08:46:31.612	2024-08-15 08:46:31.612
simulation	water-bottles	2024-08-15 08:46:31.612	2024-08-15 08:46:31.612
math	water-bottles	2024-08-15 08:46:31.612	2024-08-15 08:46:31.612
linked-list	palindrome-linked-list	2024-08-15 08:46:31.612	2024-08-15 08:46:31.612
array	concatenation-of-array	2024-08-15 08:46:31.611	2024-08-15 08:46:31.611
two-pointers	palindrome-linked-list	2024-08-15 08:46:31.612	2024-08-15 08:46:31.612
stack	palindrome-linked-list	2024-08-15 08:46:31.613	2024-08-15 08:46:31.613
array	final-value-of-variable-after-performing-operations	2024-08-15 08:46:31.614	2024-08-15 08:46:31.614
recursion	palindrome-linked-list	2024-08-15 08:46:31.613	2024-08-15 08:46:31.613
simulation	final-value-of-variable-after-performing-operations	2024-08-15 08:46:31.615	2024-08-15 08:46:31.615
simulation	pass-the-pillow	2024-08-15 08:46:31.627	2024-08-15 08:46:31.627
math	pass-the-pillow	2024-08-15 08:46:31.627	2024-08-15 08:46:31.627
hash-table	first-unique-character-in-a-string	2024-08-15 08:46:31.627	2024-08-15 08:46:31.627
string	first-unique-character-in-a-string	2024-08-15 08:46:31.627	2024-08-15 08:46:31.627
counting	first-unique-character-in-a-string	2024-08-15 08:46:31.627	2024-08-15 08:46:31.627
queue	first-unique-character-in-a-string	2024-08-15 08:46:31.627	2024-08-15 08:46:31.627
string	final-value-of-variable-after-performing-operations	2024-08-15 08:46:31.615	2024-08-15 08:46:31.615
array	richest-customer-wealth	2024-08-15 08:46:31.634	2024-08-15 08:46:31.634
matrix	richest-customer-wealth	2024-08-15 08:46:31.634	2024-08-15 08:46:31.634
array	make-two-arrays-equal-by-reversing-subarrays	2024-08-15 13:08:17.223	2024-08-15 13:08:17.223
depth-first-search	minimum-number-of-days-to-disconnect-island	2024-08-15 13:08:17.23	2024-08-15 13:08:17.23
string	score-of-a-string	2024-08-15 13:08:17.23	2024-08-15 13:08:17.23
breadth-first-search	minimum-number-of-days-to-disconnect-island	2024-08-15 13:08:17.231	2024-08-15 13:08:17.231
matrix	minimum-number-of-days-to-disconnect-island	2024-08-15 13:08:17.231	2024-08-15 13:08:17.231
array	minimum-number-of-days-to-disconnect-island	2024-08-15 13:08:17.232	2024-08-15 13:08:17.232
two-pointers	3sum	2024-08-15 13:08:17.232	2024-08-15 13:08:17.232
sorting	3sum	2024-08-15 13:08:17.232	2024-08-15 13:08:17.232
strongly-connected-component	minimum-number-of-days-to-disconnect-island	2024-08-15 13:08:17.231	2024-08-15 13:08:17.231
math	ugly-number	2024-08-15 13:08:17.232	2024-08-15 13:08:17.232
array	search-in-rotated-sorted-array	2024-08-15 13:08:17.232	2024-08-15 13:08:17.232
binary-search	search-in-rotated-sorted-array	2024-08-15 13:08:17.232	2024-08-15 13:08:17.232
two-pointers	merge-sorted-array	2024-08-15 13:08:17.254	2024-08-15 13:08:17.254
array	3sum	2024-08-15 13:08:17.232	2024-08-15 13:08:17.232
array	merge-sorted-array	2024-08-15 13:08:17.254	2024-08-15 13:08:17.254
binary-search	find-first-and-last-position-of-element-in-sorted-array	2024-08-15 13:08:17.254	2024-08-15 13:08:17.254
sorting	sort-the-people	2024-08-15 13:08:17.255	2024-08-15 13:08:17.255
array	sort-the-people	2024-08-15 13:08:17.255	2024-08-15 13:08:17.255
array	find-first-and-last-position-of-element-in-sorted-array	2024-08-15 13:08:17.254	2024-08-15 13:08:17.254
sorting	merge-sorted-array	2024-08-15 13:08:17.254	2024-08-15 13:08:17.254
hash-table	sort-the-people	2024-08-15 13:08:17.255	2024-08-15 13:08:17.255
matrix	lucky-numbers-in-a-matrix	2024-08-15 13:08:17.256	2024-08-15 13:08:17.256
sorting	sort-the-jumbled-numbers	2024-08-15 13:08:17.256	2024-08-15 13:08:17.256
array	sort-the-jumbled-numbers	2024-08-15 13:08:17.256	2024-08-15 13:08:17.256
array	lucky-numbers-in-a-matrix	2024-08-15 13:08:17.256	2024-08-15 13:08:17.256
string	sort-the-people	2024-08-15 13:08:17.255	2024-08-15 13:08:17.255
math	divide-two-integers	2024-08-15 13:08:17.262	2024-08-15 13:08:17.262
math	powx-n	2024-08-15 13:08:17.26	2024-08-15 13:08:17.26
math	sqrtx	2024-08-15 13:08:27.368	2024-08-15 13:08:27.368
hash-table	roman-to-integer	2024-08-15 13:08:27.372	2024-08-15 13:08:27.372
linked-list	merge-in-between-linked-lists	2024-08-15 13:08:27.372	2024-08-15 13:08:27.372
hash-table	sum-of-unique-elements	2024-08-15 13:08:27.372	2024-08-15 13:08:27.372
array	max-consecutive-ones	2024-08-15 13:08:32.5	2024-08-15 13:08:32.5
bit-manipulation	divide-two-integers	2024-08-15 13:08:17.262	2024-08-15 13:08:17.262
stack	simplify-path	2024-08-15 13:08:27.37	2024-08-15 13:08:27.37
string	reverse-words-in-a-string	2024-08-15 13:08:32.488	2024-08-15 13:08:32.488
sorting	assign-cookies	2024-08-15 13:08:32.488	2024-08-15 13:08:32.488
counting	majority-element	2024-08-15 13:08:32.5	2024-08-15 13:08:32.5
binary-search	maximum-count-of-positive-integer-and-negative-integer	2024-08-15 13:08:40.015	2024-08-15 13:08:40.015
matrix	find-valid-matrix-given-row-and-column-sums	2024-08-15 13:08:17.258	2024-08-15 13:08:17.258
binary-search	sqrtx	2024-08-15 13:08:27.369	2024-08-15 13:08:27.369
array	single-number	2024-08-15 13:08:27.371	2024-08-15 13:08:27.371
string-matching	find-the-index-of-the-first-occurrence-in-a-string	2024-08-15 13:08:27.375	2024-08-15 13:08:27.375
array	remove-duplicates-from-sorted-array	2024-08-15 13:08:32.483	2024-08-15 13:08:32.483
array	third-maximum-number	2024-08-15 13:08:32.489	2024-08-15 13:08:32.489
hash-table	missing-number	2024-08-15 13:08:32.499	2024-08-15 13:08:32.499
two-pointers	count-pairs-whose-sum-is-less-than-target	2024-08-15 13:08:37.523	2024-08-15 13:08:37.523
math	find-the-winner-of-the-circular-game	2024-08-15 13:08:40.015	2024-08-15 13:08:40.015
stack	valid-parentheses	2024-08-15 13:08:27.37	2024-08-15 13:08:27.37
array	majority-element	2024-08-15 13:08:32.5	2024-08-15 13:08:32.5
queue	find-the-winner-of-the-circular-game	2024-08-15 13:08:40.015	2024-08-15 13:08:40.015
math	roman-to-integer	2024-08-15 13:08:27.372	2024-08-15 13:08:27.372
binary-search	count-pairs-whose-sum-is-less-than-target	2024-08-15 13:08:37.523	2024-08-15 13:08:37.523
string	simplify-path	2024-08-15 13:08:27.37	2024-08-15 13:08:27.37
two-pointers	remove-duplicates-from-sorted-array	2024-08-15 13:08:32.483	2024-08-15 13:08:32.483
two-pointers	linked-list-cycle	2024-08-15 13:08:32.487	2024-08-15 13:08:32.487
binary-search	missing-number	2024-08-15 13:08:32.499	2024-08-15 13:08:32.499
binary-search	search-insert-position	2024-08-15 13:08:32.504	2024-08-15 13:08:32.504
sorting	contains-duplicate	2024-08-15 13:08:32.508	2024-08-15 13:08:32.508
brainteaser	nim-game	2024-08-15 13:08:37.52	2024-08-15 13:08:37.52
array	find-the-winner-of-the-circular-game	2024-08-15 13:08:40.015	2024-08-15 13:08:40.015
array	sum-of-unique-elements	2024-08-15 13:08:27.372	2024-08-15 13:08:27.372
string	length-of-last-word	2024-08-15 13:08:32.487	2024-08-15 13:08:32.487
greedy	assign-cookies	2024-08-15 13:08:32.488	2024-08-15 13:08:32.488
sorting	majority-element	2024-08-15 13:08:32.5	2024-08-15 13:08:32.5
brainteaser	strictly-palindromic-number	2024-08-15 13:08:37.52	2024-08-15 13:08:37.52
two-pointers	rotate-array	2024-08-15 13:08:37.522	2024-08-15 13:08:37.522
two-pointers	find-the-index-of-the-first-occurrence-in-a-string	2024-08-15 13:08:27.375	2024-08-15 13:08:27.375
linked-list	linked-list-cycle	2024-08-15 13:08:32.487	2024-08-15 13:08:32.487
array	search-insert-position	2024-08-15 13:08:32.504	2024-08-15 13:08:32.504
sorting	count-pairs-whose-sum-is-less-than-target	2024-08-15 13:08:37.523	2024-08-15 13:08:37.523
recursion	find-the-winner-of-the-circular-game	2024-08-15 13:08:40.015	2024-08-15 13:08:40.015
string	valid-parentheses	2024-08-15 13:08:27.37	2024-08-15 13:08:27.37
two-pointers	move-zeroes	2024-08-15 13:08:32.484	2024-08-15 13:08:32.484
two-pointers	reverse-words-in-a-string	2024-08-15 13:08:32.488	2024-08-15 13:08:32.488
sorting	third-maximum-number	2024-08-15 13:08:32.489	2024-08-15 13:08:32.489
math	missing-number	2024-08-15 13:08:32.499	2024-08-15 13:08:32.499
hash-table	contains-duplicate	2024-08-15 13:08:32.508	2024-08-15 13:08:32.508
game-theory	nim-game	2024-08-15 13:08:37.52	2024-08-15 13:08:37.52
array	check-if-array-is-sorted-and-rotated	2024-08-15 13:08:37.522	2024-08-15 13:08:37.522
simulation	find-the-winner-of-the-circular-game	2024-08-15 13:08:40.015	2024-08-15 13:08:40.015
array	move-zeroes	2024-08-15 13:08:32.483	2024-08-15 13:08:32.483
divide-and-conquer	majority-element	2024-08-15 13:08:32.5	2024-08-15 13:08:32.5
math	nim-game	2024-08-15 13:08:37.52	2024-08-15 13:08:37.52
stack	reverse-substrings-between-each-pair-of-parentheses	2024-08-15 13:08:40.015	2024-08-15 13:08:40.015
two-pointers	remove-element	2024-08-15 13:08:32.501	2024-08-15 13:08:32.501
two-pointers	strictly-palindromic-number	2024-08-15 13:08:37.52	2024-08-15 13:08:37.52
array	rotate-array	2024-08-15 13:08:37.522	2024-08-15 13:08:37.522
string	reverse-substrings-between-each-pair-of-parentheses	2024-08-15 13:08:40.015	2024-08-15 13:08:40.015
geometry	rectangle-overlap	2024-08-15 13:09:04.803	2024-08-15 13:09:04.803
matrix	spiral-matrix-iii	2024-08-15 13:09:04.809	2024-08-15 13:09:04.809
hash-table	jewels-and-stones	2024-08-15 13:09:04.823	2024-08-15 13:09:04.823
greedy	jump-game	2024-08-15 13:09:04.803	2024-08-15 13:09:04.803
array	jump-game	2024-08-15 13:09:04.803	2024-08-15 13:09:04.803
hash-table	n-repeated-element-in-size-2n-array	2024-08-15 13:09:04.817	2024-08-15 13:09:04.817
recursion	power-of-two	2024-08-15 13:09:04.823	2024-08-15 13:09:04.823
dynamic-programming	jump-game	2024-08-15 13:09:04.803	2024-08-15 13:09:04.803
string	jewels-and-stones	2024-08-15 13:09:04.823	2024-08-15 13:09:04.823
array	best-time-to-buy-and-sell-stock	2024-08-15 13:09:04.804	2024-08-15 13:09:04.804
array	spiral-matrix-iii	2024-08-15 13:09:04.809	2024-08-15 13:09:04.809
bit-manipulation	power-of-two	2024-08-15 13:09:04.823	2024-08-15 13:09:04.823
math	rectangle-overlap	2024-08-15 13:09:04.802	2024-08-15 13:09:04.802
matrix	set-matrix-zeroes	2024-08-15 13:09:04.821	2024-08-15 13:09:04.821
array	rearrange-array-elements-by-sign	2024-08-15 13:09:04.806	2024-08-15 13:09:04.806
two-pointers	rearrange-array-elements-by-sign	2024-08-15 13:09:04.806	2024-08-15 13:09:04.806
array	n-repeated-element-in-size-2n-array	2024-08-15 13:09:04.817	2024-08-15 13:09:04.817
math	power-of-two	2024-08-15 13:09:04.823	2024-08-15 13:09:04.823
simulation	rearrange-array-elements-by-sign	2024-08-15 13:09:04.806	2024-08-15 13:09:04.806
dynamic-programming	best-time-to-buy-and-sell-stock	2024-08-15 13:09:04.804	2024-08-15 13:09:04.804
simulation	spiral-matrix-iii	2024-08-15 13:09:04.81	2024-08-15 13:09:04.81
hash-table	set-matrix-zeroes	2024-08-15 13:09:04.821	2024-08-15 13:09:04.821
array	set-matrix-zeroes	2024-08-15 13:09:04.821	2024-08-15 13:09:04.821
two-pointers	remove-duplicates-from-sorted-array-ii	2024-08-15 13:09:04.806	2024-08-15 13:09:04.806
array	remove-duplicates-from-sorted-array-ii	2024-08-15 13:09:04.806	2024-08-15 13:09:04.806
array	squares-of-a-sorted-array	2024-08-15 13:38:45.816	2024-08-15 13:38:45.816
binary-tree	binary-tree-inorder-traversal	2024-08-15 13:38:45.82	2024-08-15 13:38:45.82
sorting	squares-of-a-sorted-array	2024-08-15 13:38:45.816	2024-08-15 13:38:45.816
string	longest-common-prefix	2024-08-15 13:38:45.819	2024-08-15 13:38:45.819
two-pointers	squares-of-a-sorted-array	2024-08-15 13:38:45.816	2024-08-15 13:38:45.816
recursion	merge-two-sorted-lists	2024-08-15 13:38:45.816	2024-08-15 13:38:45.816
sorting	sort-colors	2024-08-15 13:38:45.819	2024-08-15 13:38:45.819
two-pointers	remove-nth-node-from-end-of-list	2024-08-15 13:38:45.816	2024-08-15 13:38:45.816
two-pointers	sort-colors	2024-08-15 13:38:45.819	2024-08-15 13:38:45.819
linked-list	remove-nth-node-from-end-of-list	2024-08-15 13:38:45.816	2024-08-15 13:38:45.816
stack	flatten-binary-tree-to-linked-list	2024-08-15 13:38:45.817	2024-08-15 13:38:45.817
stack	binary-tree-inorder-traversal	2024-08-15 13:38:45.82	2024-08-15 13:38:45.82
linked-list	merge-two-sorted-lists	2024-08-15 13:38:45.816	2024-08-15 13:38:45.816
array	sort-colors	2024-08-15 13:38:45.819	2024-08-15 13:38:45.819
depth-first-search	binary-tree-inorder-traversal	2024-08-15 13:38:45.82	2024-08-15 13:38:45.82
linked-list	flatten-binary-tree-to-linked-list	2024-08-15 13:38:45.817	2024-08-15 13:38:45.817
two-pointers	longest-palindromic-substring	2024-08-15 13:38:45.818	2024-08-15 13:38:45.818
trie	longest-common-prefix	2024-08-15 13:38:45.819	2024-08-15 13:38:45.819
dynamic-programming	longest-palindromic-substring	2024-08-15 13:38:45.818	2024-08-15 13:38:45.818
tree	binary-tree-inorder-traversal	2024-08-15 13:38:45.82	2024-08-15 13:38:45.82
string	longest-palindromic-substring	2024-08-15 13:38:45.818	2024-08-15 13:38:45.818
binary-tree	flatten-binary-tree-to-linked-list	2024-08-15 13:38:45.818	2024-08-15 13:38:45.818
depth-first-search	flatten-binary-tree-to-linked-list	2024-08-15 13:38:45.818	2024-08-15 13:38:45.818
tree	flatten-binary-tree-to-linked-list	2024-08-15 13:38:45.818	2024-08-15 13:38:45.818
math	number-of-steps-to-reduce-a-number-to-zero	2024-08-15 14:02:22.037	2024-08-15 14:02:22.037
simulation	fizz-buzz	2024-08-15 14:02:22.038	2024-08-15 14:02:22.038
string	fizz-buzz	2024-08-15 14:02:22.038	2024-08-15 14:02:22.038
array	find-numbers-with-even-number-of-digits	2024-08-15 14:02:22.043	2024-08-15 14:02:22.043
string	valid-anagram	2024-08-15 14:05:55.314	2024-08-15 14:05:55.314
merge-sort	sort-list	2024-08-15 14:05:55.319	2024-08-15 14:05:55.319
hash-table	make-two-arrays-equal-by-reversing-subarrays	2024-08-15 13:08:17.223	2024-08-15 13:08:17.223
divide-and-conquer	number-of-1-bits	2024-08-15 13:08:27.369	2024-08-15 13:08:27.369
hash-table	majority-element	2024-08-15 13:08:32.5	2024-08-15 13:08:32.5
math	fizz-buzz	2024-08-15 14:02:22.038	2024-08-15 14:02:22.038
recursion	add-two-numbers	2024-08-15 14:05:55.319	2024-08-15 14:05:55.319
bit-manipulation	number-of-steps-to-reduce-a-number-to-zero	2024-08-15 14:02:22.037	2024-08-15 14:02:22.037
bit-manipulation	minimum-bit-flips-to-convert-number	2024-08-15 14:05:55.314	2024-08-15 14:05:55.314
divide-and-conquer	sort-list	2024-08-15 14:05:55.319	2024-08-15 14:05:55.319
linked-list	intersection-of-two-linked-lists	2024-08-15 14:02:22.04	2024-08-15 14:02:22.04
two-pointers	intersection-of-two-linked-lists	2024-08-15 14:02:22.04	2024-08-15 14:02:22.04
counting	ransom-note	2024-08-15 14:02:22.044	2024-08-15 14:02:22.044
linked-list	delete-the-middle-node-of-a-linked-list	2024-08-15 14:05:55.316	2024-08-15 14:05:55.316
two-pointers	delete-the-middle-node-of-a-linked-list	2024-08-15 14:05:55.316	2024-08-15 14:05:55.316
hash-table	intersection-of-two-linked-lists	2024-08-15 14:02:22.04	2024-08-15 14:02:22.04
string	ransom-note	2024-08-15 14:02:22.044	2024-08-15 14:02:22.044
two-pointers	reverse-string	2024-08-15 14:02:22.04	2024-08-15 14:02:22.04
two-pointers	sort-list	2024-08-15 14:05:55.318	2024-08-15 14:05:55.318
hash-table	two-sum	2024-08-15 14:02:22.041	2024-08-15 14:02:22.041
greedy	largest-odd-number-in-string	2024-08-15 14:05:55.315	2024-08-15 14:05:55.315
hash-table	ransom-note	2024-08-15 14:02:22.044	2024-08-15 14:02:22.044
sorting	sort-list	2024-08-15 14:05:55.319	2024-08-15 14:05:55.319
prefix-sum	running-sum-of-1d-array	2024-08-15 14:02:22.041	2024-08-15 14:02:22.041
math	largest-odd-number-in-string	2024-08-15 14:05:55.315	2024-08-15 14:05:55.315
string-matching	rotate-string	2024-08-15 14:05:55.319	2024-08-15 14:05:55.319
array	two-sum	2024-08-15 14:02:22.041	2024-08-15 14:02:22.041
hash-table	valid-anagram	2024-08-15 14:05:55.314	2024-08-15 14:05:55.314
array	running-sum-of-1d-array	2024-08-15 14:02:22.041	2024-08-15 14:02:22.041
string	largest-odd-number-in-string	2024-08-15 14:05:55.315	2024-08-15 14:05:55.315
linked-list	add-two-numbers	2024-08-15 14:05:55.319	2024-08-15 14:05:55.319
string	reverse-string	2024-08-15 14:02:22.04	2024-08-15 14:02:22.04
string	count-and-say	2024-08-15 14:05:55.315	2024-08-15 14:05:55.315
string	rotate-string	2024-08-15 14:05:55.319	2024-08-15 14:05:55.319
sorting	make-two-arrays-equal-by-reversing-subarrays	2024-08-15 13:08:17.223	2024-08-15 13:08:17.223
greedy	find-valid-matrix-given-row-and-column-sums	2024-08-15 13:08:17.258	2024-08-15 13:08:17.258
counting	sum-of-unique-elements	2024-08-15 13:08:27.372	2024-08-15 13:08:27.372
string	find-the-index-of-the-first-occurrence-in-a-string	2024-08-15 13:08:27.375	2024-08-15 13:08:27.375
hash-table	linked-list-cycle	2024-08-15 13:08:32.487	2024-08-15 13:08:32.487
two-pointers	assign-cookies	2024-08-15 13:08:32.488	2024-08-15 13:08:32.488
array	assign-cookies	2024-08-15 13:08:32.488	2024-08-15 13:08:32.488
array	missing-number	2024-08-15 13:08:32.499	2024-08-15 13:08:32.499
sorting	missing-number	2024-08-15 13:08:32.499	2024-08-15 13:08:32.499
array	remove-element	2024-08-15 13:08:32.501	2024-08-15 13:08:32.501
array	count-pairs-whose-sum-is-less-than-target	2024-08-15 13:08:37.523	2024-08-15 13:08:37.523
array	maximum-count-of-positive-integer-and-negative-integer	2024-08-15 13:08:40.015	2024-08-15 13:08:40.015
sorting	valid-anagram	2024-08-15 14:05:55.315	2024-08-15 14:05:55.315
math	add-two-numbers	2024-08-15 14:05:55.319	2024-08-15 14:05:55.319
linked-list	sort-list	2024-08-15 14:05:55.318	2024-08-15 14:05:55.318
array	find-valid-matrix-given-row-and-column-sums	2024-08-15 13:08:17.258	2024-08-15 13:08:17.258
string	roman-to-integer	2024-08-15 13:08:27.372	2024-08-15 13:08:27.372
bit-manipulation	reverse-bits	2024-08-15 13:08:27.375	2024-08-15 13:08:27.375
counting	maximum-count-of-positive-integer-and-negative-integer	2024-08-15 13:08:40.015	2024-08-15 13:08:40.015
recursion	powx-n	2024-08-15 13:08:17.26	2024-08-15 13:08:17.26
bit-manipulation	number-of-1-bits	2024-08-15 13:08:27.369	2024-08-15 13:08:27.369
bit-manipulation	single-number	2024-08-15 13:08:27.371	2024-08-15 13:08:27.371
divide-and-conquer	reverse-bits	2024-08-15 13:08:27.375	2024-08-15 13:08:27.375
bit-manipulation	missing-number	2024-08-15 13:08:32.499	2024-08-15 13:08:32.499
array	contains-duplicate	2024-08-15 13:08:32.508	2024-08-15 13:08:32.508
math	strictly-palindromic-number	2024-08-15 13:08:37.52	2024-08-15 13:08:37.52
math	rotate-array	2024-08-15 13:08:37.522	2024-08-15 13:08:37.522
linked-list	odd-even-linked-list	2024-08-15 13:08:40.015	2024-08-15 13:08:40.015
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" (id, email, password, role, "linkedIn", github, leetcode, class, stream, batch, "lastBackupTime", created_at, updated_at) FROM stdin;
22PC03	22pc03@psgtech.ac.in	$2b$10$7qtMKtB693d9/Z47LroRWu22TVPwW/ZmvO9yc3C9Oo8RWP0aJEK82	STUDENT			abinayab_17	22PC	CS	2022	2024-04-13 17:08:16.728	2024-08-14 09:39:36.669	2024-08-14 09:39:36.669
22PC15	22pc15@psgtech.ac.in	$2b$10$H1uEUkcpvUbKltziyKlfvOrvUQYdb2zYTpDzcuAEDaIaZKCwBmqsi	STUDENT			jaishree_k	22PC	CS	2022	2024-04-13 17:08:16.728	2024-08-14 15:34:38.117	2024-08-14 15:34:38.117
22PC16	22pc16@psgtech.ac.in	$2b$10$3fFJL6eAlsu.ZSAm062WRerrVLIr74tz9OUCwgYRd3odt4EjWIE4O	STUDENT			karthika_v	22PC	CS	2022	2024-04-13 17:08:16.728	2024-08-14 15:34:48.541	2024-08-14 15:34:48.541
22PC19	22pc19@psgtech.ac.in	$2b$10$8wye1j3D6Vnjwt3jc03ea.S9ioeOMXsKIxIM/m1HaPTqfmh3KNREu	STUDENT			mithunkarthick1610	22PC	CS	2022	2024-04-13 17:08:16.728	2024-08-13 17:08:16.728	2024-08-14 09:22:55.799
22PC20	22pc20@psgtech.ac.in	$2b$10$/MmDiI3gXAXMc3x0nx0kZe6l5APW6vgGJTlNidOzTwE21XSjNtdUK	STUDENT			muthu_meenakshi	22PC	CS	2022	2024-04-13 17:08:16.728	2024-08-14 09:39:25.666	2024-08-14 09:39:25.666
22PC28	22pc28@psgtech.ac.in	$2b$10$LnEh5jvKx1.n6jPJyhAAo.uZ.FjmOMAl4I8KFyrmWkEckCoLdI/ia	STUDENT			sai_venki	22PC	CS	2022	2024-04-13 17:08:16.728	2024-08-14 15:36:14.276	2024-08-14 15:36:14.276
22PC33	22pc33@psgtech.ac.in	$2b$10$dDBvwbBcY5cCldtCe8tbPOZwGkkreJzHHE37lnkDXcL8GEo4JRjnS	STUDENT			shreenithi_2003	22PC	CS	2022	2024-04-13 17:08:16.728	2024-08-14 15:34:22.784	2024-08-14 15:34:22.784
22PC37	22pc37@psgtech.ac.in	$2b$10$jPuvS3lJbqsJ6yS0TIYHauWWRBxZp1AtRqY3q/l2obrL7L0P.5MEa	STUDENT			vengateshwaran	22PC	CS	2022	2024-04-13 17:08:16.728	2024-08-14 09:02:35.27	2024-08-14 09:14:51.139
22PW01	22pw01@psgtech.ac.in	$2b$10$t4YW2j3sGu1C8RrFN2S9wOs5kUQ4cMX6EumX/BX8GNhMkCXI2szwW	STUDENT	\N	\N	Ajay_180505	22PW	SS	2022	2024-08-15 13:37:49.462	2024-08-15 13:37:49.462	2024-08-15 13:37:49.462
22PW29	22pw29@psgtech.ac.in	$2b$10$.9Yf/KiTs4/uk3/538sP8uUJhUZAvA1q3WYx9PgrxzgzupAdO5NIq	STUDENT	\N	\N	Prem-Dharshan	22PW	SS	2022	2024-08-15 14:02:09.935	2024-08-15 14:02:09.935	2024-08-15 14:02:09.935
22PT07	22pt07@psgtech.ac.in	$2b$10$5XmiOIgzw3KvJPcBWn.mqOMj96G67XKMLpow2wHJBaX87wMpltjsi	STUDENT	\N	\N	thatcatfromspace	22PT	TCS	2022	2024-08-15 14:05:43.818	2024-08-15 14:05:43.818	2024-08-15 14:05:43.818
\.


--
-- Data for Name: User_Problem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User_Problem" ("timestamp", created_at, "problemId", "userId") FROM stdin;
2024-08-15 08:46:15.402	2024-08-15 08:46:15.402	integer-to-english-words	22PC33
2024-08-15 08:46:15.403	2024-08-15 08:46:15.403	number-of-senior-citizens	22PC33
2024-08-15 08:46:15.404	2024-08-15 08:46:15.404	kth-distinct-string-in-an-array	22PC33
2024-08-15 08:46:15.404	2024-08-15 08:46:15.404	minimum-common-value	22PC33
2024-08-15 08:46:15.405	2024-08-15 08:46:15.405	minimum-number-of-pushes-to-type-word-ii	22PC33
2024-08-15 08:46:15.424	2024-08-15 08:46:15.424	fill-missing-data	22PC33
2024-08-15 08:46:15.415	2024-08-15 08:46:15.415	reshape-data-melt	22PC33
2024-08-15 08:46:15.406	2024-08-15 08:46:15.406	article-views-i	22PC33
2024-08-15 08:46:15.431	2024-08-15 08:46:15.431	binary-search	22PC33
2024-08-15 08:46:15.411	2024-08-15 08:46:15.411	change-data-type	22PC33
2024-08-15 08:46:15.431	2024-08-15 08:46:15.431	reshape-data-pivot	22PC33
2024-08-15 08:46:15.411	2024-08-15 08:46:15.411	find-customer-referee	22PC33
2024-08-15 08:46:15.442	2024-08-15 08:46:15.442	evaluate-reverse-polish-notation	22PC33
2024-08-15 08:46:15.442	2024-08-15 08:46:15.442	method-chaining	22PC33
2024-08-15 08:46:15.44	2024-08-15 08:46:15.44	minimum-swaps-to-group-all-1s-together-ii	22PC33
2024-08-15 08:46:15.406	2024-08-15 08:46:15.406	reshape-data-concatenate	22PC33
2024-08-15 08:46:15.405	2024-08-15 08:46:15.405	merge-nodes-in-between-zeros	22PC33
2024-08-15 08:46:15.452	2024-08-15 08:46:15.452	invalid-tweets	22PC33
2024-08-15 08:46:15.452	2024-08-15 08:46:15.452	big-countries	22PC33
2024-08-15 08:46:15.453	2024-08-15 08:46:15.453	recyclable-and-low-fat-products	22PC33
2024-08-15 08:46:26.594	2024-08-15 08:46:26.594	merge-nodes-in-between-zeros	22PC19
2024-08-15 08:46:31.606	2024-08-15 08:46:31.606	palindrome-number	22PC19
2024-08-15 08:46:31.607	2024-08-15 08:46:31.607	remove-duplicates-from-sorted-list	22PC19
2024-08-15 08:46:31.607	2024-08-15 08:46:31.607	find-words-containing-character	22PC19
2024-08-15 08:46:31.606	2024-08-15 08:46:31.606	reverse-linked-list	22PC19
2024-08-15 08:46:31.607	2024-08-15 08:46:31.607	middle-of-the-linked-list	22PC19
2024-08-15 08:46:31.607	2024-08-15 08:46:31.607	shuffle-the-array	22PC19
2024-08-15 08:46:31.607	2024-08-15 08:46:31.607	number-of-good-pairs	22PC19
2024-08-15 08:46:31.608	2024-08-15 08:46:31.608	build-array-from-permutation	22PC19
2024-08-15 08:46:31.61	2024-08-15 08:46:31.61	find-minimum-operations-to-make-all-elements-divisible-by-three	22PC19
2024-08-15 08:46:31.611	2024-08-15 08:46:31.611	concatenation-of-array	22PC19
2024-08-15 08:46:31.612	2024-08-15 08:46:31.612	delete-node-in-a-linked-list	22PC19
2024-08-15 08:46:31.612	2024-08-15 08:46:31.612	three-consecutive-odds	22PC19
2024-08-15 08:46:31.612	2024-08-15 08:46:31.612	water-bottles	22PC19
2024-08-15 08:46:31.613	2024-08-15 08:46:31.613	palindrome-linked-list	22PC19
2024-08-15 08:46:31.615	2024-08-15 08:46:31.615	final-value-of-variable-after-performing-operations	22PC19
2024-08-15 08:46:31.627	2024-08-15 08:46:31.627	pass-the-pillow	22PC19
2024-08-15 08:46:31.627	2024-08-15 08:46:31.627	first-unique-character-in-a-string	22PC19
2024-08-15 08:46:31.634	2024-08-15 08:46:31.634	richest-customer-wealth	22PC19
2024-08-15 13:08:11.292	2024-08-15 13:08:11.292	minimum-swaps-to-group-all-1s-together-ii	22PC03
2024-08-15 13:08:11.292	2024-08-15 13:08:11.292	number-of-senior-citizens	22PC03
2024-08-15 13:08:11.292	2024-08-15 13:08:11.292	three-consecutive-odds	22PC03
2024-08-15 13:08:11.292	2024-08-15 13:08:11.292	reverse-linked-list	22PC03
2024-08-15 13:08:11.292	2024-08-15 13:08:11.292	kth-distinct-string-in-an-array	22PC03
2024-08-15 13:08:11.292	2024-08-15 13:08:11.292	integer-to-english-words	22PC03
2024-08-15 13:08:17.231	2024-08-15 13:08:17.231	score-of-a-string	22PC03
2024-08-15 13:08:17.231	2024-08-15 13:08:17.231	minimum-number-of-days-to-disconnect-island	22PC03
2024-08-15 13:08:17.232	2024-08-15 13:08:17.232	3sum	22PC03
2024-08-15 13:08:17.232	2024-08-15 13:08:17.232	ugly-number	22PC03
2024-08-15 13:08:17.232	2024-08-15 13:08:17.232	search-in-rotated-sorted-array	22PC03
2024-08-15 13:08:17.255	2024-08-15 13:08:17.255	find-first-and-last-position-of-element-in-sorted-array	22PC03
2024-08-15 13:08:17.254	2024-08-15 13:08:17.254	merge-sorted-array	22PC03
2024-08-15 13:08:17.255	2024-08-15 13:08:17.255	sort-the-people	22PC03
2024-08-15 13:08:17.256	2024-08-15 13:08:17.256	lucky-numbers-in-a-matrix	22PC03
2024-08-15 13:08:17.258	2024-08-15 13:08:17.258	find-valid-matrix-given-row-and-column-sums	22PC03
2024-08-15 13:08:17.262	2024-08-15 13:08:17.262	divide-two-integers	22PC03
2024-08-15 13:08:17.256	2024-08-15 13:08:17.256	sort-the-jumbled-numbers	22PC03
2024-08-15 13:08:17.26	2024-08-15 13:08:17.26	powx-n	22PC03
2024-08-15 13:08:17.223	2024-08-15 13:08:17.223	make-two-arrays-equal-by-reversing-subarrays	22PC03
2024-08-15 13:08:22.416	2024-08-15 13:08:22.416	reverse-linked-list	22PC15
2024-08-15 13:08:22.416	2024-08-15 13:08:22.416	middle-of-the-linked-list	22PC15
2024-08-15 13:08:22.417	2024-08-15 13:08:22.417	evaluate-reverse-polish-notation	22PC15
2024-08-15 13:08:22.416	2024-08-15 13:08:22.416	remove-duplicates-from-sorted-list	22PC15
2024-08-15 13:08:22.417	2024-08-15 13:08:22.417	water-bottles	22PC15
2024-08-15 13:08:27.369	2024-08-15 13:08:27.369	number-of-1-bits	22PC15
2024-08-15 13:08:27.37	2024-08-15 13:08:27.37	simplify-path	22PC15
2024-08-15 13:08:27.37	2024-08-15 13:08:27.37	valid-parentheses	22PC15
2024-08-15 13:08:27.369	2024-08-15 13:08:27.369	sqrtx	22PC15
2024-08-15 13:08:27.371	2024-08-15 13:08:27.371	single-number	22PC15
2024-08-15 13:08:27.372	2024-08-15 13:08:27.372	roman-to-integer	22PC15
2024-08-15 13:08:27.372	2024-08-15 13:08:27.372	merge-in-between-linked-lists	22PC15
2024-08-15 13:08:27.375	2024-08-15 13:08:27.375	reverse-bits	22PC15
2024-08-15 13:08:27.375	2024-08-15 13:08:27.375	find-the-index-of-the-first-occurrence-in-a-string	22PC15
2024-08-15 13:08:27.372	2024-08-15 13:08:27.372	sum-of-unique-elements	22PC15
2024-08-15 13:08:29.539	2024-08-15 13:08:29.539	roman-to-integer	22PC16
2024-08-15 13:08:29.539	2024-08-15 13:08:29.539	evaluate-reverse-polish-notation	22PC16
2024-08-15 13:08:29.539	2024-08-15 13:08:29.539	find-the-index-of-the-first-occurrence-in-a-string	22PC16
2024-08-15 13:08:29.539	2024-08-15 13:08:29.539	valid-parentheses	22PC16
2024-08-15 13:08:29.539	2024-08-15 13:08:29.539	simplify-path	22PC16
2024-08-15 13:08:29.539	2024-08-15 13:08:29.539	merge-sorted-array	22PC16
2024-08-15 13:08:32.483	2024-08-15 13:08:32.483	remove-duplicates-from-sorted-array	22PC16
2024-08-15 13:08:32.483	2024-08-15 13:08:32.483	move-zeroes	22PC16
2024-08-15 13:08:32.487	2024-08-15 13:08:32.487	linked-list-cycle	22PC16
2024-08-15 13:08:32.487	2024-08-15 13:08:32.487	length-of-last-word	22PC16
2024-08-15 13:08:32.488	2024-08-15 13:08:32.488	reverse-words-in-a-string	22PC16
2024-08-15 13:08:32.488	2024-08-15 13:08:32.488	assign-cookies	22PC16
2024-08-15 13:08:32.489	2024-08-15 13:08:32.489	third-maximum-number	22PC16
2024-08-15 13:08:32.5	2024-08-15 13:08:32.5	max-consecutive-ones	22PC16
2024-08-15 13:08:32.5	2024-08-15 13:08:32.5	majority-element	22PC16
2024-08-15 13:08:32.499	2024-08-15 13:08:32.499	missing-number	22PC16
2024-08-15 13:08:32.504	2024-08-15 13:08:32.504	search-insert-position	22PC16
2024-08-15 13:08:32.504	2024-08-15 13:08:32.504	remove-element	22PC16
2024-08-15 13:08:32.509	2024-08-15 13:08:32.509	contains-duplicate	22PC16
2024-08-15 13:08:35.865	2024-08-15 13:08:35.865	find-first-and-last-position-of-element-in-sorted-array	22PC28
2024-08-15 13:08:35.865	2024-08-15 13:08:35.865	single-number	22PC28
2024-08-15 13:08:35.865	2024-08-15 13:08:35.865	search-in-rotated-sorted-array	22PC28
2024-08-15 13:08:35.865	2024-08-15 13:08:35.865	integer-to-english-words	22PC28
2024-08-15 13:08:35.865	2024-08-15 13:08:35.865	search-insert-position	22PC28
2024-08-15 13:08:35.865	2024-08-15 13:08:35.865	third-maximum-number	22PC28
2024-08-15 13:08:35.865	2024-08-15 13:08:35.865	shuffle-the-array	22PC28
2024-08-15 13:08:35.865	2024-08-15 13:08:35.865	binary-search	22PC28
2024-08-15 13:08:35.865	2024-08-15 13:08:35.865	missing-number	22PC28
2024-08-15 13:08:35.865	2024-08-15 13:08:35.865	max-consecutive-ones	22PC28
2024-08-15 13:08:37.52	2024-08-15 13:08:37.52	strictly-palindromic-number	22PC28
2024-08-15 13:08:40.015	2024-08-15 13:08:40.015	reverse-substrings-between-each-pair-of-parentheses	22PC37
2024-08-15 13:08:35.865	2024-08-15 13:08:35.865	remove-duplicates-from-sorted-array	22PC28
2024-08-15 13:08:39.579	2024-08-15 13:08:39.579	valid-parentheses	22PC37
2024-08-15 13:08:40.015	2024-08-15 13:08:40.015	find-the-winner-of-the-circular-game	22PC37
2024-08-15 13:08:35.865	2024-08-15 13:08:35.865	kth-distinct-string-in-an-array	22PC28
2024-08-15 13:08:39.579	2024-08-15 13:08:39.579	binary-search	22PC37
2024-08-15 13:08:37.52	2024-08-15 13:08:37.52	nim-game	22PC28
2024-08-15 13:08:39.579	2024-08-15 13:08:39.579	delete-node-in-a-linked-list	22PC37
2024-08-15 13:08:37.522	2024-08-15 13:08:37.522	rotate-array	22PC28
2024-08-15 13:08:39.579	2024-08-15 13:08:39.579	palindrome-linked-list	22PC37
2024-08-15 13:08:37.522	2024-08-15 13:08:37.522	check-if-array-is-sorted-and-rotated	22PC28
2024-08-15 13:08:37.523	2024-08-15 13:08:37.523	count-pairs-whose-sum-is-less-than-target	22PC28
2024-08-15 13:08:39.579	2024-08-15 13:08:39.579	merge-nodes-in-between-zeros	22PC37
2024-08-15 13:08:39.579	2024-08-15 13:08:39.579	water-bottles	22PC37
2024-08-15 13:08:40.016	2024-08-15 13:08:40.016	maximum-count-of-positive-integer-and-negative-integer	22PC37
2024-08-15 13:08:59.809	2024-08-15 13:08:59.809	kth-distinct-string-in-an-array	22PC20
2024-08-15 13:09:04.806	2024-08-15 13:09:04.806	remove-duplicates-from-sorted-array-ii	22PC20
2024-08-15 13:08:59.809	2024-08-15 13:08:59.809	find-the-index-of-the-first-occurrence-in-a-string	22PC20
2024-08-15 13:09:04.803	2024-08-15 13:09:04.803	jump-game	22PC20
2024-08-15 13:08:59.809	2024-08-15 13:08:59.809	roman-to-integer	22PC20
2024-08-15 13:08:59.809	2024-08-15 13:08:59.809	find-valid-matrix-given-row-and-column-sums	22PC20
2024-08-15 13:08:59.809	2024-08-15 13:08:59.809	palindrome-linked-list	22PC20
2024-08-15 13:09:04.807	2024-08-15 13:09:04.807	rearrange-array-elements-by-sign	22PC20
2024-08-15 13:08:59.809	2024-08-15 13:08:59.809	remove-element	22PC20
2024-08-15 13:09:04.81	2024-08-15 13:09:04.81	spiral-matrix-iii	22PC20
2024-08-15 13:09:04.823	2024-08-15 13:09:04.823	jewels-and-stones	22PC20
2024-08-15 13:08:59.809	2024-08-15 13:08:59.809	rotate-array	22PC20
2024-08-15 13:09:04.821	2024-08-15 13:09:04.821	set-matrix-zeroes	22PC20
2024-08-15 13:08:59.809	2024-08-15 13:08:59.809	palindrome-number	22PC20
2024-08-15 13:08:59.809	2024-08-15 13:08:59.809	merge-sorted-array	22PC20
2024-08-15 13:09:04.823	2024-08-15 13:09:04.823	power-of-two	22PC20
2024-08-15 13:08:59.809	2024-08-15 13:08:59.809	remove-duplicates-from-sorted-array	22PC20
2024-08-15 13:09:04.803	2024-08-15 13:09:04.803	rectangle-overlap	22PC20
2024-08-15 13:09:04.804	2024-08-15 13:09:04.804	best-time-to-buy-and-sell-stock	22PC20
2024-08-15 13:09:04.817	2024-08-15 13:09:04.817	n-repeated-element-in-size-2n-array	22PC20
2024-08-15 13:38:42.915	2024-08-15 13:38:42.915	remove-element	22PW01
2024-08-15 13:38:42.915	2024-08-15 13:38:42.915	rotate-array	22PW01
2024-08-15 13:38:42.915	2024-08-15 13:38:42.915	reverse-linked-list	22PW01
2024-08-15 13:38:45.819	2024-08-15 13:38:45.819	longest-common-prefix	22PW01
2024-08-15 13:38:42.915	2024-08-15 13:38:42.915	set-matrix-zeroes	22PW01
2024-08-15 13:38:42.915	2024-08-15 13:38:42.915	find-the-index-of-the-first-occurrence-in-a-string	22PW01
2024-08-15 13:38:42.915	2024-08-15 13:38:42.915	palindrome-number	22PW01
2024-08-15 13:38:42.915	2024-08-15 13:38:42.915	powx-n	22PW01
2024-08-15 13:38:45.816	2024-08-15 13:38:45.816	remove-nth-node-from-end-of-list	22PW01
2024-08-15 13:38:42.915	2024-08-15 13:38:42.915	middle-of-the-linked-list	22PW01
2024-08-15 13:38:42.915	2024-08-15 13:38:42.915	majority-element	22PW01
2024-08-15 13:38:45.816	2024-08-15 13:38:45.816	merge-two-sorted-lists	22PW01
2024-08-15 13:38:45.82	2024-08-15 13:38:45.82	binary-tree-inorder-traversal	22PW01
2024-08-15 13:38:42.915	2024-08-15 13:38:42.915	delete-node-in-a-linked-list	22PW01
2024-08-15 13:38:42.915	2024-08-15 13:38:42.915	valid-parentheses	22PW01
2024-08-15 13:38:45.816	2024-08-15 13:38:45.816	squares-of-a-sorted-array	22PW01
2024-08-15 13:38:45.818	2024-08-15 13:38:45.818	longest-palindromic-substring	22PW01
2024-08-15 13:38:45.819	2024-08-15 13:38:45.819	sort-colors	22PW01
2024-08-15 13:38:45.818	2024-08-15 13:38:45.818	flatten-binary-tree-to-linked-list	22PW01
2024-08-15 14:02:18.987	2024-08-15 14:02:18.987	linked-list-cycle	22PW29
2024-08-15 14:02:22.044	2024-08-15 14:02:22.044	ransom-note	22PW29
2024-08-15 14:02:18.988	2024-08-15 14:02:18.988	squares-of-a-sorted-array	22PW29
2024-08-15 14:02:22.038	2024-08-15 14:02:22.038	fizz-buzz	22PW29
2024-08-15 14:02:22.043	2024-08-15 14:02:22.043	find-numbers-with-even-number-of-digits	22PW29
2024-08-15 14:02:18.988	2024-08-15 14:02:18.988	palindrome-number	22PW29
2024-08-15 14:05:55.314	2024-08-15 14:05:55.314	minimum-bit-flips-to-convert-number	22PT07
2024-08-15 14:05:55.319	2024-08-15 14:05:55.319	rotate-string	22PT07
2024-08-15 14:02:18.988	2024-08-15 14:02:18.988	max-consecutive-ones	22PW29
2024-08-15 14:05:55.315	2024-08-15 14:05:55.315	count-and-say	22PT07
2024-08-15 14:05:55.319	2024-08-15 14:05:55.319	sort-list	22PT07
2024-08-15 14:05:55.321	2024-08-15 14:05:55.321	counter-ii	22PT07
2024-08-15 14:05:55.314	2024-08-15 14:05:55.314	filter-elements-from-array	22PT07
2024-08-15 14:02:18.988	2024-08-15 14:02:18.988	middle-of-the-linked-list	22PW29
2024-08-15 14:02:22.037	2024-08-15 14:02:22.037	number-of-steps-to-reduce-a-number-to-zero	22PW29
2024-08-15 14:05:55.319	2024-08-15 14:05:55.319	add-two-numbers	22PT07
2024-08-15 14:02:18.988	2024-08-15 14:02:18.988	remove-duplicates-from-sorted-array	22PW29
2024-08-15 14:05:55.316	2024-08-15 14:05:55.316	delete-the-middle-node-of-a-linked-list	22PT07
2024-08-15 14:05:55.32	2024-08-15 14:05:55.32	counter	22PT07
2024-08-15 14:02:22.04	2024-08-15 14:02:22.04	intersection-of-two-linked-lists	22PW29
2024-08-15 14:02:22.041	2024-08-15 14:02:22.041	two-sum	22PW29
2024-08-15 14:05:55.314	2024-08-15 14:05:55.314	to-be-or-not-to-be	22PT07
2024-08-15 14:02:18.988	2024-08-15 14:02:18.988	reverse-linked-list	22PW29
2024-08-15 14:02:18.988	2024-08-15 14:02:18.988	richest-customer-wealth	22PW29
2024-08-15 14:05:55.32	2024-08-15 14:05:55.32	function-composition	22PT07
2024-08-15 14:05:55.316	2024-08-15 14:05:55.316	largest-odd-number-in-string	22PT07
2024-08-15 14:05:55.32	2024-08-15 14:05:55.32	create-hello-world-function	22PT07
2024-08-15 14:02:22.04	2024-08-15 14:02:22.04	reverse-string	22PW29
2024-08-15 14:05:53.586	2024-08-15 14:05:53.586	palindrome-linked-list	22PT07
2024-08-15 14:02:22.041	2024-08-15 14:02:22.041	running-sum-of-1d-array	22PW29
2024-08-15 14:05:53.586	2024-08-15 14:05:53.586	linked-list-cycle	22PT07
2024-08-15 14:05:55.315	2024-08-15 14:05:55.315	valid-anagram	22PT07
2024-08-15 14:05:53.586	2024-08-15 14:05:53.586	kth-distinct-string-in-an-array	22PT07
2024-08-15 14:05:53.587	2024-08-15 14:05:53.587	minimum-number-of-pushes-to-type-word-ii	22PT07
2024-08-15 14:05:55.314	2024-08-15 14:05:55.314	return-length-of-arguments-passed	22PT07
2024-08-15 14:05:55.316	2024-08-15 14:05:55.316	apply-transform-over-each-element-in-array	22PT07
2024-08-15 13:08:35.865	2024-08-15 13:08:35.865	move-zeroes	22PC28
2024-08-15 13:08:40.015	2024-08-15 13:08:40.015	odd-even-linked-list	22PC37
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
e51894d9-5cb9-4e53-b64d-855ea10c5f5b	d18e5e64f5926350bceb96737f705617080c64ae8e0b5f7e643af9a0cb546f91	2024-08-15 14:12:20.449504+05:30	20240815084220_squashed_migration	\N	\N	2024-08-15 14:12:20.427949+05:30	1
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

