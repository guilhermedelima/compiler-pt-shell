-- COMANDOS


insert into syntax.comandos
select id_verbo, infinitivo, 'cd'
from syntax.verbos 
where infinitivo like 'mudar' or infinitivo like 'ir';

insert into syntax.comandos
select id_verbo, infinitivo, 'ls'
from syntax.verbos 
where infinitivo like 'ver' or infinitivo like 'mostrar' or infinitivo like 'exibir';

insert into syntax.comandos
select id_verbo, infinitivo, 'mkdir'
from syntax.verbos 
where infinitivo like 'criar' or infinitivo like 'gerar';

insert into syntax.comandos
select id_verbo, infinitivo, 'rm'
from syntax.verbos 
where infinitivo like 'remover' or infinitivo like 'apagar';

insert into syntax.comandos
select id_verbo, infinitivo, 'cp'
from syntax.verbos 
where infinitivo like 'copiar';

insert into syntax.comandos
select id_verbo, infinitivo, 'cd'
from syntax.verbos 
where infinitivo like 'voltar';

insert into syntax.comandos
select id_verbo, infinitivo, 'grep'
from syntax.verbos 
where infinitivo like 'encontrar' or infinitivo like 'buscar' or infinitivo like 'filtrar';

-- VERBOS

insert into syntax.verbos(infinitivo, "is", fi, ti, ii, fn, ps, mi, "in", ia, fs, pi, ip, ei) values
('mostrar', 'mostrasse:mostrasses:mostrasse:mostrssemos:mostrsseis:mostrassem', 'mostrarei:mostrars:mostrar:mostraremos:mostrareis:mostraro', 'mostraria:mostrarias:mostraria:mostraramos:mostrareis:mostrariam',  'mostrava:mostravas:mostrava:mostrvamos:mostrveis:mostravam', 'mostrar:mostrando:mostrado', 'mostre:mostres:mostre:mostremos:mostreis:mostrem', 'mostrara:mostraras:mostrara:mostrramos:mostrreis:mostraram', 'mostres:mostre:mostremos:mostreis:mostrem', 'mostra:mostre:mostremos:mostrai:mostrem', 'mostrar:mostrares:mostrar:mostrarmos:mostrardes:mostrarem', 'mostro:mostras:mostra:mostramos:mostrais:mostram', 'mostrar:mostrares:mostrar:mostrarmos:mostrardes:mostrarem', 'mostrei:mostraste:mostrou:mostramos:mostrastes:mostraram');

insert into syntax.verbos(infinitivo, "is", fi, ti, ii, fn, ps, mi, "in", ia, fs, pi, ip, ei) values
('ver', 'visse:visses:visse:vssemos:vsseis:vissem', 'verei:vers:ver:veremos:vereis:vero', 'veria:verias:veria:veramos:vereis:veriam', 'via:vias:via:vamos:veis:viam', 'ver:vendo:visto', 'veja:vejas:vejamos:vejais:vejam', 'vira:viras:vira:vramos:vreis:viram', 'vejas:veja:vejamos:vejais:vejam', 'v:veja:vejamos:vede:vejam', 'vir:vires:vir:virmos:virdes:virem', 'vejo:vs:v:vemos:vedes:vem', 'ver:veres:ver:vermos:verdes:verem', 'vi:viste:viu:vimos:vistes:viram');

insert into syntax.verbos(infinitivo, "is", fi, ti, ii, fn, ps, mi, "in", ia, fs, pi, ip, ei) values
('demonstrar','demonstrasse:demonstrasses:demonstrasse:demonstrssemos:demonstrsseis:demonstrassem',  'demonstrarei:demonstrars:demonstrar:demonstraremos:demonstrareis:demonstraro', 'demonstraria:demonstrarias:demonstraria:demonstraramos:demonstrareis:demonstrariam', 'demonstrava:demonstravas:demonstrava:demonstrvamos:demonstrveis:demonstravam', 'demonstrar:demonstrando:demonstrado', 'demonstre:demonstres:demonstre:demonstremos:demonstreis:demonstrem', 'demonstrara:demonstraras:demonstrara:demonstrramos:demonstrreis:demonstraram', 'demonstres:demonstre:demonstremos:demonstreis:demonstrem', 'demonstra:demonstre:demonstremos:demonstrai:demonstrem', 'demonstrar:demonstrares:demonstrar:demonstrarmos:demonstrardes:demonstrarem', 'demonstro:demonstras:demonstra:demonstramos:demonstrais:demonstram', 'demonstrar:demonstrares:demonstrar:demonstrarmos:demonstrardes:demonstrarem', 'demonstrei:demonstraste:demonstrou:demonstramos:demonstrastes:demonstraram');

