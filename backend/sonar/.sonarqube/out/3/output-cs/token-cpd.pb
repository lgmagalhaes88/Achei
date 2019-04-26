�

+D:\git\Achei\backend\Api\AuthorizeHandle.cs
	namespace 	
Api
 
{ 
public 

class 
AuthorizeHandle  
:! "!
IAuthorizationHandler# 8
{ 
public		 
Task		 
HandleAsync		 
(		  '
AuthorizationHandlerContext		  ;
context		< C
)		C D
{

 	
string 
email 
= 
context "
." #
User# '
.' (
Identity( 0
.0 1
Name1 5
;5 6
if 
( 
context 
. 
User 
. 
Identity %
.% &
IsAuthenticated& 5
)5 6
{ 
string 
database 
=  !
Session" )
.) * 
BuscarBancoDoUsuario* >
(> ?
email? D
)D E
;E F
if 
( 
database 
!= 
$str  "
)" #
{ 
ConnectionString $
.$ %
Database% -
=. /
database0 8
;8 9
} 
} 
return 
Task 
. 
CompletedTask %
;% &
} 	
} 
} �
9D:\git\Achei\backend\Api\Controllers\ApiControllerBase.cs
	namespace 	
Api
 
. 
Controllers 
{ 
[ 
ApiController 
] 
[ 
	Authorize 
( 
$str 
) 
] 
public 

abstract 
class 
ApiControllerBase +
<+ ,
T, -
>- .
:/ 0
ControllerBase1 ?
{		 
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
abstract 
IActionResult %
Get& )
() *
)* +
;+ ,
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
abstract 
IActionResult %
Get& )
() *
long* .
id/ 1
)1 2
;2 3
[ 	
HttpPut	 
] 
public 
abstract 
IActionResult %
Put& )
() *
[* +
FromBody+ 3
]3 4
T4 5
entity6 <
)< =
;= >
[&& 	
HttpPost&&	 
]&& 
public'' 
abstract'' 
IActionResult'' %
Post''& *
(''* +
[''+ ,
FromBody'', 4
]''4 5
T''5 6
entidade''7 ?
)''? @
;''@ A
[.. 	

HttpDelete..	 
(.. 
$str.. 
).. 
].. 
public// 
abstract// 
IActionResult// %
Delete//& ,
(//, -
long//- 1
id//2 4
)//4 5
;//5 6
}00 
}11 �2
>D:\git\Achei\backend\Api\Controllers\AutenticacaoController.cs
	namespace 	
Api
 
