xquery version "3.1";

declare namespace k="http://example.com";
declare variable $intvar as xs:integer:=30;
declare variable $stringvar as xs:string:="name";
declare variable $boolvar :=fn:false();
declare variable $seqvar :=("name",1,"age",20);
declare variable $itemvar as xs:string*:=("item1","item2");
declare variable $mapvar:=(
("key1","value1"),
("key2","value2")
);
declare function k:myfunction($input as xs:string) as element(message){
if($input="Summer strike")then
 <message>drama exist</message>
else if($input !="Summer strike") then
 <message>drama does not exist</message>
else
 <message>no</message>
};
(: let example :)
let $int1:=(1 to 5)

let $doc:=fn:doc("/kdrama.xml")
let $title:=$doc//kdrama/title[1]/string()

return <result>
<variables>
<int>{$intvar}</int>
<string>{$stringvar}</string>
<bool>{$boolvar}</bool>
<seq>{$seqvar}</seq></variables>
<items>
{
for $item in $itemvar
return <item>{$item}</item>
}
</items>
<map>
{
for $key in $mapvar
return <keys>{$key}</keys>
}
</map>
<letvalue>{$int1}</letvalue>
<dramas>
{

for $t in $title 
where starts-with($t,"S")
order by $t descending
return <title>{$t}</title>
}
</dramas>

{
for $t in $title
return k:myfunction($t)}
</result>