insert into syntax.verbos(infinitivo, "is", fi, ti, ii, fn, ps, mi, "in", ia, fs, pi, ip, ei) values
('exibir', 'exibisse:exibisses:exibisse:exibssemos:exibsseis:exibissem', 'exibirei:exibirs:exibir:exibiremos:exibireis:exibiro', 'exibiria:exibirias:exibiria:exibiramos:exibireis:exibiriam', 'exibia:exibias:exibia:exibamos:exibeis:exibiam', 'exibir:exibindo:exibido', 'exiba:exibas:exiba:exibamos:exibais:exibam', 'exibira:exibiras:exibira:exibramos:exibreis:exibiram', 'exibas:exiba:exibamos:exibais:exibam', 'exibe:exiba:exibamos:exibi:exibam', 'exibir:exibires:exibir:exibirmos:exibirdes:exibirem', 'exibo:exibes:exibe:exibimos:exibis:exibem', 'exibir:exibires:exibir:exibirmos:exibirdes:exibirem', 'exibi:exibiste:exibiu:exibimos:exibistes:exibiram');

insert into syntax.verbos(infinitivo, "is", fi, ti, ii, fn, ps, mi, "in", ia, fs, pi, ip, ei) values
('expor', 'expusesse:expusesses:expusesse:expusssemos:expussseis:expusessem', 'exporei:expors:expor:exporemos:exporeis:exporo', 'exporia:exporias:exporia:exporamos:exporeis:exporiam', 'expunha:expunhas:expunha:expnhamos:expnheis:expunham', 'expor:expondo:exposto', 'exponha:exponhas:exponha:exponhamos:exponhais:exponham', 'expusera:expuseras:expusera:expusramos:expusreis:expuseram', 'exponhas:exponha:exponhamos:exponhais:exponham', 'expe:exponha:exponhamos:exponde:exponham', 'expuser:expuseres:expuser:expusermos:expuserdes:expuserem', 'exponho:expes:expe:expomos:expondes:expem', 'expor:expores:expor:expormos:expordes:exporem', 'expus:expuseste:exps:expusemos:expusestes:expuseram');

insert into syntax.verbos(infinitivo, "is", fi, ti, ii, fn, ps, mi, "in", ia, fs, pi, ip, ei) values
('apontar', 'apontasse:apontasses:apontasse:apontssemos:apontsseis:apontassem', 'apontarei:apontars:apontar:apontaremos:apontareis:apontaro', 'apontaria:apontarias:apontaria:apontaramos:apontareis:apontariam', 'apontava:apontavas:apontava:apontvamos:apontveis:apontavam', 'apontar:apontando:apontado', 'aponte:apontes:aponte:apontemos:aponteis:apontem', 'apontara:apontaras:apontara:apontramos:apontreis:apontaram', 'apontes:aponte:apontemos:aponteis:apontem', 'aponta:aponte:apontemos:apontai:apontem', 'apontar:apontares:apontar:apontarmos:apontardes:apontarem', 'aponto:apontas:aponta:apontamos:apontais:apontam', 'apontar:apontares:apontar:apontarmos:apontardes:apontarem', 'apontei:apontaste:apontou:apontamos:apontastes:apontaram');

