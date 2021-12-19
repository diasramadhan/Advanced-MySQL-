<html>
<head>
<title>Index.sql</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
.s0 { color: #cc7832;}
.s1 { color: #a9b7c6;}
.s2 { color: #6897bb;}
.s3 { color: #6a8759;}
.s4 { color: #808080;}
</style>
</head>
<body bgcolor="#2b2b2b">
<table CELLSPACING=0 CELLPADDING=5 COLS=1 WIDTH="100%" BGCOLOR="#606060" >
<tr><td><center>
<font face="Arial, Helvetica" color="#000000">
Index.sql</font>
</center></td></tr></table>
<pre><span class="s0">create database </span><span class="s1">indexTutorial</span><span class="s0">;</span>
<span class="s0">show  databases ;</span>
<span class="s0">use </span><span class="s1">indexTutorial</span><span class="s0">;</span>
<span class="s0">show tables ;</span>

<span class="s0">create table </span><span class="s1">mahasiswa(</span>
    <span class="s1">mhs_id </span><span class="s0">int not null auto_increment,</span>
    <span class="s1">first_name </span><span class="s0">varchar</span><span class="s1">(</span><span class="s2">100</span><span class="s1">) </span><span class="s0">default null,</span>
    <span class="s1">last_name </span><span class="s0">varchar</span><span class="s1">(</span><span class="s2">100</span><span class="s1">) </span><span class="s0">default null,</span>
    <span class="s1">tempat_lahir </span><span class="s0">varchar</span><span class="s1">(</span><span class="s2">100</span><span class="s1">) </span><span class="s0">default null,</span>
    <span class="s1">tanggal_lahir </span><span class="s0">date default null,</span>
    <span class="s0">primary key </span><span class="s1">(mhs_id)</span><span class="s0">,</span>
    <span class="s0">index </span><span class="s1">(first_name)</span>
<span class="s1">)</span><span class="s0">;</span>

<span class="s0">show index from </span><span class="s1">mahasiswa</span><span class="s0">;</span>
<span class="s0">create index </span><span class="s1">last_name_idx </span><span class="s0">on </span><span class="s1">mahasiswa(last_name)</span><span class="s0">;</span>

<span class="s0">insert into </span><span class="s1">mahasiswa (first_name</span><span class="s0">, </span><span class="s1">last_name</span><span class="s0">, </span><span class="s1">tempat_lahir</span><span class="s0">, </span><span class="s1">tanggal_lahir) </span><span class="s0">VALUES</span>
<span class="s1">(</span><span class="s3">'Asep'</span><span class="s0">,</span><span class="s3">'kamarudin'</span><span class="s0">,</span><span class="s3">'jakarta'</span><span class="s0">,</span><span class="s3">'2000-01-04'</span><span class="s1">)</span><span class="s0">,</span>
<span class="s1">(</span><span class="s3">'Dias'</span><span class="s0">,</span><span class="s3">'Ramadhan'</span><span class="s0">,</span><span class="s3">'Nganjuk'</span><span class="s0">,</span><span class="s3">'2001-11-24'</span><span class="s1">)</span><span class="s0">,</span>
<span class="s1">(</span><span class="s3">'Rama'</span><span class="s0">,</span><span class="s3">'Dima'</span><span class="s0">,</span><span class="s3">'Sukomoro'</span><span class="s0">,</span><span class="s3">'2000-11-14'</span><span class="s1">)</span><span class="s0">,</span>
<span class="s1">(</span><span class="s3">'Noermala'</span><span class="s0">,</span><span class="s3">'Riska'</span><span class="s0">,</span><span class="s3">'Prambon'</span><span class="s0">,</span><span class="s3">'2000-01-04'</span><span class="s1">)</span><span class="s0">,</span>
<span class="s1">(</span><span class="s3">'Mala'</span><span class="s0">,</span><span class="s3">'Agustin'</span><span class="s0">,</span><span class="s3">'jakarta'</span><span class="s0">,</span><span class="s3">'2002-08-25'</span><span class="s1">)</span><span class="s0">;</span>

<span class="s0">select </span><span class="s1">* </span><span class="s0">from </span><span class="s1">mahasiswa</span><span class="s0">;</span>
<span class="s0">select </span><span class="s1">* </span><span class="s0">from </span><span class="s1">mahasiswa </span><span class="s0">where </span><span class="s1">tempat_lahir = </span><span class="s3">'Nganjuk'</span><span class="s0">;</span>

<span class="s4">#=====================================================================================</span>
<span class="s4">/* 
  1. analisa join table 
  2. show index 
  3. drop index 
  4. explain, explain format tree, explain format json 
 */</span>
<span class="s0">drop index </span><span class="s1">last_name_idx </span><span class="s0">on </span><span class="s1">mahasiswa</span><span class="s0">;</span>


<span class="s4">#=====================================================================================</span>
<span class="s4">/* 
 1. konsep dasar unique index 
 2. membuat unique index bersama create table 
 3. membuat unique index dengan alter table 
 4. membuat unique index dengan create unique index 
 5. unique index di MySql bisa menyimpan null lebih dari 1 
 */</span>

<span class="s0">show tables ;</span>

<span class="s0">show index from </span><span class="s1">mahasiswa</span><span class="s0">;</span>

<span class="s4"># drop table bararang;</span>
<span class="s4"># cara 1</span>
<span class="s0">create table </span><span class="s1">barang(</span>
    <span class="s1">barang_id </span><span class="s0">int primary key auto_increment,</span>
    <span class="s1">barcode </span><span class="s0">varchar</span><span class="s1">(</span><span class="s2">50</span><span class="s1">) </span><span class="s0">unique,</span>
    <span class="s1">nama </span><span class="s0">varchar</span><span class="s1">(</span><span class="s2">100</span><span class="s1">)</span>
<span class="s1">)</span><span class="s0">;</span>
<span class="s4"># cara 2</span>
<span class="s0">create table </span><span class="s1">barang(</span>
    <span class="s1">barang_id </span><span class="s0">int primary key auto_increment,</span>
    <span class="s1">barcode </span><span class="s0">varchar</span><span class="s1">(</span><span class="s2">50</span><span class="s1">)</span><span class="s0">,</span>
    <span class="s1">nama </span><span class="s0">varchar</span><span class="s1">(</span><span class="s2">100</span><span class="s1">)</span><span class="s0">,</span>
    <span class="s0">unique index </span><span class="s1">barcode_uniqueidx (barcode)</span>
<span class="s1">)</span><span class="s0">;</span>
<span class="s4"># cara 3</span>
<span class="s0">create table </span><span class="s1">barang(</span>
    <span class="s1">barang_id </span><span class="s0">int primary key auto_increment,</span>
    <span class="s1">barcode </span><span class="s0">varchar</span><span class="s1">(</span><span class="s2">50</span><span class="s1">)</span><span class="s0">,</span>
    <span class="s1">nama </span><span class="s0">varchar</span><span class="s1">(</span><span class="s2">100</span><span class="s1">)</span><span class="s0">,</span>
    <span class="s0">constraint </span><span class="s1">barcode_idx </span><span class="s0">unique index </span><span class="s1">(barcode)</span>
<span class="s1">)</span><span class="s0">;</span>

<span class="s0">desc </span><span class="s1">barang</span><span class="s0">;</span>

<span class="s0">drop table </span><span class="s1">barang</span><span class="s0">;</span>

<span class="s0">show index from </span><span class="s1">barang</span><span class="s0">;</span>

<span class="s0">drop index </span><span class="s1">barcode_idx </span><span class="s0">on </span><span class="s1">indextutorial.barang</span><span class="s0">;</span>

<span class="s0">alter table </span><span class="s1">barang</span>
    <span class="s0">change </span><span class="s1">barcode barcode </span><span class="s0">varchar</span><span class="s1">(</span><span class="s2">100</span><span class="s1">) </span><span class="s0">unique ;</span>

<span class="s0">create unique index </span><span class="s1">barcode_barang_idx </span><span class="s0">on </span><span class="s1">barang (barcode)</span><span class="s0">;</span>













</pre>
</body>
</html>