. 
Controllers 
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class "
AutenticacaoController '
:( )
ControllerBase* 8
{ 
[ 	
HttpPost	 
] 
[ 	
AllowAnonymous	 
] 
public 
object 
Post 
( 
[ 
FromBody 
] 
Usuario 
usuario %
,% &
[ 
FromServices 
]  
IAutenticacaoService /
autenticacaoService0 C
,C D
[ 
FromServices 
] !
SigningConfigurations /!
signingConfigurations0 E
,E F
[ 
FromServices 
] 
TokenConfigurations -
tokenConfigurations. A
)A B
{ 	
Usuario 
usuarioBase 
=  !
null" &
;& '
if 
( 
usuario 
!= 
null 
&&  "
!# $
string$ *
.* +
IsNullOrWhiteSpace+ =
(= >
usuario> E
.E F
EmailF K
)K L
)L M
{ 
try 
{ 
usuarioBase   
=    !
autenticacaoService  " 5
.  5 6
AutenticarUsuario  6 G
(  G H
usuario  H O
.  O P
Email  P U
,  U V
usuario  W ^
.  ^ _
Senha  _ d
)  d e
;  e f
if"" 
("" 
usuarioBase"" #
!=""$ &
null""' +
)""+ ,
{## 
if$$ 
($$ 
Session$$ #
.$$# $
IsUsuarioLogado$$$ 3
($$3 4
usuario$$4 ;
.$$; <
Email$$< A
)$$A B
)$$B C
{%% 
return&& "
new&&# &
{'' 
authenticated((  -
=((. /
false((0 5
,((5 6
message))  '
=))( )
$str))* :
}** 
;** 
}++ 
ClaimsIdentity-- &
identity--' /
=--0 1
new--2 5
ClaimsIdentity--6 D
(--D E
new.. 
GenericIdentity..  /
(../ 0
usuario..0 7
...7 8
Email..8 =
,..= >
$str..? F
)..F G
,..G H
new// 
[//  
]//  !
{//" #
new00 
Claim00 !
(00! "#
JwtRegisteredClaimNames00" 9
.009 :
Jti00: =
,00= >
Guid00? C
.00C D
NewGuid00D K
(00K L
)00L M
.00M N
ToString00N V
(00V W
$str00W Z
)00Z [
)00[ \
,00\ ]
new11 
Claim11 !
(11! "#
JwtRegisteredClaimNames11" 9
.119 :

UniqueName11: D
,11D E
usuario11F M
.11M N
Email11N S
)11S T
}22 
)33 
;33 
DateTime55  
dataCriacao55! ,
=55- .
DateTime55/ 7
.557 8
Now558 ;
;55; <
DateTime66  
dataExpiracao66! .
=66/ 0
dataCriacao661 <
+66= >
TimeSpan77 $
.77$ %
FromSeconds77% 0
(770 1
tokenConfigurations771 D
.77D E
Seconds77E L
)77L M
;77M N#
JwtSecurityTokenHandler99 /
handler990 7
=998 9
new99: =#
JwtSecurityTokenHandler99> U
(99U V
)99V W
;99W X
SecurityToken:: %
securityToken::& 3
=::4 5
handler::6 =
.::= >
CreateToken::> I
(::I J
new::J M#
SecurityTokenDescriptor::N e
{;; 
Issuer<< "
=<<# $
tokenConfigurations<<% 8
.<<8 9
Issuer<<9 ?
,<<? @
Audience== $
===% &
tokenConfigurations==' :
.==: ;
Audience==; C
,==C D
SigningCredentials>> .
=>>/ 0!
signingConfigurations>>1 F
.>>F G
SigningCredentials>>G Y
,>>Y Z
Subject?? #
=??$ %
identity??& .
,??. /
	NotBefore@@ %
=@@& '
dataCriacao@@( 3
,@@3 4
ExpiresAA #
=AA$ %
dataExpiracaoAA& 3
}BB 
)BB 
;BB 
stringCC 
tokenCC $
=CC% &
handlerCC' .
.CC. /

WriteTokenCC/ 9
(CC9 :
securityTokenCC: G
)CCG H
;CCH I
returnEE 
newEE "
{FF 
authenticatedGG )
=GG* +
trueGG, 0
,GG0 1
createdHH #
=HH$ %
dataCriacaoHH& 1
.HH1 2
ToStringHH2 :
(HH: ;
$strHH; P
)HHP Q
,HHQ R

expirationII &
=II' (
dataExpiracaoII) 6
.II6 7
ToStringII7 ?
(II? @
$strII@ U
)IIU V
,IIV W
tokenJJ !
=JJ" #
tokenJJ$ )
,JJ) *
messageKK #
=KK$ %
$strKK& *
,KK* +
usuarioLL #
=LL$ %
usuarioBaseLL& 1
}MM 
;MM 
}NN 
elseOO 
{PP 
returnQQ 
newQQ "
{RR 
authenticatedSS )
=SS* +
falseSS, 1
,SS1 2
messageTT #
=TT$ %
$strTT& @
}UU 
;UU 
}VV 
}WW 
catchXX 
(XX 
	ExceptionXX  
)XX  !
{YY 
returnZZ 
newZZ 
{ZZ  
messageZZ! (
=ZZ) *
$strZZ+ M
}ZZN O
;ZZO P
}[[ 
}\\ 
return]] 
new]] 
{]] 
message]]  
=]]! "
$str]]# 3
}]]4 5
;]]5 6
}^^ 	
}__ 
}`` �
<D:\git\Achei\backend\Api\Controllers\ItemAchadoController.cs
	namespace 	
Api
 
. 
Controllers 
{ 
[ 
ApiController 
] 
[		 
Route		 

(		
 
$str		 
)		 
]		 
public

 

class

  
ItemAchadoController

 %
:

& '
ControllerBase

( 6
{ 
private 
readonly 
IItemAchadoService +
itemAchadoService, =
;= >
public  
ItemAchadoController #
(# $
IItemAchadoService$ 6
itemAchadoService7 H
)H I
{ 	
this 
. 
itemAchadoService "
=# $
itemAchadoService% 6
;6 7
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
IActionResult 
BuscarAchado )
() *
long* .
id/ 1
)1 2
{ 	
try 
{ 

ItemAchado 
achado !
=" #
itemAchadoService$ 5
.5 6
Buscar6 <
(< =
id= ?
)? @
;@ A
return 
Ok 
( 
achado  
)  !
;! "
} 
catch 
( 
	Exception 
e 
) 
{ 
return 

BadRequest !
(! "
e" #
)# $
;$ %
} 
} 	
[!! 	
HttpPost!!	 
]!! 
public"" 
IActionResult"" 
Salvar"" #
(""# $
[""$ %
FromBody""% -
]""- .

ItemAchado"". 8

itemAchado""9 C
)""C D
{## 	
try$$ 
{%% 
itemAchadoService&& !
.&&! "
Inserir&&" )
(&&) *

itemAchado&&* 4
)&&4 5
;&&5 6
return'' 
Ok'' 
('' 
new'' 
RequestResponse'' -
(''- .
)''. /
{''0 1
message''2 9
='': ;
$str''< Y
,''Y Z
status''[ a
=''b c
$str''d i
}''j k
)''k l
;''l m
}(( 
catch)) 
()) 
	Exception)) 