insert into syntax.verbos(infinitivo, "is", fi, ti, ii, fn, ps, mi, "in", ia, fs, pi, ip, ei) values
('criar', 'criasse:criasses:criasse:crissemos:crisseis:criassem', 'criarei:criars:criar:criaremos:criareis:criaro', 'criaria:criarias:criaria:criaramos:criareis:criariam', 'criava:criavas:criava:crivamos:criveis:criavam', 'criar:criando:criado', 'crie:cries:crie:criemos:crieis:criem', 'criara:criaras:criara:criramos:crireis:criaram', 'cries:crie:criemos:crieis:criem', 'cria:crie:criemos:criai:criem', 'criar:criares:criar:criarmos:criardes:criarem', 'crio:crias:cria:criamos:criais:criam', 'criar:criares:criar:criarmos:criardes:criarem', 'criei:criaste:criou:criamos:criastes:criaram');

insert into syntax.verbos(infinitivo, "is", fi, ti, ii, fn, ps, mi, "in", ia, fs, pi, ip, ei) values
('gerar', 'gerasse:gerasses:gerasse:gerssemos:gersseis:gerassem', 'gerarei:gerars:gerar:geraremos:gerareis:geraro', 'geraria:gerarias:geraria:geraramos:gerareis:gerariam', 'gerava:geravas:gerava:gervamos:gerveis:geravam', 'gerar:gerando:gerado', 'gere:geres:gere:geremos:gereis:gerem', 'gerara:geraras:gerara:gerramos:gerreis:geraram', 'geres:gere:geremos:gereis:gerem', 'gera:gere:geremos:gerai:gerem', 'gerar:gerares:gerar:gerarmos:gerardes:gerarem', 'gero:geras:gera:geramos:gerais:geram', 'gerar:gerares:gerar:gerarmos:gerardes:gerarem', 'gerei:geraste:gerou:geramos:gerastes:geraram');

insert into syntax.verbos(infinitivo, "is", fi, ti, ii, fn, ps, mi, "in", ia, fs, pi, ip, ei) values
('fazer', 'fizesse:fizesses:fizesse:fizssemos:fizsseis:fizessem', 'farei:fars:far:faremos:fareis:faro', 'faria:farias:faria:faramos:fareis:fariam', 'fazia:fazias:fazia:fazamos:fazeis:faziam', 'fazer:fazendo:feito', 'faa:faas:faa:faamos:faais:faam', 'fizera:fizeras:fizera:fizramos:fizreis:fizeram', 'faas:faa:faamos:faais:faam', 'faze:faa:faamos:fazei:faam', 'fizer:fizeres:fizer:fizermos:fizerdes:fizerem', 'fao:fazes:faz:fazemos:fazeis:fazem', 'fazer:fazeres:fazer:fazermos:fazerdes:fazerem', 'fiz:fizeste:fez:fizemos:fizestes:fizeram');

insert into syntax.verbos(infinitivo, "is", fi, ti, ii, fn, ps, mi, "in", ia, fs, pi, ip, ei) values
('originar', 'originasse:originasses:originasse:originssemos:originsseis:originassem', 'originarei:originars:originar:originaremos:originareis:originaro', 'originaria:originarias:originaria:originaramos:originareis:originariam', 'originava:originavas:originava:originvamos:originveis:originavam', 'originar:originando:originado', 'origine:origines:origine:originemos:origineis:originem', 'originara:originaras:originara:originramos:originreis:originaram', 'origines:origine:originemos:origineis:originem', 'origina:origine:originemos:originai:originem', 'originar:originares:originar:originarmos:originardes:originarem', 'origino:originas:origina:originamos:originais:originam', 'originar:originares:originar:originarmos:originardes:originarem', 'originei:originaste:originou:originamos:originastes:originaram');

insert into syntax.verbos(infinitivo, "is", fi, ti, ii, fn, ps, mi, "in", ia, fs, pi, ip, ei) values
('formar', 'formasse:formasses:formasse:formssemos:formsseis:formassem', 'formarei:formars:formar:formaremos:formareis:formaro', 'formaria:formarias:formaria:formaramos:formareis:formariam', 'formava:formavas:formava:formvamos:formveis:formavam', 'formar:formando:formado', 'forme:formes:forme:formemos:formeis:formem', 'formara:formaras:formara:formramos:formreis:formaram', 'formes:forme:formemos:formeis:formem', 'forma:forme:formemos:formai:formem', 'formar:formares:formar:formarmos:formardes:formarem', 'formo:formas:forma:formamos:formais:formam', 'formar:formares:formar:formarmos:formardes:formarem', 'formei:formaste:formou:formamos:formastes:formaram');

