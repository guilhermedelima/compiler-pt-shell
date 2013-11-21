--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.9
-- Dumped by pg_dump version 9.1.9
-- Started on 2013-11-19 17:42:05 BRST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 7 (class 2615 OID 16825)
-- Name: syntax; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA syntax;


ALTER SCHEMA syntax OWNER TO postgres;

SET search_path = syntax, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 165 (class 1259 OID 16880)
-- Dependencies: 7
-- Name: comandos; Type: TABLE; Schema: syntax; Owner: postgres; Tablespace: 
--

CREATE TABLE comandos (
    id_comando integer NOT NULL,
    nome character varying(25),
    pipe character(1)
);


ALTER TABLE syntax.comandos OWNER TO postgres;

--
-- TOC entry 164 (class 1259 OID 16878)
-- Dependencies: 165 7
-- Name: comando_shell_id_comando_seq; Type: SEQUENCE; Schema: syntax; Owner: postgres
--

CREATE SEQUENCE comando_shell_id_comando_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE syntax.comando_shell_id_comando_seq OWNER TO postgres;

--
-- TOC entry 1923 (class 0 OID 0)
-- Dependencies: 164
-- Name: comando_shell_id_comando_seq; Type: SEQUENCE OWNED BY; Schema: syntax; Owner: postgres
--

ALTER SEQUENCE comando_shell_id_comando_seq OWNED BY comandos.id_comando;


--
-- TOC entry 166 (class 1259 OID 16917)
-- Dependencies: 7
-- Name: relacao_verbo_comando; Type: TABLE; Schema: syntax; Owner: postgres; Tablespace: 
--

CREATE TABLE relacao_verbo_comando (
    id_verbo integer,
    id_comando integer,
    verbo character varying(30),
    comando character varying(25)
);


ALTER TABLE syntax.relacao_verbo_comando OWNER TO postgres;

--
-- TOC entry 163 (class 1259 OID 16828)
-- Dependencies: 7
-- Name: verbos; Type: TABLE; Schema: syntax; Owner: postgres; Tablespace: 
--

CREATE TABLE verbos (
    id_verbo integer NOT NULL,
    infinitivo character varying(15),
    "is" character varying(100),
    fi character varying(100),
    ti character varying(100),
    ii character varying(100),
    fn character varying(100),
    ps character varying(100),
    mi character varying(100),
    "in" character varying(100),
    ia character varying(100),
    fs character varying(100),
    pi character varying(100),
    ip character varying(100),
    ei character varying(100)
);


ALTER TABLE syntax.verbos OWNER TO postgres;

--
-- TOC entry 162 (class 1259 OID 16826)
-- Dependencies: 7 163
-- Name: verbos_id_verbo_seq; Type: SEQUENCE; Schema: syntax; Owner: postgres
--

CREATE SEQUENCE verbos_id_verbo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE syntax.verbos_id_verbo_seq OWNER TO postgres;

--
-- TOC entry 1924 (class 0 OID 0)
-- Dependencies: 162
-- Name: verbos_id_verbo_seq; Type: SEQUENCE OWNED BY; Schema: syntax; Owner: postgres
--

ALTER SEQUENCE verbos_id_verbo_seq OWNED BY verbos.id_verbo;


--
-- TOC entry 1905 (class 2604 OID 16883)
-- Dependencies: 164 165 165
-- Name: id_comando; Type: DEFAULT; Schema: syntax; Owner: postgres
--

ALTER TABLE ONLY comandos ALTER COLUMN id_comando SET DEFAULT nextval('comando_shell_id_comando_seq'::regclass);


--
-- TOC entry 1904 (class 2604 OID 16831)
-- Dependencies: 163 162 163
-- Name: id_verbo; Type: DEFAULT; Schema: syntax; Owner: postgres
--

ALTER TABLE ONLY verbos ALTER COLUMN id_verbo SET DEFAULT nextval('verbos_id_verbo_seq'::regclass);


--
-- TOC entry 1925 (class 0 OID 0)
-- Dependencies: 164
-- Name: comando_shell_id_comando_seq; Type: SEQUENCE SET; Schema: syntax; Owner: postgres
--

SELECT pg_catalog.setval('comando_shell_id_comando_seq', 8, true);


--
-- TOC entry 1917 (class 0 OID 16880)
-- Dependencies: 165 1919
-- Data for Name: comandos; Type: TABLE DATA; Schema: syntax; Owner: postgres
--