e)) 
))) 
{** 
return++ 

BadRequest++ !
(++! "
e++" #
)++# $
;++$ %
},, 
}-- 	
}.. 
}// �
=D:\git\Achei\backend\Api\Controllers\ItemPerdidoController.cs
	namespace 	
Api
 
. 
Controllers 
{ 
[ 
ApiController 
] 
[		 
Route		 

(		
 
$str		 
)		 
]		 
public

 

class

 !
ItemPerdidoController

 &
:

' (
ControllerBase

) 7
{ 
private 
readonly 
IItemPerdidoService ,
itemPerdidoService- ?
;? @
public !
ItemPerdidoController $
($ %
IItemPerdidoService% 8
itemPerdidoService9 K
)K L
{ 	
this 
. 
itemPerdidoService #
=$ %
itemPerdidoService& 8
;8 9
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
IActionResult 
BuscarPerdido *
(* +
long+ /
id0 2
)2 3
{ 	
try 
{ 
ItemPerdido 
perdido #
=$ %
itemPerdidoService& 8
.8 9
BuscarComTags9 F
(F G
idG I
)I J
;J K
return 
Ok 
( 
perdido !
)! "
;" #
} 
catch 
( 
	Exception 
e 
) 
{ 
return 

BadRequest !
(! "
e" #
)# $
;$ %
} 
} 	
[!! 	
HttpPost!!	 
]!! 
public"" 
IActionResult"" 
Salvar"" #
(""# $
[""$ %
FromBody""% -
]""- .
ItemPerdido"". 9
itemPerdido"": E
)""E F
{## 	
try$$ 
{%% 
itemPerdidoService&& "
.&&" #
Inserir&&# *
(&&* +
itemPerdido&&+ 6
)&&6 7
;&&7 8
return'' 
Ok'' 
('' 
new'' 
RequestResponse'' -
(''- .
)''. /
{''0 1
message''2 9
='': ;
$str''< Y
,''Y Z
status''[ a
=''b c
$str''d i
}''j k
)''k l
;''l m
}(( 
catch)) 
()) 
	Exception)) 
e)) 
))) 
{** 
return++ 

BadRequest++ !
(++! "
e++" #
)++# $
;++$ %
},, 
}-- 	
}.. 
}// �
8D:\git\Achei\backend\Api\Controllers\StatusController.cs
	namespace 	
Api
 
. 
Controllers 
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
StatusController !
:" #
ControllerBase$ 2
{ 
[		 	
HttpGet			 
(		 
)		 
]		 
public

 
IActionResult

 
Get

  
(

  !
)

! "
{ 	
return 
Ok 
( 
$str (
)( )
;) *
} 	
} 
} �?
9D:\git\Achei\backend\Api\Controllers\UsuarioController.cs
	namespace		 	
Api		
 