insert into syntax.verbos(infinitivo, "is", fi, ti, ii, fn, ps, mi, "in", ia, fs, pi, ip, ei) values
('ir', 'fosse:fosses:fosse:fssemos:fsseis:fossem', 'irei:irs:ir:iremos:ireis:iro', 'iria:irias:iria:iramos:ireis:iriam', 'ia:ias:ia:amos:eis:iam', 'ir:indo:ido', 'v:vs:v:vamos:vades:vo', 'fora:foras:fora:framos:freis:foram', 'vs:v:vamos:vades:vo', 'vai:v:vamos:ide:vo', 'for:fores:for:formos:fordes:forem', 'vou:vais:vai:vamos:ides:vo', 'ir:ires:ir:irmos:irdes:irem', 'fui:foste:foi:fomos:fostes:foram');

insert into syntax.verbos(infinitivo, "is", fi, ti, ii, fn, ps, mi, "in", ia, fs, pi, ip, ei) values
('mover', 'movesse:movesses:movesse:movssemos:movsseis:movessem', 'moverei:movers:mover:moveremos:movereis:movero', 'moveria:moverias:moveria:moveramos:movereis:moveriam', 'movia:movias:movia:movamos:moveis:moviam', 'mover:movendo:movido', 'mova:movas:mova:movamos:movais:movam', 'movera:moveras:movera:movramos:movreis:moveram', 'movas:mova:movamos:movais:movam', 'move:mova:movamos:movei:movam', 'mover:moveres:mover:movermos:moverdes:moverem', 'movo:moves:move:movemos:moveis:movem', 'mover:moveres:mover:movermos:moverdes:moverem', 'movi:moveste:moveu:movemos:movestes:movera');

insert into syntax.verbos(infinitivo, "is", fi, ti, ii, fn, ps, mi, "in", ia, fs, pi, ip, ei) values
('mudar', 'mudasse:mudasses:mudasse:mudssemos:mudsseis:mudassem', 'mudarei:mudars:mudar:mudaremos:mudareis:mudaro', 'mudaria:mudarias:mudaria:mudaramos:mudareis:mudariam', 'mudava:mudavas:mudava:mudvamos:mudveis:mudavam', 'mudar:mudando:mudado', 'mude:mudes:mude:mudemos:mudeis:mudem', 'mudara:mudaras:mudara:mudramos:mudreis:mudaram', 'mudes:mude:mudemos:mudeis:mudem', 'muda:mude:mudemos:mudai:mudem', 'mudar:mudares:mudar:mudarmos:mudardes:mudarem', 'mudo:mudas:muda:mudamos:mudais:mudam', 'mudar:mudares:mudar:mudarmos:mudardes:mudarem', 'mudei:mudaste:mudou:mudamos:mudastes:mudaram');

insert into syntax.verbos(infinitivo, "is", fi, ti, ii, fn, ps, mi, "in", ia, fs, pi, ip, ei) values
('deslocar', 'deslocasse:deslocasses:deslocasse:deslocssemos:deslocsseis:deslocassem', 'deslocarei:deslocars:deslocar:deslocaremos:deslocareis:deslocaro', 'deslocaria:deslocarias:deslocaria:deslocaramos:deslocareis:deslocariam', 'deslocava:deslocavas:deslocava:deslocvamos:deslocveis:deslocavam', 'deslocar:deslocando:deslocado', 'desloque:desloques:desloque:desloquemos:desloqueis:desloquem', 'deslocara:deslocaras:deslocara:deslocramos:deslocreis:deslocaram', 'desloques:desloque:desloquemos:desloqueis:desloquem', 'desloca:desloque:desloquemos:deslocai:desloquem', 'deslocar:deslocares:deslocar:deslocarmos:deslocardes:deslocarem', 'desloco:deslocas:desloca:deslocamos:deslocais:deslocam', 'deslocar:deslocares:deslocar:deslocarmos:deslocardes:deslocarem', 'desloquei:deslocaste:deslocou:deslocamos:deslocastes:deslocaram');