INSERT INTO comandos VALUES (2, 'cat', 's');
INSERT INTO comandos VALUES (3, 'ls', 's');
INSERT INTO comandos VALUES (6, 'grep', 's');
INSERT INTO comandos VALUES (1, 'mkdir', 'n');
INSERT INTO comandos VALUES (4, 'cd', 'n');
INSERT INTO comandos VALUES (5, 'cp', 'n');
INSERT INTO comandos VALUES (7, 'rm', 'n');
INSERT INTO comandos VALUES (8, 'touch', 'n');


--
-- TOC entry 1918 (class 0 OID 16917)
-- Dependencies: 166 1919
-- Data for Name: relacao_verbo_comando; Type: TABLE DATA; Schema: syntax; Owner: postgres
--

INSERT INTO relacao_verbo_comando VALUES (12, 4, 'ir', 'cd');
INSERT INTO relacao_verbo_comando VALUES (14, 4, 'mudar', 'cd');
INSERT INTO relacao_verbo_comando VALUES (1, 3, 'mostrar', 'ls');
INSERT INTO relacao_verbo_comando VALUES (2, 3, 'ver', 'ls');
INSERT INTO relacao_verbo_comando VALUES (4, 3, 'exibir', 'ls');
INSERT INTO relacao_verbo_comando VALUES (7, 1, 'criar', 'mkdir');
INSERT INTO relacao_verbo_comando VALUES (8, 1, 'gerar', 'mkdir');
INSERT INTO relacao_verbo_comando VALUES (17, 7, 'apagar', 'rm');
INSERT INTO relacao_verbo_comando VALUES (18, 7, 'remover', 'rm');
INSERT INTO relacao_verbo_comando VALUES (22, 5, 'copiar', 'cp');
INSERT INTO relacao_verbo_comando VALUES (25, 6, 'encontrar', 'grep');
INSERT INTO relacao_verbo_comando VALUES (26, 6, 'buscar', 'grep');
INSERT INTO relacao_verbo_comando VALUES (27, 6, 'filtrar', 'grep');
INSERT INTO relacao_verbo_comando VALUES (1, 2, 'mostrar', 'cat');
INSERT INTO relacao_verbo_comando VALUES (2, 2, 'ver', 'cat');
INSERT INTO relacao_verbo_comando VALUES (4, 2, 'exibir', 'cat');
INSERT INTO relacao_verbo_comando VALUES (7, 8, 'criar', 'touch');
INSERT INTO relacao_verbo_comando VALUES (8, 8, 'gerar', 'touch');


--
-- TOC entry 1915 (class 0 OID 16828)
-- Dependencies: 163 1919
-- Data for Name: verbos; Type: TABLE DATA; Schema: syntax; Owner: postgres
--