.		 
Controllers		 
{

 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
UsuarioController "
:# $
ControllerBase% 3
{ 
private 
readonly 
IUsuarioService (
usuarioService) 7
;7 8
public 
UsuarioController  
(  !
IUsuarioService! 0
usuarioService1 ?
)? @
{ 	
this 
. 
usuarioService 
=  !
usuarioService" 0
;0 1
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
[ 	
	Authorize	 
( 
$str 
) 
] 
public 
IActionResult 
Get  
(  !
long! %
id& (
)( )
{ 	
try 
{   
Usuario!! 
usuario!! 
=!!  !
usuarioService!!" 0
.!!0 1
Buscar!!1 7
(!!7 8
id!!8 :
)!!: ;
;!!; <
if"" 
("" 
usuario"" 
!="" 
null"" #
)""# $
{## 
return$$ 
Ok$$ 
($$ 
usuario$$ %
)$$% &
;$$& '
}%% 
else&& 
{'' 
return(( 
NotFound(( #
(((# $
$str(($ K
)((K L
;((L M
})) 
}** 
catch++ 
(++ 
	Exception++ 
ex++ 
)++  
{,, 
return-- 

BadRequest-- !
(--! "
ex--" $
.--$ %
Message--% ,
)--, -
;--- .
}.. 
}// 	
[66 	
HttpPost66	 
]66 
public77 
IActionResult77 
Post77 !
(77! "
[77" #
FromBody77# +
]77+ ,
Usuario77, 3
usuario774 ;
)77; <
{88 	
try99 
{:: 
Usuario;; 
user;; 
=;; 
usuarioService;; -
.<< 
Buscar<< 
(<< 
_usuario<< $
=><<% '
_usuario<<( 0
.<<0 1
Email<<1 6
==<<7 9
usuario<<: A
.<<A B
Email<<B G
)<<G H
.== 
SingleOrDefault== $
(==$ %
)==% &
;==& '
if?? 
(?? 
user?? 
!=?? 
null??  
)??  !
{@@ 
returnAA 

BadRequestAA %
(AA% &
newAA& )
{AA* +
messageAA, 3
=AA4 5
$strAA6 n
}AAo p
)AAp q
;AAq r
}BB 
usuarioServiceDD 
.DD 
InserirDD &
(DD& '
usuarioDD' .
)DD. /
;DD/ 0
returnEE 
OkEE 
(EE 
newEE 
RequestResponseEE -
(EE- .
)EE. /
{EE0 1
messageEE2 9
=EE: ;
$strEE< X
,EEX Y
statusEEZ `
=EEa b
$strEEc h
,EEh i
dataEEj n
=EEo p
usuarioEEq x
}EEy z
)EEz {
;EE{ |
}FF 
catchGG 
(GG 
	ExceptionGG 
exGG 
)GG  
{HH 
returnII 

BadRequestII !
(II! "
newII" %
RequestResponseII& 5
(II5 6
)II6 7
{II8 9
messageII: A
=IIB C
exIID F
.IIF G
MessageIIG N
,IIN O
statusIIP V
=IIW X
$strIIY ^
}II_ `
)II` a
;IIa b
}JJ 
}KK 	
[RR 	
HttpPutRR	 
]RR 
[SS 	
	AuthorizeSS	 
(SS 
$strSS 
)SS 
]SS 
publicTT 
IActionResultTT 
	AtualizarTT &
(TT& '
[TT' (
FromBodyTT( 0
]TT0 1
UsuarioTT1 8
usuarioTT9 @
)TT@ A
{UU 	
tryVV 
{WW 
usuarioServiceXX 
.XX 
	AtualizarXX (
(XX( )
usuarioXX) 0
)XX0 1
;XX1 2
returnYY 
OkYY 
(YY 
newYY 
RequestResponseYY -
(YY- .
)YY. /
{YY0 1
messageYY2 9
=YY: ;
$strYY< \
,YY\ ]
statusYY^ d
=YYe f
$strYYg l
}YYm n
)YYn o
;YYo p
}ZZ 
catch[[ 
([[ 
	Exception[[ 
ex[[ 
)[[  
{\\ 
return]] 

BadRequest]] !
(]]! "
new]]" %
RequestResponse]]& 5
(]]5 6
)]]6 7
{]]8 9
message]]: A
=]]B C
ex]]D F
.]]F G
Message]]G N
,]]N O
status]]P V
=]]W X
$str]]Y ^
}]]_ `
)]]` a
;]]a b
}^^ 
}__ 	
[ff 	

HttpDeleteff	 
(ff 
$strff 
)ff 
]ff 
[gg 	
	Authorizegg	 
(gg 
$strgg 
)gg 
]gg 
publichh 
IActionResulthh 
Deletehh #
(hh# $
longhh$ (
idhh) +
)hh+ ,
{ii 	
usuarioServicejj 
.jj 
Deletarjj "
(jj" #
idjj# %
)jj% &
;jj& '
returnkk 
Okkk 
(kk 
)kk 
;kk 
}ll 	
[nn 	
HttpGetnn	 
(nn 
$strnn +
)nn+ ,
]nn, -
publicoo 
IActionResultoo 
BuscarItensAchadosoo /
(oo/ 0
longoo0 4
	usuarioIdoo5 >
,oo> ?
[oo@ A
FromServicesooA M
]ooM N
IItemAchadoServiceooO a
itemAchadoServiceoob s
)oos t
{pp 	
tryqq 
{rr 
Listss 
<ss 

ItemAchadoss 
>ss  
perdidosss! )
=ss* +
itemAchadoServicess, =
.ss= >
BuscarPorIdUsuarioss> P
(ssP Q
	usuarioIdssQ Z
)ssZ [
;ss[ \
returntt 
Oktt 
(tt 
perdidostt "
)tt" #
;tt# $
}uu 
catchvv 
(vv 
	Exceptionvv 
evv 
)vv 
{ww 
returnxx 

BadRequestxx !
(xx! "
exx" #
)xx# $
;xx$ %
}yy 
}zz 	
[|| 	
HttpGet||	 
(|| 
$str|| ,
)||, -
]||- .
public}} 
IActionResult}} 
BuscarItensPerdidos}} 0
(}}0 1
long}}1 5
	usuarioId}}6 ?
,}}? @
[}}A B
FromServices}}B N
]}}N O
IItemPerdidoService}}P c
itemPerdidoService}}d v
)}}v w
{~~ 	
try 
{
�� 
List
�� 
<
�� 
ItemPerdido
��  
>
��  !
perdidos
��" *
=
��+ , 
itemPerdidoService
��- ?
.
��? @ 
BuscarPorIdUsuario
��@ R
(
��R S
	usuarioId
��S \
)
��\ ]
;
��] ^
return
�� 
Ok
�� 
(
�� 
perdidos
�� "
)
��" #
;
��# $
}
�� 
catch
�� 
(
�� 
	Exception
�� 
e
�� 
)
�� 
{
�� 
return
�� 

BadRequest
�� !
(
��! "
e
��" #
)
��# $
;
��$ %
}
�� 
}
�� 	
}
�� 
}�� �
#D:\git\Achei\backend\Api\Program.cs
	namespace 	
Api
 
{ 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	 
CreateWebHostBuilder		  
(		  !
args		! %
)		% &
.		& '
Build		' ,
(		, -
)		- .
.		. /
Run		/ 2
(		2 3
)		3 4
;		4 5
}

 	
public 
static 
IWebHostBuilder % 
CreateWebHostBuilder& :
(: ;
string; A
[A B
]B C
argsD H
)H I
{ 	
return 
WebHost 
.  
CreateDefaultBuilder /
(/ 0
args0 4
)4 5
.5 6

UseStartup6 @
<@ A
StartupA H
>H I
(I J
)J K
;K L
} 	
} 
} �
+D:\git\Achei\backend\Api\RequestResponse.cs
	namespace 	
Api
 
{ 
public 

class 
RequestResponse  
{ 
public 
string 
message 
; 
public 
string 
status 
; 
public 
object 
data 
; 
} 
}		 �&
#D:\git\Achei\backend\Api\Session.cs
	namespace 	
Api
 
{ 
public 

static 
class 
Session 
{ 
private		 
static		 
readonly		 

Dictionary		  *
<		* +
string		+ 1
,		1 2
string		3 9
>		9 :
usuarios		; C
;		C D
static 
Session 
( 
) 
{ 	
usuarios 
= 
new 

Dictionary %
<% &
string& ,
,, -
string. 4
>4 5
(5 6
)6 7
;7 8
} 	
public 
static 
bool 
IsUsuarioLogado *
(* +
string+ 1
email2 7
)7 8
{ 	
try 
{ 
string 
banco 
= 
usuarios '
[' (
email( -
]- .
;. /
return 
! 
string 
. 
IsNullOrEmpty ,
(, -
banco- 2
)2 3
;3 4
} 
catch 
{ 
return 
false 
; 
} 
} 	
public 
static 
int (
GetQuantidadeUsuariosLogados 6
(6 7
string7 =
banco> C
)C D
{ 	
if 
( 
! 
string 
. 
IsNullOrEmpty %
(% &
banco& +
)+ ,
), -
{   
return!! 
usuarios!! 
.!!  
Where!!  %
(!!% &
usuario!!& -
=>!!. 0
usuario!!1 8
.!!8 9
Value!!9 >
==!!? A
banco!!B G
)!!G H
.!!H I
Count!!I N
(!!N O
)!!O P
;!!P Q
}"" 
throw## 
new## 
	Exception## 
(##  
$str##  J
)##J K
;##K L
}$$ 	
public&& 
static&& 
void&& "
AdicionarSessaoUsuario&& 1
(&&1 2
string&&2 8
email&&9 >
,&&> ?
string&&@ F
banco&&G L
)&&L M
{'' 	
if(( 
((( 
string(( 
.(( 
IsNullOrEmpty(( $
((($ %
email((% *
)((* +
||((, .
string((/ 5
.((5 6
IsNullOrEmpty((6 C
(((C D
banco((D I
)((I J
)((J K
{)) 
if** 
(** 
string** 
.** 
IsNullOrEmpty** (
(**( )
email**) .
)**. /
)**/ 0
{++ 
throw,, 
new,, 
	Exception,, '
(,,' (
$str,,( Q
),,Q R
;,,R S
}-- 
if// 
(// 
string// 
.// 
IsNullOrEmpty// (
(//( )
banco//) .
)//. /
)/// 0
{00 
throw11 
new11 
	Exception11 '
(11' (
$str11( Q
)11Q R
;11R S
}22 
}33 
usuarios44 
.44 
Add44 
(44 
email44 
,44 
banco44  %
)44% &
;44& '
}55 	
public77 
static77 
string77  
BuscarBancoDoUsuario77 1
(771 2
string772 8
email779 >
)77> ?
{88 	
try99 
{:: 
string;; 
banco;; 
=;; 
usuarios;; '
[;;' (
email;;( -
];;- .
;;;. /
if<< 
(<< 
!<< 
string<< 
.<< 
IsNullOrEmpty<< )
(<<) *
banco<<* /
)<</ 0
)<<0 1
{== 
return>> 
banco>>  
;>>  !
}?? 
return@@ 
$str@@ 
;@@ 
}AA 
catchBB 
{CC 
returnDD 
$strDD 
;DD 
}EE 
}FF 	
publicHH 
staticHH 
voidHH 
FinalizarSessaoHH *
(HH* +
stringHH+ 1
tokenHH2 7
)HH7 8
{II 	
ifJJ 
(JJ 
!JJ 
usuariosJJ 
.JJ 
RemoveJJ  
(JJ  !
tokenJJ! &
)JJ& '
)JJ' (
{KK 
throwLL 
newLL 
	ExceptionLL #
(LL# $
$strLL$ K
+LLL M
tokenLLN S
+LLT U
$strMM 9
)MM9 :
;MM: ;
}NN 
}OO 	
}PP 
}QQ �o
#D:\git\Achei\backend\Api\Startup.cs
	namespace 	
Api
 
{ 
public 

class 
Startup 
{ 
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
ConnectionString!! 
.!! 
Server!! #
=!!$ %
configuration!!& 3
.!!3 4
GetValue!!4 <
<!!< =
string!!= C
>!!C D
(!!D E
$str!!E ^
)!!^ _
;!!_ `
ConnectionString"" 
."" 
Database"" %
=""& '
configuration""( 5
.""5 6
GetValue""6 >
<""> ?
string""? E
>""E F
(""F G
$str""G b
)""b c
;""c d
ConnectionString## 
.## 
UserId## #
=##$ %
configuration##& 3
.##3 4
GetValue##4 <
<##< =
string##= C
>##C D
(##D E
$str##E ^
)##^ _
;##_ `
ConnectionString$$ 
.$$ 
Password$$ %
=$$& '
configuration$$( 5
.$$5 6
GetValue$$6 >
<$$> ?
string$$? E
>$$E F
($$F G
$str$$G b
)$$b c
;$$c d
}%% 	
public(( 
void(( 
ConfigureServices(( %
(((% &
IServiceCollection((& 8
services((9 A
)((A B
{)) 	
services** 
.** 
AddCors** 
(** 
)** 
;** 
services++ 
.++ 
AddOData++ 
(++ 
)++ 
;++  
services,, 
.,, 
AddMvc,, 
(,, 
),, 
.,, #
SetCompatibilityVersion,, 5
(,,5 6 
CompatibilityVersion,,6 J
.,,J K
Version_2_2,,K V
),,V W
;,,W X
services.. 
... 
	AddScoped.. 
(.. 
typeof.. %
(..% &
ICrudService..& 2
<..2 3
>..3 4
)..4 5
,..5 6
typeof..7 =
(..= >
CrudService..> I
<..I J
>..J K
)..K L
)..L M
;..M N
services// 
.// 
	AddScoped// 
(// 
typeof// %
(//% & 
IAutenticacaoService//& :
)//: ;
,//; <
typeof//= C
(//C D
AutenticacaoService//D W
)//W X
)//X Y
;//Y Z
services00 
.00 
	AddScoped00 
(00 
typeof00 %
(00% &
IUsuarioService00& 5
)005 6
,006 7
typeof008 >
(00> ?
UsuarioService00? M
)00M N
)00N O
;00O P
services11 
.11 
	AddScoped11 
(11 
typeof11 %
(11% &
IItemAchadoService11& 8
)118 9
,119 :
typeof11; A
(11A B
ItemAchadoService11B S
)11S T
)11T U
;11U V
services22 
.22 
	AddScoped22 
(22 
typeof22 %
(22% &
IItemPerdidoService22& 9
)229 :
,22: ;
typeof22< B
(22B C
ItemPerdidoService22C U
)22U V
)22V W
;22W X
services44 
.44 
Scan44 
(44 
scan44 
=>44 !
scan44" &
.44& '
FromCallingAssembly44' :
(44: ;
)44; <
.44< =

AddClasses44= G
(44G H
)44H I
.44I J
AsMatchingInterface44J ]
(44] ^
)44^ _
)44_ `
;44` a
services66 
.66 
AddSingleton66 !
<66! " 
IHttpContextAccessor66" 6
,666 7
HttpContextAccessor668 K
>66K L
(66L M
)66M N
;66N O
services77 
.77 
AddSingleton77 !
<77! "!
IAuthorizationHandler77" 7
,777 8
AuthorizeHandle779 H
>77H I
(77I J
)77J K
;77K L
services99 
.99 
AddDbContext99 !
<99! " 
ApplicationDbContext99" 6
>996 7
(997 8
)998 9
;999 :#
ConfigureAuthentication;; #
(;;# $
services;;$ ,
);;, -
;;;- .
services>> 
.>> 
AddSwaggerGen>> "
(>>" #
c>># $
=>>>% '
{?? 
c@@ 
.@@ 

SwaggerDoc@@ 
(@@ 
$str@@ !
,@@! "
new@@# &
Info@@' +
{@@, -
Title@@. 3
=@@4 5
$str@@6 >
,@@> ?
Version@@@ G
=@@H I
$str@@J N
}@@O P
)@@P Q
;@@Q R
stringBB 
xmlFileBB 
=BB  
$"BB! #
{BB# $
AssemblyBB$ ,
.BB, - 
GetExecutingAssemblyBB- A
(BBA B
)BBB C
.BBC D
GetNameBBD K
(BBK L
)BBL M
.BBM N
NameBBN R
}BBR S
.xmlBBS W
"BBW X
;BBX Y
stringCC 
xmlPathCC 
=CC  
PathCC! %
.CC% &
CombineCC& -
(CC- .

AppContextCC. 8
.CC8 9
BaseDirectoryCC9 F
,CCF G
xmlFileCCH O
)CCO P
;CCP Q
cDD 
.DD 
IncludeXmlCommentsDD $
(DD$ %
xmlPathDD% ,
)DD, -
;DD- .
}EE 
)EE 
;EE 
}FF 	
publicII 
voidII 
	ConfigureII 
(II 
IApplicationBuilderII 1
appII2 5
,II5 6
IHostingEnvironmentII7 J
envIIK N
)IIN O
{JJ 	
appKK 
.KK 
UseKK 
(KK 
asyncKK 
(KK 
ctxKK 
,KK 
nextKK  $
)KK$ %
=>KK& (
{LL 
awaitMM 
nextMM 
(MM 
)MM 
;MM 
ifNN 
(NN 
ctxNN 
.NN 
ResponseNN  
.NN  !

StatusCodeNN! +
==NN, .
$numNN/ 2
)NN2 3
{OO 
ctxPP 
.PP 
ResponsePP  
.PP  !
ContentLengthPP! .
=PP/ 0
$numPP1 2
;PP2 3
}QQ 
}RR 
)RR 
;RR 
ifTT 
(TT 
envTT 
.TT 
IsDevelopmentTT !
(TT! "
)TT" #
)TT# $
{UU 
appVV 
.VV %
UseDeveloperExceptionPageVV -
(VV- .
)VV. /
;VV/ 0
appWW 
.WW 
UseCorsWW 
(WW 
builderWW #
=>WW$ &
builderWW' .
.WW. /
WithOriginsWW/ :
(WW: ;
$strWW; R
)WWR S
.XX 
AllowAnyHeaderXX 
(XX  
)XX  !
.YY 
AllowAnyMethodYY 
(YY  
)YY  !
)YY! "
;YY" #
}ZZ 
else[[ 
{\\ 
app]] 
.]] 
UseHsts]] 
(]] 
)]] 
;]] 
}^^ 
appaa 
.aa 

UseSwaggeraa 
(aa 
)aa 
;aa 
appee 
.ee 
UseSwaggerUIee 
(ee 
cee 
=>ee !
{ff 
cgg 
.gg 
SwaggerEndpointgg !
(gg! "
$strgg" <
,gg< =
$strgg> L
)ggL M
;ggM N
}hh 
)hh 
;hh 
UpdateDatabasejj 
(jj 
appjj 
)jj 
;jj  
appkk 
.kk 
UseHttpsRedirectionkk #
(kk# $
)kk$ %
;kk% &
appll 
.ll 
UseMvcll 
(ll 
routerBuilderll $
=>ll% '
{mm 
routerBuildernn 
.nn %
EnableDependencyInjectionnn 7
(nn7 8
)nn8 9
;nn9 :
routerBuilderoo 
.oo 
Expandoo $
(oo$ %
)oo% &
.oo& '
Filteroo' -
(oo- .
)oo. /
.oo/ 0
Countoo0 5
(oo5 6
)oo6 7
.oo7 8
OrderByoo8 ?
(oo? @
)oo@ A
;ooA B
}pp 
)pp 
;pp 
}qq 	
privatess 
voidss 
UpdateDatabasess #
(ss# $
IApplicationBuilderss$ 7
appss8 ;
)ss; <
{tt 	
usinguu 
(uu 
IServiceScopeuu  
serviceScopeuu! -
=uu. /
appuu0 3
.uu3 4
ApplicationServicesuu4 G
.uuG H
GetRequiredServiceuuH Z
<uuZ [ 
IServiceScopeFactoryuu[ o
>uuo p
(uup q
)uuq r
.uur s
CreateScopeuus ~
(uu~ 
)	uu �
)
uu� �
{vv 
usingww 
(ww  
ApplicationDbContextww +
contextww, 3
=ww4 5
serviceScopeww6 B
.wwB C
ServiceProviderwwC R
.wwR S

GetServicewwS ]
<ww] ^ 
ApplicationDbContextww^ r
>wwr s
(wws t
)wwt u
)wwu v
{xx 
contextyy 
.yy 
Databaseyy $
.yy$ %
Migrateyy% ,
(yy, -
)yy- .
;yy. /
}zz 
}{{ 
}|| 	
private~~ 
void~~ #
ConfigureAuthentication~~ ,
(~~, -
IServiceCollection~~- ?
services~~@ H
)~~H I
{ 	#
SigningConfigurations
�� !#
signingConfigurations
��" 7
=
��8 9
new
��: =#
SigningConfigurations
��> S
(
��S T
)
��T U
;
��U V
services
�� 
.
�� 
AddSingleton
�� !
(
��! "#
signingConfigurations
��" 7
)
��7 8
;
��8 9!
TokenConfigurations
�� !
tokenConfigurations
��  3
=
��4 5
new
��6 9!
TokenConfigurations
��: M
(
��M N
)
��N O
;
��O P
new
�� /
!ConfigureFromConfigurationOptions
�� 1
<
��1 2!
TokenConfigurations
��2 E
>
��E F
(
��F G
Configuration
�� 
.
�� 

GetSection
�� (
(
��( )
$str
��) >
)
��> ?
)
��? @
.
�� 
	Configure
�� 
(
�� !
tokenConfigurations
�� 2
)
��2 3
;
��3 4
services
�� 
.
�� 
AddSingleton
�� !
(
��! "!
tokenConfigurations
��" 5
)
��5 6
;
��6 7
services
�� 
.
�� 
AddAuthentication
�� &
(
��& '
authOptions
��' 2
=>
��3 5
{
�� 
authOptions
�� 
.
�� '
DefaultAuthenticateScheme
�� 5
=
��6 7
JwtBearerDefaults
��8 I
.
��I J"
AuthenticationScheme
��J ^
;
��^ _
authOptions
�� 
.
�� $
DefaultChallengeScheme
�� 2
=
��3 4
JwtBearerDefaults
��5 F
.
��F G"
AuthenticationScheme
��G [
;
��[ \
}
�� 
)
�� 
.
�� 
AddJwtBearer
�� 
(
�� 
bearerOptions
�� )
=>
��* ,
{
�� 
	Microsoft
�� 
.
�� 
IdentityModel
�� '
.
��' (
Tokens
��( .
.
��. /'
TokenValidationParameters
��/ H
paramsValidation
��I Y
=
��Z [
bearerOptions
��\ i
.
��i j(
TokenValidationParameters��j �
;��� �
paramsValidation
��  
.
��  !
IssuerSigningKey
��! 1
=
��2 3#
signingConfigurations
��4 I
.
��I J
Key
��J M
;
��M N
paramsValidation
��  
.
��  !
ValidAudience
��! .
=
��/ 0!
tokenConfigurations
��1 D
.
��D E
Audience
��E M
;
��M N
paramsValidation
��  
.
��  !
ValidIssuer
��! ,
=
��- .!
tokenConfigurations
��/ B
.
��B C
Issuer
��C I
;
��I J
paramsValidation
��  
.
��  !&
ValidateIssuerSigningKey
��! 9
=
��: ;
true
��< @
;
��@ A
paramsValidation
��  
.
��  !
ValidateLifetime
��! 1
=
��2 3
true
��4 8
;
��8 9
paramsValidation
��  
.
��  !
	ClockSkew
��! *
=
��+ ,
TimeSpan
��- 5
.
��5 6
Zero
��6 :
;
��: ;
}
�� 
)
�� 
;
�� 
services
�� 
.
�� 
AddAuthorization
�� %
(
��% &
auth
��& *
=>
��+ -
{
�� 
auth
�� 
.
�� 
	AddPolicy
�� 
(
�� 
$str
�� '
,
��' (
new
��) ,(
AuthorizationPolicyBuilder
��- G
(
��G H
)
��H I
.
�� &
AddAuthenticationSchemes
�� -
(
��- .
JwtBearerDefaults
��. ?
.
��? @"
AuthenticationScheme
��@ T
)
��T U
.
�� &
RequireAuthenticatedUser
�� -
(
��- .
)
��. /
.
��/ 0
Build
��0 5
(
��5 6
)
��6 7
)
��7 8
;
��8 9
}
�� 
)
�� 
;
�� 
}
�� 	
}
�� 
}�� �

7D:\git\Achei\backend\Api\Token\SigningConfigurations.cs
	namespace 	
Api
 
. 
Token 
{ 
public 

class !
SigningConfigurations &
{ 
public 
SecurityKey 
Key 
{  
get! $
;$ %
}& '
public		 
SigningCredentials		 !
SigningCredentials		" 4
{		5 6
get		7 :
;		: ;
}		< =
public !
SigningConfigurations $
($ %
)% &
{ 	
using 
( $
RSACryptoServiceProvider +
provider, 4
=5 6
new7 :$
RSACryptoServiceProvider; S
(S T
$numT X
)X Y
)Y Z
{ 
Key 
= 
new 
RsaSecurityKey (
(( )
provider) 1
.1 2
ExportParameters2 B
(B C
trueC G
)G H
)H I
;I J
} 
SigningCredentials 
=  
new! $
SigningCredentials% 7
(7 8
Key 
, 
SecurityAlgorithms '
.' (
RsaSha256Signature( :
): ;
;; <
} 	
} 
} �
5D:\git\Achei\backend\Api\Token\TokenConfigurations.cs
	namespace 	
Api
 
. 
Token 
{ 
public 

class 
TokenConfigurations $
{ 
public		 
string		 
Audience		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public

 
string

 
Issuer

 
{

 
get

 "
;

" #
set

$ '
;

' (
}

) *
public 
int 
Seconds 
{ 
get  
;  !
set" %
;% &
}' (
} 
} 