insert into syntax.verbos(infinitivo, "is", fi, ti, ii, fn, ps, mi, "in", ia, fs, pi, ip, ei) values
('conduzir', 'conduzisse:conduzisses:conduzisse:conduzssemos:conduzsseis:conduzissem', 'conduzirei:conduzirs:conduzir:conduziremos:conduzireis:conduziro', 'conduziria:conduzirias:conduziria:conduziramos:conduzireis:conduziriam', 'conduzia:conduzias:conduzia:conduzamos:conduzeis:conduziam', 'conduzir:conduzindo:conduzido', 'conduza:conduzas:conduza:conduzamos:conduzais:conduzam', 'conduzira:conduziras:conduzira:conduzramos:conduzreis:conduziram', 'conduzas:conduza:conduzamos:conduzais:conduzam', 'conduze:conduza:conduzamos:conduzi:conduzam', 'conduzir:conduzires:conduzir:conduzirmos:conduzirdes:conduzirem', 'conduzo:conduzes:conduz:conduzimos:conduzis:conduzem', 'conduzir:conduzires:conduzir:conduzirmos:conduzirdes:conduzirem', 'conduzi:conduziste:conduziu:conduzimos:conduzistes:conduziram');

insert into syntax.verbos(infinitivo, "is", fi, ti, ii, fn, ps, mi, "in", ia, fs, pi, ip, ei) values
('apagar', 'apagasse:apagasses:apagasse:apagssemos:apagsseis:apagassem', 'apagarei:apagars:apagar:apagaremos:apagareis:apagaro', 'apagaria:apagarias:apagaria:apagaramos:apagareis:apagariam', 'apagava:apagavas:apagava:apagvamos:apagveis:apagavam', 'apagar:apagando:apagado', 'apague:apagues:apague:apaguemos:apagueis:apaguem', 'apagara:apagaras:apagara:apagramos:apagreis:apagaram', 'apagues:apague:apaguemos:apagueis:apaguem', 'apaga:apague:apaguemos:apagai:apaguem', 'apagar:apagares:apagar:apagarmos:apagardes:apagarem', 'apago:apagas:apaga:apagamos:apagais:apagam', 'apagar:apagares:apagar:apagarmos:apagardes:apagarem', 'apaguei:apagaste:apagou:apagamos:apagastes:apagaram');

insert into syntax.verbos(infinitivo, "is", fi, ti, ii, fn, ps, mi, "in", ia, fs, pi, ip, ei) values
('remover', 'removesse:removesses:removesse:removssemos:removsseis:removessem', 'removerei:removers:remover:removeremos:removereis:removero', 'removeria:removerias:removeria:removeramos:removereis:removeriam', 'removia:removias:removia:removamos:removeis:removiam', 'remover:removendo:removido', 'remova:removas:remova:removamos:removais:removam', 'removera:removeras:removera:removramos:removreis:removeram', 'removas:remova:removamos:removais:removam', 'remove:remova:removamos:removei:removam', 'remover:removeres:remover:removermos:removerdes:removerem', 'removo:removes:remove:removemos:removeis:removem', 'remover:removeres:remover:removermos:removerdes:removerem', 'removi:removeste:removeu:removemos:removestes:removeram');

insert into syntax.verbos(infinitivo, "is", fi, ti, ii, fn, ps, mi, "in", ia, fs, pi, ip, ei) values
('eliminar', 'eliminasse:eliminasses:eliminasse:eliminssemos:eliminsseis:eliminassem', 'eliminarei:eliminars:eliminar:eliminaremos:eliminareis:eliminaro', 'eliminaria:eliminarias:eliminaria:eliminaramos:eliminareis:eliminariam', 'eliminava:eliminavas:eliminava:eliminvamos:eliminveis:eliminavam', 'eliminar:eliminando:eliminado', 'elimine:elimines:elimine:eliminemos:elimineis:eliminem', 'eliminara:eliminaras:eliminara:eliminramos:eliminreis:eliminaram', 'elimines:elimine:eliminemos:elimineis:eliminem', 'elimina:elimine:eliminemos:eliminai:eliminem', 'eliminar:eliminares:eliminar:eliminarmos:eliminardes:eliminarem', 'elimino:eliminas:elimina:eliminamos:eliminais:eliminam', 'eliminar:eliminares:eliminar:eliminarmos:eliminardes:eliminarem', 'eliminei:eliminaste:eliminou:eliminamos:eliminastes:eliminaram');