INSERT INTO verbos VALUES (1, 'mostrar', 'mostrasse:mostrasses:mostrasse:mostrssemos:mostrsseis:mostrassem', 'mostrarei:mostrars:mostrar:mostraremos:mostrareis:mostraro', 'mostraria:mostrarias:mostraria:mostraramos:mostrareis:mostrariam', 'mostrava:mostravas:mostrava:mostrvamos:mostrveis:mostravam', 'mostrar:mostrando:mostrado', 'mostre:mostres:mostre:mostremos:mostreis:mostrem', 'mostrara:mostraras:mostrara:mostrramos:mostrreis:mostraram', 'mostres:mostre:mostremos:mostreis:mostrem', 'mostra:mostre:mostremos:mostrai:mostrem', 'mostrar:mostrares:mostrar:mostrarmos:mostrardes:mostrarem', 'mostro:mostras:mostra:mostramos:mostrais:mostram', 'mostrar:mostrares:mostrar:mostrarmos:mostrardes:mostrarem', 'mostrei:mostraste:mostrou:mostramos:mostrastes:mostraram');
INSERT INTO verbos VALUES (2, 'ver', 'visse:visses:visse:vssemos:vsseis:vissem', 'verei:vers:ver:veremos:vereis:vero', 'veria:verias:veria:veramos:vereis:veriam', 'via:vias:via:vamos:veis:viam', 'ver:vendo:visto', 'veja:vejas:vejamos:vejais:vejam', 'vira:viras:vira:vramos:vreis:viram', 'vejas:veja:vejamos:vejais:vejam', 'v:veja:vejamos:vede:vejam', 'vir:vires:vir:virmos:virdes:virem', 'vejo:vs:v:vemos:vedes:vem', 'ver:veres:ver:vermos:verdes:verem', 'vi:viste:viu:vimos:vistes:viram');
INSERT INTO verbos VALUES (3, 'demonstrar', 'demonstrasse:demonstrasses:demonstrasse:demonstrssemos:demonstrsseis:demonstrassem', 'demonstrarei:demonstrars:demonstrar:demonstraremos:demonstrareis:demonstraro', 'demonstraria:demonstrarias:demonstraria:demonstraramos:demonstrareis:demonstrariam', 'demonstrava:demonstravas:demonstrava:demonstrvamos:demonstrveis:demonstravam', 'demonstrar:demonstrando:demonstrado', 'demonstre:demonstres:demonstre:demonstremos:demonstreis:demonstrem', 'demonstrara:demonstraras:demonstrara:demonstrramos:demonstrreis:demonstraram', 'demonstres:demonstre:demonstremos:demonstreis:demonstrem', 'demonstra:demonstre:demonstremos:demonstrai:demonstrem', 'demonstrar:demonstrares:demonstrar:demonstrarmos:demonstrardes:demonstrarem', 'demonstro:demonstras:demonstra:demonstramos:demonstrais:demonstram', 'demonstrar:demonstrares:demonstrar:demonstrarmos:demonstrardes:demonstrarem', 'demonstrei:demonstraste:demonstrou:demonstramos:demonstrastes:demonstraram');
INSERT INTO verbos VALUES (4, 'exibir', 'exibisse:exibisses:exibisse:exibssemos:exibsseis:exibissem', 'exibirei:exibirs:exibir:exibiremos:exibireis:exibiro', 'exibiria:exibirias:exibiria:exibiramos:exibireis:exibiriam', 'exibia:exibias:exibia:exibamos:exibeis:exibiam', 'exibir:exibindo:exibido', 'exiba:exibas:exiba:exibamos:exibais:exibam', 'exibira:exibiras:exibira:exibramos:exibreis:exibiram', 'exibas:exiba:exibamos:exibais:exibam', 'exibe:exiba:exibamos:exibi:exibam', 'exibir:exibires:exibir:exibirmos:exibirdes:exibirem', 'exibo:exibes:exibe:exibimos:exibis:exibem', 'exibir:exibires:exibir:exibirmos:exibirdes:exibirem', 'exibi:exibiste:exibiu:exibimos:exibistes:exibiram');
INSERT INTO verbos VALUES (5, 'expor', 'expusesse:expusesses:expusesse:expusssemos:expussseis:expusessem', 'exporei:expors:expor:exporemos:exporeis:exporo', 'exporia:exporias:exporia:exporamos:exporeis:exporiam', 'expunha:expunhas:expunha:expnhamos:expnheis:expunham', 'expor:expondo:exposto', 'exponha:exponhas:exponha:exponhamos:exponhais:exponham', 'expusera:expuseras:expusera:expusramos:expusreis:expuseram', 'exponhas:exponha:exponhamos:exponhais:exponham', 'expe:exponha:exponhamos:exponde:exponham', 'expuser:expuseres:expuser:expusermos:expuserdes:expuserem', 'exponho:expes:expe:expomos:expondes:expem', 'expor:expores:expor:expormos:expordes:exporem', 'expus:expuseste:exps:expusemos:expusestes:expuseram');
INSERT INTO verbos VALUES (6, 'apontar', 'apontasse:apontasses:apontasse:apontssemos:apontsseis:apontassem', 'apontarei:apontars:apontar:apontaremos:apontareis:apontaro', 'apontaria:apontarias:apontaria:apontaramos:apontareis:apontariam', 'apontava:apontavas:apontava:apontvamos:apontveis:apontavam', 'apontar:apontando:apontado', 'aponte:apontes:aponte:apontemos:aponteis:apontem', 'apontara:apontaras:apontara:apontramos:apontreis:apontaram', 'apontes:aponte:apontemos:aponteis:apontem', 'aponta:aponte:apontemos:apontai:apontem', 'apontar:apontares:apontar:apontarmos:apontardes:apontarem', 'aponto:apontas:aponta:apontamos:apontais:apontam', 'apontar:apontares:apontar:apontarmos:apontardes:apontarem', 'apontei:apontaste:apontou:apontamos:apontastes:apontaram');
INSERT INTO verbos VALUES (7, 'criar', 'criasse:criasses:criasse:crissemos:crisseis:criassem', 'criarei:criars:criar:criaremos:criareis:criaro', 'criaria:criarias:criaria:criaramos:criareis:criariam', 'criava:criavas:criava:crivamos:criveis:criavam', 'criar:criando:criado', 'crie:cries:crie:criemos:crieis:criem', 'criara:criaras:criara:criramos:crireis:criaram', 'cries:crie:criemos:crieis:criem', 'cria:crie:criemos:criai:criem', 'criar:criares:criar:criarmos:criardes:criarem', 'crio:crias:cria:criamos:criais:criam', 'criar:criares:criar:criarmos:criardes:criarem', 'criei:criaste:criou:criamos:criastes:criaram');
INSERT INTO verbos VALUES (8, 'gerar', 'gerasse:gerasses:gerasse:gerssemos:gersseis:gerassem', 'gerarei:gerars:gerar:geraremos:gerareis:geraro', 'geraria:gerarias:geraria:geraramos:gerareis:gerariam', 'gerava:geravas:gerava:gervamos:gerveis:geravam', 'gerar:gerando:gerado', 'gere:geres:gere:geremos:gereis:gerem', 'gerara:geraras:gerara:gerramos:gerreis:geraram', 'geres:gere:geremos:gereis:gerem', 'gera:gere:geremos:gerai:gerem', 'gerar:gerares:gerar:gerarmos:gerardes:gerarem', 'gero:geras:gera:geramos:gerais:geram', 'gerar:gerares:gerar:gerarmos:gerardes:gerarem', 'gerei:geraste:gerou:geramos:gerastes:geraram');
INSERT INTO verbos VALUES (9, 'fazer', 'fizesse:fizesses:fizesse:fizssemos:fizsseis:fizessem', 'farei:fars:far:faremos:fareis:faro', 'faria:farias:faria:faramos:fareis:fariam', 'fazia:fazias:fazia:fazamos:fazeis:faziam', 'fazer:fazendo:feito', 'faa:faas:faa:faamos:faais:faam', 'fizera:fizeras:fizera:fizramos:fizreis:fizeram', 'faas:faa:faamos:faais:faam', 'faze:faa:faamos:fazei:faam', 'fizer:fizeres:fizer:fizermos:fizerdes:fizerem', 'fao:fazes:faz:fazemos:fazeis:fazem', 'fazer:fazeres:fazer:fazermos:fazerdes:fazerem', 'fiz:fizeste:fez:fizemos:fizestes:fizeram');
INSERT INTO verbos VALUES (10, 'originar', 'originasse:originasses:originasse:originssemos:originsseis:originassem', 'originarei:originars:originar:originaremos:originareis:originaro', 'originaria:originarias:originaria:originaramos:originareis:originariam', 'originava:originavas:originava:originvamos:originveis:originavam', 'originar:originando:originado', 'origine:origines:origine:originemos:origineis:originem', 'originara:originaras:originara:originramos:originreis:originaram', 'origines:origine:originemos:origineis:originem', 'origina:origine:originemos:originai:originem', 'originar:originares:originar:originarmos:originardes:originarem', 'origino:originas:origina:originamos:originais:originam', 'originar:originares:originar:originarmos:originardes:originarem', 'originei:originaste:originou:originamos:originastes:originaram');
INSERT INTO verbos VALUES (11, 'formar', 'formasse:formasses:formasse:formssemos:formsseis:formassem', 'formarei:formars:formar:formaremos:formareis:formaro', 'formaria:formarias:formaria:formaramos:formareis:formariam', 'formava:formavas:formava:formvamos:formveis:formavam', 'formar:formando:formado', 'forme:formes:forme:formemos:formeis:formem', 'formara:formaras:formara:formramos:formreis:formaram', 'formes:forme:formemos:formeis:formem', 'forma:forme:formemos:formai:formem', 'formar:formares:formar:formarmos:formardes:formarem', 'formo:formas:forma:formamos:formais:formam', 'formar:formares:formar:formarmos:formardes:formarem', 'formei:formaste:formou:formamos:formastes:formaram');
INSERT INTO verbos VALUES (12, 'ir', 'fosse:fosses:fosse:fssemos:fsseis:fossem', 'irei:irs:ir:iremos:ireis:iro', 'iria:irias:iria:iramos:ireis:iriam', 'ia:ias:ia:amos:eis:iam', 'ir:indo:ido', 'v:vs:v:vamos:vades:vo', 'fora:foras:fora:framos:freis:foram', 'vs:v:vamos:vades:vo', 'vai:v:vamos:ide:vo', 'for:fores:for:formos:fordes:forem', 'vou:vais:vai:vamos:ides:vo', 'ir:ires:ir:irmos:irdes:irem', 'fui:foste:foi:fomos:fostes:foram');
INSERT INTO verbos VALUES (13, 'mover', 'movesse:movesses:movesse:movssemos:movsseis:movessem', 'moverei:movers:mover:moveremos:movereis:movero', 'moveria:moverias:moveria:moveramos:movereis:moveriam', 'movia:movias:movia:movamos:moveis:moviam', 'mover:movendo:movido', 'mova:movas:mova:movamos:movais:movam', 'movera:moveras:movera:movramos:movreis:moveram', 'movas:mova:movamos:movais:movam', 'move:mova:movamos:movei:movam', 'mover:moveres:mover:movermos:moverdes:moverem', 'movo:moves:move:movemos:moveis:movem', 'mover:moveres:mover:movermos:moverdes:moverem', 'movi:moveste:moveu:movemos:movestes:movera');
INSERT INTO verbos VALUES (14, 'mudar', 'mudasse:mudasses:mudasse:mudssemos:mudsseis:mudassem', 'mudarei:mudars:mudar:mudaremos:mudareis:mudaro', 'mudaria:mudarias:mudaria:mudaramos:mudareis:mudariam', 'mudava:mudavas:mudava:mudvamos:mudveis:mudavam', 'mudar:mudando:mudado', 'mude:mudes:mude:mudemos:mudeis:mudem', 'mudara:mudaras:mudara:mudramos:mudreis:mudaram', 'mudes:mude:mudemos:mudeis:mudem', 'muda:mude:mudemos:mudai:mudem', 'mudar:mudares:mudar:mudarmos:mudardes:mudarem', 'mudo:mudas:muda:mudamos:mudais:mudam', 'mudar:mudares:mudar:mudarmos:mudardes:mudarem', 'mudei:mudaste:mudou:mudamos:mudastes:mudaram');
INSERT INTO verbos VALUES (15, 'deslocar', 'deslocasse:deslocasses:deslocasse:deslocssemos:deslocsseis:deslocassem', 'deslocarei:deslocars:deslocar:deslocaremos:deslocareis:deslocaro', 'deslocaria:deslocarias:deslocaria:deslocaramos:deslocareis:deslocariam', 'deslocava:deslocavas:deslocava:deslocvamos:deslocveis:deslocavam', 'deslocar:deslocando:deslocado', 'desloque:desloques:desloque:desloquemos:desloqueis:desloquem', 'deslocara:deslocaras:deslocara:deslocramos:deslocreis:deslocaram', 'desloques:desloque:desloquemos:desloqueis:desloquem', 'desloca:desloque:desloquemos:deslocai:desloquem', 'deslocar:deslocares:deslocar:deslocarmos:deslocardes:deslocarem', 'desloco:deslocas:desloca:deslocamos:deslocais:deslocam', 'deslocar:deslocares:deslocar:deslocarmos:deslocardes:deslocarem', 'desloquei:deslocaste:deslocou:deslocamos:deslocastes:deslocaram');
INSERT INTO verbos VALUES (16, 'conduzir', 'conduzisse:conduzisses:conduzisse:conduzssemos:conduzsseis:conduzissem', 'conduzirei:conduzirs:conduzir:conduziremos:conduzireis:conduziro', 'conduziria:conduzirias:conduziria:conduziramos:conduzireis:conduziriam', 'conduzia:conduzias:conduzia:conduzamos:conduzeis:conduziam', 'conduzir:conduzindo:conduzido', 'conduza:conduzas:conduza:conduzamos:conduzais:conduzam', 'conduzira:conduziras:conduzira:conduzramos:conduzreis:conduziram', 'conduzas:conduza:conduzamos:conduzais:conduzam', 'conduze:conduza:conduzamos:conduzi:conduzam', 'conduzir:conduzires:conduzir:conduzirmos:conduzirdes:conduzirem', 'conduzo:conduzes:conduz:conduzimos:conduzis:conduzem', 'conduzir:conduzires:conduzir:conduzirmos:conduzirdes:conduzirem', 'conduzi:conduziste:conduziu:conduzimos:conduzistes:conduziram');
INSERT INTO verbos VALUES (17, 'apagar', 'apagasse:apagasses:apagasse:apagssemos:apagsseis:apagassem', 'apagarei:apagars:apagar:apagaremos:apagareis:apagaro', 'apagaria:apagarias:apagaria:apagaramos:apagareis:apagariam', 'apagava:apagavas:apagava:apagvamos:apagveis:apagavam', 'apagar:apagando:apagado', 'apague:apagues:apague:apaguemos:apagueis:apaguem', 'apagara:apagaras:apagara:apagramos:apagreis:apagaram', 'apagues:apague:apaguemos:apagueis:apaguem', 'apaga:apague:apaguemos:apagai:apaguem', 'apagar:apagares:apagar:apagarmos:apagardes:apagarem', 'apago:apagas:apaga:apagamos:apagais:apagam', 'apagar:apagares:apagar:apagarmos:apagardes:apagarem', 'apaguei:apagaste:apagou:apagamos:apagastes:apagaram');
INSERT INTO verbos VALUES (18, 'remover', 'removesse:removesses:removesse:removssemos:removsseis:removessem', 'removerei:removers:remover:removeremos:removereis:removero', 'removeria:removerias:removeria:removeramos:removereis:removeriam', 'removia:removias:removia:removamos:removeis:removiam', 'remover:removendo:removido', 'remova:removas:remova:removamos:removais:removam', 'removera:removeras:removera:removramos:removreis:removeram', 'removas:remova:removamos:removais:removam', 'remove:remova:removamos:removei:removam', 'remover:removeres:remover:removermos:removerdes:removerem', 'removo:removes:remove:removemos:removeis:removem', 'remover:removeres:remover:removermos:removerdes:removerem', 'removi:removeste:removeu:removemos:removestes:removeram');
INSERT INTO verbos VALUES (19, 'eliminar', 'eliminasse:eliminasses:eliminasse:eliminssemos:eliminsseis:eliminassem', 'eliminarei:eliminars:eliminar:eliminaremos:eliminareis:eliminaro', 'eliminaria:eliminarias:eliminaria:eliminaramos:eliminareis:eliminariam', 'eliminava:eliminavas:eliminava:eliminvamos:eliminveis:eliminavam', 'eliminar:eliminando:eliminado', 'elimine:elimines:elimine:eliminemos:elimineis:eliminem', 'eliminara:eliminaras:eliminara:eliminramos:eliminreis:eliminaram', 'elimines:elimine:eliminemos:elimineis:eliminem', 'elimina:elimine:eliminemos:eliminai:eliminem', 'eliminar:eliminares:eliminar:eliminarmos:eliminardes:eliminarem', 'elimino:eliminas:elimina:eliminamos:eliminais:eliminam', 'eliminar:eliminares:eliminar:eliminarmos:eliminardes:eliminarem', 'eliminei:eliminaste:eliminou:eliminamos:eliminastes:eliminaram');
INSERT INTO verbos VALUES (20, 'limpar', 'limpasse:limpasses:limpasse:limpssemos:limpsseis:limpassem', 'limparei:limpars:limpar:limparemos:limpareis:limparo', 'limparia:limparias:limparia:limparamos:limpareis:limpariam', 'limpava:limpavas:limpava:limpvamos:limpveis:limpavam', 'limpar:limpando:limpado', 'limpe:limpes:limpe:limpemos:limpeis:limpem', 'limpara:limparas:limpara:limpramos:limpreis:limparam', 'limpes:limpe:limpemos:limpeis:limpem', 'limpa:limpe:limpemos:limpai:limpem', 'limpar:limpares:limpar:limparmos:limpardes:limparem', 'limpo:limpas:limpa:limpamos:limpais:limpam', 'limpar:limpares:limpar:limparmos:limpardes:limparem', 'limpei:limpaste:limpou:limpamos:limpastes:limparam');
INSERT INTO verbos VALUES (21, 'matar', 'matasse:matasses:matasse:matssemos:matsseis:matassem', 'matarei:matars:matar:mataremos:matareis:mataro', 'mataria:matarias:mataria:mataramos:matareis:matariam', 'matava:matavas:matava:matvamos:matveis:matavam', 'matar:matando:matado', 'mate:mates:mate:matemos:mateis:matem', 'matara:mataras:matara:matramos:matreis:mataram', 'mates:mate:matemos:mateis:matem', 'mata:mate:matemos:matai:matem', 'matar:matares:matar:matarmos:matardes:matarem', 'mato:matas:mata:matamos:matais:matam', 'matar:matares:matar:matarmos:matardes:matarem', 'matei:mataste:matou:matamos:matastes:matara');
INSERT INTO verbos VALUES (22, 'copiar', 'copiasse:copiasses:copiasse:copissemos:copisseis:copiassem', 'copiarei:copiars:copiar:copiaremos:copiareis:copiaro', 'copiaria:copiarias:copiaria:copiaramos:copiareis:copiariam', 'copiava:copiavas:copiava:copivamos:copiveis:copiavam', 'copiar:copiando:copiado', 'copie:copies:copie:copiemos:copieis:copiem', 'copiara:copiaras:copiara:copiramos:copireis:copiaram', 'copies:copie:copiemos:copieis:copiem', 'copia:copie:copiemos:copiai:copiem', 'copiar:copiares:copiar:copiarmos:copiardes:copiarem', 'copio:copias:copia:copiamos:copiais:copiam', 'copiar:copiares:copiar:copiarmos:copiardes:copiarem', 'copiei:copiaste:copiou:copiamos:copiastes:copiaram');
INSERT INTO verbos VALUES (23, 'transcrever', 'transcrevesse:transcrevesses:transcrevesse:transcrevssemos:transcrevsseis:transcrevessem', 'transcreverei:transcrevers:transcrever:transcreveremos:transcrevereis:transcrevero', 'transcreveria:transcreverias:transcreveria:transcreveramos:transcrevereis:transcreveriam', 'transcrevia:transcrevias:transcrevia:transcrevamos:transcreveis:transcreviam', 'transcrever:transcrevendo:transcrevido', 'transcreva:transcrevas:transcreva:transcrevamos:transcrevais:transcrevam', 'transcrevera:transcreveras:transcrevera:transcrevramos:transcrevreis:transcreveram', 'transcrevas:transcreva:transcrevamos:transcrevais:transcrevam', 'transcreve:transcreva:transcrevamos:transcrevei:transcrevam', 'transcrever:transcreveres:transcrever:transcrevermos:transcreverdes:transcreverem', 'transcrevo:transcreves:transcreve:transcrevemos:transcreveis:transcrevem', 'transcrever:transcreveres:transcrever:transcrevermos:transcreverdes:transcreverem', 'transcrevi:transcreveste:transcreveu:transcrevemos:transcrevestes:transcreveram');
INSERT INTO verbos VALUES (24, 'voltar', 'voltasse:voltasses:voltasse:volt', 'voltarei:voltar', 'voltaria:voltarias:voltaria:voltar', 'voltava:voltavas:voltava:volt', 'voltar:voltando:voltado', 'volte:voltes:volte:voltemos:volteis:voltem', 'voltara:voltaras:voltara:volt', 'voltes:volte:voltemos:volteis:voltem', 'volta:volte:voltemos:voltai:voltem', 'voltar:voltares:voltar:voltarmos:voltardes:voltarem', 'volto:voltas:volta:voltamos:voltais:voltam', 'voltar:voltares:voltar:voltarmos:voltardes:voltarem', 'voltei:voltaste:voltou:voltamos:voltastes:voltaram');
INSERT INTO verbos VALUES (25, 'encontrar', 'encontrasse:encontrasses:encontrasse:encontr', 'encontrarei:encontrar', 'encontraria:encontrarias:encontraria:encontrar', 'encontrava:encontravas:encontrava:encontr', 'encontrar:encontrando:encontrado', 'encontre:encontres:encontre:encontremos:encontreis:encontrem', 'encontrara:encontraras:encontrara:encontr', 'encontres:encontre:encontremos:encontreis:encontrem', 'encontra:encontre:encontremos:encontrai:encontrem', 'encontrar:encontrares:encontrar:encontrarmos:encontrardes:encontrarem', 'encontro:encontras:encontra:encontramos:encontrais:encontram', 'encontrar:encontrares:encontrar:encontrarmos:encontrardes:encontrarem', 'encontrei:encontraste:encontrou:encontramos:encontrastes:encontraram');
INSERT INTO verbos VALUES (26, 'buscar', 'buscasse:buscasses:buscasse:busc', 'buscarei:buscar', 'buscaria:buscarias:buscaria:buscar', 'buscava:buscavas:buscava:busc', 'buscar:buscando:buscado', 'busque:busques:busque:busquemos:busqueis:busquem', 'buscara:buscaras:buscara:busc', 'busques:busque:busquemos:busqueis:busquem', 'busca:busque:busquemos:buscai:busquem', 'buscar:buscares:buscar:buscarmos:buscardes:buscarem', 'busco:buscas:busca:buscamos:buscais:buscam', 'buscar:buscares:buscar:buscarmos:buscardes:buscarem', 'busquei:buscaste:buscou:buscamos:buscastes:buscaram');
INSERT INTO verbos VALUES (27, 'filtrar', 'filtrasse:filtrasses:filtrasse:filtr', 'filtrarei:filtrar', 'filtraria:filtrarias:filtraria:filtrar', 'filtrava:filtravas:filtrava:filtr', 'filtrar:filtrando:filtrado', 'filtre:filtres:filtre:filtremos:filtreis:filtrem', 'filtrara:filtraras:filtrara:filtr', 'filtres:filtre:filtremos:filtreis:filtrem', 'filtra:filtre:filtremos:filtrai:filtrem', 'filtrar:filtrares:filtrar:filtrarmos:filtrardes:filtrarem', 'filtro:filtras:filtra:filtramos:filtrais:filtram', 'filtrar:filtrares:filtrar:filtrarmos:filtrardes:filtrarem', 'filtrei:filtraste:filtrou:filtramos:filtrastes:filtraram');
INSERT INTO verbos VALUES (28, 'listar',
'listasse:listasses:listasse:list',
'listarei:listar',
'listaria:listarias:listaria:listar',
'listava:listavas:listava:list',
'listar:listando:listado',
'liste:listes:liste:listemos:listeis:listem',
'listara:listaras:listara:list',
'listes:liste:listemos:listeis:listem',
'lista:liste:listemos:listai:listem',
'listar:listares:listar:listarmos:listardes:listarem',
'listo:listas:lista:listamos:listais:listam',
'listar:listares:listar:listarmos:listardes:listarem',
'listei:listaste:listou:listamos:listastes:listaram');