insert into syntax.verbos(infinitivo, "is", fi, ti, ii, fn, ps, mi, "in", ia, fs, pi, ip, ei) values
('limpar', 'limpasse:limpasses:limpasse:limpssemos:limpsseis:limpassem', 'limparei:limpars:limpar:limparemos:limpareis:limparo', 'limparia:limparias:limparia:limparamos:limpareis:limpariam', 'limpava:limpavas:limpava:limpvamos:limpveis:limpavam', 'limpar:limpando:limpado', 'limpe:limpes:limpe:limpemos:limpeis:limpem', 'limpara:limparas:limpara:limpramos:limpreis:limparam', 'limpes:limpe:limpemos:limpeis:limpem', 'limpa:limpe:limpemos:limpai:limpem', 'limpar:limpares:limpar:limparmos:limpardes:limparem', 'limpo:limpas:limpa:limpamos:limpais:limpam', 'limpar:limpares:limpar:limparmos:limpardes:limparem', 'limpei:limpaste:limpou:limpamos:limpastes:limparam');

insert into syntax.verbos(infinitivo, "is", fi, ti, ii, fn, ps, mi, "in", ia, fs, pi, ip, ei) values
('matar', 'matasse:matasses:matasse:matssemos:matsseis:matassem', 'matarei:matars:matar:mataremos:matareis:mataro', 'mataria:matarias:mataria:mataramos:matareis:matariam', 'matava:matavas:matava:matvamos:matveis:matavam', 'matar:matando:matado', 'mate:mates:mate:matemos:mateis:matem', 'matara:mataras:matara:matramos:matreis:mataram', 'mates:mate:matemos:mateis:matem', 'mata:mate:matemos:matai:matem', 'matar:matares:matar:matarmos:matardes:matarem', 'mato:matas:mata:matamos:matais:matam', 'matar:matares:matar:matarmos:matardes:matarem', 'matei:mataste:matou:matamos:matastes:matara');

insert into syntax.verbos(infinitivo, "is", fi, ti, ii, fn, ps, mi, "in", ia, fs, pi, ip, ei) values
('copiar', 'copiasse:copiasses:copiasse:copissemos:copisseis:copiassem', 'copiarei:copiars:copiar:copiaremos:copiareis:copiaro', 'copiaria:copiarias:copiaria:copiaramos:copiareis:copiariam', 'copiava:copiavas:copiava:copivamos:copiveis:copiavam', 'copiar:copiando:copiado', 'copie:copies:copie:copiemos:copieis:copiem', 'copiara:copiaras:copiara:copiramos:copireis:copiaram', 'copies:copie:copiemos:copieis:copiem', 'copia:copie:copiemos:copiai:copiem', 'copiar:copiares:copiar:copiarmos:copiardes:copiarem', 'copio:copias:copia:copiamos:copiais:copiam', 'copiar:copiares:copiar:copiarmos:copiardes:copiarem', 'copiei:copiaste:copiou:copiamos:copiastes:copiaram');

insert into syntax.verbos(infinitivo, "is", fi, ti, ii, fn, ps, mi, "in", ia, fs, pi, ip, ei) values
('transcrever', 'transcrevesse:transcrevesses:transcrevesse:transcrevssemos:transcrevsseis:transcrevessem', 'transcreverei:transcrevers:transcrever:transcreveremos:transcrevereis:transcrevero', 'transcreveria:transcreverias:transcreveria:transcreveramos:transcrevereis:transcreveriam', 'transcrevia:transcrevias:transcrevia:transcrevamos:transcreveis:transcreviam', 'transcrever:transcrevendo:transcrevido', 'transcreva:transcrevas:transcreva:transcrevamos:transcrevais:transcrevam', 'transcrevera:transcreveras:transcrevera:transcrevramos:transcrevreis:transcreveram', 'transcrevas:transcreva:transcrevamos:transcrevais:transcrevam', 'transcreve:transcreva:transcrevamos:transcrevei:transcrevam', 'transcrever:transcreveres:transcrever:transcrevermos:transcreverdes:transcreverem', 'transcrevo:transcreves:transcreve:transcrevemos:transcreveis:transcrevem', 'transcrever:transcreveres:transcrever:transcrevermos:transcreverdes:transcreverem', 'transcrevi:transcreveste:transcreveu:transcrevemos:transcrevestes:transcreveram');

insert into syntax.verbos(infinitivo, "is", fi, ti, ii, fn, ps, mi, "in", ia, fs, pi, ip, ei) values
('voltar',
'voltasse:voltasses:voltasse:volt',
'voltarei:voltar',
'voltaria:voltarias:voltaria:voltar',
'voltava:voltavas:voltava:volt',
'voltar:voltando:voltado',
'volte:voltes:volte:voltemos:volteis:voltem',
'voltara:voltaras:voltara:volt',
'voltes:volte:voltemos:volteis:voltem',
'volta:volte:voltemos:voltai:voltem',
'voltar:voltares:voltar:voltarmos:voltardes:voltarem',
'volto:voltas:volta:voltamos:voltais:voltam',
'voltar:voltares:voltar:voltarmos:voltardes:voltarem',
'voltei:voltaste:voltou:voltamos:voltastes:voltaram');

insert into syntax.verbos(infinitivo, "is", fi, ti, ii, fn, ps, mi, "in", ia, fs, pi, ip, ei) values
('encontrar',
'encontrasse:encontrasses:encontrasse:encontr',
'encontrarei:encontrar',
'encontraria:encontrarias:encontraria:encontrar',
'encontrava:encontravas:encontrava:encontr',
'encontrar:encontrando:encontrado',
'encontre:encontres:encontre:encontremos:encontreis:encontrem',
'encontrara:encontraras:encontrara:encontr',
'encontres:encontre:encontremos:encontreis:encontrem',
'encontra:encontre:encontremos:encontrai:encontrem',
'encontrar:encontrares:encontrar:encontrarmos:encontrardes:encontrarem',
'encontro:encontras:encontra:encontramos:encontrais:encontram',
'encontrar:encontrares:encontrar:encontrarmos:encontrardes:encontrarem',
'encontrei:encontraste:encontrou:encontramos:encontrastes:encontraram');

insert into syntax.verbos(infinitivo, "is", fi, ti, ii, fn, ps, mi, "in", ia, fs, pi, ip, ei) values
('buscar',
'buscasse:buscasses:buscasse:busc',
'buscarei:buscar',
'buscaria:buscarias:buscaria:buscar',
'buscava:buscavas:buscava:busc',
'buscar:buscando:buscado',
'busque:busques:busque:busquemos:busqueis:busquem',
'buscara:buscaras:buscara:busc',
'busques:busque:busquemos:busqueis:busquem',
'busca:busque:busquemos:buscai:busquem',
'buscar:buscares:buscar:buscarmos:buscardes:buscarem',
'busco:buscas:busca:buscamos:buscais:buscam',
'buscar:buscares:buscar:buscarmos:buscardes:buscarem',
'busquei:buscaste:buscou:buscamos:buscastes:buscaram');

insert into syntax.verbos(infinitivo, "is", fi, ti, ii, fn, ps, mi, "in", ia, fs, pi, ip, ei) values
('filtar',
'filtrasse:filtrasses:filtrasse:filtr',
'filtrarei:filtrar',
'filtraria:filtrarias:filtraria:filtrar',
'filtrava:filtravas:filtrava:filtr',
'filtrar:filtrando:filtrado',
'filtre:filtres:filtre:filtremos:filtreis:filtrem',
'filtrara:filtraras:filtrara:filtr',
'filtres:filtre:filtremos:filtreis:filtrem',
'filtra:filtre:filtremos:filtrai:filtrem',
'filtrar:filtrares:filtrar:filtrarmos:filtrardes:filtrarem',
'filtro:filtras:filtra:filtramos:filtrais:filtram',
'filtrar:filtrares:filtrar:filtrarmos:filtrardes:filtrarem',
'filtrei:filtraste:filtrou:filtramos:filtrastes:filtraram');