--
-- TOC entry 1926 (class 0 OID 0)
-- Dependencies: 162
-- Name: verbos_id_verbo_seq; Type: SEQUENCE SET; Schema: syntax; Owner: postgres
--

SELECT pg_catalog.setval('verbos_id_verbo_seq', 27, true);


--
-- TOC entry 1909 (class 2606 OID 16885)
-- Dependencies: 165 165 1920
-- Name: comando_shell_nome_key; Type: CONSTRAINT; Schema: syntax; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY comandos
    ADD CONSTRAINT comando_shell_nome_key UNIQUE (nome);


--
-- TOC entry 1911 (class 2606 OID 16903)
-- Dependencies: 165 165 1920
-- Name: pk_comando; Type: CONSTRAINT; Schema: syntax; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY comandos
    ADD CONSTRAINT pk_comando PRIMARY KEY (id_comando);


--
-- TOC entry 1907 (class 2606 OID 16836)
-- Dependencies: 163 163 1920
-- Name: verbos_pkey; Type: CONSTRAINT; Schema: syntax; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY verbos
    ADD CONSTRAINT verbos_pkey PRIMARY KEY (id_verbo);


--
-- TOC entry 1913 (class 2606 OID 16925)
-- Dependencies: 1910 165 166 1920
-- Name: fk_comando; Type: FK CONSTRAINT; Schema: syntax; Owner: postgres
--

ALTER TABLE ONLY relacao_verbo_comando
    ADD CONSTRAINT fk_comando FOREIGN KEY (id_comando) REFERENCES comandos(id_comando);


--
-- TOC entry 1912 (class 2606 OID 16920)
-- Dependencies: 1906 166 163 1920
-- Name: fk_verbo; Type: FK CONSTRAINT; Schema: syntax; Owner: postgres
--

ALTER TABLE ONLY relacao_verbo_comando
    ADD CONSTRAINT fk_verbo FOREIGN KEY (id_verbo) REFERENCES verbos(id_verbo);


-- Completed on 2013-11-19 17:42:05 BRST

--
-- PostgreSQL database dump complete
--

